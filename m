Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D206AE7E9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:07:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZamh-0002GE-3m; Tue, 07 Mar 2023 12:07:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZamc-0002Fy-AJ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:07:26 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZama-0004rl-OX
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:07:26 -0500
Received: by mail-pl1-x630.google.com with SMTP id x11so10300103pln.12
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678208843;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UZcjcKmJgSMFqTNcjIVhTv2JU56bRFe7qX1GJT3B4EU=;
 b=RRn1fKbqnSyvwGiU+CtHl9leENNeWcCLP6dPvqCYBH6gwGvI23OZSL9IiZ/ST5t8kF
 MuiGcMorNE+esm2Y4Zi9/swlpIuHM+K638aelOcwTh4naoajGlv4R3mUF1n2U2ACnCu2
 nAFxI38EQ6HkLhZSQhw/0dCLl4U+oBGxOMXsfq49JfB9uU0bJ57dAKIHAV4NCPTyq7JR
 YLMLnbcSym2zCvzjai0tNlACkNkSycbAVoOUB1ELRnbDceUvGFNae0tXZLp0/OibTnkt
 JRs26pRnXRKrCkK3p0gGNeNPjmwaKQKoMIlrio81nLIrE4Z1053TypMGG70NSWTr/0yk
 YrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678208843;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UZcjcKmJgSMFqTNcjIVhTv2JU56bRFe7qX1GJT3B4EU=;
 b=Y5JaoiIkiouUN/nWKQ1UKstPO6XIii69S3ZucgFS+RUlDj44cWFfwZs1zvhTPxvKYk
 Fpf8/btIT3ufxXpclYcuKWek6YqzvgWt7jRXQX8gvHY7+Aaon5Gb/Vgwd5ML63OrbOz8
 ECYgtUp4W6fLfDYqGLct6FKTCi7MBmZuk8uwd6pY86mQdsi/rxf/3frmC3FHEjZpRn9Z
 RmIGdxLWu1CYMY+Ea+oQS5rMMn4RJF9paNLpvzjFrwwCstfRJXQcx26R1zfp/TEi+ebZ
 L2xNToQU0oKsUEKLRkD2TZU/bG2zpT/23b8MdMl4/wnRSB1HA+/J5AT134B1KAeHXt7w
 s1jg==
X-Gm-Message-State: AO0yUKUl597T6IMVZPZn5VuylVjDpmnmLaJ/ToGdZ8hV5Qh/My88udN7
 L43uCDe0xMfd3cK3Iec+mPtqaA==
X-Google-Smtp-Source: AK7set82tngOkvpr54iS7v6rwU8IkhbbntoGTTXb3TD+XX+gV95HZ6V+uZhahAwr+Iri8VCOM50hoQ==
X-Received: by 2002:a17:903:24f:b0:19e:7a2c:78a7 with SMTP id
 j15-20020a170903024f00b0019e7a2c78a7mr17151767plh.57.1678208842618; 
 Tue, 07 Mar 2023 09:07:22 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb?
 ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 ku7-20020a170903288700b0019cd1ee1523sm4740291plb.30.2023.03.07.09.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 09:07:22 -0800 (PST)
Message-ID: <b256f22e-ab10-bc0f-b80c-035f1c9d7cd1@linaro.org>
Date: Tue, 7 Mar 2023 09:07:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 00/15] linux-user/sparc: Handle missing traps
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20230216054516.1267305-1-richard.henderson@linaro.org>
 <3902d4eb-9158-19aa-3686-bf04b0f5a85c@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <3902d4eb-9158-19aa-3686-bf04b0f5a85c@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/7/23 07:56, Laurent Vivier wrote:
> Hi Richard,
> 
> I don't have the time to review your series, do you want I queue it in the linux-user 
> branch and I keep it if it passes my test suite?

Yes please.


r~

