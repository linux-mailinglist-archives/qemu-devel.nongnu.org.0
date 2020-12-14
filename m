Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3722D9A3E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:48:18 +0100 (CET)
Received: from localhost ([::1]:48998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kop97-000168-IP
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:48:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kookq-0000f2-FA
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:23:14 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kookl-000644-2z
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:23:12 -0500
Received: by mail-wr1-x444.google.com with SMTP id d26so3377163wrb.12
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ERyFYHof5EYrvcGCUi6qgiCMzjpIgSAjI9dhBaUg8g8=;
 b=VEwcH78Sn7hRGSE9A0fQinEtrjY4w236Cfg7YX+0VtawWw9fLPxdHRJDilxcPYF4ZN
 LAuk3J3U+924ekIpKDp3j7D6X1PWFERRGTyoqLncFFErJnnsWeAmyooz46GIjhSjJbJI
 FtEVFtRwU2CBz8nTGMLwJ21Kc5R9x5PHtiZW/a8xEnBpFsdqEm0KXyhuGGSsBJ2/MnDM
 4yk1VedlBWbGvjIVenjhjxC6R/iO924vGizGgh95oR/u6nAyvor9VJ4vnS7g+OvCkyfb
 ckIkaiCMP2HRrESmSwNj/EFSFYUnHOdplBuz+4R91Cu1/eHWh/dA+bq2jdvb3KB3PaH5
 795A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ERyFYHof5EYrvcGCUi6qgiCMzjpIgSAjI9dhBaUg8g8=;
 b=mGF3EZq1izeTp4hS2Oiq5hP2oLXC0y4aHVwC1dBgWLsnyOsijLW7hxkm0p32YJBFDU
 7QSm8IYsIWhxwdo2BVMijqH5McHWzshitu6bzt4lHTwpcz3T6afIFauZsThTgj6OOQek
 Y9nuuFowXB4A494f+xTpDE+qYpkTImZ2Xx15LfRnZtXUt1Dy1l7DIgv6w0krvJ1WSJb6
 w4rc57LU3HWyQT7UCXEGln4mnlD8aQZRxwOnTC6Pzg1YlkhR8rQeN1SqlgB6RLgNkKek
 USTCYb3a58rb0sxx49zz9wUUTvpzIzJf8YF/y/xBa1PrJvNw4P0bxKM6GtfeG/mp72iL
 YOow==
X-Gm-Message-State: AOAM531YbRfa2ulKvWmkvZQJFIpJllTRuJuGWUclZAMiM9DnhjJov9PW
 wzeM1wgUPldS4YdEzuQPgkg=
X-Google-Smtp-Source: ABdhPJzcSCCL9TAEgdTEz74BprnBdj7iErtqUTpz0FfbTAj8CGU5q1fTaq+S/iLTcc0pmP357pYSkw==
X-Received: by 2002:a5d:610d:: with SMTP id v13mr29598918wrt.425.1607955785737; 
 Mon, 14 Dec 2020 06:23:05 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id d9sm31203997wrs.26.2020.12.14.06.23.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 06:23:05 -0800 (PST)
Subject: Re: [PATCH 11/19] target/mips: Extract common helpers from helper.c
 to common_helper.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-12-f4bug@amsat.org>
 <ac8afc12-2ab4-a2a3-81b5-b9d75314bf6f@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a6fea84e-8b4e-4181-42c7-5cc016581e7f@amsat.org>
Date: Mon, 14 Dec 2020 15:23:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <ac8afc12-2ab4-a2a3-81b5-b9d75314bf6f@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 11:06 PM, Richard Henderson wrote:
> On 12/6/20 5:39 PM, Philippe Mathieu-Daudé wrote:
>> The rest of helper.c is TLB related. Extract the non TLB
>> specific functions to a new file, so we can rename helper.c
>> as tlb_helper.c in the next commit.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> Any better name? xxx_helper.c are usually TCG helpers.
> 
> *shrug* perhaps cpu_common.c, no "helper" at all?
> Perhaps just move these bits to cpu.c?

Sounds good, thanks :)

