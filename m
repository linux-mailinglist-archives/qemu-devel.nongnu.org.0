Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B1069BDF7
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Feb 2023 00:40:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTWnO-0002XB-Bn; Sat, 18 Feb 2023 18:39:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pTWnL-0002Wy-8Y
 for qemu-devel@nongnu.org; Sat, 18 Feb 2023 18:39:07 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pTWnJ-0007jV-80
 for qemu-devel@nongnu.org; Sat, 18 Feb 2023 18:39:07 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id AC692746F31;
 Sun, 19 Feb 2023 00:38:58 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7646E74632B; Sun, 19 Feb 2023 00:38:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 74C54745720;
 Sun, 19 Feb 2023 00:38:58 +0100 (CET)
Date: Sun, 19 Feb 2023 00:38:58 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Richard Henderson <richard.henderson@linaro.org>
cc: pixman@lists.freedesktop.org, qemu-devel@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: pixman_blt on aarch64
In-Reply-To: <e615e033-a3f6-083f-5f0f-eb506c3c5b4c@eik.bme.hu>
Message-ID: <6af8172c-da06-848c-a9df-ebf65b41ccb6@eik.bme.hu>
References: <4b519268-f8e8-6542-9d1b-34054879eec0@eik.bme.hu>
 <a7866129-9f7a-02d6-1e58-bf05e1bf89e4@eik.bme.hu>
 <410c3da9-9be5-a715-7b7a-48bd67355c9c@linaro.org>
 <e615e033-a3f6-083f-5f0f-eb506c3c5b4c@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sun, 5 Feb 2023, BALATON Zoltan wrote:
> On Sun, 5 Feb 2023, Richard Henderson wrote:
>> On 2/4/23 06:57, BALATON Zoltan wrote:
>>> This has just bounced, I hoped to still be able to post after moderation 
>>> but now I'm resending it after subscribing to the pixman list. Meanwhile 
>>> I've found this ticket as well: 
>>> https://gitlab.freedesktop.org/pixman/pixman/-/merge_requests/71
>>> See the rest of the message below. Looks like this is being worked on but 
>>> I'm not sure how far is it from getting resolved. Any info on that?
>> 
>> Please try this:
>> 
>> https://gitlab.freedesktop.org/rth7680/pixman/-/tree/general
>> 
>> It provides a pure C version for ultimate fallback.
>> Unfortunately, there are no test cases for this, nor documentation.
>
> Thanks, I don't have hardware to test this but maybe Akihiko or somebody else 
> here cam try. Do you think pixman_fill won't have the same problem? It seems 
> to have at least a fast_path implementation but I'm not sure how pixman 
> selects these.

We have tried the branch above and while it does make it better and usable 
in 16bit mode, 8bit is still missing (no wonder as it does not have that 
implemented but the AmigaOS driver only allows 16bit and 8bit with the 
sm501 device this is used in but probably that's not important when 16 bit 
works). Even in 16bit more there were some graphics problems seen but that 
may need some more checking to make sure it's not some other change as the 
report was not clear if that worked before. I've asked to check the 
changes in 
https://gitlab.freedesktop.org/pixman/pixman/-/merge_requests/71 next to 
see if that would work better.

Regards,
BALATON Zoltan

