Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA72C50DA92
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 09:54:29 +0200 (CEST)
Received: from localhost ([::1]:51562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nitYD-00082J-2z
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 03:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nitV9-00064y-0Q
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 03:51:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nitV6-0005hU-8b
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 03:51:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650873075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7FZ8TT5trdYKBHmMU/C+dsjWxugv5kbeJMdX4hzgsRE=;
 b=RUxytqqPDioLTv65coGFYS0gV7UFDquWPVljmoXB5J/klp0p3Z1ZgvqGuJQKlTYcGGW0VU
 UHqfC2+Xe2ov/SGfDtdGq6+SHwmD4fXCbgT4TKf8ZCgQkYm8pK8wHrJ2oXxBItJ/DqGgOS
 ECz3xgEKgC+pPWFqwLJrGiaHlsGGxOQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-8rbKlVDNMH-0YONYZEeXUA-1; Mon, 25 Apr 2022 03:51:13 -0400
X-MC-Unique: 8rbKlVDNMH-0YONYZEeXUA-1
Received: by mail-wm1-f70.google.com with SMTP id
 q6-20020a1cf306000000b0038c5726365aso6841145wmq.3
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 00:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7FZ8TT5trdYKBHmMU/C+dsjWxugv5kbeJMdX4hzgsRE=;
 b=cDEXpfmP36fzX3gEKWwraRuxfZuqMd4WEFBBvqCdFri+Jt6+rH2fRs2Vrw41j1DPSH
 r2Xg8xTS0K22FYAuuUYtw/7sk6Ckkl8BD6Slqfnyh1GaGi4OzrKSrUXHnlrNR/NGIzDY
 nXT6MfGhdLiYFBDjRNanljBkopKjYcdSLvQj2DL4gPt0QGzRCZvekApYBek3RdAGvtto
 7NlwIFEqd6DI/zfTgHKhTfuWP8vAFGHuaxjJYwPYjX0QKgyMLJRuIRJ8YTs4wPlnXRWV
 NNHpekOA06keeIeqJxCb/FJcJQkSZWaG7l7L8FcVbwr79a61K//3Mg8z6ARJltAjNXlV
 1VIQ==
X-Gm-Message-State: AOAM533zm6XvNEGmVV1t9Q+jDLWQLvmnf6mENvJnLwTsAipKkreXoBH5
 PKoMjsgxnGUBhe3/lnGRfRuhhRdjB24RW/yIdfin02yHcFXVHpMKkZcV635t9UHXfmirLiqxDGn
 ioilFF1skqUPdssQ=
X-Received: by 2002:adf:bd91:0:b0:209:19ac:7159 with SMTP id
 l17-20020adfbd91000000b0020919ac7159mr12634170wrh.3.1650873072319; 
 Mon, 25 Apr 2022 00:51:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynxo9q3uy6XcoPFvLoA9qL0OJ5bSbuk1a9OEGwuJkusVwnrq9CHHvzOb6IHTgtKQg5kfvaUA==
X-Received: by 2002:adf:bd91:0:b0:209:19ac:7159 with SMTP id
 l17-20020adfbd91000000b0020919ac7159mr12634152wrh.3.1650873072106; 
 Mon, 25 Apr 2022 00:51:12 -0700 (PDT)
Received: from ?IPV6:2003:cb:c700:fc00:490d:ed6a:8b22:223a?
 (p200300cbc700fc00490ded6a8b22223a.dip0.t-ipconnect.de.
 [2003:cb:c700:fc00:490d:ed6a:8b22:223a])
 by smtp.gmail.com with ESMTPSA id
 e4-20020adfa444000000b0020ac74da5c5sm8271248wra.87.2022.04.25.00.51.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 00:51:11 -0700 (PDT)
Message-ID: <6c44677b-50ee-5d4e-2aa6-d28f98142f49@redhat.com>
Date: Mon, 25 Apr 2022 09:51:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 00/11] s390x/tcg: Implement Vector-Enhancements
 Facility 2
Content-Language: en-US
To: Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220323135722.1623-1-dmiller423@gmail.com>
 <25e876da-c2ac-ad55-0830-6fe149e0691f@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <25e876da-c2ac-ad55-0830-6fe149e0691f@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: pasic@linux.ibm.com, thuth@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.04.22 09:43, Christian Borntraeger wrote:
> Am 23.03.22 um 14:57 schrieb David Miller:
>> Implement Vector-Enhancements Facility 2 for s390x
>>
>> resolves: https://gitlab.com/qemu-project/qemu/-/issues/738
>>
>> implements:
>>      VECTOR LOAD ELEMENTS REVERSED               (VLER)
>>      VECTOR LOAD BYTE REVERSED ELEMENTS          (VLBR)
>>      VECTOR LOAD BYTE REVERSED ELEMENT           (VLEBRH, VLEBRF, VLEBRG)
>>      VECTOR LOAD BYTE REVERSED ELEMENT AND ZERO  (VLLEBRZ)
>>      VECTOR LOAD BYTE REVERSED ELEMENT AND REPLICATE (VLBRREP)
>>      VECTOR STORE ELEMENTS REVERSED              (VSTER)
>>      VECTOR STORE BYTE REVERSED ELEMENTS         (VSTBR)
>>      VECTOR STORE BYTE REVERSED ELEMENTS         (VSTEBRH, VSTEBRF, VSTEBRG)
>>      VECTOR SHIFT LEFT DOUBLE BY BIT             (VSLD)
>>      VECTOR SHIFT RIGHT DOUBLE BY BIT            (VSRD)
>>      VECTOR STRING SEARCH                        (VSTRS)
>>
>>      modifies:
>>      VECTOR FP CONVERT FROM FIXED                (VCFPS)
>>      VECTOR FP CONVERT FROM LOGICAL              (VCFPL)
>>      VECTOR FP CONVERT TO FIXED                  (VCSFP)
>>      VECTOR FP CONVERT TO LOGICAL                (VCLFP)
>>      VECTOR SHIFT LEFT                           (VSL)
>>      VECTOR SHIFT RIGHT ARITHMETIC               (VSRA)
>>      VECTOR SHIFT RIGHT LOGICAL                  (VSRL)
>>
>>
>> David Miller (9):
>>    tcg: Implement tcg_gen_{h,w}swap_{i32,i64}
>>    target/s390x: vxeh2: vector convert short/32b
>>    target/s390x: vxeh2: vector string search
>>    target/s390x: vxeh2: Update for changes to vector shifts
>>    target/s390x: vxeh2: vector shift double by bit
>>    target/s390x: vxeh2: vector {load, store} elements reversed
>>    target/s390x: vxeh2: vector {load, store} byte reversed elements
>>    target/s390x: vxeh2: vector {load, store} byte reversed element
>>    target/s390x: add S390_FEAT_VECTOR_ENH2 to qemu CPU model
>>    tests/tcg/s390x: Tests for Vector Enhancements Facility 2
>>    target/s390x: Fix writeback to v1 in helper_vstl
>>
>> Richard Henderson (2):
>>    tcg: Implement tcg_gen_{h,w}swap_{i32,i64}
>>    target/s390x: Fix writeback to v1 in helper_vstl
> 
> 
> I guess we can now re-do this series against 7.1-devel (qemu/master) which does
> have the machine compat changes. Apart from that this should be ready now?
> 

Yes, I think so. I can respin with the proper compat changes if requested.

-- 
Thanks,

David / dhildenb


