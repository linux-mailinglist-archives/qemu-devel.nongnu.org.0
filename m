Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809684CBE48
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 13:58:51 +0100 (CET)
Received: from localhost ([::1]:40214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPl2g-0006ZC-6w
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 07:58:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPl1D-0004pI-OH
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:57:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPl1A-0000QB-I0
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:57:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646312235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wG9gLeCWyKtbG9G98fdrqBLJObXLtZ3t7BNqEepFbPA=;
 b=eG0EvBrNr9+xllVNR1OvsgRgPcTp6F7Q2wYHkh3c8QTQbRhUaydgsYbfh4D2obHLm4qZJv
 Qds8mxce12Msj8OPI1e91mbPySl8wlnlrGdsPAObs5FM/WExuiUrfELlL7CWjoOfyxrY0O
 C4zJFxiGiqL88ttlMuWd90dLLa/OQOk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-nmTWui1WMP2a_YDLuE3v5Q-1; Thu, 03 Mar 2022 07:57:12 -0500
X-MC-Unique: nmTWui1WMP2a_YDLuE3v5Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 j9-20020a056402238900b004128085d906so2753160eda.19
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 04:57:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=wG9gLeCWyKtbG9G98fdrqBLJObXLtZ3t7BNqEepFbPA=;
 b=jcwh08DmIwvgl9YChqo8UQT3fQR93vpogNdqNwU1BCCuA5FxOMJLQUnKjwoA/eQ5qa
 HOYsCXsJgZiXI9JhaVsPXB2QcMD/HXA7JVcoeqfAonxJLIiIRnxSXXmjKmvN+LVHSZgJ
 eqOKMkVfwibmdABR3od0i8PuBEMfRwn28vgFaKlqyspzxjEdXa/mQ5rtGUfjpEDtmbih
 dgADtXth6os3pHBJCjC/Re+qUBWkQRjiNaGMeJn6yOhTs0pN/YQyxfaWzuuxhkRV+GXZ
 tSq7sIcaNYyyBxZvZMoenTrSgXTUKNI+SuRu47oXIdCWdfqpLclrLSZ5Sd2LwpFgfr1W
 swiQ==
X-Gm-Message-State: AOAM530GXHrwFNZz8hsNZ0Y4dTDJyJkelowR6YuDD74/MNnR8W86Fa4R
 d6NTmx1b3znhK1nA/3rbVLB9VmozE1DxILBXACUr+cSnzYOOsV9gYFvjBydQGoroPshLwe0dgXX
 Fh5hLD+jR3tStZXs=
X-Received: by 2002:a05:6402:2744:b0:415:c590:3ac3 with SMTP id
 z4-20020a056402274400b00415c5903ac3mr6467040edd.405.1646312231495; 
 Thu, 03 Mar 2022 04:57:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqM/BvP1II1vMV4t2EXrtxigo+LyBek2yew7oNiN+f6jrEGP3qT7kgpxKXnzgDqum7096XTg==
X-Received: by 2002:a05:6402:2744:b0:415:c590:3ac3 with SMTP id
 z4-20020a056402274400b00415c5903ac3mr6467020edd.405.1646312231275; 
 Thu, 03 Mar 2022 04:57:11 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:ca91:ec4d:49ff:d0d1?
 ([2a02:8071:5055:3f20:ca91:ec4d:49ff:d0d1])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a170906724600b006d4e2f6857dsm671661ejk.139.2022.03.03.04.57.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 04:57:10 -0800 (PST)
Message-ID: <68317704-78b5-ff03-74bf-0a09482e65af@redhat.com>
Date: Thu, 3 Mar 2022 13:57:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 15/16] iotests/image-fleecing: add test case with bitmap
From: Hanna Reitz <hreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
 <20220228113927.1852146-16-vsementsov@virtuozzo.com>
 <04aa1423-11ab-ecc7-7637-cca6d7b2c1a3@redhat.com>
In-Reply-To: <04aa1423-11ab-ecc7-7637-cca6d7b2c1a3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, nikita.lapshin@virtuozzo.com, stefanha@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.03.22 12:44, Hanna Reitz wrote:
> On 28.02.22 12:39, Vladimir Sementsov-Ogievskiy wrote:
>> Note that reads zero areas (not dirty in the bitmap) fails, that's
>> correct.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/tests/image-fleecing     | 32 ++++++--
>>   tests/qemu-iotests/tests/image-fleecing.out | 84 +++++++++++++++++++++
>>   2 files changed, 108 insertions(+), 8 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/tests/image-fleecing 
>> b/tests/qemu-iotests/tests/image-fleecing
>> index 909fc0a7ad..33995612be 100755
>> --- a/tests/qemu-iotests/tests/image-fleecing
>> +++ b/tests/qemu-iotests/tests/image-fleecing
>
> [...]
>
>> @@ -50,11 +50,15 @@ remainder = [('0xd5', '0x108000',  '32k'), # 
>> Right-end of partial-left [1]
>>                ('0xcd', '0x3ff0000', '64k')] # patterns[3]
>>     def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
>> -            fleece_img_path, nbd_sock_path, vm):
>> +            fleece_img_path, nbd_sock_path, vm,
>> +            bitmap=False):
>>       log('--- Setting up images ---')
>>       log('')
>>         assert qemu_img('create', '-f', iotests.imgfmt, 
>> base_img_path, '64M') == 0
>> +    if bitmap:
>> +        assert qemu_img('bitmap', '--add', base_img_path, 'bitmap0') 
>> == 0
>
> Doing this means this test can only be run with qcow2, but right now 
> it claims to support many more formats that break with this patch 
> applied.  I think the supported_fmts list needs to be restricted.

Oh, and it will also need an `unsupported_imgopts=['compat']`.

> Also, iotest 297 complains about three lines being too long now.
>
>> +
>>       if use_snapshot_access_filter:
>>           assert use_cbw
>>           assert qemu_img('create', '-f', 'raw', fleece_img_path, 
>> '64M') == 0
>


