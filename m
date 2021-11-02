Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2E4442E5F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:40:52 +0100 (CET)
Received: from localhost ([::1]:46202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mht5v-0003ru-JK
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhsS7-0000La-Da
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:59:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhsS4-00025I-Te
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635854380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EPJQWZ3Jzk8WmblyabltbgldQymm5bShaCDmIKacoMw=;
 b=Y+DIEjEmizQHvsSWxGpZVpGHhyomodCB578oKp/fCVEW6/c2stDt8jJhUNEHfftA+MXjSw
 Zpgj51Bn+mOUCzlad1zAzzlyzlkKIlHNhXXu28B5nMiIHn30dt/M2+00mxuOgcq+YGgwFf
 apBN6C4BCnZetVQSUYfWhzqnduWBfwY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-l2w0ZDuoNHWO60CgOdq8eQ-1; Tue, 02 Nov 2021 07:59:38 -0400
X-MC-Unique: l2w0ZDuoNHWO60CgOdq8eQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so1017070wmc.7
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EPJQWZ3Jzk8WmblyabltbgldQymm5bShaCDmIKacoMw=;
 b=qxT4IUmrEZPAh5mvNY1EgTyD+1X2pGIvIaHzRKE93bnUyf7xmRBYFYu1c2ubes2iMV
 /gKNSNA0wGjmzvNg5S0w5kLuc3VcOjx7gJebr54N98WQyQG/QLvdczv1sAnTSVuhEISA
 m4vBtxO3lGkwEJWHzQ28/N2oN+9UGNOffkMq82My4lluzDJk4hSFALgUDSv4g0P2wQgR
 ND1ge36neKXgHX4XxWU7eQH8VrE4TAtAwfmY8FhAdhm0Z3xCUFbxMrT8I0+Q74xvwsz9
 anS4W2zJl0uZQ1Bx3SewP/AV0wnRLv0txdWikWGU3ht0HS1uB94OAFt4p1yUctqt2NSJ
 g3/A==
X-Gm-Message-State: AOAM530JVUczhNGXbroLBR1Br5W+88NbP7AvMfn3MYQCCeMe2Y38VU4j
 RGjdGU/ZJVytZoWfBudZs7RYDvW+mwVzs8Y+SKrGj77N6E+3b4JSP39TKWxkuIoqCpzQ3XWL1pG
 Fw+Yo1VISM2/iajo=
X-Received: by 2002:a05:600c:3b17:: with SMTP id
 m23mr6300117wms.80.1635854377334; 
 Tue, 02 Nov 2021 04:59:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHxYmKXsL8925cMMYC26gx2SFDpZCdTFXsE3iXWVJhGpChVb/DKcLHbJjKqqgDtiaI8iZOnw==
X-Received: by 2002:a05:600c:3b17:: with SMTP id
 m23mr6300096wms.80.1635854377187; 
 Tue, 02 Nov 2021 04:59:37 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id v6sm20282620wrx.17.2021.11.02.04.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 04:59:36 -0700 (PDT)
Message-ID: <590bf91b-b6f5-4010-a9bf-9de3e1725fb4@redhat.com>
Date: Tue, 2 Nov 2021 12:59:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 4/5] hw/core: Remove uses of QERR_PROPERTY_VALUE_BAD
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20211029230147.2465055-1-philmd@redhat.com>
 <20211029230147.2465055-5-philmd@redhat.com>
 <388aebc7-f4a7-d1d1-40ab-f50abd86c686@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <388aebc7-f4a7-d1d1-40ab-f50abd86c686@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 10:47, Damien Hedde wrote:
> On 10/30/21 01:01, Philippe Mathieu-Daudé wrote:
>> QERR_PROPERTY_VALUE_BAD definition is obsolete since 2015 (commit
>> 4629ed1e989, "qerror: Finally unused, clean up"). Replace the two
>> uses and drop the definition.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   include/qapi/qmp/qerror.h | 3 ---
>>   hw/core/qdev-properties.c | 2 +-
>>   target/i386/cpu.c         | 2 +-
>>   3 files changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
>> index f49ae01cdb0..a3f44fc4a1e 100644
>> --- a/include/qapi/qmp/qerror.h
>> +++ b/include/qapi/qmp/qerror.h
>> @@ -50,9 +50,6 @@
>>   #define QERR_PERMISSION_DENIED \
>>       "Insufficient permission to perform this operation"
>>   -#define QERR_PROPERTY_VALUE_BAD \
>> -    "Property '%s.%s' doesn't take value '%s'"
>> -
>>   #define QERR_PROPERTY_VALUE_OUT_OF_RANGE \
>>       "Property %s.%s doesn't take value %" PRId64 " (minimum: %"
>> PRId64 ", maximum: %" PRId64 ")"
>>   diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
>> index c34aac6ebc9..dbea4cf8e5e 100644
>> --- a/hw/core/qdev-properties.c
>> +++ b/hw/core/qdev-properties.c
>> @@ -663,7 +663,7 @@ void error_set_from_qdev_prop_error(Error **errp,
>> int ret, Object *obj,
>>           break;
>>       default:
>>       case -EINVAL:
>> -        error_setg(errp, QERR_PROPERTY_VALUE_BAD,
>> +        error_setg(errp, "Property '%s.%s' doesn't take value '%s'",
>>                      object_get_typename(obj), name, value);
>>           break;
>>       case -ENOENT:
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index fc3ed80ef1e..bc63b80e5bd 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -4469,7 +4469,7 @@ static void x86_cpuid_set_vendor(Object *obj,
>> const char *value,
>>       int i;
>>         if (strlen(value) != CPUID_VENDOR_SZ) {
>> -        error_setg(errp, QERR_PROPERTY_VALUE_BAD, "", "vendor", value);
>> +        error_setg(errp, "Property '.vendor' doesn't take value
>> '%s'", value);
>>           return;
>>       }
>>  
> Hi,
> 
> maybe we can remove the '.' before vendor in this case.

I think so too but have no clue about this are, so will let
the x86 maintainers decide (I have to respin anyway).


