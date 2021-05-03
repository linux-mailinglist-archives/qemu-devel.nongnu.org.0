Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A66B37205F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 21:25:52 +0200 (CEST)
Received: from localhost ([::1]:50300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldeCV-0001HJ-AT
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 15:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lde9F-0006vA-31
 for qemu-devel@nongnu.org; Mon, 03 May 2021 15:22:29 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:40514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lde9D-0000rB-7x
 for qemu-devel@nongnu.org; Mon, 03 May 2021 15:22:28 -0400
Received: by mail-pf1-x42d.google.com with SMTP id x188so2912358pfd.7
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 12:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t6UAX4+HEE9ZtHNZWIRyVK3lOtWpU6jnwVgw1bixHjo=;
 b=mTW/HkPwuQmy8998O2iodJsRj0XPMIVOpqklF74Iu2Sx2BRcAxulTfhX/BjMcXXpS5
 GJ8/6DCXyYfzXVaD9UnFOpMdbEdQ9wgUNa9zmx9DR1PD0maMRfI4B0NXoGTuGB45Cbqr
 HpagiZ+dvBv3Yhg5HFd5I5ein1+pNkNFO9qPGvS8qzv3K7pd49pAsXSJb4qU+tE6f5WT
 M6HdtpReornj23UN5eo1Ld4XJ7isEovIBzIBB3qlvWQPZaLehflWPwsSHMz8aaVNMRPw
 sGC/TWsENTSQPd00ryIwU+nv3Rp4Rtf7R8STK3ZJVuFTlqFSt6UnDe7pbzzy1mrwL3Xc
 r9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t6UAX4+HEE9ZtHNZWIRyVK3lOtWpU6jnwVgw1bixHjo=;
 b=Oko18ZXKKScKurjxOdmkhXoshbiNLJvYG3cIje2xCXaJsVdsc3evEcRjdAH+meXCE5
 F3SWR3k26n1L/EYTW/4lBDKv16lKdXBueY5iP8Yr/OtVahdbd/ud4TCvwUMLHXyG/12Y
 /qqvfSBN2wOM5yloBXpGWP77cNmKbYHpIOO3J1kMr7OptFwq3so4G1QXm9g3ex5WxgN0
 RydzVsfFKnsTe/UMBnSfL+lY9Ef7OQ3QzVtXxWhlHGVutsOVMCl8QmJytjHzRzsqRqT5
 vMuilUJi6YlR2g5c42AQAhrbgKMHcCK1iB/y45NpGOLjQK83saenvOVXf5GC8tvuLeMk
 LpIA==
X-Gm-Message-State: AOAM532spxMYSrv94qiM67lb7JzXr3pS+lmhG5lY/1h021Ql2c74luxI
 bpU4Ns21wDRoSUe2LmaPeXYvuQ==
X-Google-Smtp-Source: ABdhPJxzdrPQJTtyjFX9v1DBcdMyAEx73B+ERLVQtR9lBXJ435Ie4RGtoCHYCCXL8T7w5IREWuYaLQ==
X-Received: by 2002:a05:6a00:1687:b029:253:f417:4dba with SMTP id
 k7-20020a056a001687b0290253f4174dbamr20350235pfc.5.1620069743641; 
 Mon, 03 May 2021 12:22:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id mn22sm242787pjb.24.2021.05.03.12.22.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 12:22:23 -0700 (PDT)
Subject: Re: [PATCH v3 6/6] hw/sparc/sun4m: Move each sun4m_hwdef definition
 in its class_init
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210503171303.822501-1-f4bug@amsat.org>
 <20210503171303.822501-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4defc9c4-1b99-19f3-44a7-19275e3afbed@linaro.org>
Date: Mon, 3 May 2021 12:22:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210503171303.822501-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 10:13 AM, Philippe Mathieu-Daudé wrote:
> Remove the sun4m_hwdefs[] array by moving assigning the
> structure fields directly in each machine class_init()
> function.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/sparc/sun4m.c | 248 ++++++++++++++++++++++-------------------------
>   1 file changed, 118 insertions(+), 130 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

