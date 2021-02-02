Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC06D30B8FE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 08:56:00 +0100 (CET)
Received: from localhost ([::1]:56762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6qXX-0002gl-RC
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 02:55:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6qWF-00027n-O6
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 02:54:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6qWD-00005p-7Q
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 02:54:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612252475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6DN823BKMYztGBZ5wPXhgrSFVRTS9vuuxVb+nPkoDtw=;
 b=HLi8JOvKspvIPIt9D+3EJkkohQTynHDOFwnLjJh/CJTo88nZ5Rhl1TNF8fiGKVGmfuYDrV
 4LsN1BaRYanXPieEo6xG3qxJalkksxMYEzrFa6uBDiOisKn7Qpim/TdUrg9nlnXs/Lm8r4
 pd7Yivt0CJHFU1UMRBUFiofuVb7KiMg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-W00KN6ZJMBKDxoeGQbYxng-1; Tue, 02 Feb 2021 02:54:34 -0500
X-MC-Unique: W00KN6ZJMBKDxoeGQbYxng-1
Received: by mail-ed1-f69.google.com with SMTP id g6so1386650edy.9
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 23:54:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6DN823BKMYztGBZ5wPXhgrSFVRTS9vuuxVb+nPkoDtw=;
 b=mf6igAGK2wkJI12wr1FxTURUr/h1ZftdGhSyXf+O6ssxd6KfOtMluxs6eVjS7Phfzq
 oHtOpwEJMFgYNliJf4e0zi4gP/rgMJVl7gRsE1MLnjrke87x4BFVKsYut4S2euqRk0lh
 9Jc03m+SKMLdhw2ki/uig6arq0GICwN99qp5nW5R/6Z5fKAHRsCmVCgTTN+41iX0zdxO
 Irxiv925tM5KCwb8QqWhzNNf1P9IzGW+uBAzLnZde1WfSS5FrWr+q+166Fjl8Fh9jYXl
 PppbqXFtfdN5t+EjIoDX+cY6q3SkJRB/htSFWEYmHRiowZCtb983DIoJArXum1h70rdd
 o52g==
X-Gm-Message-State: AOAM531766j8U/pPmC1+iQ+a+sXOyiKYJYMq203uCkzv3bJ2x9ljp/MX
 Qh5DZk4YubebQ4w1uudwHz5w9iGM1Gu80MHqfHfddO3oQAEYQUdX080dTYsNpOICEaH/W6gBBei
 3F43j1JSdLpsevNI=
X-Received: by 2002:a50:b586:: with SMTP id a6mr22514374ede.206.1612252472772; 
 Mon, 01 Feb 2021 23:54:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMDgOwhgf0U2vyJ7WZe6pp5fU387+o4SkRznSIn0NL/gt6uVzizddgAA7LD7GGtkgosqo7Lg==
X-Received: by 2002:a50:b586:: with SMTP id a6mr22514364ede.206.1612252472593; 
 Mon, 01 Feb 2021 23:54:32 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l13sm3178323eji.49.2021.02.01.23.54.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 23:54:31 -0800 (PST)
Subject: Re: [PATCH 1/3] i386: Add missing "vmx-ept-wb" feature name
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20210201225404.3941395-1-ehabkost@redhat.com>
 <20210201225404.3941395-2-ehabkost@redhat.com>
 <CABgObfaWW+ON4AA6cqygOkCMrruMbUqCR32R=uVhxnm4yUa6eQ@mail.gmail.com>
 <20210201230544.GJ3872207@habkost.net>
 <CABgObfYrOG1QBHskP4=Rwcp2uwOZKDCE9_RF1mmJWngD90zSjA@mail.gmail.com>
 <20210202001814.GK3872207@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a240f44f-b39a-7255-6329-cba1d89b3271@redhat.com>
Date: Tue, 2 Feb 2021 08:54:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210202001814.GK3872207@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Babu Moger <babu.moger@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/02/21 01:18, Eduardo Habkost wrote:
> On Tue, Feb 02, 2021 at 12:28:38AM +0100, Paolo Bonzini wrote:
>> Il mar 2 feb 2021, 00:05 Eduardo Habkost <ehabkost@redhat.com> ha scritto:
>>
>>> On Mon, Feb 01, 2021 at 11:59:48PM +0100, Paolo Bonzini wrote:
>>>> Il lun 1 feb 2021, 23:54 Eduardo Habkost <ehabkost@redhat.com> ha
>>> scritto:
>>>>
>>>>> Not having a feature name in feature_word_info breaks error
>>>>> reporting and query-cpu-model-expansion.  Add the missing feature
>>>>> name to feature_word_info[FEAT_VMX_EPT_VPID_CAPS].feat_names[14].
>>>>>
>>>> This is intentional, because there's no way that any hypervisor can run
>>> if
>>>> this feature is disabled.
>>>
>>> If leaving the feature without name enables some desirable
>>> behavior, that's by accident and not by design.  Which part of
>>> the existing behavior is intentional?
>>>
>>
>> Not being able to disable it.
> 
> We can make it a hard dependency of vmx, then.  We shouldn't
> leave it without a name, though.

The feature is already added to the MSRs unconditionally in 
kvm_msr_entry_add_vmx.  I think we can just remove it from the models 
instead.

Paolo


