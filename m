Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E87E74649C3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 09:34:54 +0100 (CET)
Received: from localhost ([::1]:52820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msL4m-0006HF-MC
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 03:34:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1msKu4-0001Yq-Ip
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 03:23:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1msKtz-0000Ws-1P
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 03:23:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638347015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VMfZZx79a2i8kDVouCCr+Hj4ayDlaUA/2VPzUGacuVA=;
 b=AeGGwO9pUf4M3WFFtn8BV8vuHtahX/LbjB4Rd89rsd8gDlpTsCWe0+yTEkVogHwdo/Tfi2
 OHBLVeQKESIcbnwGU7V1l6XNwoGjv1GENMLHlz9j7cBbXK4TB2uQg/xsedOWPkMnEfl5oX
 +WUVv2nIk3kk9Jpsmce4NtNL5yciAjY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-291-iNmgZ6NfNdaAwUfYXb3gxQ-1; Wed, 01 Dec 2021 03:23:34 -0500
X-MC-Unique: iNmgZ6NfNdaAwUfYXb3gxQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so15304964wmc.7
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 00:23:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VMfZZx79a2i8kDVouCCr+Hj4ayDlaUA/2VPzUGacuVA=;
 b=JuI09OLTNN65ehndV1yHc02YDtX7oBodYC69xPlXROEP/P7l+Czj6Zl2ucQgyXk5mw
 RcivzZvQ7lZG1cj25Ge+pdDR61LcpWW8BHQ/7lQGipy3QIuUbr5ZD5Aj6li6Blj3ttnN
 w4WMc5occKxBc44WRSYk1hYMz+DQULjZYOlKWF5wBvK/Xc5kSLN62FzBOomS5GEtiVez
 OD4w2/lHWwdWz10JYp08aV7oqu7V7VvwoE4a0jkbYHBSgqaew8SgBrBDbHF6B6chCTo4
 VZWQSGkM1OxJDt2x7CqO21/i8o8SUE/VqWHeO9nJrYgF8B9F1J10lRcBa9oh4EbRx6p8
 F/Jg==
X-Gm-Message-State: AOAM530MYYZhzYUUfIxCTBuOCp621ykkslsnGnTrEoVkDioXeOBANYOH
 nRYpO1By20TG8aNz7JP/Ob9VS1X9fmqsiIr/C0cjQcRcDSwO7JKchfWR/0LespETIvKz76Jk6eh
 oNrn06kvrbMBtAVI=
X-Received: by 2002:a5d:668d:: with SMTP id l13mr4943152wru.526.1638347013605; 
 Wed, 01 Dec 2021 00:23:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyokcrPsXr948V9zBcuzwiFjBkkpXDEOJUy0lsez0BL3jMaMfHQR1OFHg8htJuY1rmd7m0alg==
X-Received: by 2002:a5d:668d:: with SMTP id l13mr4943132wru.526.1638347013351; 
 Wed, 01 Dec 2021 00:23:33 -0800 (PST)
Received: from [192.168.3.132] (p5b0c65f1.dip0.t-ipconnect.de. [91.12.101.241])
 by smtp.gmail.com with ESMTPSA id m14sm25185000wrp.28.2021.12.01.00.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 00:23:32 -0800 (PST)
Message-ID: <87137f36-ad35-a6e9-4e4c-cafd114ff592@redhat.com>
Date: Wed, 1 Dec 2021 09:23:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 0/3] virtio-mem: Support
 VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20211130092838.24224-1-david@redhat.com>
 <20211130184539-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211130184539-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Gavin Shan <gshan@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.12.21 00:45, Michael S. Tsirkin wrote:
> On Tue, Nov 30, 2021 at 10:28:35AM +0100, David Hildenbrand wrote:
>> Support VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE in QEMU, which indicates to
>> a guest that we don't support reading unplugged memory. We indicate
>> the feature based on a new "unplugged-inaccessible" property available
>> for x86 targets only (the only ones with legacy guests). Guests that don't
>> support VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE will fail initialization if
>> indicated/required by the hypervisor.
>>
>> For example, Linux guests starting with v5.16 will support
>> VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE.
>>
>> For future targets that don't have legacy guests (especially arm64), we'll
>> always indicate VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE.
>>
>> More details can be found in the description of patch #2.
>>
>> "
>> For existing compat machines, the property will default to "off", to
>> not change the behavior but eventually warn about a problematic setup.
>> Short-term, we'll set the property default to "auto" for new QEMU machines.
>> Mid-term, we'll set the property default to "on" for new QEMU machines.
>> Long-term, we'll deprecate the parameter and disallow legacy guests
>> completely.
>> "
>>
>> TODO: Once 6.2 was release, adjust patch #3. Replace patch #1 by a proper
>>       Linux header sync.
> 
> 
> oh so it's not for 6.2. got it.

It would be awesome to get it into 6.2 (!), but I assume that ship has
sailed, right?


-- 
Thanks,

David / dhildenb


