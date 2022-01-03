Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B6D482FE3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 11:22:18 +0100 (CET)
Received: from localhost ([::1]:41820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4KTo-0005JE-9O
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 05:22:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n4KSO-0004dG-Ui
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 05:20:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n4KSK-0002O5-Fv
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 05:20:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641205241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yskaMRjfWSwdypNGAUGkdtAHShis0JhtTsJiouqQzwA=;
 b=C/4Uc3WgGFrgucIcc0GjZ0X9Qs8Vi1gyVq78IzvSdYrhLJk3XnlkZ9g5/mjFIDCNIZX2Lt
 1O+7BG80PcmZ+12b7SdMLpoUI7CCb9QwfOmu1G2RrF7kcJBzZl8eCR326uGwgTh8yg4Txq
 EJJLeLmPlkmBhj4lJvmRpmLqSSJN6k4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-UwYjpoE4Ozuml_c7XU5LKA-1; Mon, 03 Jan 2022 05:20:40 -0500
X-MC-Unique: UwYjpoE4Ozuml_c7XU5LKA-1
Received: by mail-wr1-f72.google.com with SMTP id
 h7-20020adfaa87000000b001885269a937so10176890wrc.17
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 02:20:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=yskaMRjfWSwdypNGAUGkdtAHShis0JhtTsJiouqQzwA=;
 b=dFqh8JXbCW02I9Dl4XgGiGlTinvVZzMnEwwF+2rmrq2XufzXINM3WG22buLWaTshlB
 QpsRaIcxjWYWTl9KM3pWK0ZG4dFUYTFAqZmTbvHkv1lJHLBnR/kNDTkh2PJBX3ZPojgm
 TPnoW7V5kyMJbX/5Rh1CgUyk2i6+VUfaGbRMtHHAtNHn1M57PFrwC8knVLv31/+rC0tX
 /YrMSH/3GeW2MiR1q3D6yfUuXM5QH+gadyO9yn/XB2DWklprRayBMTA/Av2RjK5f2Jwc
 G5JP4cPBB6Db81O7zkC8HmcP/CWqc9nuQzVRVl3rAjKXtjPYvVfjTMBM9SM81mIFCkdm
 HQlA==
X-Gm-Message-State: AOAM530txRLcPvT7mAVC4mxjTnHT/34hz7tUWJLVL81a5lUnZqtGgMO5
 lnY8sijUapInJngpeAhraHPmK9LHl0RX3A5pXKa+r/f43aczVQi51rGwSBElxBApKkrkhStasi5
 1KIYWaoUBOyDxx5Y=
X-Received: by 2002:a5d:4804:: with SMTP id l4mr38447123wrq.629.1641205239343; 
 Mon, 03 Jan 2022 02:20:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIYWeI2ZnuT2Wto5yWOwRvXdHe2smP6Vi0OP7vbNkTOcEdpP/6wkTuKD6mxA2YGebFhmdSzA==
X-Received: by 2002:a5d:4804:: with SMTP id l4mr38447115wrq.629.1641205239154; 
 Mon, 03 Jan 2022 02:20:39 -0800 (PST)
Received: from [192.168.3.132] (p5b0c6974.dip0.t-ipconnect.de. [91.12.105.116])
 by smtp.gmail.com with ESMTPSA id o9sm20836904wri.97.2022.01.03.02.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 02:20:38 -0800 (PST)
Message-ID: <8be25e98-6870-a492-b21e-a650f9d847c9@redhat.com>
Date: Mon, 3 Jan 2022 11:20:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211231114901.976937-1-philmd@redhat.com>
 <20211231114901.976937-8-philmd@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 7/8] hw/dma: Introduce dma_size_t type definition
In-Reply-To: <20211231114901.976937-8-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>  /*
>   * When an IOMMU is present, bus addresses become distinct from
>   * CPU/memory physical addresses and may be a different size.  Because
> @@ -39,9 +28,22 @@ struct QEMUSGList {
>   * least most) cases.
>   */
>  typedef uint64_t dma_addr_t;
> +typedef uint64_t dma_size_t;

This is a bit inconsistent with other address types (hwaddr,
ram_addr_t), no?

-> git grep "_size_t"

What sticks out are "external" mach_vm_size_t and png_size_t.

To me, it logically makes sense that both types are equal, because we're
operating on the same address space (with the same size).

So at least I don't see the benefit here, but I'd love to be enlightened  :)

-- 
Thanks,

David / dhildenb


