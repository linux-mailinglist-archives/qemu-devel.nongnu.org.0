Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E203483F43
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:39:29 +0100 (CET)
Received: from localhost ([::1]:44320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4gHw-00041j-JG
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:39:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4gGv-0003La-L5
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 04:38:25 -0500
Received: from mail-yb1-f169.google.com ([209.85.219.169]:35379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4gGu-0006AE-6c
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 04:38:25 -0500
Received: by mail-yb1-f169.google.com with SMTP id j83so87724553ybg.2
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 01:38:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WSzFov2qu+QnxJANxPd7PiYtqbEqov/QbMwE9QaYmSs=;
 b=pdL4vLVJ2Qkz84BBRd5DxVmHXscIYkt/bL+Tkby/oPpg3YEPZJ/7bETx7b+uSkR02l
 nRWiA2473ISvS7vdZixAoHGHS5/S5OJH7yN86p0Jxu7xwDiurj/veC5ikdrjw1DhlGCi
 CT83fvqH8mz0pgLlRJYt1N8S7b+1Sz26kEmFVM+teO944S6ELm7v4FMMVYT4y2jeRLmD
 DEaJC/jBWlvJeNDxs6Eav+J4DNO3VzWykoowxv4DRi7CoA2WzOAgzFL9UwRMf8f7motb
 J1qx/yzIU19WUJfL28ezZEby5zrCo6ryo5zX/isA0ICPugz3mtgejMpJpSQUQ32QEIjV
 j0Ow==
X-Gm-Message-State: AOAM5320Eyhf5cVvYm8ZuKMt7qkwc2xMTfsNbtINW4J3CV71te5S6MG1
 xXakaoA3mKHtou4K1IR8met3xQnk0jykVVRBh6U=
X-Google-Smtp-Source: ABdhPJwmS3aqru8w5zcIeWsZEGILkLkcL/HM1JQ+r8yz/zp5oL15s4GyuOGZ9h74YXNbR6g70sHYZTq4xSiIpfesquk=
X-Received: by 2002:a25:8008:: with SMTP id m8mr7422387ybk.704.1641289103189; 
 Tue, 04 Jan 2022 01:38:23 -0800 (PST)
MIME-Version: 1.0
References: <20220104024136.1433545-1-xiaoyao.li@intel.com>
In-Reply-To: <20220104024136.1433545-1-xiaoyao.li@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 4 Jan 2022 10:38:12 +0100
Message-ID: <CAAdtpL7mQtDO2Vr--jYjRP-G7KQ6MxfoYH1NewehQHt8KTg2aw@mail.gmail.com>
Subject: Re: [PATCH] sysemu: Cleanup qemu_run_machine_init_done_notifiers()
To: Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.169;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yb1-f169.google.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 4, 2022 at 3:41 AM Xiaoyao Li <xiaoyao.li@intel.com> wrote:
>
> Remove qemu_run_machine_init_done_notifiers() since no implementation
> and user.

Fixes: f66dc8737c9 ("vl: move all generic initialization out of vl.c")
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>  include/sysemu/sysemu.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index 8fae667172ac..b9421e03ffdd 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -16,7 +16,6 @@ extern bool qemu_uuid_set;
>  void qemu_add_exit_notifier(Notifier *notify);
>  void qemu_remove_exit_notifier(Notifier *notify);
>
> -void qemu_run_machine_init_done_notifiers(void);
>  void qemu_add_machine_init_done_notifier(Notifier *notify);
>  void qemu_remove_machine_init_done_notifier(Notifier *notify);
>
> --
> 2.27.0
>
>

