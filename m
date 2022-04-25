Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A2D50DC09
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 11:09:52 +0200 (CEST)
Received: from localhost ([::1]:44776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niuj9-0004ul-0i
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 05:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1niug8-0002a2-0L
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:06:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1niug5-0000Ix-4T
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:06:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650877600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jQc8p97oS+bHimoYEpbQ3L3KQ6NmZdE1p3HZh23obKY=;
 b=fYiQDzgO0nvOjFKrmUaGnx1tmme4vWoxFcvFWjzZZo8rfYT2hzZgHEz5N9sPjHp/ewaAoL
 c10mvc+/U5WY23eoeg1ctgYKD+WZZAhfgbkonQO27QzwND1aCJGChYJO40bko+GBI2SerD
 xCfbHqVxX3HSB/jWr3VpfXMBTywAiJ4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-3viThj4dOKmRCKQ2h9JQNg-1; Mon, 25 Apr 2022 05:06:38 -0400
X-MC-Unique: 3viThj4dOKmRCKQ2h9JQNg-1
Received: by mail-wr1-f71.google.com with SMTP id
 w4-20020adfbac4000000b0020acba4b779so1687125wrg.22
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 02:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jQc8p97oS+bHimoYEpbQ3L3KQ6NmZdE1p3HZh23obKY=;
 b=rCfpmAjcauqUaiaj0xXO9BdMhwZ94zmIKywGscEyvHtfZcqMBfixpdjuviolxJdoxD
 vnNOsMaM/eFib8+rNqzHxFKYBZbQcOdDs0s4VHMS0tRWTSt3B5WnuuH2W4lBmNpRar0T
 dwdqa5dDv3kYus7EFOfbes05txcvKTktgobTw+qG67zEHaZNiIgT/EErZ0JoHSOeKIi/
 u0Lkiw/NyMnojI8lNP0YCS2yI9kLlqri1TRYVVrH5qtWdGBbgfVgTqagnwyRoxbLEHuE
 RXMQmp8nFS1bYNxW9hWP69SMx2fht7hwSNm3hwA8mKdgnl6GmsJ6VuiDPFQYM1XlKy5k
 bVcg==
X-Gm-Message-State: AOAM5315ZLLZX7+dfegTDfm5jB5zDgkxovYlC+Ku9tjGB7re+MP36HHf
 BRQJZlly6hJ+FALYmz4se7915yLV0uTSSFC0gHakqtLVl5sHIRLYnnwdEqzVTOZ6D6XWUMBYwy3
 F7Cm51SdBmVIJ5VY=
X-Received: by 2002:a1c:2706:0:b0:391:822c:83da with SMTP id
 n6-20020a1c2706000000b00391822c83damr15350450wmn.100.1650877597197; 
 Mon, 25 Apr 2022 02:06:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtkx495weS/A1UJB9JPPASVoWcQPB/WesAZXWJUQ/1cTwiUZS/MzBexPxVuYUSKJZOzINqKQ==
X-Received: by 2002:a1c:2706:0:b0:391:822c:83da with SMTP id
 n6-20020a1c2706000000b00391822c83damr15350432wmn.100.1650877596986; 
 Mon, 25 Apr 2022 02:06:36 -0700 (PDT)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 i27-20020a1c541b000000b003928e866d32sm11414352wmb.37.2022.04.25.02.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 02:06:36 -0700 (PDT)
Message-ID: <8082585e-600b-a137-241f-7b8320acf88b@redhat.com>
Date: Mon, 25 Apr 2022 11:06:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 00/11] s390x/tcg: Implement Vector-Enhancements
 Facility 2
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220323135722.1623-1-dmiller423@gmail.com>
 <25e876da-c2ac-ad55-0830-6fe149e0691f@linux.ibm.com>
 <6c44677b-50ee-5d4e-2aa6-d28f98142f49@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <6c44677b-50ee-5d4e-2aa6-d28f98142f49@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
Cc: pasic@linux.ibm.com, farman@linux.ibm.com, cohuck@redhat.com,
 richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/04/2022 09.51, David Hildenbrand wrote:
> On 25.04.22 09:43, Christian Borntraeger wrote:
>> Am 23.03.22 um 14:57 schrieb David Miller:
>>> Implement Vector-Enhancements Facility 2 for s390x
>>>
>>> resolves: https://gitlab.com/qemu-project/qemu/-/issues/738
>>>
>>> implements:
>>>       VECTOR LOAD ELEMENTS REVERSED               (VLER)
>>>       VECTOR LOAD BYTE REVERSED ELEMENTS          (VLBR)
>>>       VECTOR LOAD BYTE REVERSED ELEMENT           (VLEBRH, VLEBRF, VLEBRG)
>>>       VECTOR LOAD BYTE REVERSED ELEMENT AND ZERO  (VLLEBRZ)
>>>       VECTOR LOAD BYTE REVERSED ELEMENT AND REPLICATE (VLBRREP)
>>>       VECTOR STORE ELEMENTS REVERSED              (VSTER)
>>>       VECTOR STORE BYTE REVERSED ELEMENTS         (VSTBR)
>>>       VECTOR STORE BYTE REVERSED ELEMENTS         (VSTEBRH, VSTEBRF, VSTEBRG)
>>>       VECTOR SHIFT LEFT DOUBLE BY BIT             (VSLD)
>>>       VECTOR SHIFT RIGHT DOUBLE BY BIT            (VSRD)
>>>       VECTOR STRING SEARCH                        (VSTRS)
>>>
>>>       modifies:
>>>       VECTOR FP CONVERT FROM FIXED                (VCFPS)
>>>       VECTOR FP CONVERT FROM LOGICAL              (VCFPL)
>>>       VECTOR FP CONVERT TO FIXED                  (VCSFP)
>>>       VECTOR FP CONVERT TO LOGICAL                (VCLFP)
>>>       VECTOR SHIFT LEFT                           (VSL)
>>>       VECTOR SHIFT RIGHT ARITHMETIC               (VSRA)
>>>       VECTOR SHIFT RIGHT LOGICAL                  (VSRL)
>>>
>>>
>>> David Miller (9):
>>>     tcg: Implement tcg_gen_{h,w}swap_{i32,i64}
>>>     target/s390x: vxeh2: vector convert short/32b
>>>     target/s390x: vxeh2: vector string search
>>>     target/s390x: vxeh2: Update for changes to vector shifts
>>>     target/s390x: vxeh2: vector shift double by bit
>>>     target/s390x: vxeh2: vector {load, store} elements reversed
>>>     target/s390x: vxeh2: vector {load, store} byte reversed elements
>>>     target/s390x: vxeh2: vector {load, store} byte reversed element
>>>     target/s390x: add S390_FEAT_VECTOR_ENH2 to qemu CPU model
>>>     tests/tcg/s390x: Tests for Vector Enhancements Facility 2
>>>     target/s390x: Fix writeback to v1 in helper_vstl
>>>
>>> Richard Henderson (2):
>>>     tcg: Implement tcg_gen_{h,w}swap_{i32,i64}
>>>     target/s390x: Fix writeback to v1 in helper_vstl
>>
>>
>> I guess we can now re-do this series against 7.1-devel (qemu/master) which does
>> have the machine compat changes. Apart from that this should be ready now?
>>
> 
> Yes, I think so. I can respin with the proper compat changes if requested.

FWIW, I played with the series a little bit, and did not spot any obvious 
problems anymore, so feel free to add:

Tested-by: Thomas Huth <thuth@redhat.com>

If you send a v6 with the compat stuff fixed, I can queue it for my next 
s390x pull request.

  Thomas


