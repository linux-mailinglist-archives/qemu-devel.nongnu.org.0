Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE6468AB6D
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 18:03:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLtj-00026W-JX; Sat, 04 Feb 2023 12:00:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pOLtR-0001y3-W3
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 12:00:02 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pOLtP-0006os-Bt
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 12:00:01 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7259A746392;
 Sat,  4 Feb 2023 17:57:27 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 33BD5746377; Sat,  4 Feb 2023 17:57:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3210B74633D;
 Sat,  4 Feb 2023 17:57:27 +0100 (CET)
Date: Sat, 4 Feb 2023 17:57:27 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: pixman@lists.freedesktop.org
cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: pixman_blt on aarch64
In-Reply-To: <4b519268-f8e8-6542-9d1b-34054879eec0@eik.bme.hu>
Message-ID: <a7866129-9f7a-02d6-1e58-bf05e1bf89e4@eik.bme.hu>
References: <4b519268-f8e8-6542-9d1b-34054879eec0@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 11%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This has just bounced, I hoped to still be able to post after moderation 
but now I'm resending it after subscribing to the pixman list. Meanwhile 
I've found this ticket as well: 
https://gitlab.freedesktop.org/pixman/pixman/-/merge_requests/71
See the rest of the message below. Looks like this is being worked on but 
I'm not sure how far is it from getting resolved. Any info on that?

On Sat, 4 Feb 2023, BALATON Zoltan wrote:
> Hello,
>
> I'm trying to involve the pixman list in this thread on qemu-devel list 
> started with subject "Display update issue on M1 Macs". See here:
>
> https://lists.nongnu.org/archive/html/qemu-devel/2023-02/msg01033.html
>
> We have found that on aarch64 Macs running macOS the pixman_blt and 
> pixman_fill functions are disabled without fallback due to not being able to 
> compile the needed assembly code. See detailed discussion below.
>
> Is there a way to fix this in pixman in the near future or provide a fallback 
> for this in pixman? Or do I need to add a fallback in QEMU or try using 
> something else instead of pixman for these functions?
>
> Thank you,
> BALATON Zoltan
>
> On Sat, 4 Feb 2023, Akihiko Odaki wrote:
>> On 2023/02/03 22:45, BALATON Zoltan wrote:
>>> On Fri, 3 Feb 2023, Akihiko Odaki wrote:
>>>> I finally reproduced the issue with MorphOS and ati-vga and figured out 
>>>> its cause.
>>>> 
>>>> The problem is that pixman_blt() is disabled because its backend is 
>>>> written in GNU assembly, and GNU assembler is not available on macOS. 
>>>> There is no fallback written in C, unfortunately. The issue is tracked by 
>>>> the upstream at:
>>>> https://gitlab.freedesktop.org/pixman/pixman/-/issues/59
>>> 
>>> Hm, OK but that ticket is just about compile error and suggests to disable 
>>> it and does not say it won't work then. Are they aware this is a problem? 
>>> Maybe we should write to their mailing list after we're sure what's 
>>> happening.
>> 
>> That's a good idea. They may prioritize the issue if they realize that 
>> disables pixman_blt().
>> 
>>>> I hit the same problem on Asahi Linux, which is based on Arch Linux ARM. 
>>>> It is because Arch Linux copied PKGBUILD from x86 Arch Linux, which 
>>>> disables Arm backends. It is easy to enable the backend for the platform 
>>>> so I proposed a change at:
>>>> https://github.com/archlinuxarm/PKGBUILDs/pull/1985
>>> 
>>> On macOS one source of pixman most people use is brew.sh where this seems 
>>> to be disabled:
>>> 
>>> https://github.com/Homebrew/homebrew-core/blob/master/Formula/pixman.rb
>>> 
>>> another source is macports which has an older version and no such options:
>>> 
>>> https://github.com/macports/macports-ports/blob/master/graphics/libpixman-devel/Portfile
>>> 
>>> I wonder if it compiles from macports on aarch64 then.
>> 
>> It's more likely that it is just outdated. It does not carry a patch to fix 
>> the issue.
>> 
>>> I wait if I can get some more test results and try to check pixman but its 
>>> source is not too clear to me and there are no docs either so maybe the 
>>> best way is to ask on their list. If this is a pixman issue I hope it can 
>>> be fixed there and we don't need to implement a fallback in QEMU.
>> 
>> This is certainly a pixman issue.
>> 
>> If you read the source, you can see pixman_blt() calls 
>> _pixman_implementation_blt(). _pixman_implementation_blt() calls blt member 
>> of pixman_implementation_t in turn. Grepping for "blt =" tells it is only 
>> assigned in:
>> pixman/pixman-arm-neon.c
>> pixman/pixman-arm-simd.c
>> pixman/pixman-mips-dspr2.c
>> pixman/pixman-mmx.c
>> pixman/pixman-sse2.c
>> 
>> For AArch64, only pixman/pixman-arm-neon.c is relevant, and it needs to be 
>> disabled to build the library on macOS.
>> 
>> Regards,
>> Akihiko Odaki
>> 
>>> 
>>> Regards,
>>> BALATON Zoltan
>

