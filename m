Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E544B326724
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 19:55:24 +0100 (CET)
Received: from localhost ([::1]:50790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFiGp-0001kV-Do
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 13:55:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lFiFt-0000tD-DP; Fri, 26 Feb 2021 13:54:25 -0500
Received: from relay64.bu.edu ([128.197.228.104]:46267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lFiFr-0003PV-4V; Fri, 26 Feb 2021 13:54:24 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 11QIrK5C022761
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 26 Feb 2021 13:53:23 -0500
Date: Fri, 26 Feb 2021 13:53:20 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: P J P <pj.pandit@yahoo.co.in>
Subject: Re: [QEMU-SECURITY] [PATCH 1/6] net: introduce qemu_receive_packet()
Message-ID: <20210226185320.ykopguq3vvlln5jg@mozz.bu.edu>
References: <20210224055401.492407-1-jasowang@redhat.com>
 <20210224055401.492407-2-jasowang@redhat.com>
 <9e432ff0-793e-64a7-97f3-ff3a374ee98f@redhat.com>
 <b7d39898-d688-70bb-4546-612150a1635b@redhat.com>
 <5386f97e-0fb4-b7bc-6520-698a9c856bf9@redhat.com>
 <90q67362-8n44-60q3-1q8o-nso367onnr3@erqung.pbz>
 <20210225162805.dwgmz4lwfafeqjmg@mozz.bu.edu>
 <20210225162908.awbtm2xud64xdsku@mozz.bu.edu>
 <1530141988.220096.1614363271523@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1530141988.220096.1614363271523@mail.yahoo.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 QEMU Security <qemu-security@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210226 1814, P J P wrote:
> Hello Alex,
> 
> On Thursday, 25 February, 2021, 10:00:33 pm IST, Alexander Bulekov <alxndr@bu.edu> wrote: 
> On 210225 1128, Alexander Bulekov wrote:
> > On 210225 1931, P J P wrote:
> > > +-- On Wed, 24 Feb 2021, Philippe Mathieu-Daudé wrote --+
> > > | On 2/24/21 2:17 PM, Jason Wang wrote:
> > > | > On 2021/2/24 6:11 下午, Philippe Mathieu-Daudé wrote:
> > > | >> IIUC the guest could trigger an infinite loop and brick the emulated 
> > > | >> device model. Likely exhausting the stack, so either SEGV by corruption 
> > > | >> or some ENOMEM?
> > > | > 
> > > | > Yes.
> > > | >>
> > > | >> Since this is guest triggerable, shouldn't we contact qemu-security@ list 
> > > | >> and ask for a CVE for this issue, so distributions can track the patches 
> > > | >> to backport in their stable releases? (it seems to be within the KVM 
> > > | >> devices boundary).
> > > | > 
> > > | > 
> > > | > That's the plan. I discussed this with Prasad before and he promise to
> > > | > ask CVE for this.
> > > 
> > > 'CVE-2021-3416' is assigned to this issue by Red Hat Inc.
> >
> > What is the difference with CVE-2021-20255 and CVE-2021-20257 ? Aren't
> > those just manifestations of this bug for the e1000 and the eepro100
> > devices
> 
> * You mean manifestations of the dam re-entrancy issue? 
> 

Ah I got confused - those other CVEs don't seem to be related to
loopback.
-Alex

> * They have separate CVEs because they are fixed individually.
> 
> 
> Thank you.
> ---
>   -P J P
> http://feedmug.com

