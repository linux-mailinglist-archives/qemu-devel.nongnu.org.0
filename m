Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBB62F77FC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 12:52:12 +0100 (CET)
Received: from localhost ([::1]:53730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0NeF-0008OJ-M4
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 06:52:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0Nd8-0007h0-LS
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 06:51:04 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:38085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0Nd4-00057K-T1
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 06:51:02 -0500
Received: by mail-ed1-x529.google.com with SMTP id s11so1898363edd.5
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 03:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WZaFu23Ow4jstvd34MiVFcsKpmwUSb32zVx2M8YTfTA=;
 b=MAy2PaxrbK4ILBTrNNiSXbrfayei5wB3zVe9i6lNvTZrb9DFJ7DR23Mv9eTfEHtGrA
 p6k4ywQDcAoOKzZwNT/tOhnzhGOt/MKW+64a8HKwJ3on7B3i170ciP6Vic8oSteYn0H7
 DosaJaKjfZB7Vs8KrZONqL16afS78Q2rw99pHLd2L2qnK0vPbFtJEimiK1IXruP9XPrg
 gj77VrY+d7HYfWxYWiK1wyu+7cy59tFea4CyTY6j9TrrWxG4XdsZu9vSKYCUbjNUG0ij
 KQH8ISGsWIlbpCv0d/M0z/gkUzlYx7CjKQ/Uxcgo7hGOPVtC6xVpoYCzgzssAGIeDP83
 zMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WZaFu23Ow4jstvd34MiVFcsKpmwUSb32zVx2M8YTfTA=;
 b=fqjre5OCLal/0d8ZkuqY38PMRs3dBem2EupYZytUGAP0StFQyIaN7Drl8PPx7plkxT
 S4iDSXEUujmTzLUM1xOrC08G5WFiHCM7VJb1IbNKo6FqckrThUaXLwTm2gtjptT8IGvD
 WEoxYITQ0/26FJZ65Go5ul8Ne/zYHT+jF5WS3+WdqPcsBgVnMjizFnowsumG3OUbVsdo
 sLUdLJsyEvw7VtNT/83h0K9THSLXgWnvU0m4wPqoOj72UOVraOMVMwd/APus9M+mAf4i
 Pyk4LDhAOdE3zB5U3Pyh7d8To5wb+ky2jFBe/eKtRvgKo8ox3QtCRegYFkjmQ4kPEEq2
 SLWQ==
X-Gm-Message-State: AOAM531KeLq2CWOWIr3hxunwCpMATVe2ER7CeguXxy99Dj5wF7wnpDNm
 SGFlXglIczh2vbTCpbBnGnAJcBtTc2igpwxqNu7WBA==
X-Google-Smtp-Source: ABdhPJx2I5MX8FTZtzsPDK+EzcOQ81CP8qsf2CpFyvooiZHA5Q6dTRcaML8sHkzbcGw8BKQQc19RMMRC+G51WlisjF0=
X-Received: by 2002:a05:6402:366:: with SMTP id
 s6mr9061142edw.44.1610711456864; 
 Fri, 15 Jan 2021 03:50:56 -0800 (PST)
MIME-Version: 1.0
References: <20201104092900.21214-1-green.wan@sifive.com>
In-Reply-To: <20201104092900.21214-1-green.wan@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2021 11:50:45 +0000
Message-ID: <CAFEAcA_EykbnmTQuz4RT3qGMt-Atf=EAdaHd-QqBvJCPvwemqA@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/sifive_u_otp: handling the fails of blk_pread and
 blk_pwrite
To: Green Wan <green.wan@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair23@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping! This patch was trying to fix a Coverity issue (CID 1435959,
1435960, 1435961) -- is anybody planning to review it?

(I'm not entirely sure 'guest error' is the right warning category,
but I don't know the specifics of this device.)

thanks
-- PMM

On Wed, 4 Nov 2020 at 09:29, Green Wan <green.wan@sifive.com> wrote:
>
> Fix code coverage issues by checking return value and handling fail case
> of blk_pread() and blk_pwrite(). Return default value 0xff if read fails.
>
> Signed-off-by: Green Wan <green.wan@sifive.com>
> ---
>  hw/misc/sifive_u_otp.c | 31 +++++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
>
> diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
> index 60066375ab..4314727d0d 100644
> --- a/hw/misc/sifive_u_otp.c
> +++ b/hw/misc/sifive_u_otp.c
> @@ -62,8 +62,13 @@ static uint64_t sifive_u_otp_read(void *opaque, hwaddr addr, unsigned int size)
>              if (s->blk) {
>                  int32_t buf;
>
> -                blk_pread(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD, &buf,
> -                          SIFIVE_U_OTP_FUSE_WORD);
> +                if (blk_pread(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD, &buf,
> +                              SIFIVE_U_OTP_FUSE_WORD) < 0) {
> +                    qemu_log_mask(LOG_GUEST_ERROR,
> +                                  "read error index<%d>\n", s->pa);
> +                    return 0xff;
> +                }
> +
>                  return buf;
>              }
>
> @@ -160,8 +165,12 @@ static void sifive_u_otp_write(void *opaque, hwaddr addr,
>
>              /* write to backend */
>              if (s->blk) {
> -                blk_pwrite(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD,
> -                           &s->fuse[s->pa], SIFIVE_U_OTP_FUSE_WORD, 0);
> +                if (blk_pwrite(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD,
> +                               &s->fuse[s->pa], SIFIVE_U_OTP_FUSE_WORD,
> +                               0) < 0) {
> +                    qemu_log_mask(LOG_GUEST_ERROR,
> +                                  "write error index<%d>\n", s->pa);
> +                }
>              }
>
>              /* update written bit */
> @@ -248,12 +257,18 @@ static void sifive_u_otp_reset(DeviceState *dev)
>          int index = SIFIVE_U_OTP_SERIAL_ADDR;
>
>          serial_data = s->serial;
> -        blk_pwrite(s->blk, index * SIFIVE_U_OTP_FUSE_WORD,
> -                   &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0);
> +        if (blk_pwrite(s->blk, index * SIFIVE_U_OTP_FUSE_WORD,
> +                       &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "write error index<%d>\n", index);
> +        }
>
>          serial_data = ~(s->serial);
> -        blk_pwrite(s->blk, (index + 1) * SIFIVE_U_OTP_FUSE_WORD,
> -                   &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0);
> +        if (blk_pwrite(s->blk, (index + 1) * SIFIVE_U_OTP_FUSE_WORD,
> +                       &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "write error index<%d>\n", index + 1);
> +        }
>      }
>
>      /* Initialize write-once map */
> --
> 2.17.1

