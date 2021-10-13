Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4917942C731
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 19:04:28 +0200 (CEST)
Received: from localhost ([::1]:44322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mahg3-0004dU-Cg
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 13:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mahcW-00027n-HT
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 13:00:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mahcU-0004lR-Kt
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 13:00:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634144445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JaIsHMgtu5kKvdYnwZ5EDlR1fgvZAn0kEGHvWPS/qPc=;
 b=L0/rkPgvJKlRU8wc4hBahkXgbmy8W+pGR/rWwsvSAr7bl6JNZ4bjfQlVtI6+9IyxnwJUCo
 qE/THuTOtIfX9JQrs0kK14u5ihIRwl1n6loLE0zarSAgR6rd/S0TPSDPKksaPgHyj6sF13
 EUgZB1ayyXwButgGAWhpQ2CFPjb90ro=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-TwMEwqXsPx6UFt6bGHRaTA-1; Wed, 13 Oct 2021 13:00:44 -0400
X-MC-Unique: TwMEwqXsPx6UFt6bGHRaTA-1
Received: by mail-ed1-f70.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso2774494edj.20
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 10:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JaIsHMgtu5kKvdYnwZ5EDlR1fgvZAn0kEGHvWPS/qPc=;
 b=FZ/2d3uoQkOlvGFkMHFNk2hLeT5sVl8uRMshdy8q9G3Y9i6xSfTXXrIsqe3EpbRqor
 8v0v4ekgsqMLd+7VZmwtxAt6x7AIggtkn/H/fXlTj7U+CoPJUtvxdBUDDFoMf1KYM7uX
 SWRuUkjjFHc7EmSgkxGIwqoMcrkpyxvyU3nx+OruhJuaQHzkbdRtvvjH8MGOx7jx/L49
 YiwFpu80SGCYwaZQOZRuzXwIt3cp2t5ZQUVk6WXahrVnoBY1JbHzo3OQrhf6mutQzPLH
 rJ0ayiSaygw23HIStRM7lrlQOOv36MO/S8hFRVQE1RfVtQoc+dTHcVa5kzO6ykGOjqDS
 HNAQ==
X-Gm-Message-State: AOAM531JXRh3lo9z4Lex7aMwBX5mE9aZk199L3czXMnLys+mZDw3i0bu
 9ejKbstpCeZCKhvK7yw0gvyPgPO2tJ6ak5+z5gL2dwFEjAtSpQjP8tb7dqeqf0vklzUYLhGhm1h
 aQsXtmz9KwbbxSSM=
X-Received: by 2002:a05:6402:16c9:: with SMTP id
 r9mr723178edx.147.1634144443471; 
 Wed, 13 Oct 2021 10:00:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGfHol5MSmqhFeAIDn/0EgTO54Zl2fS+XSYHweDZMO1x03SocgJ0RYYYBhIWicHA5hct9fGA==
X-Received: by 2002:a05:6402:16c9:: with SMTP id
 r9mr723141edx.147.1634144443240; 
 Wed, 13 Oct 2021 10:00:43 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id os19sm115934ejb.16.2021.10.13.10.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 10:00:42 -0700 (PDT)
Message-ID: <1d2ff0c6-f1ab-fae4-e77a-edefcc27093d@redhat.com>
Date: Wed, 13 Oct 2021 19:00:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 24/24] configure: automatically parse command line for
 meson -D options
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211012111302.246627-1-pbonzini@redhat.com>
 <20211012111302.246627-25-pbonzini@redhat.com>
 <de0d99d9-8375-5f01-c0a6-8174b6f57b49@redhat.com>
 <9f0d78be-b840-4ec1-f61c-11765650285f@redhat.com>
 <16181a8b-4676-24c9-796d-56207731d4c2@redhat.com>
 <c4807a16-7d32-bf92-a73e-d57b7cf13e9d@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <c4807a16-7d32-bf92-a73e-d57b7cf13e9d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/10/21 13:27, Thomas Huth wrote:
>>
>> +def fixup_options(options):
>> +    # Meson <= 0.60 does not include the choices in array options, 
>> fix that up
>> +    for opt in options:
>> +        if opt["name"] == "trace_backends":
>> +            opt["choices"] = [
>> +                "dtrace",
>> +                "ftrace",
>> +                "log",
>> +                "nop",
>> +                "simple",
>> +                "syslog",
>> +                "ust",
>> +            ]
> 
> Do we need a check for a fixed meson version here?

No, on a fixed version of Meson it will just overwrite the existing 
array with itself.  Once we can require a newer version, we'll remove 
the fixup.

Paolo


