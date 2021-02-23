Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3BE3227CF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:30:16 +0100 (CET)
Received: from localhost ([::1]:37840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEU1H-00089p-Gt
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:30:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lETvW-00028B-AW; Tue, 23 Feb 2021 04:24:18 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:27727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lETvT-0008Ju-Bf; Tue, 23 Feb 2021 04:24:17 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 65E2D7462FD;
 Tue, 23 Feb 2021 10:24:13 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D59677456B7; Tue, 23 Feb 2021 10:24:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D3E0D7456B4;
 Tue, 23 Feb 2021 10:24:12 +0100 (CET)
Date: Tue, 23 Feb 2021 10:24:12 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v3 0/6] Pegasos2 emulation
In-Reply-To: <YDSHmmzHLzMkd+zF@yekko.fritz.box>
Message-ID: <55c7284b-d02f-daf-b338-948de3f2d8a7@eik.bme.hu>
References: <cover.1614007326.git.balaton@eik.bme.hu>
 <YDSHmmzHLzMkd+zF@yekko.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, f4bug@amsat.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Feb 2021, David Gibson wrote:
> On Mon, Feb 22, 2021 at 04:22:06PM +0100, BALATON Zoltan wrote:
>> Hello,
>>
>> This is adding a new PPC board called pegasos2. More info on it can be
>> found at:
>>
>> https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2
>>
>> Currently it needs a firmware ROM image that I cannot include due to
>> original copyright holder (bPlan) did not release it under a free
>> licence but I have plans to write a replacement in the future. With
>> the original board firmware it can boot MorphOS now as:
>>
>> qemu-system-ppc -M pegasos2 -cdrom morphos.iso -device ati-vga,romfile="" -serial stdio
>>
>> then enter "boot cd boot.img" at the firmware "ok" prompt as described
>> in the MorphOS.readme. To boot Linux use same command line with e.g.
>> -cdrom debian-8.11.0-powerpc-netinst.iso then enter
>> "boot cd install/pegasos"
>>
>> The last patch adds the actual board code after previous patches
>> adding VT8231 and MV64361 system controller chip emulation. The
>> mv643xx.h header file is taken from Linux and produces a bunch of
>> checkpatch warnings due to different formatting rules it follows, I'm
>> not sure we want to adopt it and change formatting or keep it as it
>> is.
>
> A couple of overall comments:
>
> * Adding yourself to MAINTAINERS for the new files would be a good
>   idea
> * At least some rudimentary tests would be good, though I guess that
>   might be tricky with non-free firmware

I've described here what could be a test:

https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg01553.html

but I'm not sure how to implement that in qtest so if somebody helped with 
that that would be greatly appreciated.

Regards,
BALATON Zoltan

