Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D09E697A04
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 11:37:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSF95-0003fd-4n; Wed, 15 Feb 2023 05:36:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pSF91-0003eR-4j
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:36:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pSF8y-0004tS-TM
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:36:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676457368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RD2vdtD2hCDoDpOR7tgSDmxAVUUdTeXI5S6eB2JsfYE=;
 b=AmQiO/QsItbjozenKNqAIR6EXZyfgpRrV15Z77q9gQvWNjTg/oGb/CZ19niWipqati2uDs
 roKD8ABtnc+TxbGCdN7inkw34Wr8gRgHgWmmZUnBq/weysAHajSY1m4NVG7UHLUN79eeXD
 iVZmUVJ1SyaN+eVYtynuA8H2AOT6Q88=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-206-nRlK3a8QPBC3wMJOiR5ozg-1; Wed, 15 Feb 2023 05:36:06 -0500
X-MC-Unique: nRlK3a8QPBC3wMJOiR5ozg-1
Received: by mail-qk1-f199.google.com with SMTP id
 u11-20020a05620a0c4b00b0073b328e7d17so5606984qki.9
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 02:36:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RD2vdtD2hCDoDpOR7tgSDmxAVUUdTeXI5S6eB2JsfYE=;
 b=draY/zUlDIfWMpZ0FvBajmW0rIJwmT/IZ6m/mpTw3b7y0zCy6exXHepZ8NxJSNsex5
 BhB37INZ0L8ARC5gFDv4+epO+NyzhGNcqNJNH7kNX8l4P08zohDZfPTehqiMbWxA8C5a
 VOY+RMv1NiHorxa7A3Fffmbb80me7YsW4tD72lXVLHaZlTnxhnE/mU4SUOqRe+p/9Zdm
 Gm+JF1fczkiRBIGperxMBKF6QOyrkhV/biR/FYdkQCGaw8Ft5rjeSnIjps5p3O/e/ZWI
 iNakga7sxu4kWTI8jIl6L7qglrbQGZc5aboZFeDfALYL1dFWS/DK6i+vVNKq2Ukw/Fkr
 7PHQ==
X-Gm-Message-State: AO0yUKWjvPn/3dTDtvtGhBooZNVzizuiUz9r/oc4aZ391syRzJMXMhXq
 JTQRYtTt7eBMFt/2y/NKgmIjCHnVl/aR7/A3GvOy9Rx11dt607dONttzB5asJvafGYQ8BuewBTS
 IKU8bGaNgDu9i0Cw=
X-Received: by 2002:a05:622a:1c9:b0:3b9:a4ac:9109 with SMTP id
 t9-20020a05622a01c900b003b9a4ac9109mr2752660qtw.64.1676457365696; 
 Wed, 15 Feb 2023 02:36:05 -0800 (PST)
X-Google-Smtp-Source: AK7set8YtHxNeDwl9P8bOMf2Mkat55tTiA0Vw42KGVKRuuQMnOPNV5l9ILnxzk95iBbUd8um7615aQ==
X-Received: by 2002:a05:622a:1c9:b0:3b9:a4ac:9109 with SMTP id
 t9-20020a05622a01c900b003b9a4ac9109mr2752638qtw.64.1676457365481; 
 Wed, 15 Feb 2023 02:36:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 k9-20020ac84789000000b003b2d890752dsm12743026qtq.88.2023.02.15.02.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 02:36:04 -0800 (PST)
Message-ID: <f24a826e-2f90-d23a-c3f3-5985e90814f2@redhat.com>
Date: Wed, 15 Feb 2023 11:36:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v5 2/3] arm/kvm: add support for MTE
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230203134433.31513-1-cohuck@redhat.com>
 <20230203134433.31513-3-cohuck@redhat.com>
 <ecddd3a1-f4e4-4cc8-3294-8c94aca28ed0@redhat.com>
 <14188fd3-6e97-3e00-7d54-7f76e53eeb22@linaro.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <14188fd3-6e97-3e00-7d54-7f76e53eeb22@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Richard,
On 2/6/23 19:27, Richard Henderson wrote:
> On 2/6/23 03:32, Eric Auger wrote:
>>> +void kvm_arm_enable_mte(Error **errp)
>>> +{
>>> +    static bool tried_to_enable = false;
>>> +    Error *mte_migration_blocker = NULL;
>> can't you make the mte_migration_blocker static instead?
>>
>>> +    int ret;
>>> +
>>> +    if (tried_to_enable) {
>>> +        /*
>>> +         * MTE on KVM is enabled on a per-VM basis (and retrying
>>> doesn't make
>>> +         * sense), and we only want a single migration blocker as well.
>>> +         */
>>> +        return;
>>> +    }
>>> +    tried_to_enable = true;
>>> +
>>> +    if ((ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_MTE, 0))) {
>>> +        error_setg_errno(errp, -ret, "Failed to enable
>>> KVM_CAP_ARM_MTE");
>>> +        return;
>>> +    }
>>> +
>>> +    /* TODO: add proper migration support with MTE enabled */
>>> +    error_setg(&mte_migration_blocker,
>>> +               "Live migration disabled due to MTE enabled");
> 
> Making the blocker static wouldn't stop multiple errors from
> kvm_vm_enable_cap.
Sorry I don't get what you mean. instead of checking tried_to_enable why
can't we check !mte_migration_blocker?

Eric
> 
> 
> r~
> 


