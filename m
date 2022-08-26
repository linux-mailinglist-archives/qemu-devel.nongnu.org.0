Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F4F5A2CED
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 18:57:12 +0200 (CEST)
Received: from localhost ([::1]:55906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRcdm-0005Da-G5
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 12:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRcbw-0002kP-Be
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 12:55:12 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:50732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRcbu-0006aQ-Nk
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 12:55:12 -0400
Received: by mail-pj1-x1029.google.com with SMTP id t5so2198782pjs.0
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 09:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=fQHdzXhR0Cz0XmSTb6bAW2yHNq5f8BxdDejf4JOn++o=;
 b=hksFJkCkNSQaaASXJRJ8BdaujNsI35Afpy2FTlltJGFG1lxKT58iUbCUh1mXxmejoo
 YX1bcD+Z0SqOGvVsI+xnTy9soaKqdvWAZlSIbZdiahHsVLDDIkWw6SFsnh+7uIKxTMZI
 jErvM3bvVF0RF/o+c2yd9zlvtyk+cQTKj1QXYMT2vwILHggd+xG/4dCGEBHxMwPRylye
 US1QX0Dse5vSw5bFFq7VAPpN6swOjj+uetLLxi8X95a7N2X5j7wDK1Z96FphkUL6Lt0N
 zBFAo1qqMCRMNWydCEvW1KGAuODAW7yB8zYqJsjIiyEU2R1x6hPzM+5bNcbX3dhBl42d
 w9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=fQHdzXhR0Cz0XmSTb6bAW2yHNq5f8BxdDejf4JOn++o=;
 b=7rWDgeC6hG1oM34oWzi3PgFimnYgjQWwr/ca+rMnCVE09erQJ36lql93RZ4wNgdcrz
 Jkr3kzC5H7FGfVHgp75tXlNvfsx+v2hgWHmFVVee3faTEjxtHvUrGCQYw3eAlAVAmI+4
 ZNSMEHeTZGPAPyxoWuwEWCQB0mTc6KUXc31IjINHbYWF3F5148Fk3s3N3Vs27p/WJLNv
 zeLSYV6mQTnTIb5162k83NKEtBT2S9fGnyhZ+/QzbNZJy6qiz6v8UElMzm8k1qBe0aJE
 +ri4rukPxkFUjAyl1atbm4PxCAukqiIrAk9k5CoNeV+CJgg4M/yZmMD4xPG2WcxOfNoi
 iqHA==
X-Gm-Message-State: ACgBeo2ysw5Q4We9Y4QkcCB3lCCQdn+Arq1rK3y1XAhRDrGL2ymZSCpE
 506PjCdPQ0sBnCDtNFrG6ehMmQ==
X-Google-Smtp-Source: AA6agR66XThhL1wK9hVCnu6Adu7hvmnxEfJz3TbNq5+soJAnKeOzt8Z0Hi1DGxy5nKyZWGM42jLZsw==
X-Received: by 2002:a17:902:ec90:b0:16d:d156:2c01 with SMTP id
 x16-20020a170902ec9000b0016dd1562c01mr4579816plg.114.1661532909180; 
 Fri, 26 Aug 2022 09:55:09 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f?
 ([2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a170903124d00b0016bb24f5d19sm1825422plh.209.2022.08.26.09.55.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 09:55:08 -0700 (PDT)
Message-ID: <707e07d0-03d0-f055-7008-656d6e8a8d7f@linaro.org>
Date: Fri, 26 Aug 2022 09:55:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 18/18] i386: AVX+AES helpers prep
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220825221411.35122-1-pbonzini@redhat.com>
 <20220825221411.35122-19-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825221411.35122-19-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/25/22 15:14, Paolo Bonzini wrote:
> +    for (i = 0 ; i < 2 << SHIFT ; i++) {
> +	int j = i & 3;
> +        d->L(i) = rk.L(i) ^ bswap32(AES_Td0[st.B(AES_ishifts[4 * j + 0])] ^

It that a tab?  Seem to be several of them.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

