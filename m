Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6923D3D5B81
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 16:22:33 +0200 (CEST)
Received: from localhost ([::1]:42418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m81V1-0003ZT-V5
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 10:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m81U6-0002tx-9d
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:21:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m81U2-0006sg-A8
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:21:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627309288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Do2QCvNj6roVNNQw3lAkDSI5CZDn6uYTFDHnyZXXrvA=;
 b=hgh2OdnRNSLs4ZDRYE/MKp7cM/OgcSo6d/Z/TFXRmmQ5rF9lT/MyIIRLlQEa2hUQpn2f+p
 PE59nCIG3pbQX5NP1GCnNP4Egky2kI7A+P3iiNf5WpDCalnZil5mUibzhz+eOAdaksNO+G
 SvM/bDKVSnNjCSGQffGt1mo8D4dq8Ek=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-cK2fo3KFPSuLLlw4t1yklw-1; Mon, 26 Jul 2021 10:21:27 -0400
X-MC-Unique: cK2fo3KFPSuLLlw4t1yklw-1
Received: by mail-qv1-f72.google.com with SMTP id
 a2-20020a0562141302b02903303839b843so1174667qvv.13
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 07:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Do2QCvNj6roVNNQw3lAkDSI5CZDn6uYTFDHnyZXXrvA=;
 b=gXldvdrBPO75CRgT4DyiQXb2jATLX7j0IMzUyhF2bqyLLrdrJvoxJCuLZY/tnn9y2Y
 0FOgD6aZJUwO0Cylln1kh3k0TwKB5pLRmKHrZug67aJ1hPoUu+LeWKe5R1hx5tv6Y/lB
 4kLJDVOeFo4rPoOrSaNgcs7tx1NZ1J9iHL5nCoHdb0tIvQQu/47v2Z/2KxoDnGhAl64J
 a0S0sZ+XiRu0UDMOrwpWSEitUBMbqjRAMXPGfKGzpcIgyPYc68SuyHceYJcCDzyOWiAH
 j0QimqMs7lAo/pfdzInfDcQjBRLyzvPJO8vyGqkaZH+GW1XaH2qIHn4RxfdyhPkgOYOW
 wuhQ==
X-Gm-Message-State: AOAM5338YQjC2MZyrFlnSOP8lhdFwiQLofYSajLSaYR4o5l3HO6Zo+hM
 I8MJ1YwylFhBSMPpLqYKh0tTPJi+VsJk+G/SMR1D8tntp2rraLEwsQ3nPP6m2hj+IEKCz6v4M83
 uzQ0H5Fatlo1QPU8=
X-Received: by 2002:a05:620a:7e4:: with SMTP id
 k4mr17703759qkk.328.1627309286938; 
 Mon, 26 Jul 2021 07:21:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwu6l3tDzs2whdL/f1HYKt++I2GUzPLT4ieIxd2Pvk53JYSkPnrLyfonQs6CLPxVfJIxsdRBg==
X-Received: by 2002:a05:620a:7e4:: with SMTP id
 k4mr17703740qkk.328.1627309286694; 
 Mon, 26 Jul 2021 07:21:26 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id i4sm39478qka.130.2021.07.26.07.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:21:25 -0700 (PDT)
Date: Mon, 26 Jul 2021 10:21:24 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH resend v2 1/5] tpm: mark correct memory region range
 dirty when clearing RAM
Message-ID: <YP7E5M6d1MMlpNC/@t490s>
References: <20210720130304.26323-1-david@redhat.com>
 <20210720130304.26323-2-david@redhat.com> <YPrXutNkup2E4k6k@t490s>
 <c4bc5d98-7a34-6a9c-3c07-10e5b52cd06a@redhat.com>
 <YPtEGpcLd4bT/5sD@t490s>
 <c8da89a3-dc2a-c0fc-a562-ed3028b2acf3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c8da89a3-dc2a-c0fc-a562-ed3028b2acf3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 26, 2021 at 10:08:59AM +0200, David Hildenbrand wrote:
> diff --git a/hw/tpm/tpm_ppi.c b/hw/tpm/tpm_ppi.c
> index 362edcc5c9..fab49524d7 100644
> --- a/hw/tpm/tpm_ppi.c
> +++ b/hw/tpm/tpm_ppi.c
> @@ -30,11 +30,14 @@ void tpm_ppi_reset(TPMPPI *tpmppi)
>          guest_phys_blocks_init(&guest_phys_blocks);
>          guest_phys_blocks_append(&guest_phys_blocks);
>          QTAILQ_FOREACH(block, &guest_phys_blocks.head, next) {
> +            hwaddr mr_offs = (uint8_t *) memory_region_get_ram_ptr(block->mr) -
> +                             block->host_addr;
> +
>              trace_tpm_ppi_memset(block->host_addr,
>                                   block->target_end - block->target_start);
>              memset(block->host_addr, 0,
>                     block->target_end - block->target_start);
> -            memory_region_set_dirty(block->mr, 0,
> +            memory_region_set_dirty(block->mr, mr_offs,
>                                      block->target_end - block->target_start);
>          }
>          guest_phys_blocks_free(&guest_phys_blocks);
> 
> 
> That should make more sense :)

Yep, looks good to me (and simpler!).

-- 
Peter Xu


