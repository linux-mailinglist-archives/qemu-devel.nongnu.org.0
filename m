Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57026A1239
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 22:44:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVJNZ-0001gP-My; Thu, 23 Feb 2023 16:43:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVJNW-0001gH-DQ
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:43:50 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVJNU-00051P-Tr
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:43:50 -0500
Received: by mail-pl1-x62a.google.com with SMTP id e5so15719965plg.8
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 13:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qqRERGUhwRRTYs7BfLOlhlk6w473C7pkJdiGbnegniU=;
 b=yMEd7REGRM9TzLtMHe5F5+xy19VxwAOLpFU58rEPvTpFSGBoDX4SrEmDv1pba4W3Na
 px0A2BsA5VDMy0AJhFvhVHYLg1xMhH2WL46srqX9Qa9l+47CqOxxCmDo6Q60fTOSGBi1
 rhOA6D/Y2nu4el+7yK6xlVlWK+Jwv90ODIaqy8PJikwAO7MaCR8pYci3JIlnuGalFykB
 /duKx/BSb6+gbpahnp+G7CizVNZc106htosQAWjbVO3CMg+bJSEEE86jvZthCXmQ/e/d
 St12R8RI32uofloMyA2cs2fCpcE+nxR5V7Yzys/Utz8SObvhI3GgkHhafs3LhNgFgYWn
 18iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qqRERGUhwRRTYs7BfLOlhlk6w473C7pkJdiGbnegniU=;
 b=vGBCfvJVF7Hz6I+PWzMK7p6l6nCu5v+nVH91HlYJOT3dn6i9e8R1ATpdv3RIagflnt
 O5XT+eTOsLtVezzh/BM64KZTdA8mSzio1cQGMtkWeh0iXVN1h415oXRI8HKZ0j6Z8uNd
 WFPNWzw5yCA+GeYiLEFzdNXVIXEuxJcA1ivRGn1+7ajqTTLPLZBelUaQRfoYSRGoT04M
 bb/wsRjcqaz0NXM7X5oyo3FoKZl7KlG0IZ8Olh3vwz80BeSR3Z2RPS/2HW3ZyV+AdN5A
 S7IEAfyQSCgTdaapmKFJJF3qBBkcHa4X9sqpwNSm9+jDcPYyJtzlSBezlaboYy9t7U1X
 i2OQ==
X-Gm-Message-State: AO0yUKUVD9Pd6mzSpA3X3SQ5oGkxkOtEOybnbCOse//GXlPwXpXDVJZa
 XHzNHD9E8Lb/MYbLK2bGa0WZ3Q==
X-Google-Smtp-Source: AK7set+NzFwOFOcpKQlBfccsk06zO2EbByMh4z3c2j8/ICqiLnN4xOSRvLcUX05n3AxxdK4Sc6bwDA==
X-Received: by 2002:a17:90b:4c87:b0:233:d181:5b75 with SMTP id
 my7-20020a17090b4c8700b00233d1815b75mr13142235pjb.31.1677188626839; 
 Thu, 23 Feb 2023 13:43:46 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 c14-20020a17090a558e00b002345ef591dasm158122pji.31.2023.02.23.13.43.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 13:43:46 -0800 (PST)
Message-ID: <38e32f1f-b268-6dba-a684-1987962fc136@linaro.org>
Date: Thu, 23 Feb 2023 11:43:42 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/5] dump: Include missing "cpu.h" header for
 tswap32/tswap64() declarations
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, Steffen Eiden <seiden@linux.ibm.com>
References: <20221216215519.5522-1-philmd@linaro.org>
 <20221216215519.5522-2-philmd@linaro.org>
 <039803d2-24aa-e22f-a154-7ca07e781852@linaro.org>
 <1562d9eb-abfd-ed25-e169-404a619df47c@linaro.org>
 <4727f0a2-680b-cff4-16ad-f7904f1cd086@linaro.org>
 <c6cb2c08-65c1-5cde-f67e-9e073e01e222@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c6cb2c08-65c1-5cde-f67e-9e073e01e222@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 2/23/23 11:19, Philippe Mathieu-Daudé wrote:
> This file uses tswap() 4 times in the same function: get_note_sizes(),
> so I could extract it to a dump-target.c unit.
> I have no clue what that file is for, but this particularity is odd.

All uses of tswap in that file are wrong, and should be using cpu_to_dumpN, which 
correctly tests the endianness of the output.


r~


