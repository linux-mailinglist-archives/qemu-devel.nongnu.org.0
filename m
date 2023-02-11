Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B95BA693350
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 20:29:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQvXY-00075f-Kx; Sat, 11 Feb 2023 14:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQvXW-00075T-I7
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 14:28:02 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQvXU-0004Ya-MX
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 14:28:02 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 nn4-20020a17090b38c400b00233a6f118d0so6372091pjb.2
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 11:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3SmAkkNEsYbgraneoGfPA3V26eHRew0IhnL9K1f0A3I=;
 b=cEAnf/vt/70gKs+ZZXkzU1Zpzx2N9lS5buSLKhgsAZqDA8/lzmOtM02JyRrUO9BSkx
 EqF/A2ud7qmpcskU9JANrWQltLIKCmocUGDtIm4HqaPxlCgKkS8pvZ9uTZQBcPIohBIf
 zEbFG9jo0Byqdd0K3v6RMSrIG0mJsT62BA5x0+Ty8Xzvb3cLBi1+ENFkwc2H95WCviWh
 cxcZ7a7t+1y/DR+jIbIo9e3eA0sB4FtGtvG+cX7cgT2CfmzJvrse0dTEisPKqgP5Z15/
 ZD1TJOkJN/uU50jpTGKGlXtu98WwijlxVcZIlHh8RzC6MKTSbwWgz+rWVpiksv5r7dmu
 paFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3SmAkkNEsYbgraneoGfPA3V26eHRew0IhnL9K1f0A3I=;
 b=G1m8Gi0EiGSbZKzcWZW25gDqA+veyDP00aIFsNy+coFLD0XvtKVzKyl0YL30ItZyOy
 AY0+bbXJIl0XfZ7Ex0nT5Lw6xYDI2yj9nFHKMAmOHwBtMhqBRO7BqE6ppgn7ntw3NybB
 dIDvYSpxm7y1bckDCMCKCofuKCiXdN+s6NbltguyOHTkY3NkKzUWDCiKpOd0VL3y3DWD
 LUHnNlZUzsdbp6CK+Pmp+gRmtZL9Qhm/QThEYuoKaZdlFZ/k48mk95zKyXbsGzpZD9W3
 aStFy9vTz7uGs/xssa+XVprcqno/gNY8XEikx62ePtmKUgboLNtdIYkw+3Wt4u3JDhe4
 XXew==
X-Gm-Message-State: AO0yUKV2R/vwKlU2lVNUoGaUs//O4HCTxL6hw3C55vBqnXpw2f8Cs2B1
 bG+L9AgjU/lV9a7bMbejsZFWjQ==
X-Google-Smtp-Source: AK7set/fLr+lHdfcgKZdJCOFsc+JbL5QZZtoohUGb56OUxVBKGAIVpN4xLfsQe2xHL+WIRisxqWBTg==
X-Received: by 2002:a17:90b:1d86:b0:230:754c:32c5 with SMTP id
 pf6-20020a17090b1d8600b00230754c32c5mr20956161pjb.27.1676143678829; 
 Sat, 11 Feb 2023 11:27:58 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 n13-20020a17090aab8d00b00227223c58ecsm822348pjq.42.2023.02.11.11.27.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 11:27:58 -0800 (PST)
Message-ID: <1f1f55f4-2565-4679-2057-0da4767d1650@linaro.org>
Date: Sat, 11 Feb 2023 09:27:54 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/9] bsd-user: Add sysarch syscall
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 f4bug@amsat.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stacey Son <sson@FreeBSD.org>,
 Juergen Lock <nox@jelal.kn-bremen.de>
References: <20230210231829.39476-1-imp@bsdimp.com>
 <20230210231829.39476-4-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210231829.39476-4-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/10/23 13:18, Warner Losh wrote:
> From: Stacey Son<sson@FreeBSD.org>
> 
> Connect up the sysarch system call.
> 
> Signed-off-by: Juergen Lock<nox@jelal.kn-bremen.de>
> Co-authored-by: Juergen Lock<nox@jelal.kn-bremen.de>
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Reviewed-by: Warner Losh<imp@bsdimp.com>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/os-syscall.c | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

