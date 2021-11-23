Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE4F459F68
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 10:42:25 +0100 (CET)
Received: from localhost ([::1]:53280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpSJj-0005AH-NY
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 04:42:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpSHk-0003eS-0g
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 04:40:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpSHf-0001ht-0N
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 04:40:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637660412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lvysc9rERv4Q+2iCfPkCElB2HMXXdaJrr/miG1x6jgs=;
 b=S/FjVA3NYllpHK7cLRzx67dKxl8Z0Eys0TPunxYb2URgToFAJp0REmgTWyLIIHolBId7R3
 TOWvx/TJA4nXD8Fn/HdzzSHd09YWXWdtUMjp/J3AOrhaP4kz5WJweDGOrgB7RfNl1Kgqeh
 BpMMN29yiIAO512mmWam+aiwAMvVCZo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-KTQjnoq2MJG87Fb8D2PLQw-1; Tue, 23 Nov 2021 04:40:11 -0500
X-MC-Unique: KTQjnoq2MJG87Fb8D2PLQw-1
Received: by mail-wm1-f70.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so1231948wms.7
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 01:40:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lvysc9rERv4Q+2iCfPkCElB2HMXXdaJrr/miG1x6jgs=;
 b=jJa614K0IYPQXq4241uZFOI6OREKABgfsXZRYPBPAEeAfa8p+qxdPXgbul9N7rZ37h
 CzZ74Z+01p1VToReT0fNlA1EjhHOy1ISliWI/oWkLmxMRqdZ7opVwPa2xqb90SKo1p+D
 RvqJKg+/MjmT7WjQxVHMGm9yx+cs8cjRvSgmWKT1NiYavb7zBnphujYyeoTwYqZtWF7C
 gYPMnZUssTKKnGXCLP4dx9sf+L4+rJElacRbugwRA2Fmip0VrR/6D9G9hkzJmebTe3kg
 AOYibWc+Co7MQnO3HV8IUAR0teREdGIU5dNTUPvBJlfXi8Nh4hSUsaM5xV9Svmg/Co6u
 2m1A==
X-Gm-Message-State: AOAM532X+v4XVKURwzYIh/6CN+lrZnH7VEN0winGG0D3HEAHZ/2tzgRo
 JS3HgPWeIGDxMOBaFQlUL6OL4q2Ycxqp8HMxFt7zzav9DOgSIMxUSmfVN0ZOb/uGUfneB6zlgKg
 pYmVZWLRMaYW7iEQ=
X-Received: by 2002:a5d:6d07:: with SMTP id e7mr5235878wrq.311.1637660410307; 
 Tue, 23 Nov 2021 01:40:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVKv62om05Nak5085UtPyVQyb1vWnYIBmItlOO0ryhZMtnEzgsBR/Lh+2+rQVti5Mvk3CeZA==
X-Received: by 2002:a5d:6d07:: with SMTP id e7mr5235839wrq.311.1637660410020; 
 Tue, 23 Nov 2021 01:40:10 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id u23sm12295543wru.21.2021.11.23.01.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 01:40:09 -0800 (PST)
Message-ID: <8f582c75-5ae5-0690-f83f-848ac1592b5b@redhat.com>
Date: Tue, 23 Nov 2021 10:40:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4] s390: kvm: adjust diag318 resets to retain data
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Collin Walling <walling@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
References: <20211117152303.627969-1-walling@linux.ibm.com>
 <f3effe3a-b164-0ce1-aea4-55cde62c2295@de.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <f3effe3a-b164-0ce1-aea4-55cde62c2295@de.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.515, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: cohuck@redhat.com, frankja@linux.ibm.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/11/2021 10.28, Christian Borntraeger wrote:
> Am 17.11.21 um 16:23 schrieb Collin Walling:
>> The CPNC portion of the diag318 data is erroneously reset during an
>> initial CPU reset caused by SIGP. Let's go ahead and relocate the
>> diag318_info field within the CPUS390XState struct such that it is
>> only zeroed during a clear reset. This way, the CPNC will be retained
>> for each VCPU in the configuration after the diag318 instruction
>> has been invoked.
>>
>> The s390_machine_reset code already takes care of zeroing the diag318
>> data on VM resets, which also cover resets caused by diag308.
>>
>> Signed-off-by: Collin Walling <walling@linux.ibm.com>
>> Fixes: fabdada9357b ("s390: guest support for diagnose 0x318")
>> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
>> Reviewed-by: Janosch Frank <frankja@linux.ibm.com>
>> Reviewed-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> 
> Thomas, I think this is good to go. Will you take it via your tree?

Yes, queued to s390x-next now:

https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas


