Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098B14BDA89
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 16:26:02 +0100 (CET)
Received: from localhost ([::1]:50718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMAZc-0000bo-Jk
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 10:26:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1nMAXC-0007Or-Pv
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:23:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1nMAX9-0004nQ-2p
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:23:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645457005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L7D+Gz5qc5+200bg5kld6rn86i5+1h5B3y6lWwEfErY=;
 b=LYfJ4kokQsJ5G1UJQcmY/KbenFf+cfGa87McbD1iaa6M5eOJ9vqEjWm2mChWwBUHRJJwOy
 9ZfoIWprGfeRVCkozi6hXrLoFR/IYLW1Ri2UitIV5GgSpfInHkxCxCSIxU1uGHwWH6aiwG
 qmquJ4OsXqUmi1Ajqpe7pbdqA+39gxk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-GUeydm95MtCVVqQuMFJviA-1; Mon, 21 Feb 2022 10:23:20 -0500
X-MC-Unique: GUeydm95MtCVVqQuMFJviA-1
Received: by mail-ed1-f71.google.com with SMTP id
 l14-20020aa7cace000000b003f7f8e1cbbdso10295286edt.20
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 07:23:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=L7D+Gz5qc5+200bg5kld6rn86i5+1h5B3y6lWwEfErY=;
 b=jQyWqEi3PVJqBSO+y68vBsqYvcACVF9j8Epxk3l4yNHtLozABvyL8hGV/lB3CsUvqc
 bSnJ0vqpDjMGW0n6/3rTRdaPSPrO8ZvGDVDXq5V15/DNcDri8mvCE4fv/WItIytJ1g3k
 gWbHxBTyRws9Xe5e4c0GTxy9pyDjIWoJjMLaOugCGfbBjpeW37YeHROzkXZGCnQS9TlC
 +vzaNsBkneWCVIaH0kcJ2FvKW3ywc0zgHWMYbXebNvotSufyIRASWR94RHAhxAGUIAba
 N2N1y8GjDgS+OCpe6/oHvadIZHhijFmvRp15sXdKGrpS6QyMsFFAQhowp4F7wobilek3
 3XXw==
X-Gm-Message-State: AOAM530fIfDe9y1AjTbbbW0ENO/zqqe4I8i8YAzJBPDfKteEtsjTkjH7
 5f1ebIcDpx9SYdislPPnXRUqF8Yzj7SlzGGiiaFk9WBrdfCbNFh2mBr1Z+z28iVzVW7+WtVssfa
 SixPjFleCJ9I0n4k=
X-Received: by 2002:a50:f144:0:b0:40f:29ce:c68e with SMTP id
 z4-20020a50f144000000b0040f29cec68emr21882155edl.307.1645456999562; 
 Mon, 21 Feb 2022 07:23:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoTFuwv0JsZHH8RoTxcAfeLNi2DR2BVP//7ZNa4gKcLutUIrwPppkNV4bX+28chRF/hoFl9w==
X-Received: by 2002:a50:f144:0:b0:40f:29ce:c68e with SMTP id
 z4-20020a50f144000000b0040f29cec68emr21882131edl.307.1645456999388; 
 Mon, 21 Feb 2022 07:23:19 -0800 (PST)
Received: from [10.43.2.56] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id j8sm9256909edw.40.2022.02.21.07.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 07:23:18 -0800 (PST)
Message-ID: <03b5523b-ba5a-a729-40d7-61bd469f8e0f@redhat.com>
Date: Mon, 21 Feb 2022 16:23:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
To: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <f7dc638d-0de1-baa8-d883-fd8435ae13f2@redhat.com>
 <bf97384a-2244-c997-ba75-e3680d576401@redhat.com>
 <ad4e6ea2-df38-005a-5d60-375ec9be8c0e@redhat.com>
 <CAJSP0QVNjdr+9GNr+EG75tv4SaenV0TSk3RiuLG01iqHxhY7gQ@mail.gmail.com>
 <d2af5caf-5201-70aa-92cc-16790a8159d1@redhat.com>
 <1b38c5ea-d908-fe36-05e1-022d402cedbc@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <1b38c5ea-d908-fe36-05e1-022d402cedbc@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: "libvir-list@redhat.com" <libvir-list@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/22 12:27, Paolo Bonzini wrote:
> On 2/21/22 10:36, Michal Prívozník wrote:
>> Indeed. Libvirt's participating on its own since 2016, IIRC. Since we're
>> still in org acceptance phase we have some time to decide this,
>> actually. We can do the final decision after participating orgs are
>> announced. My gut feeling says that it's going to be more work on QEMU
>> side which would warrant it to be on the QEMU ideas page.
> 
> There are multiple projects that can be done on this topic, some
> QEMU-only, some Libvirt-only.  For now I would announce the project on
> the Libvirt side (and focus on those projects) since you are comentoring.
> 

Alright then. I've listed the project idea here:

https://gitlab.com/libvirt/libvirt/-/issues/276

Please let me know what do you think.

Michal


