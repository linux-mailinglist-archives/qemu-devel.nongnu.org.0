Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1116AD4EF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 03:44:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZNIx-0003c5-57; Mon, 06 Mar 2023 21:43:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZNIs-0003a5-QR
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:43:51 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZNIr-000314-8B
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:43:50 -0500
Received: by mail-pl1-x62b.google.com with SMTP id i5so12683803pla.2
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 18:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678157028;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TZZUerayr4Vwu+mLpbm9993BkKWAeLPQd3Hs8A+YpLQ=;
 b=GJPBc3z+jhZ0HwjeNXwiWdLykxv/heTtof0JnXRPLTjNLt7XoK4QATdgNl+zC+uYER
 10d0xOLQbQ5tKYoDbIepka+6YTmlOUZmsOSvE70UNfF3w9HogCJB7jX1p7RTdlmoYAfV
 JPY7PUgR2Wlg1G7tB4aycGrixENBPBoSczpL3n5ygJXhOGdt0hO2g+lGwFfljuixSS0L
 MJPHza/Fg/HF+l4hSqLwluZc/FJxCAJaiegNxwZntC0CHWeeXnLOvth8uFAOaT2d8fta
 bCGTwmswBAEx6jDFOnheZ5bo6qC0nc8ABG1jflBxDQb5iGqPx1QACgdrDd/l/2Vtkp5n
 KjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678157028;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TZZUerayr4Vwu+mLpbm9993BkKWAeLPQd3Hs8A+YpLQ=;
 b=ozr1W2o614nzQLAEy1N70vhRE/JhpHcQwLXZNACJz/u931DW1dv0RyECAypHxPlZMb
 5bNHGhOEPxfEsB7GlsBpheU/Xb/zOrT+sYUOOx2A+eSjplsjrcbm4+MXcfijcPCw0/7P
 aSqT1/rMoAB4fs2nzsfNpiuGKuR35kQzsKPG9tAQc66qFv7hp0My2CI7wI2hszwDkE8n
 xlTNUlEXDOR4pihBrFu8TtBddH4xcdPSWdJGSm9nn05OLCPG7q8gqBfwwX/zTtbVLCRN
 ZhagqiUmFWO5Lt+T/Rkc9tRu2X7B3UNjCQcONlmlso+uGcEabdSZ10moSGDHOtTZ+C19
 mrRQ==
X-Gm-Message-State: AO0yUKVHsFAyQkrl8ocMfHG97ZZqjECkXFIsEjUJhC33gw9opOIlZtRu
 CyRTrysdp1HsPtJc1o/ltC6rgw==
X-Google-Smtp-Source: AK7set8T2iiJsAa1B9KEmbNwjnC1t3/UPR2fiiOhp2gcxJV18BX8m8me8ijn0RPS48CAkLqh08YiJw==
X-Received: by 2002:a17:902:d2c9:b0:19a:7d0e:ceea with SMTP id
 n9-20020a170902d2c900b0019a7d0eceeamr14474139plc.25.1678157027766; 
 Mon, 06 Mar 2023 18:43:47 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb?
 ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 li11-20020a170903294b00b0017a032d7ae4sm7360964plb.104.2023.03.06.18.43.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 18:43:47 -0800 (PST)
Message-ID: <861d7a45-734e-8115-ec57-7d0629fa36a1@linaro.org>
Date: Mon, 6 Mar 2023 18:43:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 4/5] docs/about/deprecated: Deprecate 32-bit arm hosts
 for system emulation
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-5-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230306084658.29709-5-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

On 3/6/23 00:46, Thomas Huth wrote:
> +continuous to be supported on 32-bit arm hosts, too)

"continues"

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

