Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E69C4625906
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 12:03:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otRnK-0001tg-QL; Fri, 11 Nov 2022 06:01:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1otRnG-0001tO-Rg
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:01:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1otRnE-0003r7-H5
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:01:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668164511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oVa7NeFgku+0ebB26kWiVeKN6kB2ALJLwFhmbRN7ulE=;
 b=LRj7U28VOVf0kOAgpWWO6wu/5Rnq14qB+/aWNjRLrEWAfaiHv10mBv3NXFPEYK0wOJAyJ5
 jCRqtzuLCytN5/FXSL2YbqLhP/9FwK6TWBo0UY5adwUfSH+f7AwHoGqYHnbRlXort+SUnq
 iR/B7xFunL4Ca1mRyw0tNXWZDPnbW+0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-662-MJ5ZCvFvOtq8Hf7siXVJ5w-1; Fri, 11 Nov 2022 06:01:50 -0500
X-MC-Unique: MJ5ZCvFvOtq8Hf7siXVJ5w-1
Received: by mail-wm1-f72.google.com with SMTP id
 f26-20020a7bcc1a000000b003c03db14864so1666061wmh.6
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 03:01:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oVa7NeFgku+0ebB26kWiVeKN6kB2ALJLwFhmbRN7ulE=;
 b=0vSDL7eo3rBqEASOEw3EUEW7iRvCVh/QL0EucevCmMg/Ca7kBCt2eq4IOn2Goqe1vp
 k6KNYCNybxj6oHZR2HzDioVfj1dFaxFGBN2O5Lu4BlR/niIDsrpY06zwHsmSlLtv6E1D
 x0iXpwoKgsHTxK/yMu9ddxuS8pMTuG5f30uPuwhP6nZJQw8T+Cz0vAUWgBlbgtNtYNqv
 p6siJP9Oiu4TgonhwzxzHvgQ1epj6YyvVKbBT7gDlc7dNqsSipSQSmsjyEyV0XE17kv9
 VWfvv4s/+f7LDrrrQc+htR2u/CDnZFQy2yov1vXorftGavybn6kfkUYzdUATE1EW1phG
 R7GA==
X-Gm-Message-State: ANoB5plVEhBeZNcOrXC+eawaXYkOdv+V1xymRpwMv7P/+KFdfiTZn94h
 NfIGlsLspb2wi8X0dfUfOnqti2ubp1RY4hu2kfI2PkRjk5mzSg2RvQkZMYq1ZBt7YvK85Q2v6fN
 ucK3oX1sQVV9X/os=
X-Received: by 2002:a05:600c:5006:b0:3c6:bd12:ac68 with SMTP id
 n6-20020a05600c500600b003c6bd12ac68mr859423wmr.123.1668164509047; 
 Fri, 11 Nov 2022 03:01:49 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4NQo2dEiZmGVsfDblk1LpsfPPMKU8EzTWYL/jFDLoSR3bGNUCdbx3m3OPr53bQdXEBUWALnQ==
X-Received: by 2002:a05:600c:5006:b0:3c6:bd12:ac68 with SMTP id
 n6-20020a05600c500600b003c6bd12ac68mr859399wmr.123.1668164508791; 
 Fri, 11 Nov 2022 03:01:48 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 g9-20020a05600c4ec900b003cfd10a33afsm1596666wmq.11.2022.11.11.03.01.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 03:01:48 -0800 (PST)
Message-ID: <379f2f0e-1ee3-79d8-5b42-418ed3549020@redhat.com>
Date: Fri, 11 Nov 2022 12:01:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 3/3] kvm: Atomic memslot updates
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>
References: <20221110164807.1306076-1-eesposit@redhat.com>
 <20221110164807.1306076-4-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221110164807.1306076-4-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 11/10/22 17:48, Emanuele Giuseppe Esposito wrote:
> 
> +    /* Remove all memslots before adding the new ones. */
> +    QSIMPLEQ_FOREACH_SAFE(u1, &kml->transaction_del, next, u2) {
> +        kvm_set_phys_mem(kml, u1->section, false);
> +        memory_region_unref(u1->section->mr);
> +
> +        QSIMPLEQ_REMOVE(&kml->transaction_del, u1, KVMMemoryUpdate, next);
> +        memory_region_section_free_copy(u1->section);
> +        g_free(u1);
> +    }
> +    QSIMPLEQ_FOREACH_SAFE(u1, &kml->transaction_add, next, u2) {
> +        memory_region_ref(u1->section->mr);
> +        kvm_set_phys_mem(kml, u1->section, true);
> +
> +        QSIMPLEQ_REMOVE(&kml->transaction_add, u1, KVMMemoryUpdate, next);
> +        memory_region_section_free_copy(u1->section);
> +        g_free(u1);
> +    }

I'm not a huge fan of new_copy/free_copy, and I don't think it's needed 
here.  The FlatView is certainly alive between begin and commit (see 
address_space_set_flatview()), and the MemoryRegion is kept alive by the 
FlatView.  In other words, unlike other uses of the functions, here the 
lifetime is bound by kvm_region_commit, and that means you can just copy 
by value.  You can just copy it into KVMMemoryUpdate, i.e.

     typedef struct KVMMemoryUpdate {
         QSIMPLEQ_ENTRY(KVMMemoryUpdate) next;
         MemoryRegionSection section;
     } KVMMemoryUpdate;

Also, you can write the loop as

     while (!QSIMPLEQ_EMPTY(&kvm->transaction_add) {
         u = QSIMPLEQ_FIRST(&kvm->transaction_add);
         QSIMPLEQ_REMOVE_HEAD(&kml->transaction_add, next);
         ...
         g_free(u);
     }

This clarifies the invariant that the QSIMPLEQs become empty at the end 
of the loop.  If it were QTAILQ it would be more a matter of personal 
taste, but QSIMPLEQ_REMOVE is technically not constant-time and that 
also tilts in favor of QSIMPLEQ_REMOVE_HEAD.

In fact I think we should remove QSIMPLEQ_REMOVE and QSLIST_REMOVE, 
changing all users that need it to QTAILQ and QLIST respectively... 
added to https://wiki.qemu.org/Contribute/BiteSizedTasks#API_conversion.

Paolo


