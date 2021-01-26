Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 734E4303C78
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 13:06:32 +0100 (CET)
Received: from localhost ([::1]:40610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4N79-0005i6-1S
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 07:06:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4N5G-00056U-L1
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:04:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4N5C-000898-5D
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:04:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611662668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JJ0yxFZKlhTeoO6scl01re9Cf+WssHkaOm7y22Pjsho=;
 b=d+KnfywczxYrtDo6to7H2liqO/PfAgrgVVQYjKOKm+8P0r8XZZi2BQPatiTyErZW7I4IYR
 8+UqiUe8uLpd6ijHkhy5oc57LWXI5FFBVaB4LFhgE4NwFgLtHHp+fEjTJW6rSSiOVf1ijA
 bAzqQQJ/ES/2qqsL5HfWGaBp57MKask=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-h0dj6fwYOo-ojlCVuoPgxg-1; Tue, 26 Jan 2021 07:04:26 -0500
X-MC-Unique: h0dj6fwYOo-ojlCVuoPgxg-1
Received: by mail-ed1-f70.google.com with SMTP id q12so4448461edr.2
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 04:04:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JJ0yxFZKlhTeoO6scl01re9Cf+WssHkaOm7y22Pjsho=;
 b=LuSmnhrWV1Vd93gmOTI5wByQSEavpfQdUNdVqtEvieZadTacNzbdc9qLFjDF52grmR
 NzuCUMNQ1M/83FCEDe/rroDJczRfwnYILJdCT/O2JLtsNqHHKFG7lXB7tdKuvDRYV7wn
 qLwzPcfWrQnNzcbK1BqlyNv9t5CjhH2J+E94hfuJgj8UySqOWSNJwedPsu6sYolnqZz1
 XXW6/P9bEWoVF51ieV594tGkqHORN7upZ7GOgQZR1/CFh9+Ja8FsGEMU7/1h5H+5ve+L
 rzGhttoQAqj2JArCZ9OrsIv28mBV5uSS5pPBtGNYT06XmGTyQW72xUdyrn/S2pdfiyrS
 08NA==
X-Gm-Message-State: AOAM53347ttDnNgIqFn/zD0Rjxb5C9E51U/9STXZkOOsFrrUmmQ7rTtE
 4pshYTPXJtk4kZqBeb2Lo4oTKpSqoPzoeYYjEe2DwGgPmLbqog4FeU6VCwq9cGt3KaQzrar+9yH
 CvhrPU8BDEb6k+lM=
X-Received: by 2002:a17:907:f81:: with SMTP id
 kb1mr3318134ejc.412.1611662665134; 
 Tue, 26 Jan 2021 04:04:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsk6Ym5M1XNK006JhFaSQkhmZ5ompc2amSStyO7MtA/a2AiITxvVOkvstCunzggMXPZ4cVrA==
X-Received: by 2002:a17:907:f81:: with SMTP id
 kb1mr3318113ejc.412.1611662664977; 
 Tue, 26 Jan 2021 04:04:24 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id m20sm13325372edj.43.2021.01.26.04.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 04:04:24 -0800 (PST)
Subject: Re: [PATCH 2/2] gitlab-ci: Test Fedora capstone package
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210126113649.3148417-1-philmd@redhat.com>
 <20210126113649.3148417-3-philmd@redhat.com>
 <20210126113927.GE3640294@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <95825bc2-0e6b-b9ae-86c3-ac8fa8989559@redhat.com>
Date: Tue, 26 Jan 2021 13:04:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126113927.GE3640294@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 12:39 PM, Daniel P. Berrangé wrote:
> On Tue, Jan 26, 2021 at 12:36:49PM +0100, Philippe Mathieu-Daudé wrote:
>> Test building the 4 targets using the capstone disassembler
>> with the capstone package provided on Fedora.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  .gitlab-ci.yml | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index de3a3d25b58..913940656de 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -493,6 +493,13 @@ build-tci:
>>      - QTEST_QEMU_BINARY="./qemu-system-x86_64" ./tests/qtest/pxe-test
>>      - QTEST_QEMU_BINARY="./qemu-system-s390x" ./tests/qtest/pxe-test -m slow
>>  
>> +build-capstone-distrib:
>> +  <<: *native_build_job_definition
>> +  variables:
>> +    IMAGE: fedora
>> +    CONFIGURE_ARGS: --enable-capstone=system --disable-tools --disable-docs
>> +    TARGETS: arm-softmmu ppc-softmmu x86_64-linux-user s390x-linux-user
> 
> Won't one of the existing jobs using Fedora automatically enable use
> of the system capstone ?  I don't think we want to keep adding jobs
> for each new possible configure arg. Instead try to re-use existing
> jobs whereever possible.

I looked but couldn't find one. Eventually the TCI job.

As this is unlikely to fail often, I'll see with Thomas the other
possible policies. Building this every month/release should be enough.


