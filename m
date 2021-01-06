Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2897D2EC1C0
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 18:08:20 +0100 (CET)
Received: from localhost ([::1]:48574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxCIF-0003pK-0X
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 12:08:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxCGd-00028y-M1
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:06:40 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:62873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxCGZ-0006Kx-Mh
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:06:38 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5E35D7470DF;
 Wed,  6 Jan 2021 18:06:32 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2B5DA74646C; Wed,  6 Jan 2021 18:06:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2979474645B;
 Wed,  6 Jan 2021 18:06:32 +0100 (CET)
Date: Wed, 6 Jan 2021 18:06:32 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] vl: initialize displays _after_ exiting preconfiguration
In-Reply-To: <20201217091403.36195-1-pbonzini@redhat.com>
Message-ID: <206452d4-8883-8787-366-c2921c365e@eik.bme.hu>
References: <20201217091403.36195-1-pbonzini@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org, Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Dec 2020, Paolo Bonzini wrote:
> Due to the renumbering of text consoles when graphical consoles are
> created, init_displaystate must be called after all QemuConsoles are
> created, i.e. after devices are created.
>
> vl.c calls it from qemu_init_displays, while qmp_x_exit_preconfig is
> where devices are created.  If qemu_init_displays is called before it,
> the VGA graphical console does not come up.

Tested-by: BALATON Zoltan <balaton@eik.bme.hu>

This still seems to be missing from master, who should take care of this?

Regards,
BALATON Zoltan

> Reported-by: Howard Spoelstra <hsp.cat7@gmail.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
> softmmu/vl.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 0ed5c5ba93..7ddf405d76 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3529,10 +3529,10 @@ void qemu_init(int argc, char **argv, char **envp)
>         exit(0);
>     }
>
> -    qemu_init_displays();
>     if (!preconfig_requested) {
>         qmp_x_exit_preconfig(&error_fatal);
>     }
> +    qemu_init_displays();
>     accel_setup_post(current_machine);
>     os_setup_post();
>     resume_mux_open();
>

