Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB44467D7E7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 22:49:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLA60-0003oq-Ak; Thu, 26 Jan 2023 16:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLA5y-0003of-FS
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 16:47:46 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLA5w-00030j-PM
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 16:47:46 -0500
Received: by mail-pl1-x629.google.com with SMTP id p24so3081923plw.11
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 13:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6a0f8kBiowqX2eg7SV/j2zrJZyh8wbZxx9dOy4zPudw=;
 b=YERaG6A6h6C9nT/tHWJ70F+dR8Je0wPavPfxUk5cBImoXRdfv2Nni7x+OvtH4Fy1Y/
 kTV1d8V/yH9RneruTWosQKnz0xQnQzVqBIdB7S1GgkTWnGNQhBTGmHMKbWh9l7AiSprG
 JmmKZHvhDuWrxsj9lnkdYzzvOuBOFYBsDTBAkxL9MOtHhQcSFxIF3EqehcTAvzeA6X3K
 bDOs3y7ChjEZ1tD8V7GE22h6vSTJsl/7ZTwU/grzvu6e36zbAvKOw2oz4/cb3rXnmaWi
 bi9THTR1BKNKsbyHiddNf5Unqe5GJddMp5+1poOOouRjyl7SQihZzFr02V8sIz7QkZzB
 4wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6a0f8kBiowqX2eg7SV/j2zrJZyh8wbZxx9dOy4zPudw=;
 b=rm5cKoyi6BYNhsqa7IO/2/Vh7N7VgTgx1IRT5tOJve5Bugmv3+9/IdRTqAgF7fqEf1
 YIblvj+u+k9okbxVjTDVb+fy2QZkpGliWIAM6KJAMdTPsu2GjqQmnv8I/tegMy0bCLwo
 FFkFn+vP+jiejkitJi2zfVud5UCofsuRLNN6s4hfdg2koj+GlPmsHp5yrf+G7kJDiIwf
 O1DPoLabxKLJR+ShsLEpGDX5O/hCmv1Q4vDnRO+fBcNtj/IunxexJU9tws+kJn5Im4BD
 Wnn/+ehe+E8gyWMZ2iwm7QgOHArXGnPgV3xpWB/KRMQEZMcy4UnLkhqPL+Cjhwz9EKxn
 2agQ==
X-Gm-Message-State: AFqh2kpla3+bxSgM26x4H0nqNBszJ/xRIp8/v+TGjGGAnBaSYN7Ypzs4
 qceopDwdGmXfy+ojxdhDk1X43Q==
X-Google-Smtp-Source: AMrXdXuzE6HyMFwbVgT7xYVu9Ke4EvaGjMjgoS76ztLb5larueHMLWtPn/HM2yX1Dlbxmh71p4tHXg==
X-Received: by 2002:a17:902:da90:b0:194:43e2:dcd9 with SMTP id
 j16-20020a170902da9000b0019443e2dcd9mr52005748plx.2.1674769663017; 
 Thu, 26 Jan 2023 13:47:43 -0800 (PST)
Received: from [192.168.50.174] ([173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a63af48000000b0046b1dabf9a8sm1105368pgo.70.2023.01.26.13.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 13:47:42 -0800 (PST)
Message-ID: <22dbeec0-38e7-21d2-05d7-df60b15a2ff0@linaro.org>
Date: Thu, 26 Jan 2023 11:47:35 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: ARM: ptw.c:S1_ptw_translate
Content-Language: en-US
To: Sid Manning <sidneym@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "philmd@linaro.org" <philmd@linaro.org>,
 Mark Burton <mburton@qti.qualcomm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <BYAPR02MB550905E891B95879D05846B9BEF59@BYAPR02MB5509.namprd02.prod.outlook.com>
 <a07b1be0-7ee2-9b7b-a2d7-7d2435f25007@linaro.org>
 <BYAPR02MB55099839E05FC89E5EBB9D9EBEFB9@BYAPR02MB5509.namprd02.prod.outlook.com>
 <BYAPR02MB550960AECCDF2B28D2C4F8EABECE9@BYAPR02MB5509.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <BYAPR02MB550960AECCDF2B28D2C4F8EABECE9@BYAPR02MB5509.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.15,
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

Please try the following.  It's essentially the same bug I had for mte.
I've just realized that the testing I did under Linux with virtualization=on
was insufficient -- this path won't be exercised without KVM under TCG.


diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 57f3615a66..2b125fff44 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -266,7 +266,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
          if (unlikely(flags & TLB_INVALID_MASK)) {
              goto fail;
          }
-        ptw->out_phys = full->phys_addr;
+        ptw->out_phys = full->phys_addr | (addr & ~TARGET_PAGE_MASK);
          ptw->out_rw = full->prot & PAGE_WRITE;
          pte_attrs = full->pte_attrs;
          pte_secure = full->attrs.secure;



r~

