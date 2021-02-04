Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C048130FDC0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 21:11:38 +0100 (CET)
Received: from localhost ([::1]:35940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kyX-0007TZ-Ch
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 15:11:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l7kx3-0006pG-Oi
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:10:05 -0500
Received: from kerio.kamp.de ([195.62.97.192]:59029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l7kx1-0002IR-KZ
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:10:05 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Thu, 4 Feb 2021 21:09:48 +0100
Received: (qmail 6251 invoked from network); 4 Feb 2021 20:09:53 -0000
Received: from ac71.vpn.kamp-intra.net (HELO ?172.20.250.71?)
 (pl@kamp.de@::ffff:172.20.250.71)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES128-SHA encrypted) ESMTPA;
 4 Feb 2021 20:09:53 -0000
Subject: Re: [PATCH] qemu-img: add seek and -n option to dd command
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20210128140704.6547-1-pl@kamp.de>
 <99982043-ed89-5fbe-afe2-691a9c19280d@redhat.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <567ab8bb-b452-d6c2-dec7-bc2cf1e34ec8@kamp.de>
Date: Thu, 4 Feb 2021 21:09:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <99982043-ed89-5fbe-afe2-691a9c19280d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.182,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.02.21 um 16:51 schrieb Eric Blake:
> On 1/28/21 8:07 AM, Peter Lieven wrote:
>> Signed-off-by: Peter Lieven <pl@kamp.de>
> Your commit message says 'what', but not 'why'.  Generally, the one-line
> 'what' works well as the subject line, but you want the commit body to
> give an argument why your patch should be applied, rather than blank.
>
> Here's the last time we tried to improve qemu-img dd:
> https://lists.gnu.org/archive/html/qemu-devel/2018-08/msg02618.html


I was not aware of that story. My use case is that I want to be

able to "patch" an image that Qemu is able to handle by overwriting

certain sectors. And I especially do not want to "mount" that image

via qemu-nbd because I might not trust it. I totally want to avoid that the host

system tries to analyse that image in terms of scanning the bootsector, partprobe,

lvm etc. pp.


>
> where I also proposed adding seek=, and fixing skip= with count=.  Your
> patch does not do the latter.  But the bigger complaint back then was
> that 'qemu-img copy' should be able to do everything, and that qemu-img
> dd should then just be a thin shim around 'qemu-img copy', rather than
> having two parallel projects that diverge in their implementations.


understood. I was not aware of an issue with skip and count.

The patch works for me and I wanted to share it. But when I read

the thread it seems that it would be a difficult task to get it merged.


>
> Your patch does not have the typical '---' divider and diffstat between
> the commit message and the patch proper; this may be a factor of which
> git packages you have installed, but having the diffstat present makes
> it easier to see at a glance what your patch touches without reading the
> entire email.  I had to go hunting to learn if you added iotest coverage
> of this new feature...
>
> ...and the answer was no, you didn't.  You'll need to add that in v2
> (see the link to my earlier attempt at modifying dd for an example).


I did not. Maybe I accidently killed the '---' divider. If I will make a V2 I will add

an I/O test.


Thanks for your suggestions,

Peter




