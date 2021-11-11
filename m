Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE0A44D54B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 11:49:41 +0100 (CET)
Received: from localhost ([::1]:34158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml7eG-0005RR-QC
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 05:49:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ml7dL-0004mQ-Kl
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:48:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ml7dJ-0007MP-Qg
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:48:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636627721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Va/U12ptTo4GhjFWZgkvxzuDP92hU6Ix8DJc/4QbTEM=;
 b=VFY/KID5MMBi3gDAmsYWFk9i7UWaNOVX6zDCGko0tNtShJ3Em2L6/Vjki3W68CtqTeWC4f
 bf4/zhlwk2nfIH5GaOpUY4gmrA3+i6ZbYNF05wMQNyYjO9d99t2GiK9KP06FMMvXX2ET8X
 foNhOxL9/eay44QrYzZKSpckxa7Ho20=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-UqimRBM7PoWgSG561PqGng-1; Thu, 11 Nov 2021 05:48:38 -0500
X-MC-Unique: UqimRBM7PoWgSG561PqGng-1
Received: by mail-wm1-f69.google.com with SMTP id
 m1-20020a1ca301000000b003231d5b3c4cso4593065wme.5
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 02:48:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Va/U12ptTo4GhjFWZgkvxzuDP92hU6Ix8DJc/4QbTEM=;
 b=AzEtUmib+Xi6Wv3UWr15l0hxZOCHHqtSj3x+eqT5vvorBeQkx4/FsuqUKjYM1mzRiZ
 S1q0kaRt0wEkWpdU8fxDGQwRdcnwqT1ANQwCk2HNKqqc6hC5mzbTNBvbM0hx98CAvi5o
 Ciu02dCmFWpizQZpkpah+oOiavi717x6o5Qhkc8BY4yJI54UUlPeuFHF7Xj+Ng/b/imj
 UfciwA3w1DATPj5yRkl9c6YwR+l4bBeOtWWHjTFolI3NXcDiURtoGCam35yPg7mcnuFn
 NKFe1KOPsGIwkm+hnA2rrMDnZpbci+7M8u8LN+Nhelm8O7BWwQSYmvgwLesHLJg0mOpV
 XG3g==
X-Gm-Message-State: AOAM530vqT0hXM+lq/5geGdCDI0fQZtRXVTtkcC9jKZZtFyS4kziA356
 7fJ4GjaiTVnriZMiKVYyRqY3I+lTh4tQV5Pvr6QdylIdsILpUe4kgghVLo+bLWnraJ7ISMKSMTA
 UiKXkvVGe3VrGODs=
X-Received: by 2002:a05:600c:224a:: with SMTP id
 a10mr7238634wmm.154.1636627716762; 
 Thu, 11 Nov 2021 02:48:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzss60yZEpM2SYP2jbqpBeFs24oeHVKmvFvfOdEJINwG6/ywPvCWiPheu7BsVCr6b0Kbi3RIA==
X-Received: by 2002:a05:600c:224a:: with SMTP id
 a10mr7238625wmm.154.1636627716634; 
 Thu, 11 Nov 2021 02:48:36 -0800 (PST)
Received: from [192.168.3.132] (p4ff23ee8.dip0.t-ipconnect.de. [79.242.62.232])
 by smtp.gmail.com with ESMTPSA id c6sm10609650wmq.46.2021.11.11.02.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 02:48:36 -0800 (PST)
Message-ID: <e8038316-d698-043e-a61f-96915d91b4ba@redhat.com>
Date: Thu, 11 Nov 2021 11:48:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 0/3] Some watchpoint-related patches
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <163662450348.125458.5494710452733592356.stgit@pasha-ThinkPad-X280>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <163662450348.125458.5494710452733592356.stgit@pasha-ThinkPad-X280>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, alex.bennee@linaro.org,
 peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.11.21 10:55, Pavel Dovgalyuk wrote:
> The series includes several watchpoint-related patches.
> 
> v2 changes:
>  - added patch to fix races with interrupts
>  - added patch to process watchpoints-on-stack
>  - removed upstreamed patches

Out of interest, do we have any reproducer / tests for this?


-- 
Thanks,

David / dhildenb


