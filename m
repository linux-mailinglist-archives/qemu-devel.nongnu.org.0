Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D060A441F15
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:18:51 +0100 (CET)
Received: from localhost ([::1]:42606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhaxO-0000hN-Ne
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhao8-0003mD-3E
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:12:09 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:33527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhanx-0004VK-79
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:09:13 -0400
Received: by mail-qt1-x82d.google.com with SMTP id h16so12045059qtk.0
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/GSdll4Fw99FelC5qAZLj2qabGCWJDaztkcdRfdRaBU=;
 b=uEsFI04hqcoktVKXa/Fo1b+7vdMwTP9fUYr5L23nkqXcRM7Z4jqjtFLiBc9yrxBv76
 RjJ4fGfLxHgMOjB3iTXK625YaoNmiA3kg4tGoi2tln0cBuYSR5cU74IfBgs9QAWgbFQC
 8KyxVFQ7HCs3RgUNo6ajvHJ9itBjm05IELgyM4FuK8+Z/cEiCFn8XLnMuAN+5fXUa5PG
 dDvkDS71bUFCCwQGuFp79QX7+QDDDytLok9jt9zKjLIWmo+S2Q/FrCPE3cM5m2T+4Fm1
 iXs7dmxq5wBXBfIgO3zpJaDxXPrplSND7yClTNpOSv5mgFDoTl/fNIAPWE+8NTnW0zob
 wTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/GSdll4Fw99FelC5qAZLj2qabGCWJDaztkcdRfdRaBU=;
 b=Bs4pOlcDwY2uOwrEugDx066fdRt6OYl0Kpwu5V59UD9eRAtTKv6nRWMPqo+4HKkcOH
 bDwCF/VY9z87JUuripctzANrT5ukmJthoRDTHBF2wc6zfnefFkpTcto5n2fc3o2wQzFR
 m9NBA/cldJRKj3f2THSH65vkRiY7AZtrtBrVi8oBRL2s/kGMFRehdunjwXs0XACcoAW/
 s5FpyTTnZUWog4qKs9i2ijEKsEsmDdr3d0zhrT6BEYa75sBGUka06XBfS3UcKDEfQJ6i
 v9xz+8pqnULvxVNWD7B1YepRdLQKAt2n8WvjsDpNAHRzQRLzr7KpLkNeV34rBEux+u1r
 0pBg==
X-Gm-Message-State: AOAM5318ns/soR7G+U6FAZ35KtoKnVMWGTZTFY3+cBKlVV8NY4o9sJyl
 aEiH6zYBc4m93IYj+f5Xf9KIhg==
X-Google-Smtp-Source: ABdhPJzlp4CHWYyiGx1wBJbz1KmZw4Zt8wELgYu70npRHeVoZGiKBOTBkCvGvCalA46fK7A5L6WFuw==
X-Received: by 2002:a05:622a:1810:: with SMTP id
 t16mr31367600qtc.29.1635786487191; 
 Mon, 01 Nov 2021 10:08:07 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id s7sm9404355qta.3.2021.11.01.10.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 10:08:06 -0700 (PDT)
Subject: Re: [PATCH v6 13/66] linux-user/host/s390: Populate host_signal.h
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
 <20211030171635.1689530-14-richard.henderson@linaro.org>
 <d9cb104f-741c-e85d-5e29-c2b37d641a25@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6b204fb9-69b3-37e5-5ce6-b1a2629dc9f4@linaro.org>
Date: Mon, 1 Nov 2021 13:08:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d9cb104f-741c-e85d-5e29-c2b37d641a25@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 12:10 PM, Thomas Huth wrote:
> Since you moved code around, should this file also bear the original copyright statement?

Probably.

> License changes from LGPL to GPL - intended? (I personally don't mind, I just wanted to 
> check whether this was on purpose or by accident)

Not really intentional; I just boilerplated the move.


r~

