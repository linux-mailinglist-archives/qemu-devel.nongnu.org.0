Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFD63097C0
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 20:03:50 +0100 (CET)
Received: from localhost ([::1]:38674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5vXB-0001q4-6R
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 14:03:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5vVa-0001NT-AE
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 14:02:10 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:38510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5vVW-0006w2-Af
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 14:02:10 -0500
Received: by mail-pg1-x531.google.com with SMTP id o16so9128231pgg.5
 for <qemu-devel@nongnu.org>; Sat, 30 Jan 2021 11:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SB85d4ezlGZF3nl90aeqB2ymvhwUzFz6l3Nrngk8Wi8=;
 b=eWIFaQHSGTJyDPdW9lh79uaX3rTWJ/5h98KDv1CpCgGXfkk/86hOumiIgAOejaH9O6
 71chVR3s6GejGwFkA9P0yAgU/LoJHDfqQ8r1GFv2F1bbY8qZWRAs1wsbpsYe3iDRXaZL
 yOxZ2ufeknYBWI06IbVdfzbF9/wZ3qOwTErxXLn2ty5x3IzRTsBs6bySLzgVtRNp3O6P
 BnBhW2j7C4II2OXSu++OtrAI6LddZtZzepWQ+yPmJPv3wyEybAI19noAxXFMg/okZC+P
 dbTxKluPxlEqHfhTspUyGJnyTB2FjJ1sSGemIwVLvfc9W0KuV0GhizpYvWTeuQd6Tmp9
 Ki6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SB85d4ezlGZF3nl90aeqB2ymvhwUzFz6l3Nrngk8Wi8=;
 b=FP+KAkGEfGwAXJrQIf5FoOyG16W/Xjea9rpV2xY9J61r1BGGoZpzlMPHNMOVo6BBh1
 9P/TOO/SfQYWJ9ppxS5pA2URFMnpBiJcYH76NWHmJVeknO54qt2iUN3S7OKh6fNz5okd
 wFbb0ot/tuwkN5Lmflj4sgZUW8u6+rutsGXHzmU9cecS4rkTgrMKook9SM/KwEK6xEkf
 b0hgypEOVtttJHfm4ztc8seEwZXBBdm6x1F8CDG+QWrCS/b6sH0mq8AI3L1A8oRuuHT7
 46lV3OALl8A3wdqKR82h3ozXKcZ+wOWJ9ytMfeNr91QzlwZB1Wv6YTZC+KckurPN/anw
 USDQ==
X-Gm-Message-State: AOAM532Degq1qWa/I9xd92hYMpMQa1fOW65fAlby4GgsDUL3CufymPQ5
 5EOdsQm+PRUS/5IFHrIQKL3VLg==
X-Google-Smtp-Source: ABdhPJzdrLUKNwAApKUYDFV/Nlhx95VahzvViitd6wngnG7J24JI1HiCOhwJErrlVceBQ4vX7Q1KQA==
X-Received: by 2002:a63:5942:: with SMTP id j2mr9882947pgm.33.1612033319494;
 Sat, 30 Jan 2021 11:01:59 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id h10sm12267294pfn.213.2021.01.30.11.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Jan 2021 11:01:58 -0800 (PST)
Subject: Re: [PATCH v14 18/22] accel: introduce AccelCPUClass extending
 CPUClass
To: Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210128092814.8676-1-cfontana@suse.de>
 <20210128092814.8676-19-cfontana@suse.de>
 <64d8385c-db22-b647-2402-3840b0e0e9b5@redhat.com>
 <9a51a203-f6a8-686f-7859-475537b3607a@suse.de> <878s8dujj5.fsf@linaro.org>
 <40ed971e-a4fe-77c5-94b9-28691874ee32@redhat.com>
 <0943e736-6847-4b6a-8433-f28f4692a299@linaro.org>
 <aaafff05-f3c6-ef44-2d98-f6fcb74ccf64@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <03ac58b2-619b-572f-85ae-0760c0c12bac@linaro.org>
Date: Sat, 30 Jan 2021 09:01:53 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <aaafff05-f3c6-ef44-2d98-f6fcb74ccf64@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/30/21 12:53 AM, Claudio Fontana wrote:
> To summarize:
> 
> 1) accel->cpu_realizefn extends the current cpu target-specific realize functions with accelerator-specific code,
>    which currently does not make use of errp at all (thus, the temptation to remove errp from the interface until it is actually needed by a target).

No, arm does use errp in realizefn already.
It's just that the void return value is hinky.


r~

