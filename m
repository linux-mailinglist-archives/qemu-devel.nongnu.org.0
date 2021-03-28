Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B6A34BE81
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 21:16:54 +0200 (CEST)
Received: from localhost ([::1]:48266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQau5-0000Xm-IN
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 15:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQasR-00088s-3Y
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 15:15:11 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:44705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQasP-0005d8-Bq
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 15:15:10 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 y19-20020a0568301d93b02901b9f88a238eso10239286oti.11
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 12:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JW6fct95Fa1ji9kCrsVT9sZz+5mbt+Z6nqFaLjknEMk=;
 b=yvYnQSf/ut6IRBsJXfNYTzb0P+FGw1Q5JpfU1ORjcQGmwtB7Dpea8aVWln88CCdSj2
 Gm2PjUCBYq7C5F+vaZ+PgfaNKp/W5KIGVVOEKmW/N7pj64xjRnMuwBVtuiszGN99LDVj
 cAU0dUE6G+WsdA1Lt7Vf+SPynbiHCT/nf9WyJ19Qc2KaGz9uIMNIP07F0VMOTP0j7OF2
 cM9QXB+5iKmOxTPZMj96aAHY1oRE0XMPe56E9jtt1x6pLNhvWcdhcDKvXD6xIH+C9NuU
 hJSL/nnSHYP6wM9poEWT/TOInhkg/n1G2YEPA2bVSJWce6sSOBOHz6yJrmMOr7Jc73ss
 97nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JW6fct95Fa1ji9kCrsVT9sZz+5mbt+Z6nqFaLjknEMk=;
 b=rabNKASF696b/EkVb53CrwW79V9m8w8H5/EFFuI22SktvsSyqhaC/e8Cy7UfZQhVC5
 ypChaFRj/up4f9o81a04Vt7QJ7id4N4oZpaGKO895HR1FTqR4B3hSpPe1+o+vvVYlOEM
 c6eml21JdvVfap4zAcEgXg8BPZC2y2Rs4Y7A5YrAgWl14emWL5Av5P4OvUncLGvqRtad
 +DDkFbk1nAeSQQIiUg6i1aa38OqSf4EkEQqHfLB6OJD1KW2aqxb3/SLAHGEhF5qlPpFL
 wszvtF5UG/BYQT7X3YurBU13YFH1kEp4HKE112oDIy1iqZ3g2fMOB5Q2w1G6yCGgGcg8
 mbgQ==
X-Gm-Message-State: AOAM530FiFATtjIXoOdy5nYvuaiNSzoEeW7y5lEGbE91dwnXBIW3+TPI
 4onFY+I/MKh6e8fuuwxXbvSVsJuNb8p78R9s
X-Google-Smtp-Source: ABdhPJzPk8JN/eIZ6eBhcTam6zdfN1e2pvbMhUz/Op22DyuDeVn2k47Hd2XVzM3Yb0RmBjC9cOGUzw==
X-Received: by 2002:a9d:5541:: with SMTP id h1mr19340615oti.246.1616958908204; 
 Sun, 28 Mar 2021 12:15:08 -0700 (PDT)
Received: from [192.168.44.35] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id v23sm3943378ots.63.2021.03.28.12.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 12:15:07 -0700 (PDT)
Subject: Re: [RFC v12 62/65] target/arm: refactor arm_cpu_finalize_features
 into cpu64
From: Richard Henderson <richard.henderson@linaro.org>
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-63-cfontana@suse.de>
 <3e3b446d-59a6-9cba-94a1-9613cc3644c6@linaro.org>
Message-ID: <e488590e-cbc5-6bd6-a7c5-3ea16b82eb88@linaro.org>
Date: Sun, 28 Mar 2021 13:15:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <3e3b446d-59a6-9cba-94a1-9613cc3644c6@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/21 1:12 PM, Richard Henderson wrote:
> On 3/26/21 1:36 PM, Claudio Fontana wrote:
>> +++ b/target/arm/monitor.c
>> @@ -184,9 +184,11 @@ CpuModelExpansionInfo 
>> *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>>           if (!err) {
>>               visit_check_struct(visitor, &err);
>>           }
>> +#ifdef TARGET_AARCH64
>>           if (!err) {
>> -            arm_cpu_finalize_features(ARM_CPU(obj), &err);
>> +            aarch64_cpu_finalize_features(ARM_CPU(obj), &err);
>>           }
>> +#endif /* TARGET_AARCH64 */
>>           visit_end_struct(visitor, NULL);
>>           visit_free(visitor);
>>           if (err) {
>> @@ -195,7 +197,9 @@ CpuModelExpansionInfo 
>> *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>>               return NULL;
>>           }
>>       } else {
>> -        arm_cpu_finalize_features(ARM_CPU(obj), &error_abort);
>> +#ifdef TARGET_AARCH64
>> +        aarch64_cpu_finalize_features(ARM_CPU(obj), &error_abort);
>> +#endif /* TARGET_AARCH64 */
> 
> These ifdefs are not an improvement.

And are actively wrong, since we've lost the runtime test for ARM_FEATURE_AARCH64.

r~

