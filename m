Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82CA474A0F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 18:47:58 +0100 (CET)
Received: from localhost ([::1]:49492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxBu9-0005t5-8v
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 12:47:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxBsh-0004o1-5w
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 12:46:27 -0500
Received: from [2607:f8b0:4864:20::1030] (port=50999
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxBse-00080r-34
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 12:46:25 -0500
Received: by mail-pj1-x1030.google.com with SMTP id gj24so1015541pjb.0
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 09:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BFTWBJ4xIs5uZPV2tc5XRQIaM+cmZwLYIn+iveHuhU4=;
 b=qgmeUGT6FtGwn+syvlDLsgDL5rqkpQ4bsC5R6aBjKHFv4AFP4iSGNA8CBOmhO26Gc4
 ee5pJU8Z0fIlrtLd938ce4GEn3FTDWRO4m9Kkv/Sn8X6R2OXUpeLx3zw8aTLmY5xMME/
 QpSmjbHN6iVWjPW2oGPyH0zGOiqMJ2pLJu4JZVf89cP3skgfDsoQAfDdKufb8Ll2zN3Z
 vw9vlkztiSNIW+Sif+2h/1Dr4ORCXyVc/a1R4uO8Kq67a3KHiSKzw0rKBrwg/DTXXq7s
 oFNGMKvvqjXrLOWEtQ7URcezOqoW5s82PSWA1cfNH3/BJCfb2AeYnrFh2/qzJRTsk4h3
 Jmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BFTWBJ4xIs5uZPV2tc5XRQIaM+cmZwLYIn+iveHuhU4=;
 b=V0Z0kgOKvoVONPXTSAtWa+UPaR4wqy5kh82YkH+d8WBEEoVBgo33nTQawRaNO5RUFl
 o4exNp6J9ctG8OETnovjBHSL77B3AzLh5KIOuX/Hwa4n4ianXFmqG0ltIQqEwU4qjNPg
 uwBAF/lgjemak9ZjAzFjL6HMERcdIynp1YrM4GrFCXNPFbFt8wDht40fRFrlS3ici/m/
 rCHra61Z98vC4c1LG3IYcKdU/SfpKu9BG3zJRDzwwM/L+yIMAmzeKl30xMbtD7eZpWof
 n2FOoJNLGpeYXgtfVzHPKKpptbEWmUzsJr4DPRgx4mKwI1VhwofdTbY7q6R8o/fOqHOB
 w0kg==
X-Gm-Message-State: AOAM533YF1HK/g3r8phVToGUP5J8nQbmw3QHee6x6a9YtAA8JRI/qzZ/
 EPVndu2G0/DemjezPI68G60hAQ==
X-Google-Smtp-Source: ABdhPJwal4Xy6UshvpEfugEqROjUkqAST65slIQk7jzcCiLn04IhwLWYquwAdNUb7jyF1ShR4WuY8Q==
X-Received: by 2002:a17:90b:3882:: with SMTP id
 mu2mr7171505pjb.165.1639503981930; 
 Tue, 14 Dec 2021 09:46:21 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id 145sm365108pgd.0.2021.12.14.09.46.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 09:46:21 -0800 (PST)
Subject: Re: [PATCH for-7.0 0/6] target/arm: Implement LVA, LPA, LPA2 features
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211208231154.392029-1-richard.henderson@linaro.org>
 <87tufbgmpp.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <48bed752-e432-02d4-e664-bb3cde0e65c3@linaro.org>
Date: Tue, 14 Dec 2021 09:46:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87tufbgmpp.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 8:37 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> These features are all related and relatively small.
>>
>> Testing so far has been limited to booting a kernel
>> with 64k pages and VA and PA set to 52 bits, which
>> excercises LVA and LPA.
> 
> Do any distros ship with 64k pages that we could use for an avocado
> test?

Well, RHEL 8 has 64k pages but with a 48-bit address space.  There are separate kernel 
configuration options for 52-bits.


r~

