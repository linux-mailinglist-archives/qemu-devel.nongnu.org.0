Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6247E2CC74C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 21:01:19 +0100 (CET)
Received: from localhost ([::1]:50914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkYJR-0000uu-T8
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 15:01:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kkYHr-0000FT-Uk
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 14:59:39 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:18895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kkYHo-0003cy-Lc
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 14:59:38 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 51ADB746553;
 Wed,  2 Dec 2020 20:59:32 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 24AD574645B; Wed,  2 Dec 2020 20:59:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2392E746383;
 Wed,  2 Dec 2020 20:59:32 +0100 (CET)
Date: Wed, 2 Dec 2020 20:59:32 +0100 (CET)
To: Doug Evans <dje@google.com>
Subject: Re: [DISCUSSION] How to set properties of non-pluggable devices?
In-Reply-To: <CADPb22T6ML4hzOaa7Y1K8X-2vB6j-7=JJpYdtuDMwv+889fLpg@mail.gmail.com>
Message-ID: <bd66adf6-32d8-6fb-5cb2-4ab8d8869d1b@eik.bme.hu>
References: <CADPb22T6ML4hzOaa7Y1K8X-2vB6j-7=JJpYdtuDMwv+889fLpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

Hello,

On Wed, 2 Dec 2020, Doug Evans wrote:
> Hi.
>
> Suppose I want to set a property of a non-pluggable device that cannot be
> set after the device has been realized (e.g., I can't use qmp to set the
> property after QEMU has started).
> Being non-pluggable means I can't use "-device foo,bar=baz" on the command
> line.
> [But I can use "-device foo,help" to list its properties :-)  (if I also
> specify -M bar) ]
>
> How do people do this?

I don't know but there's a -global option than may be what you need but I 
never know how to use it. You may be able to find examples in the doc dir 
or hopefully someone who knows it better will correct me.

Hope this helps or sorry if this is not the right answer.

Regards,
BALATON Zoltan

> The device is part of a "machine" (board really), so I could add the
> property to the machine to be passed on to the device when it's realized
> (at least I think I can), but that doesn't feel right: The machine has lots
> of devices -> it feels cleaner to associate the property with the device
> and not the machine (lest the machine over time collect a myriad of random
> properties to pass on to its devices). Things get a little complicated
> because the machine can have multiple copies of a device: specifying the
> device's name is insufficient.
>
> The device has an object path: /machine/foo/bar/device[0]. There's also
> /.../device[1].
> IWBN to be able to do something along the lines of:
> -device-property /device/path[,PROP1=VALUE1,...]
> copying the syntax used for "-object".
>
> It's perhaps even nicer if this could be accomplished with -device:
> avoiding further confusion on what -device can and can't be used for (e.g.,
> can I use -device-property to set a property that could also be set with
> -device?).
>
> If what I'm asking for is reasonable and isn't doable today (I'm certainly
> willing to believe I'm missing something), I'm happy to work on the patch
> (with some guidance as to what would be acceptable).
>
> One thought that comes to mind is to use -object, store the properties
> there, and have the machine collect them from there when realizing its
> devices. Or is that an abuse of -object ?
>

