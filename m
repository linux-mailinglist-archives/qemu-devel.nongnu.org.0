Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7903B4C52
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 06:06:17 +0200 (CEST)
Received: from localhost ([::1]:60498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwzaB-00019y-VL
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 00:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lwzZ8-0000LO-9X; Sat, 26 Jun 2021 00:05:10 -0400
Received: from relay68.bu.edu ([128.197.228.73]:60900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lwzZ5-00025F-RP; Sat, 26 Jun 2021 00:05:09 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 15Q448Tl020248
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 26 Jun 2021 00:04:12 -0400
Date: Sat, 26 Jun 2021 00:04:08 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 0/9] hw/sd: Allow card size not power of 2 again
Message-ID: <20210626040408.hut2su4cxb2vgoyt@mozz.bu.edu>
References: <20210623180021.898286-1-f4bug@amsat.org>
 <20210624025054.57gf3w5fawybm3me@mozz.bu.edu>
 <235bae9f-4c24-0a78-2c53-ed08daa282b1@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <235bae9f-4c24-0a78-2c53-ed08daa282b1@amsat.org>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Tom Yan <tom.ty89@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210624 1012, Philippe Mathieu-Daudé wrote:
> On 6/24/21 4:50 AM, Alexander Bulekov wrote:
> > On 210623 2000, Philippe Mathieu-Daudé wrote:
> >> Hi Ubi-Wan Kenubi and Tom,
> >>
> >> In commit a9bcedd (SD card size has to be power of 2) we decided
> >> to restrict SD card size to avoid security problems (CVE-2020-13253)
> >> but this became not practical to some users.
> >>
> >> This RFC series tries to remove the limitation, keeping our
> >> functional tests working. It is unfinished work because I had to
> >> attend other topics, but sending it early as RFC to get feedback.
> >> I'll keep working when I get more time, except if one if you can
> >> help me.
> >>
> >> Alexander, could you generate a qtest reproducer with the fuzzer
> >> corpus? See: https://bugs.launchpad.net/qemu/+bug/1878054
> > 
> > I think that bug was already fixed - the reproducer no logner causes a
> > timeout on 6.0. Did I misunderstand something?
> 
> That bug was fixed but now I'm changing the code and would like to feel
> sure I'm not re-introducing the problem, so having the reproducer in the
> tree would help.

Ok - I'll try to come up with one. Minimizing reproducers for timeouts
is trickier than crashes :-)

> 
> > I applied this series and ran the OSS-Fuzz corpus for the sdhci-v3
> > config. The only problem it found is this assert() (that exists without the
> > patch anyways):
> > https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=29225 
> 
> Sigh.
> 
> > Let me know if this is something you think I should report on gitlab..
> 
> Yes please :(

Ok here it is: https://gitlab.com/qemu-project/qemu/-/issues/450

The fuzzer I left running for 24h also found another bug (looks like DMA
reentrancy), which I thought was introduced by this patchset, since
OSS-Fuzz had not reported it in months of fuzzing. However, as a
sanity-check I tried it against qemu.git and it crashed - strange...
Anyways here it is: https://gitlab.com/qemu-project/qemu/-/issues/451

-Alex

> 
> > I'll leave the fuzzer running for another 24h or so, but otherwise I'm
> > happy to leave a Tested-by, once there is a V1 series 
> > -Alex
> 
> Thanks!
> 
> Phil.

