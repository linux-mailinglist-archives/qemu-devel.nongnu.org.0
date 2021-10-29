Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EAF4402F6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:11:54 +0200 (CEST)
Received: from localhost ([::1]:51222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXI9-0005zM-35
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXBp-0003AS-TT
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:05:22 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXBn-00047Q-BY
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:05:21 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 n11-20020a17090a2bcb00b001a1e7a0a6a6so11351170pje.0
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 12:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wgza1XroPssQ0CtgK8UCm9x2jaOBf7VVWeXm08OQO4k=;
 b=IcsMhEzylfQ6PKE8+FDEwqbJmbWUmFwDazmIKIZt3ZuWJhNlKNWJ3tEe7aSeqjKAAK
 foDBeLR0LXPIPdONIgy9vMhdiJeDH14nu/ePBp6RDaX1abUp583C3qEdi9iADdFhTQhh
 AcD5HWACIg+7/R3QgBiNUc2HdIrEB4cjr1FvNdbkba2BBXmOl1D2bvsUHZU2UcLq6Xrh
 ViUZulp5ZT4BJhCesWAcCAwiIZF29wphj+hhqZbxfCgYnOXYENfqr0dWWD3sIaNCQv92
 iSc9lnTkhTBAiJDsdO/UUV7Yy0cWOI+NAKXX895OJTQ1tsrLqJpgu6fA8++As6kY+wkc
 ZGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wgza1XroPssQ0CtgK8UCm9x2jaOBf7VVWeXm08OQO4k=;
 b=HmkW0lh4I9bhWLTy8yFtpXPIEgvnbUaUEf+VtdQv+ZQwewFrecRW4nEf2GnZEiq65J
 S9S9M+n8zEY1a9vUUQlJ6u9wMf8svv4YRDDtjy7tHvjpi8W1A/J2AEOmeNTnt9zYvtsE
 +MKu2y9hprQHWaQhUPfvytsu1Yk3L0o/lGsW4wkpRFSaEMt8GzCy+aLmrS+NkxdkbuzR
 PBDRenvQLWnkbZWScOnA1ki2XCHlTlMGwLqMsMP0PaDA50/4XDOzO+/JOLw9G0TuLaqy
 lmJG0fOnc5cY3aD7xesf/mAmvFL5HOS7KHDceSKHsM3my3JekGVIizqCeQIATVcVMgoH
 73mw==
X-Gm-Message-State: AOAM531N7P3v+U7SkGmSR7fRihTsv9qEDo0rM3Q6hvGchDOhh+qcH0ed
 9qwppkX0TsWtKYdGeOnIwvSJuw==
X-Google-Smtp-Source: ABdhPJwx2RPlvxLlr0emnCXZIEkdYYpvoUvitpHXg8o2EAnJ1c9cDdfxMi1S64CfmrebY9e7uPxqIg==
X-Received: by 2002:a17:903:18f:b0:140:658d:851d with SMTP id
 z15-20020a170903018f00b00140658d851dmr11212454plg.47.1635534301573; 
 Fri, 29 Oct 2021 12:05:01 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id gf23sm6991951pjb.26.2021.10.29.12.05.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 12:05:00 -0700 (PDT)
Subject: Re: [PATCH v4 14/30] Hexagon HVX (target/hexagon) helper overrides
 for histogram instructions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
 <1634033468-23566-15-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b4c7465e-bf63-f0d5-c37b-25c51fa6b1fb@linaro.org>
Date: Fri, 29 Oct 2021 12:04:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634033468-23566-15-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 3:10 AM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg_hvx.h | 106 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 106 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

