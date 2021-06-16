Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8AF3AA758
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 01:18:32 +0200 (CEST)
Received: from localhost ([::1]:50300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltenn-0001D9-NC
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 19:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltelI-0007eE-Ud
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 19:15:58 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:43562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltelG-0006x9-4G
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 19:15:56 -0400
Received: by mail-pl1-x62c.google.com with SMTP id v12so1926193plo.10
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 16:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dm3GzBQJLbiCUcWOn8pZUE/pHZ5TGEQ6WTR0vg6TJFc=;
 b=NNZ/GwraeRJfwb36tpAQyUDh12GzF4TNXf/S8vA3MaOAEJW/5Rlr7VAJar3x0B+X7G
 iQNFmq/iHjCgrfBRRavKVYSdkxfVSlL4+Zwoiwo7j1YUhh8CfgXGKQNZvHu11dBYJvlh
 g6J2oFcCzLFcS639rE9YPkJ/kfUFm2wumsz8CWC+ATlk3xNz27Rxmsbsz5zEapZyaEXE
 XA9LfVGQkEjtK4bZRQM3S5oZUZaynQZBHCJLat4IEyBnB0HVn27f9o/NSciGSlz397He
 N55TalOzj7gZRk+0e0A1uEE7ddna23podj8Yo/vJa6JZXZikYzavhEx7hrdrTj8D3P7b
 b8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dm3GzBQJLbiCUcWOn8pZUE/pHZ5TGEQ6WTR0vg6TJFc=;
 b=B5Ut/whMjQDkUn2ly6QClnGyehvdRXG2wnZqDmO21qRZT9G7KcsXUnc0Hgq9exoVx9
 OCR1kE2r2rTq1Oh4ivlvotP7G5ITf5+hxawni8RTPcj29tGKc6uhgUQtf5fknK8CMmnT
 yGi93jsEuQUwpTUuFVXECNB1jpEtOXjjlnIkIkvAl6CXGA/etRhXVK1OJ27wMsVXKIV1
 UcpQel1cc/EgANJsbdmCDC5idNoZRa5Q4MQjQSSTUXrcIngPn037otcikQEO4Fd7NNYA
 TEwV5WORfop10xa5g6rDcC8lOwYBFsMdMlJii/zyL6XZJoxMhFFsPYPQw36QusclYEYC
 DkEg==
X-Gm-Message-State: AOAM530lGex/vSoo8A7NSxgL1XXum1A3NcHymIWVN34OY3eke9NX9ry+
 gxsc1GQoPq/Tc6kg30AHdwm5dA==
X-Google-Smtp-Source: ABdhPJyKZ3qFX4ssna4gW5oU4njIQyPxmge9zxhVh2wlAUyilt0oLhLDPMBkwxX30hwPaYesFqQ4OA==
X-Received: by 2002:a17:90a:6749:: with SMTP id c9mr416297pjm.65.1623885351847; 
 Wed, 16 Jun 2021 16:15:51 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u13sm3272110pga.64.2021.06.16.16.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 16:15:51 -0700 (PDT)
Subject: Re: [PATCH 07/21] linux-user/hexagon: Implement setup_sigtramp
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-8-richard.henderson@linaro.org>
 <BYAPR02MB488698AB4CECA0A05F1B3AB7DE0F9@BYAPR02MB4886.namprd02.prod.outlook.com>
 <43f61832-1d76-31dc-4ba4-e35007b16fe7@linaro.org>
 <94c4e258-e1c3-9d58-f53e-72c4249ea93a@linaro.org>
 <BYAPR02MB48867798284EBC45752A8FD7DE0F9@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e701528e-682c-251a-274f-9d27983c2bdb@linaro.org>
Date: Wed, 16 Jun 2021 16:15:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB48867798284EBC45752A8FD7DE0F9@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 2:37 PM, Taylor Simpson wrote:
> Yes, I'm confused.  Why is signal frame unwinding in libgcc?

Because it's tied to the compiler, and it was a decent solution back in 1997.

I see llvm calls it libunwind, and only has special signal frame support for aarch64.  I 
wonder if ever other target is expecting unwind info in a vdso?


r~

