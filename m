Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF313F5361
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 00:28:32 +0200 (CEST)
Received: from localhost ([::1]:57944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIIQg-0004CF-VA
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 18:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mIIPp-0003A5-1e; Mon, 23 Aug 2021 18:27:39 -0400
Received: from relay68.bu.edu ([128.197.228.73]:35162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mIIPn-0008Rb-0B; Mon, 23 Aug 2021 18:27:36 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 17NMQs1m018627
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 23 Aug 2021 18:26:58 -0400
Date: Mon, 23 Aug 2021 18:26:54 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [RFC PATCH v2 0/5] physmem: Have flaview API check bus
 permission from MemTxAttrs argument
Message-ID: <20210823222654.4q5prjmqqnukywem@mozz.bu.edu>
References: <20210823164157.751807-1-philmd@redhat.com>
 <CAFEAcA9_=6n4w86gD3MHhiLeCiui9_+ePT7E2sSHdSRufUJdyA@mail.gmail.com>
 <YSQKHaGiJZE5OAk2@t490s>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YSQKHaGiJZE5OAk2@t490s>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.885,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210823 1650, Peter Xu wrote:
> On Mon, Aug 23, 2021 at 08:10:50PM +0100, Peter Maydell wrote:
> > On Mon, 23 Aug 2021 at 17:42, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> > >
> > > This series aim to kill a recent class of bug, the infamous
> > > "DMA reentrancy" issues found by Alexander while fuzzing.
> > >
> > > Introduce the 'bus_perm' field in MemTxAttrs, defining 3 bits:
> > >
> > > - MEMTXPERM_UNSPECIFIED (current default, unchanged behavior)
> > > - MEMTXPERM_UNRESTRICTED (allow list approach)
> > > - MEMTXPERM_RAM_DEVICE (example of deny list approach)
> > >
> > > If a transaction permission is not allowed (for example access
> > > to non-RAM device), we return the specific MEMTX_BUS_ERROR.
> > >
> > > Permissions are checked in after the flatview is resolved, and
> > > before the access is done, in a new function: flatview_access_allowed().
> > 
> > So I'm not going to say 'no' to this, because we have a real
> > recursive-device-handling problem and I don't have a better
> > idea to hand, but the thing about this is that we end up with
> > behaviour which is not what the real hardware does. I'm not
> > aware of any DMA device which has this kind of "can only DMA
> > to/from RAM, and aborts on access to a device" behaviour...
> 
> Sorry for not being familiar with the context - is there more info regarding
> the problem to fix?  I'm looking at the links mentioned in the old series:
> 
> https://lore.kernel.org/qemu-devel/20200903110831.353476-12-philmd@redhat.com/
> https://bugs.launchpad.net/qemu/+bug/1886362
> https://bugs.launchpad.net/qemu/+bug/1888606
> 
> They seem all marked as fixed now.

Here are some that should still reproduce:
https://gitlab.com/qemu-project/qemu/-/issues/542
https://gitlab.com/qemu-project/qemu/-/issues/540
https://gitlab.com/qemu-project/qemu/-/issues/541
https://gitlab.com/qemu-project/qemu/-/issues/62
https://lore.kernel.org/qemu-devel/20210218140629.373646-1-ppandit@redhat.com/ (CVE-2021-20255)

There's also this one, that I don't think I ever created a bug report
for (working on it now):
https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=33247
-Alex

> 
> Thanks,
> 
> -- 
> Peter Xu
> 

