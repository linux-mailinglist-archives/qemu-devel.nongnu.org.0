Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD09A408F7A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:44:59 +0200 (CEST)
Received: from localhost ([::1]:48182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmGY-0005AH-OC
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mPlHz-0004Ji-4n
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:42:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mPlHx-0002VE-GR
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631536940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L8x6xmksworV2GL44a6nKcXz40uyDHJUaxG4GZC64U4=;
 b=FTAaFgHSW5mS4dSzZIcB/2NLJMs+tMqE+s6/ecC1AOxqUnWkVQRfmLIUmByDhg67gdZR8W
 s2/yxrVjm4xlFNyxWUtfgPwcRGUTEo6YXozphH6txfTN7mJoCkbVDa7tXpGLQgexw4h7C4
 fYYlVmpSZMK3WVwjIszG98v1mVFC4vU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-MidrlpfVORGSODZA7Bhkbg-1; Mon, 13 Sep 2021 08:42:19 -0400
X-MC-Unique: MidrlpfVORGSODZA7Bhkbg-1
Received: by mail-ed1-f70.google.com with SMTP id
 ec14-20020a0564020d4e00b003cf5630c190so4894651edb.3
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 05:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L8x6xmksworV2GL44a6nKcXz40uyDHJUaxG4GZC64U4=;
 b=E+Ex6oQUDit4fCt0NAOKa4EVmKQPCBYOuNtHX61zFvbK0k60LgFE3qq+XRUd3bvk1z
 B2GzUgNhdkJRyVFFSGnI6qFm0RPeB1gQIuMkmpOoysklicSr9gHzBAsz5nHXsjS6734X
 FP/l7G33vQzy9tmRNjuSQH6lejjxO9sVUsRqV49IlBz3xlb+2XeoBgQ4mqCWhmlbUZgI
 dxICxU02kPe3j5IgbrBHMCHWdHqE2Ve+QZfnhwFJh1MrWw4ubp11Wcnh5KtYXN/9Cc3A
 zzQglJO8BYjdkSQQkQfzHT9/YzgNRWuEobSv42gsCW+dRntoHOi7UzuDh+Se3LeTjEiw
 gRxA==
X-Gm-Message-State: AOAM530mcqW9IO7FH5b9nvSE92WjO/xoYY71EkewkbdCXyBxphzpMx1h
 hvvax7jCNYLv9SEw7tNe1MSrrpp9H5vsZ92sQq5ApmPNJb1tcp9sAg+J+ekhI5dzWNX4GZ/lRzJ
 Go451hGdCrIHhV3c=
X-Received: by 2002:a17:906:b74f:: with SMTP id
 fx15mr12640710ejb.299.1631536938578; 
 Mon, 13 Sep 2021 05:42:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLYZXzqpSsSNyf/w2/zcwNhPxSm2SUaWbZJGyMp8t7LhYTv3R/+Z1RNEcbJ/xg5xWs5PNCBg==
X-Received: by 2002:a17:906:b74f:: with SMTP id
 fx15mr12640690ejb.299.1631536938368; 
 Mon, 13 Sep 2021 05:42:18 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w5sm3459589ejz.25.2021.09.13.05.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 05:42:17 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] monitor: Add HMP and QMP interfaces
To: Yang Zhong <yang.zhong@intel.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210910102258.46648-1-yang.zhong@intel.com>
 <20210910102258.46648-2-yang.zhong@intel.com>
 <fb7d360d-80b5-9bc2-0f6f-f48e04dc08f9@redhat.com>
 <20210913103713.GB27331@yangzhon-Virtual>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <03db3b3d-5961-b11a-ae09-97a11dea9cc7@redhat.com>
Date: Mon, 13 Sep 2021 14:42:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913103713.GB27331@yangzhon-Virtual>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eblake@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/09/21 12:37, Yang Zhong wrote:
>>> +{ 'struct': 'SGXInfo',
>>> +  'data': { 'sgx': 'bool',
>>> +            'sgx1': 'bool',
>>> +            'sgx2': 'bool',
>>> +            'flc': 'bool',
>>> +            'section-size': 'uint64'},
>>> +   'if': 'TARGET_I386' }
>>
>> Is it possible to restrict it to KVM? Maybe:
>>
>>       'if': { 'all': ['TARGET_I386', 'CONFIG_KVM'] } },
>>
>> ? (I'm not sure).
> 
>    Philippe, i tried this definition, which is feasible.
>    This seems more accurate for sgx in the kvm of i386 platform. thanks!

The definition is needed in the stubs as well (cross-compilation 
currently fails due to missing sgx_get_{info,capabilities}), so I think 
this doesn't work.

Paolo


