Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1E96690E8
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 09:30:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGFQ4-0001xH-4A; Fri, 13 Jan 2023 03:28:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pGFQ1-0001wy-5A
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:28:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pGFPz-0001XP-6j
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:28:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673598486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=crwur8v4vMN2112VBylQfnHHCntyE5oDmkNdPl9Rxls=;
 b=cbBd52IWi348Ji7Javh9HbKe0ZPzzHrNUlZeQvPCOPhmQj6NUTuSbScS8fSYBkK2kFWnKZ
 w2G7bmcuN7aF5KVjp/79vzCYt6rOxEQL0kbvn6941p+KOTLlfDVuuZGRnzHMQc18ihFVnj
 0y+ev55PhQX9scqMjIHuZYlAhFJbo/Y=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-231-yHlZsiTxPxibvIUHYPy8sg-1; Fri, 13 Jan 2023 03:27:57 -0500
X-MC-Unique: yHlZsiTxPxibvIUHYPy8sg-1
Received: by mail-ej1-f71.google.com with SMTP id
 qw20-20020a1709066a1400b007c1727f7c55so14398640ejc.2
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 00:27:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=crwur8v4vMN2112VBylQfnHHCntyE5oDmkNdPl9Rxls=;
 b=fciqwjRRfazdh6e3TWi677F3LVZoHKVzrToNI99yQjtNH1VdjvspJKrq7ZcQ/+vYMQ
 4DDja5xa2d6m90z1rK80Fs/7Gg/XnvwgxX2TrUS0PsQ7xXxLbJRb5swLaTLiUibNrd6D
 U3G1VFSwkwMZmTMIINHEQ0xO0sS9hKCs0ASxcGznbR+62eaqw2CpbgPIVHLlVN/zFwvU
 BgqE5e8KAEL65nKOqOWNg8gSubJV6KzQodmpeCS+lzhK0BRW9G20V2ltCeeZDQ0n2GRN
 tb2qvfZWxzGma/b8B5DresC8OLnBLTCCtthZPDC4j2rFI5OjPY5P57+efQhhFAIP1rEV
 kQKg==
X-Gm-Message-State: AFqh2krKp3Gb3bXBMtJ6zFsGq34KYL2haB1MQxuQfHifbEhKdIZdFEED
 xx0ayH48i9sCZh/LpkoMB9HEDnz6WYE+fqagnOz4R4NBM6aSThRLti9fz/yY5lvfA+AMhf9oLHM
 n0tgb6OYa6dOJR1s=
X-Received: by 2002:a17:906:a047:b0:7a9:fc17:eb4c with SMTP id
 bg7-20020a170906a04700b007a9fc17eb4cmr63748295ejb.40.1673598475994; 
 Fri, 13 Jan 2023 00:27:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu//RppKj94uB1BvtX9FMS881gC0EAVopLDk7rhZfaokuXaCRo7fnrFC6PER8xCD1hs6BJQmQ==
X-Received: by 2002:a17:906:a047:b0:7a9:fc17:eb4c with SMTP id
 bg7-20020a170906a04700b007a9fc17eb4cmr63748281ejb.40.1673598475723; 
 Fri, 13 Jan 2023 00:27:55 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 g11-20020a170906538b00b007c16e083b01sm8258747ejo.9.2023.01.13.00.27.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:27:55 -0800 (PST)
Message-ID: <98a2dc4e-5690-cc65-3953-d80183869d3a@redhat.com>
Date: Fri, 13 Jan 2023 09:27:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] remove unnecessary extern "C" blocks
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20230110084946.299480-1-pbonzini@redhat.com>
 <CAFEAcA9VCBqarUPzRrTx5ZXXFV8bdijge6zi=YUSrcirtv6bWA@mail.gmail.com>
 <08ae1223-2721-b10c-ff2b-91a62bd83070@redhat.com>
 <CAFEAcA8KRTP58UoGEGFvSSBxQ66EmnXFsBWgq0S2a==CGFwhjw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA8KRTP58UoGEGFvSSBxQ66EmnXFsBWgq0S2a==CGFwhjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/12/23 12:05, Peter Maydell wrote:
> On Wed, 11 Jan 2023 at 09:14, Paolo Bonzini<pbonzini@redhat.com>  wrote:
>> On 1/10/23 11:53, Peter Maydell wrote:
>>> On Tue, 10 Jan 2023 at 09:33, Paolo Bonzini<pbonzini@redhat.com>  wrote:
>>>> A handful of header files in QEMU are wrapped with extern "C" blocks.
>>>> These are not necessary: there are C++ source files anymore in QEMU,
>>>> and even where there were some, they did not include most of these
>>>> files anyway.
>>> Any reason not to also take out the extern "C" block in osdep.h
>>> and the uses of QEMU_EXTERN_C ?
>> qemu/osdep.h is still included by the C++ sources in qga/vss-win32.
> If anything C++ still includes osdep.h then you can't remove
> the handling of this from os-win32.h and os-posix.h, because
> those files are included from osdep.h.

Oh, I was confused by them being in sysemu/.  I'll revert those two.

Paolo


