Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADD34B675A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:18:52 +0100 (CET)
Received: from localhost ([::1]:46212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJtz1-0004Nq-08
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:18:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nJtx9-0001R4-Tx
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:16:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nJtx5-0005nO-Qx
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:16:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644916610;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=venWY+SDalVW4Zgf8HNc7ksd8lvrIn1qbTRT0F5mb4M=;
 b=CPPqquSM33lsfCxZS72yRMyB07oB0IbuxyzNyKK5ZUu6i+2fzLXjO7P/C+HUqlpPwV1jWm
 4A53c/JrbdODM556hyF502XO1Bo0Qes5dttF9XBkrustsNnYF7xCj0thaea5c1Q556dBMT
 fZFPVJ0lDJiUpTKMKo7laXKSSNMl62c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-rGh6GL4RM2GY6L3sQpY3Hg-1; Tue, 15 Feb 2022 04:16:44 -0500
X-MC-Unique: rGh6GL4RM2GY6L3sQpY3Hg-1
Received: by mail-wr1-f70.google.com with SMTP id
 q8-20020adfb188000000b001e33a8cdbf4so8058904wra.16
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=venWY+SDalVW4Zgf8HNc7ksd8lvrIn1qbTRT0F5mb4M=;
 b=4qFJjtOqj3HiTASRkmCn0ywKggGhvI9q/Hm7Po1/1UXyPQYeZShaW0ohp7XlNzWY9k
 dkEpOHadVIf0LcV3fyISd9YiwvsuH9aXaBpRyCbZ4FYThQuNVvHCs754MD4wnaJ2dEIU
 1z6gREvqYqCk8mSMEc1V9IRbB0l+Efw6BikPU5YwElk5SV7YxaKtc/gPJBuhR2fzzft6
 1qOosK/impRPAezKviZ/BOlWna7YFnggbOLfk/8ogtr4/RHjnY1zhePbTy9+4Eh4tksU
 PmW2lfRBMOGbgOWGEVtrDfGlTvGCdJygRbm4atCCsZgeilIsZrt0uV3Kv4gjnQ/lS5EI
 /57w==
X-Gm-Message-State: AOAM531xiq43mBjjabv2Yp8USeW70rRg6yRIPH6cH234zh7nJMHN+aUw
 Z32bmM+KJDgsbatuWotIJsmrKXpCBrSYX02FFkKMPIc3MADy76r/BImOp+CKZXapUJNB+OU+T9Z
 e1rTpq9WAIlb9ZEU=
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr2231046wmg.35.1644916603007; 
 Tue, 15 Feb 2022 01:16:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBLiyiVGswdaSDQic99yn5BfZJVKYntmGu336TTNdn8M6ArwKP91jhJZ2gwdK+SJsW0txvXg==
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr2231030wmg.35.1644916602799; 
 Tue, 15 Feb 2022 01:16:42 -0800 (PST)
Received: from ?IPv6:2a01:e0a:92b:6460:3f38:a137:6502:95a4?
 ([2a01:e0a:92b:6460:3f38:a137:6502:95a4])
 by smtp.gmail.com with ESMTPSA id l15sm14291193wmi.29.2022.02.15.01.16.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 01:16:42 -0800 (PST)
Subject: Re: [PATCH v3 0/4] virtio-iommu: Support VIRTIO_IOMMU_F_BYPASS_CONFIG
To: Cornelia Huck <cohuck@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20220214124356.872985-1-jean-philippe@linaro.org>
 <87o839s67g.fsf@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <ef945ca8-ee6b-8b17-2fe2-add32dfb9dd4@redhat.com>
Date: Tue, 15 Feb 2022 10:16:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87o839s67g.fsf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: lvivier@redhat.com, thuth@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pasic@linux.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Connie,

On 2/14/22 6:34 PM, Cornelia Huck wrote:
> On Mon, Feb 14 2022, Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:
>
>> Replace the VIRTIO_IOMMU_F_BYPASS feature with
>> VIRTIO_IOMMU_F_BYPASS_CONFIG, which enables a config space bit to switch
>> global bypass on and off.
>>
>> Add a boot-bypass option, which defaults to 'on' to be in line with
>> other vIOMMUs and to allow running firmware/bootloader that are unaware
>> of the IOMMU. x86 doesn't need a workaround to boot with virtio-iommu
>> anymore.
>>
>> Since v2 [1]:
>> * Added the new bypass bits to the migration stream.
>>   As discussed on the v2 thread, we assume that cross-version
>>   compatibility is not required for live migration at the moment, so we
>>   only increase the version number. Patch 2 says: "We add the bypass
>>   field to the migration stream without introducing subsections, based
>>   on the assumption that this virtio-iommu device isn't being used in
>>   production enough to require cross-version migration at the moment
>>   (all previous version required workarounds since they didn't support
>>   ACPI and boot-bypass)."
>>
>> [1] https://lore.kernel.org/qemu-devel/20220127142940.671333-1-jean-philippe@linaro.org/
> One thing that we could do to avoid surprises in the unlikely case that
> somebody has a virtio-iommu device and wants to migrate to an older
> machine version is to add a migration blocker for the virtio-iommu
> device for all compat machines for versions 6.2 or older (i.e. only 7.0
> or newer machine types can have a migratable virtio-iommu device
> starting with QEMU 7.0.) Not too complicated to implement, but I'm not
> sure whether we'd add too much code to prevent something very unlikely
> to happen anyway. I would not insist on it :)
As nobody has shout and we are not aware of anybody using the device in
production mode yet due to the missing boot bypass feature this series
brings, I would be personally in favour of leaving things as is. Now, up
to Jean if he wants to go and implement your suggestion.

Thanks

Eric

>
> Otherwise, I didn't spot problems in this series.
>


