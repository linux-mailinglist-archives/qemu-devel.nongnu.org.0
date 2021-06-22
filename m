Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE9A3B0EF1
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 22:45:12 +0200 (CEST)
Received: from localhost ([::1]:51702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvnGg-0001Ws-Hg
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 16:45:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvnFS-0000QA-4d
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 16:43:54 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvnFQ-0002QN-Ja
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 16:43:53 -0400
Received: by mail-wr1-x42f.google.com with SMTP id j1so126472wrn.9
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 13:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AZ2JQxgdVI5F/m0R800lfErYJXnHhtFs3VBDkMzW7t0=;
 b=U3GyNvBRgbjoiryHSO//ZYtn3Use7nwuPUgpW14bm2u5LZkxFICpvuNQ3SZFH1Pt4N
 ZrKNnIjKlBPZGTK52ns89iiTuMlCd9/snBgLHRcLEqnrAex3WoJeKLYDMeZecZdJyWwI
 HcBW1gQeJIY1J249ihpVlVAV8/hGM9N+/Jio6Ieoyu9/XEN8cpSs1c0+gTy2R2aMmwNH
 iu7Y2flARzzBQS3x7cUtx6Hic7jKqVqSQ6tUiFcr+IGlf/DxznDpx49gq3fiaRy32Non
 UWftleRwx9r+g3327I0l02kh527wosJNApZztELdLZLHOt22K7H3zTYgKtRipApu0nSd
 Z7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AZ2JQxgdVI5F/m0R800lfErYJXnHhtFs3VBDkMzW7t0=;
 b=T25LNsQXEnys6gJhtQC8fBb6Sl19NqvGBv6gOx2htktf1spFekFFb8qD/e5bdB7VSd
 zPgqBnTzBhT6U+kh7plvSZnqFemBf4e2w+JRt8DAMCWAw+M79Wqd5trOOUYSOuRXG+oi
 0Kq6IhsnK6DYZfV8o5ic7IjewBpS7QNXMqq68VfiIpsm5G0qOURbQrM5XLjZ7s1NAtL5
 vb7pvcMWg5HwQeVhq6NS0pj8J3bXTxtOThjR5UvFdYjsoJDR9XwacEpxEEkKw+XW07je
 d2r9nYwItmF/Wh/hxC60OGtkcssuEDqjP5nXGRmVHS+ZIXvHjblZ+I2iMjVYE2uBvTcF
 9DoQ==
X-Gm-Message-State: AOAM5332w6bv46gwqa3yrA1vnfL1kFl+k1R217U1zVLwHd8g/P/1xfeW
 csPBsM5uXxWAVzj9n0lH1skwAgvUEAoPwA==
X-Google-Smtp-Source: ABdhPJyH61eNQWyruZ/8Bt6qXMUykzn5Zu5j6ZF0+H0etM3mLbFtwYHK4NdzVE9hWtVGaARSw50omQ==
X-Received: by 2002:a5d:4acf:: with SMTP id y15mr7067598wrs.96.1624394629891; 
 Tue, 22 Jun 2021 13:43:49 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p16sm474636wrs.52.2021.06.22.13.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 13:43:47 -0700 (PDT)
Subject: Re: [PATCH] target/mips: fix emulation of nanoMIPS BPOSGE32
 instruction
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>,
 Filip Vidojevic <Filip.Vidojevic@Syrmia.com>
References: <VI1PR0302MB34869449EE56F226FC3C21129C309@VI1PR0302MB3486.eurprd03.prod.outlook.com>
 <3d567171-0b2f-85b9-be70-ad8df4508a32@amsat.org>
Message-ID: <3a83563b-9a05-7b28-ef63-8b6f3850f39f@amsat.org>
Date: Tue, 22 Jun 2021 22:43:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3d567171-0b2f-85b9-be70-ad8df4508a32@amsat.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Filip and Aleksandar,

On 6/15/21 7:33 PM, Philippe Mathieu-Daudé wrote:
> On 6/15/21 7:22 PM, Aleksandar Rikalo wrote:
>> Per the "MIPS® Architecture Extension: nanoMIPS32 DSP Technical
>> Reference Manual — Revision 0.04" p. 88 "BPOSGE32C", offset argument (imm)
>> should be left-shifted first.
>> This change was tested against test_dsp_r1_bposge32.c DSP test.
> 
> Thank you! Could you add a job to run these tests on the mainstream CI?
> You simply need to open a GitLab account, add your job (probably in
> .gitlab-ci.d/buildtest.yml) and push your branch to test it.

One week passed, so I'll proceed with the MIPS pull request without
these tests. If you want to send them later, they are still welcomed!

Regards,

Phil.

>> Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
>> Signed-off-by: Filip Vidojevic <filip.vidojevic@syrmia.com>
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
>> ---
>>  target/mips/tcg/translate.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
>> index 797eba4434..2d0a723061 100644
>> --- a/target/mips/tcg/translate.c
>> +++ b/target/mips/tcg/translate.c
>> @@ -21137,7 +21137,7 @@ static int
>> decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
>>                                        extract32(ctx->opcode, 0, 1) << 13;
>>  
>>                          gen_compute_branch_nm(ctx, OPC_BPOSGE32, 4, -1, -2,
>> -                                              imm);
>> +                                              imm << 1);
>>                      }
>>                      break;
>>                  default:
>> -- 
>> 2.25.1
> 

