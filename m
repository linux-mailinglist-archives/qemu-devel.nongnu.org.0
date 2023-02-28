Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC696A5DFC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 18:13:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX3Wf-00031w-5b; Tue, 28 Feb 2023 12:12:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pX3Wc-0002w8-87
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 12:12:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pX3Wa-0004HD-8W
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 12:12:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677604343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HxnZpZe1s57Ij/1uwiQ4l+CFpFlSO3GA1PTiZpgCbgc=;
 b=Jpz+XMGi3fehM4s7PYeuxg3QIMc0CpSjrCo3aH8YPSKEsHvH8aKEePLJ5bpei8EEmK4DjM
 N5JYTSkoZvwnnR7kiWJfWlyMlCr6U+uhOguIBMmcEW9SkHUecU6QCwegFTMhLvAaNs+bfx
 NnNrTk1cfqMG2UesSMbvnq2QCzvRuGc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-116-zV0zDkh-P-KljTOdt4nvOQ-1; Tue, 28 Feb 2023 12:12:21 -0500
X-MC-Unique: zV0zDkh-P-KljTOdt4nvOQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 u5-20020a5d6da5000000b002cd82373455so664085wrs.9
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 09:12:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HxnZpZe1s57Ij/1uwiQ4l+CFpFlSO3GA1PTiZpgCbgc=;
 b=c4G8okxkHuRhSGMS6yFdixSH0q4i/l76uPR4HRbvdo/fpij/nRy5+rJyHfIvDQXZeh
 wh1WWPuQ4JeyeG6vx2niPyem3BkA5fmYH/XhyheEfQ4vpyJGSq1ujTjbDbmkSssmAp8A
 buRlvqOWFaLocSRJrQ0mPcY4GMb466KuynkCpXWdgRDaUP4tCFTwlF2wIMASPmxpmQcX
 +H5XzONn6H5yMPzyMrcFJXxMmYjCFD3m1riVsNlQi1Et59CUPviRuCkZPv0rP/BqvAyU
 a+7LyI2TwaIfrM7ZszucScMQ564HOz3lvI7hdR5ybq/Y+59CT0AYAimqubBdtI4eUDCv
 fDpQ==
X-Gm-Message-State: AO0yUKXWBuyO6771eTOdneRPBneOP3OAZvfnY9ccIIzmwD+mwKx1o8BA
 DAg8QKs4GNnS+W0GfiohhYM2odrfZoSUAn8REe+Og6NcB22b2ZInp7DTtt0DSmGmXpZO8tRqh/i
 t4DWPy0rSw4MPHXo=
X-Received: by 2002:a05:600c:a4c:b0:3eb:2e27:2cf0 with SMTP id
 c12-20020a05600c0a4c00b003eb2e272cf0mr9766440wmq.0.1677604340277; 
 Tue, 28 Feb 2023 09:12:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+3FeInWEISQMelc+p2bHc1w37YTy25m6hNZAA7cmsAZsoxhft1HuXF0OoAQHDA2I7oyG6gDQ==
X-Received: by 2002:a05:600c:a4c:b0:3eb:2e27:2cf0 with SMTP id
 c12-20020a05600c0a4c00b003eb2e272cf0mr9766420wmq.0.1677604339912; 
 Tue, 28 Feb 2023 09:12:19 -0800 (PST)
Received: from ?IPV6:2003:cb:c706:b800:3757:baed:f95e:20ac?
 (p200300cbc706b8003757baedf95e20ac.dip0.t-ipconnect.de.
 [2003:cb:c706:b800:3757:baed:f95e:20ac])
 by smtp.gmail.com with ESMTPSA id
 bh22-20020a05600c3d1600b003e01493b136sm16577578wmb.43.2023.02.28.09.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 09:12:19 -0800 (PST)
Message-ID: <3a25062c-ce51-b71f-4639-a062aa96ddfc@redhat.com>
Date: Tue, 28 Feb 2023 18:12:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>,
 "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S . Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
References: <cover.1677274611.git.maciej.szmigiero@oracle.com>
 <4c4fe768b5457f8e6c17dcea7656cbe017c9a4df.1677274611.git.maciej.szmigiero@oracle.com>
 <20230228171828.5f610ea4@imammedo.users.ipa.redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH][RESEND v3 3/3] Add a Hyper-V Dynamic Memory Protocol
 driver (hv-balloon)
In-Reply-To: <20230228171828.5f610ea4@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 28.02.23 17:18, Igor Mammedov wrote:
> On Fri, 24 Feb 2023 22:41:16 +0100
> "Maciej S. Szmigiero" <mail@maciej.szmigiero.name> wrote:
> 
>> From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
>>
>> This driver is like virtio-balloon on steroids: it allows both changing the
>> guest memory allocation via ballooning and inserting extra RAM into it by
>> adding required memory backends and providing them to the driver.
> 
> 
> this sounds pretty much like what virtio-mem does, modulo used protocol.
> Would it be too crazy ask to reuse virtio-mem by teaching it new protocol
> and avoid adding new device with all mgmt hurdles that virtio-mem has
> already solved?

There are some main differences between both approaches that make a 1:1 
reuse impossible. As one example, the hv-balloon can operate (inflate) 
on the whole VM memory, which is very different to the virtio-mem model. 
As another example, the hv-balloon does not support variable (large) 
block sizes, and must be able to operate in page granularity IIRC. This 
not only restricts which memory backends we can use, it also means that 
vfio support is rather problematic (just like with virtio-balloon).

So there is more to that than a simple protocol difference and I don't 
think we can simply implement a proxy devices.

But I do think that we would be able to reuse some of the 
ideas/infrastructure virtio-mem implemented: for example, using a single 
large sparse memory region.

-- 
Thanks,

David / dhildenb


