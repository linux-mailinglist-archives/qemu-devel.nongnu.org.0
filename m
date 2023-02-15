Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C03698338
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:24:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSMQd-00083O-6m; Wed, 15 Feb 2023 13:22:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSMQb-00083D-B2
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:22:49 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSMQZ-0000gM-HI
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:22:48 -0500
Received: by mail-pg1-x52f.google.com with SMTP id b22so7914260pgw.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 10:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xk+LlhKgDiwVXBCNeQnjEjnaRlLT9O57ljmLWXtiXcI=;
 b=e3RtMRBqICHEPc2uTo848AHi73yMwwqPup0iuH+aSjEM0knn0RJrOsPtgED0EQ4XFB
 /GPeh250+Y3/6/iq9fYULTH9tccfoYKQyEH1/6majRCwJdnq7/p0kvMLLCmtKwp55t7w
 YhO4ThzCYvxWTxmgqUe9zIcXTlqHm1gjDSwvQXFHWcEpbSR2S0ECeFyJi9aBEIAKjRBt
 CCawrQzNK1xOg6QJ2dF6+3JS4OSKmADm3B75smFQql45rQ097QA1/vSbWTHZQej7wHQq
 zXEZvZPEcY60sh2H6cnfv73ehJ2YOp8oqjqHhRU8ImB/Y8nfQxFazgj+IuNCufuRyZqv
 rE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xk+LlhKgDiwVXBCNeQnjEjnaRlLT9O57ljmLWXtiXcI=;
 b=pjI3EAm3gSGqmM9UAfns9wXTDSXpNj9IvRe3uujlztlujPO6T7SSUodWOkoyF3mZ7R
 huF8wnWFbgDd7TfirHo+gVAs0iEn0K0veuOEF32aSuGdgfSINn1Uf7yI529KvExMXpgx
 7gsh8hFrP+HGkLyPxIqcczbEhw+D3TKEZGxEgbjyZt/fP7yLMGK+37q4wCZQgvBea+02
 WQgkHMqLIChALa5sWWp85eHbEbUL6B1SpN6e/gJxQTWrhmDlqoxq0D9UvXiFyxypSBLc
 tDrugaenRoom7rkcjfCpXOkeW8Qy4wgn3CSk+/TJPl3FluHDxH4o4XCHHE8W9A4yzj6K
 HlBw==
X-Gm-Message-State: AO0yUKUSde+9Oeubx4tydGjZEjT5s3+HHLuQB3qd8CX5JfrL1V72r76R
 QDp5Pkb3c0ObKmBIRrByUwsOUg==
X-Google-Smtp-Source: AK7set+dXd7VJrIEjMw26Qg65rSiYflde1aUFhfwHaS2d1V1bGcfTSNjGzdOeqXCQiBMsrqQnXniJQ==
X-Received: by 2002:aa7:9d81:0:b0:5a8:b911:a264 with SMTP id
 f1-20020aa79d81000000b005a8b911a264mr2348416pfq.28.1676485365791; 
 Wed, 15 Feb 2023 10:22:45 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 a20-20020aa780d4000000b0058d54960eccsm11936550pfn.151.2023.02.15.10.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 10:22:45 -0800 (PST)
Message-ID: <bbd1374f-8ffb-720b-f759-aa75dee70f5e@linaro.org>
Date: Wed, 15 Feb 2023 08:22:39 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] util/cacheflush: fix illegal instruction on
 windows-arm64
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org, 
 alex.bennee@linaro.org
References: <20230213161352.17199-1-pierrick.bouvier@linaro.org>
 <20230213161352.17199-2-pierrick.bouvier@linaro.org>
 <CAFEAcA--p8kRsbTy4vg83fEap_MO--HEMcOGGnnXzcxJYZW6Mw@mail.gmail.com>
 <01e0e1f1-96ea-2294-f8ea-8a36320021e5@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <01e0e1f1-96ea-2294-f8ea-8a36320021e5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/15/23 02:49, Pierrick Bouvier wrote:
> I'm not an expert on this area, but I imagine that booting a full VM will force TCG to 
> emit code at the same address twice (after having generated enough translated blocks), 
> which shows that generic flush_idcache_range works. Is that reasoning correct?
> 
> Do you think we still need a specialized version for windows-arm64?

No, I don't think so.  It would be ideal if we were able to read CTR_EL0, because we make 
use of the IDC field, but 0 is a safe default.


r~

