Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4129F4E5740
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:16:52 +0100 (CET)
Received: from localhost ([::1]:45256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4bL-00075q-Bj
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:16:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nX4YO-0004cz-Nz
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:13:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nX4YL-0001dd-O7
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:13:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648055624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bd5WQ+R+378RYxGbzMXEZrz2tanG/zdpXYYmEwsqE/s=;
 b=M3h/1Ov6RcwM3NRlf/EGtgjYY10uxotsETnZ3eciN6EVd8lWtdB22IlMwX3/B4wx+vd1eI
 7nEIyvMEByZ62rHol3RXu4r6QCl57JyBFyrshHT+XhOgvjugxXuv/bWr7KvzH98oXXTpTe
 sxCNsqc17xsn407FGSk6jUJGX1D9tws=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-FVIbrG3qNfqJvQHX1EchRQ-1; Wed, 23 Mar 2022 13:13:42 -0400
X-MC-Unique: FVIbrG3qNfqJvQHX1EchRQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 p16-20020adfc390000000b00204006989c2so722125wrf.5
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=Bd5WQ+R+378RYxGbzMXEZrz2tanG/zdpXYYmEwsqE/s=;
 b=rNgKhCS0PwdtToTEppIBtfWdUfHEvGoPOp1Bsxnmjvn2h+RvRejSFIsE4XiCxVFHDk
 mdyE+2r4wLOaoT4q5eNbG2pTJ4bvX3xtiKnsRzVYMm1ldSjQcpGT2GAue/67IeOlV9F6
 s9vTIGKYgG89fd6niBDszyDTtyLBkCbJJOqH/Yi5uK01YpnLusg+5mY0+oen52UgXwYl
 d7byZ3OIzCDJrePmz6OW78MJAXTcYocsTWesGZHh3RWHxpp7mLJWbSmjtEa2oQAUYx6Z
 YsMfuA/u114kjlMvXSBqkeL9QEflywqGWNhByO7BaKZOF/5qFpE5at7Bw1Q5H3T7p7kC
 9f6g==
X-Gm-Message-State: AOAM530Xq2118s55uB3A9k0x38R84xBi4k0gVb8rLq3WteWUp9bDMCyU
 zcidKfsAlMW8QjukSOgONHtr9xvUxvrCHPjvsycQEsGEqPn8zthWh/OsGJpYDKv+r085pNzuFOB
 4/uEuuXFRiBK+/Zc=
X-Received: by 2002:a05:6000:22a:b0:203:f7f8:e006 with SMTP id
 l10-20020a056000022a00b00203f7f8e006mr807998wrz.175.1648055621390; 
 Wed, 23 Mar 2022 10:13:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2tA5nSv8ZnoG/xzhIghxbm8ciLSwQO/KY82WMS+dBnestShsVTE1OtVXH0ZieMHoSYoZdfA==
X-Received: by 2002:a05:6000:22a:b0:203:f7f8:e006 with SMTP id
 l10-20020a056000022a00b00203f7f8e006mr807959wrz.175.1648055620982; 
 Wed, 23 Mar 2022 10:13:40 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 e12-20020a5d6d0c000000b001a65e479d20sm469367wrq.83.2022.03.23.10.13.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 10:13:40 -0700 (PDT)
Message-ID: <95ad366c-509d-d41f-209b-dc66054de4b8@redhat.com>
Date: Wed, 23 Mar 2022 18:13:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 10/11] tests/tcg/s390x: Tests for Vector Enhancements
 Facility 2
From: Thomas Huth <thuth@redhat.com>
To: David Hildenbrand <david@redhat.com>, David Miller
 <dmiller423@gmail.com>, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20220322000441.26495-1-dmiller423@gmail.com>
 <20220322000441.26495-11-dmiller423@gmail.com>
 <c3bb72da-c390-f9b5-5254-f8c16df21427@redhat.com>
 <6409f049-d938-0e06-3cea-5877b31fce00@redhat.com>
In-Reply-To: <6409f049-d938-0e06-3cea-5877b31fce00@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: farman@linux.ibm.com, cohuck@redhat.com, richard.henderson@linaro.org,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/03/2022 11.31, Thomas Huth wrote:
> On 22/03/2022 09.53, David Hildenbrand wrote:
>> On 22.03.22 01:04, David Miller wrote:
> [...]
>>> diff --git a/tests/tcg/s390x/Makefile.target 
>>> b/tests/tcg/s390x/Makefile.target
>>> index 8c9b6a13ce..921a056dd1 100644
>>> --- a/tests/tcg/s390x/Makefile.target
>>> +++ b/tests/tcg/s390x/Makefile.target
>>> @@ -16,6 +16,14 @@ TESTS+=shift
>>>   TESTS+=trap
>>>   TESTS+=signals-s390x
>>> +VECTOR_TESTS=vxeh2_vs
>>> +VECTOR_TESTS+=vxeh2_vcvt
>>> +VECTOR_TESTS+=vxeh2_vlstr
>>> +
>>> +TESTS+=$(VECTOR_TESTS)
>>> +
>>> +$(VECTOR_TESTS): CFLAGS+=-march=z15 -O2
>>
>> @Thomas, will that survive our test framework already, or do we have to
>> wait for the debain11 changes?
> 
> Alex' update to the container has already been merged:
> 
> https://gitlab.com/qemu-project/qemu/-/commit/89767579cad2e371b
> 
> ... and seems like it's working in Travis on s390x, too:
> 
> https://app.travis-ci.com/github/huth/qemu/jobs/564188977#L12797
> 
> ... so it seems like it should be OK now (considering that we drop support 
> for the old Ubuntu version 18.04 in QEMU 7.1, too).

Looks like I spoke a little bit too soon - some of the CI pipelines are 
still using Debian 10 for running the TCG tests, and they are failing with 
these patches applied:

https://gitlab.com/thuth/qemu/-/jobs/2238422870#L3499

Thus we either need to update the CI jobs to use Debian 11, or use 
handcrafted instruction opcodes here again...

  Thomas


