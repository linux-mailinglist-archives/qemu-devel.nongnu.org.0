Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25250369108
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 13:25:11 +0200 (CEST)
Received: from localhost ([::1]:41804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZtvq-0008DS-8Y
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 07:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lZtpg-0003bf-V1
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 07:18:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lZtpf-0006kq-7i
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 07:18:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619176724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SxqdisL6mawIzWdNPfQMplWG9qQZPf3s4tztvCYJnOs=;
 b=TjCXVQ4qnWvFs9biZQYFtUwEvUQSGOV/3Qo8itU/p1JmUC6GH43NV415BCatMLfwWiPraZ
 D9OACm9oIlFeibp+v+LX5ZXVhArVm0Bp/sBM43DSp521VJ3wFSilfF4iiUBaQ9GgVEB8Dv
 lzADVIhPGnDJM/L65nXSg1eKy8aENSI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-cfSilDK_Ofie8V9SdfEe9Q-1; Fri, 23 Apr 2021 07:18:40 -0400
X-MC-Unique: cfSilDK_Ofie8V9SdfEe9Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 j123-20020a1c23810000b02901384b7122bcso2716052wmj.6
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 04:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SxqdisL6mawIzWdNPfQMplWG9qQZPf3s4tztvCYJnOs=;
 b=r6AIE7EUlOV1H6Jj2aPWDk0koZKLhK5tAOgSqjvmSdtlOFVmdzE5/YgweTsgL6DAjd
 SXMCwordvxlXHSjJ0w8x2SO8ggc0a/pkQOXCGOQ2bDCSL7G1jrT5VLahwCYUQTamIo9S
 CJgk5DOGBMEeBO6vGVcI/OY68Byt1+4c67VSP0VR5PwzagNsYx6dKC1Bg7pWKx3OxZal
 q6yD8Df7tONALRd/13/P1hMVJZvjpQ2iKYWQlHEsB1r1OHh31UmgKL9ghle/zdOMR+vR
 d9zQseCDX/y2iWtjTxnKYHgDm7cRje80UzHexNp3+mvI6lxrNGmlIA822oneHo680UBv
 HPzA==
X-Gm-Message-State: AOAM530A5EOq5X2mu0b0o9mRr+UrIBmC1hFiwE+TvaKbWKRx2h/wNHym
 T9TrQKY2mF8yImIq1bnNVx+apyI3tJ6ptkXAs/l44aqccBjKY41s6pJ0UnnxuCmuO2hEjBHZcPN
 lVn76gq9ov8yRcmM=
X-Received: by 2002:a5d:58f3:: with SMTP id f19mr4080131wrd.133.1619176719304; 
 Fri, 23 Apr 2021 04:18:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTWS7RWrH0RtoGc3W3YIrht5qhO6Gz5atMAiDe2W3tMYlgQgf3ExtWs8iBKNjSY79NGKoPeQ==
X-Received: by 2002:a5d:58f3:: with SMTP id f19mr4080112wrd.133.1619176719096; 
 Fri, 23 Apr 2021 04:18:39 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6365.dip0.t-ipconnect.de. [91.12.99.101])
 by smtp.gmail.com with ESMTPSA id
 t17sm7164067wmq.12.2021.04.23.04.18.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 04:18:38 -0700 (PDT)
Subject: Re: [PATCH v6 10/15] hostmem: Wire up RAM_NORESERVE via "reserve"
 property
To: Markus Armbruster <armbru@redhat.com>
References: <20210421122624.12292-1-david@redhat.com>
 <20210421122624.12292-11-david@redhat.com>
 <87a6ppi77c.fsf@dusky.pond.sub.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <7cf63e36-1d1c-113d-15b5-227d099d76a1@redhat.com>
Date: Fri, 23 Apr 2021 13:18:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87a6ppi77c.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> diff --git a/backends/hostmem.c b/backends/hostmem.c
>> index c6c1ff5b99..58fdc1b658 100644
>> --- a/backends/hostmem.c
>> +++ b/backends/hostmem.c
>> @@ -217,6 +217,11 @@ static void host_memory_backend_set_prealloc(Object *obj, bool value,
>>       Error *local_err = NULL;
>>       HostMemoryBackend *backend = MEMORY_BACKEND(obj);
>>   
>> +    if (!backend->reserve && value) {
>> +        error_setg(errp, "'prealloc=on' and 'reserve=off' are incompatible");
>> +        return;
>> +    }
> 
> Aha.  Shouldn't this be documented in qom.json?
> 

Whoops, skipped that comment. Can add it if that's the place to document 
that.

-- 
Thanks,

David / dhildenb


