Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 986F24E3C7E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 11:32:56 +0100 (CET)
Received: from localhost ([::1]:49622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWbot-00049I-NY
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 06:32:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWbnU-0003Q3-OL
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:31:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWbnR-0000ot-W6
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:31:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647945084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rHCRINFZSGBvFJxf4M63jL/4B9ACQE8MJG6kL3idk6w=;
 b=EIx9Ts1e+OcIpidaCyzUarWjFFZ5EHpQ1rwdXlIOmbIyhB+k2GpxBZqA8kEcWM80Ou4LbZ
 auk6zSUxzIrmJv3UmOVObs1hy8CKt+P2zKL7j6n5/kbz6RU8UtSTFMfFiq66F7FSLCInhG
 JRaRK6acWUEZ3a3VF3GwoXYYGNYh37Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-Mnebt3tdMSq-ePbw6uhXig-1; Tue, 22 Mar 2022 06:31:22 -0400
X-MC-Unique: Mnebt3tdMSq-ePbw6uhXig-1
Received: by mail-wm1-f69.google.com with SMTP id
 12-20020a05600c24cc00b0038c6caa95f7so669511wmu.4
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 03:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rHCRINFZSGBvFJxf4M63jL/4B9ACQE8MJG6kL3idk6w=;
 b=qvueeZdmCxXa9T10tlfTAnptyeO5LAfqrbUovsvAS8lgzb2eOkZzEqnGupxruLaxc1
 5J4PXoeoUA+u4jxTNgazNyHWiy8dEQEOT73OhL4kreYlpqn9F/4PamIYcQxJT5r1qX1U
 muUBDiLqQ1fZxSkhA4YUWIdMD98s0r9thDWt/btnhjb0f5qtLzsIBGRdFe/b0SJ+gLcN
 4uuzETUAFEayguSv4/HMcX+2EAzj1lMV4Lxk5nfdGTgWck870UwLm8I7EJMP5u33vE7g
 TEJdlBDQB9kwEyS3DkVYkIamiYn1BzPo/bRBaA31SSTebGtJkXKTC18cCOpnh6bhs9jH
 SfEQ==
X-Gm-Message-State: AOAM5335pAtsruO3zLQYSpMeD2zIDldttLpNBRzUIZRepSXx3VRfc+mh
 1/X1luyZv/DcmXH1IJkPwd04Oibz2apnjq9lq9pJdBnMPD9XI3KkbwOv2q5bswvvgObQVEy9e81
 cRO5CUZWOq0wYRB8=
X-Received: by 2002:a5d:5249:0:b0:203:d647:a5cd with SMTP id
 k9-20020a5d5249000000b00203d647a5cdmr21847264wrc.103.1647945081646; 
 Tue, 22 Mar 2022 03:31:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzR5tCDGQqtGyv+xou4KFRBOTYoXfgfNASBjDMYWoGaDL4AaiY/RIVfJd5viwum78P+8H0sPg==
X-Received: by 2002:a5d:5249:0:b0:203:d647:a5cd with SMTP id
 k9-20020a5d5249000000b00203d647a5cdmr21847251wrc.103.1647945081437; 
 Tue, 22 Mar 2022 03:31:21 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 v2-20020adf8b42000000b001edc38024c9sm16980773wra.65.2022.03.22.03.31.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 03:31:20 -0700 (PDT)
Message-ID: <6409f049-d938-0e06-3cea-5877b31fce00@redhat.com>
Date: Tue, 22 Mar 2022 11:31:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 10/11] tests/tcg/s390x: Tests for Vector Enhancements
 Facility 2
To: David Hildenbrand <david@redhat.com>, David Miller
 <dmiller423@gmail.com>, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20220322000441.26495-1-dmiller423@gmail.com>
 <20220322000441.26495-11-dmiller423@gmail.com>
 <c3bb72da-c390-f9b5-5254-f8c16df21427@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <c3bb72da-c390-f9b5-5254-f8c16df21427@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: pasic@linux.ibm.com, borntraeger@linux.ibm.com, farman@linux.ibm.com,
 cohuck@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/03/2022 09.53, David Hildenbrand wrote:
> On 22.03.22 01:04, David Miller wrote:
[...]
>> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
>> index 8c9b6a13ce..921a056dd1 100644
>> --- a/tests/tcg/s390x/Makefile.target
>> +++ b/tests/tcg/s390x/Makefile.target
>> @@ -16,6 +16,14 @@ TESTS+=shift
>>   TESTS+=trap
>>   TESTS+=signals-s390x
>>   
>> +VECTOR_TESTS=vxeh2_vs
>> +VECTOR_TESTS+=vxeh2_vcvt
>> +VECTOR_TESTS+=vxeh2_vlstr
>> +
>> +TESTS+=$(VECTOR_TESTS)
>> +
>> +$(VECTOR_TESTS): CFLAGS+=-march=z15 -O2
> 
> @Thomas, will that survive our test framework already, or do we have to
> wait for the debain11 changes?

Alex' update to the container has already been merged:

https://gitlab.com/qemu-project/qemu/-/commit/89767579cad2e371b

... and seems like it's working in Travis on s390x, too:

https://app.travis-ci.com/github/huth/qemu/jobs/564188977#L12797

... so it seems like it should be OK now (considering that we drop support 
for the old Ubuntu version 18.04 in QEMU 7.1, too).

  Thomas


