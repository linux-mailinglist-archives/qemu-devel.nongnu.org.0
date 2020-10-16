Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239602909D1
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 18:39:26 +0200 (CEST)
Received: from localhost ([::1]:59594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTSlJ-00023e-5K
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 12:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kTSj0-0000Gq-MD
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 12:37:04 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kTSix-0002s0-Vc
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 12:37:02 -0400
Received: by mail-pf1-x444.google.com with SMTP id c20so1796885pfr.8
 for <qemu-devel@nongnu.org>; Fri, 16 Oct 2020 09:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=msi3YYKOZTR4Hq0EUNjad8l9VXlyyoavU1/5+gmvPZM=;
 b=bfyEzfv29mKkSh4CUIDCuysnpE+TmBrn7atKFMN+G3mWKAJPqDulO16yJmWwcfq9aQ
 b5ZlgNNexGKlWe4gq3V26L84wR5CGr5xlS+lsJSMUMnxOPn5zmGQ03Y7Y8E/dCN+8NLN
 /o+UzHSLjIkjwdrvcbvzD/izfmtioGqGLrjUUAPgyo0dfNwB8scrzfsmSkhg8yPBMe4d
 bXLQrH7d6gBE6yR7RgeMQLJBe1ThaRw7HqPKwFPG8yVnwyv/dZlBhLXEmTbIfzMSEPaF
 vvIXyM2TR8SeAVY2cU9NavdF8Akf58gvI0hm56w72Wj2B1+uBjMUMgTkqUonCFsO62J0
 ebGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=msi3YYKOZTR4Hq0EUNjad8l9VXlyyoavU1/5+gmvPZM=;
 b=b7j9dZGcSOxgzRKTMF+tQVO3MVZH3gjjDf0UzVqDwsalxEmYp7Xm1/ytC+iHrjyODt
 o2CKJNTnBAnku11EwKtxi475eaIiED77r4Xd5ubT4x3hq0T+P8w31d59gFGnpGKDjDFK
 R4z0wutfvjtadyzvym8op39kx3Col+9Inlt61TzmkDlYyaOwqGqF8BgaxNsOo/Ma1UPT
 UJQVlW2Lxp6SFVqJhQOPnMVGIjgftVtcrF4j2tB27pLwZRhcguAEAtmZu04ePE+n5/A8
 4na9f0xlbnaw+HFCP0jLLpmdEjwrZXd4WZzfEINnvOX9RFOUzLrtWfVTr1kaSOZz3QYa
 vmvQ==
X-Gm-Message-State: AOAM533s/4HqMiaPsjhxobsbV7e690xtGOZbkjQcjk6Do8pyPRa7SbEs
 +67dkEyeC2M73jndfbhHybsaxQ==
X-Google-Smtp-Source: ABdhPJyLVW3Pqeq+rrfj9f6e2pNX4cEdu3onb2KA4lDYuzY1IB20JIQ5j9FV1dpa3CwYpRFiyHnp/g==
X-Received: by 2002:aa7:990b:0:b029:155:d228:8cad with SMTP id
 z11-20020aa7990b0000b0290155d2288cadmr4370511pff.29.1602866208782; 
 Fri, 16 Oct 2020 09:36:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id e16sm4528180pjr.36.2020.10.16.09.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2020 09:36:47 -0700 (PDT)
Subject: Re: [PATCH v2 05/10] softfloat: Inline pick_nan_muladd into its caller
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200925152047.709901-1-richard.henderson@linaro.org>
 <20200925152047.709901-6-richard.henderson@linaro.org>
 <87wnzquopl.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4ba9afe5-d5f0-7315-2a6f-139a4a6e66be@linaro.org>
Date: Fri, 16 Oct 2020 09:36:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87wnzquopl.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.253,
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
Cc: bharata@linux.ibm.com, qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/16/20 9:20 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Because of FloatParts, there will only ever be one caller.
> 
> Isn't that admitting defeat - after all the logic here will be the same
> as the login in the up coming float128_muladd code and we only seem to
> need additional information...


Well, that and passing around a completely different structure.
Which is the big stop.  Any suggestions for that?


r~

