Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9933A87A1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:34:58 +0200 (CEST)
Received: from localhost ([::1]:55368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCxl-0003CQ-Hn
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltCwT-0001OX-Nf
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:33:37 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:35349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltCwS-0007Jf-8e
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:33:37 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 k5-20020a05600c1c85b02901affeec3ef8so2347576wms.0
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 10:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=flZ/YMMs+93ZpkUzXJkXdGqKXbGy5i9COH+JVfBWs4A=;
 b=BwCq91w5uKb86cd0gyibH8ichR6tedBbU2vSGZ7JeriIzPStNX/VFOmi58At3lvWd/
 les/dQDz8Wgdyxw1Zk6Xfj4bSZzRkWatU+rzpOsYqGGL1YmBjjiHGCto/y4qA8FJGzbK
 8IVsZx1H7s0I8lh9OuVjS457/L4PXdcrf7FJU/BvRAjCqiNkxCeFWMhjKrato+k3Yc30
 BBCzi4wQXuvWhUfR2Fl683TLY2Rj3f+1SiGYLlXAv6NINUaCNr6p5xQJJpQ/KT3t4F94
 pYKg/tzifBSyK6YzEc+5l+kNUKpI1Qe3vrCn44aEslY+n8+3exj4B3wgOacI8nL6YIIl
 B9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=flZ/YMMs+93ZpkUzXJkXdGqKXbGy5i9COH+JVfBWs4A=;
 b=CPxi1SiEJe5RSZZyW6Uf4dYaICUJmPR9n1+vRjEtUkN/jVUwtHTpogZqZA58LU9Jm9
 vtStyYR0JBi/QTSirclG3Jpwn9VT5HzeDj1jt2tRUzk+vixr0SeDwwsde1+xg2ykzePw
 9BJA0zr8MBNZvEHE4i3bub3u+VRGVbxHDpSvPvnXHBjayrYwTNzwOO0LVcEXzuIKEWmC
 6/kc5/sYhrwaxZ8XajnPXhCGEPA/Xn8Ydgd2NxL3explQJOfiJ50BFyVRlMvF7+gZ28Y
 9+Jwkp+Gi5x5vwFT5xY4EX3uqGAPYbZ1ulxBKjI1LEic3dlHmqO5HQU8h97XKbtLfsk4
 6hOQ==
X-Gm-Message-State: AOAM531Kf1bpQg7pZkVMCiPg/vD7o4K2orEf+r6ziXhDXpRlZxjP/Uv0
 vX+VKuUHQyQQPcMgmdXMwd4=
X-Google-Smtp-Source: ABdhPJzS9fc0rG6BBVeenGHP7MZ28c0tYzSNxOBNCB31sKH132nOw++ZZPvcW5HwwTOWGFcwZPP4uQ==
X-Received: by 2002:a05:600c:4f4d:: with SMTP id
 m13mr6684543wmq.14.1623778414676; 
 Tue, 15 Jun 2021 10:33:34 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id 89sm20155691wrq.14.2021.06.15.10.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 10:33:33 -0700 (PDT)
Subject: Re: [PATCH] target/mips: fix emulation of nanoMIPS BPOSGE32
 instruction
To: Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <VI1PR0302MB34869449EE56F226FC3C21129C309@VI1PR0302MB3486.eurprd03.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3d567171-0b2f-85b9-be70-ad8df4508a32@amsat.org>
Date: Tue, 15 Jun 2021 19:33:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <VI1PR0302MB34869449EE56F226FC3C21129C309@VI1PR0302MB3486.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>,
 Filip Vidojevic <Filip.Vidojevic@Syrmia.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/21 7:22 PM, Aleksandar Rikalo wrote:
> Per the "MIPS® Architecture Extension: nanoMIPS32 DSP Technical
> Reference Manual — Revision 0.04" p. 88 "BPOSGE32C", offset argument (imm)
> should be left-shifted first.
> This change was tested against test_dsp_r1_bposge32.c DSP test.

Thank you! Could you add a job to run these tests on the mainstream CI?
You simply need to open a GitLab account, add your job (probably in
.gitlab-ci.d/buildtest.yml) and push your branch to test it.

> Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> Signed-off-by: Filip Vidojevic <filip.vidojevic@syrmia.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/mips/tcg/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
> index 797eba4434..2d0a723061 100644
> --- a/target/mips/tcg/translate.c
> +++ b/target/mips/tcg/translate.c
> @@ -21137,7 +21137,7 @@ static int
> decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
>                                        extract32(ctx->opcode, 0, 1) << 13;
>  
>                          gen_compute_branch_nm(ctx, OPC_BPOSGE32, 4, -1, -2,
> -                                              imm);
> +                                              imm << 1);
>                      }
>                      break;
>                  default:
> -- 
> 2.25.1

