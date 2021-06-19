Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 982C43ADB32
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:02:14 +0200 (CEST)
Received: from localhost ([::1]:41438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufIK-00067A-SX
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lufGM-0004ma-QK
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:00:10 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:44965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lufGL-00015t-8Q
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:00:10 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 h21-20020a1ccc150000b02901d4d33c5ca0so5676773wmb.3
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RSmWO/HuiaxuDqp+y0Dj2yPNleglzPN+ImIRBy56coo=;
 b=kgt816IfoFY3k5IEpM98hnIk44zP3uxVSNU1jZGEiOCneppXlcZnvIL4lx5SC5A6zT
 F56nvQzETbOWlRCyDCvoeNdMdCy52jMbFOUcMXrPMvhQ0IF+sVCZodlQhJ3ELvYiVCGI
 6AX+dkXl5P+Ii8kfJhdDXb6Y8IZyUJg3tf4HfO6MUcaVaq8KQws3a7pQX5TiWXvJY5rk
 1cxy9IRYfqEotSWcT+4BNOfy8xpTNYr3iJxJ5j4+tupL45f7VEMnAVpuPpMt7UjgSBkD
 Zv+VYHQQprdp7quE2Q20ZxefQp5DP1OVCQKRf2/mhpwhztaNj7DbmiEJKiWIXON67ziv
 rG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RSmWO/HuiaxuDqp+y0Dj2yPNleglzPN+ImIRBy56coo=;
 b=I5zU6qGk3YnumipdDfYNkRStMOtuLVC9/pxnbHkUEsHpagLI35Quy6Zup4DDUXxFjT
 0NeJ/4SnH5nD2vIV3EnA+DmV5J6/EF5xHd7roWKkNHfbCcnv/3+FTNm3QcEp8aRcffTc
 ezuaB7XJM+8qfp3UH+n9kSYB5MMaPueCi3hMu7nI6m8oLABCU9zArC8aItepFmKwtp0u
 nny6+rDSXxxlVM6CmQYKHTEOARWCReoQIizdNYmcpIDRXbPIF0mGcnNIPg5PTiTYRKjJ
 ESVlbJcJn6DJKbyZJdqnZYr+VWkrpk6DzK3RAFZ38pRDRN8d8GhIiZfxsI3WO9W6NGBh
 wZQw==
X-Gm-Message-State: AOAM531iLuk0clvJ4b/kWX5zPLihelKimZAo/fCTseGIU+OZhjfQiyOG
 9WYVfJi74e0W8dY1S+LAHoU=
X-Google-Smtp-Source: ABdhPJzI8CFmMWZLxtDbwvZP4Ip8Wxkb9J3ATd2x5FAo5TdTQmL0PY6boMhukcRoC7cwjvZlxb7rvQ==
X-Received: by 2002:a1c:4d01:: with SMTP id o1mr3243441wmh.98.1624125607460;
 Sat, 19 Jun 2021 11:00:07 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id h46sm13903935wrh.44.2021.06.19.11.00.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 11:00:06 -0700 (PDT)
Subject: Re: [PATCH] target/mips: fix emulation of nanoMIPS BPOSGE32
 instruction
To: Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <VI1PR0302MB34869449EE56F226FC3C21129C309@VI1PR0302MB3486.eurprd03.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f208ab86-29cd-7be2-161f-e88e02389a2f@amsat.org>
Date: Sat, 19 Jun 2021 20:00:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <VI1PR0302MB34869449EE56F226FC3C21129C309@VI1PR0302MB3486.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
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
> 
> Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> Signed-off-by: Filip Vidojevic <filip.vidojevic@syrmia.com>
> ---
>  target/mips/tcg/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to mips-next.

