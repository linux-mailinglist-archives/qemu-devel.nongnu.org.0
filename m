Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 814F5686F44
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 20:50:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNJ6Z-0007F3-2i; Wed, 01 Feb 2023 14:49:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNJ6X-0007Ea-1f
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:49:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNJ6V-0004Gn-JG
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:49:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675280950;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=I0WcPf82h5uiTHhfDvnR3/BKoDZUZHBk/b/Vsp2gq0k=;
 b=JepEov0zc59PIjArtHWbcGmvjtBuojdf7xWsnyQD4twes+ICdR0/T/ukpUmR2uF8X0ouQk
 vo3nZGMPumPzooQyXKLnFg5CHti/oTV/hZMmT1jJve42N9BVxdHOWX3+MNre7UwxQqFwxz
 +vbOqfW6ogqHG4tkfwNlqfNFglgNEt8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-29-t5yzxH6eN5amhppL2DxIUw-1; Wed, 01 Feb 2023 14:49:09 -0500
X-MC-Unique: t5yzxH6eN5amhppL2DxIUw-1
Received: by mail-wm1-f69.google.com with SMTP id
 j24-20020a05600c1c1800b003dc4480f7bdso1624866wms.5
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 11:49:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I0WcPf82h5uiTHhfDvnR3/BKoDZUZHBk/b/Vsp2gq0k=;
 b=Y7piBn++YJQmsI/u6VESZ9Ee12aYRuJAvnm4dR7wcu05au/ZxDFoC6fKn6yrg9MqqF
 C+WMYLILSaie4Km8z8uxqnIFcUoSLqHsvz4WuB5kAIp39H8oKdbgC02K2JFD2QkCaIvF
 IxXy5ZetEcXnewxrKssPIU25eamuvSyDl5t6MgbmNykY15jktMtveZChSi3/iyxSiQAf
 qDO2JzUaqK6dog/C59uSttw0yNqQpHt5yXzLXwmRx03YYO8j2O2N+h0eW5DpW5brv/qx
 jdZoXGoSDtT2qwGkfAAfGxZY2dTz00fDN2juTMWmubKc4EoVyzwGd1p762S4OC4nxXpA
 yf1g==
X-Gm-Message-State: AO0yUKUs2ZJG9YGIASMiHpbpNrTWGs4jBF8psTiw3w5IsEmVb6fVzIZF
 2FmIxDEsvbHhVVkiSP9K7Nxxzjs2HNSNMC8ib1hOr8pOVn5DuHFAzQfu2KBIIPf/ROcfqpl2+8x
 XMNfjY2g919jlRY8=
X-Received: by 2002:a05:600c:1f10:b0:3db:742:cfe9 with SMTP id
 bd16-20020a05600c1f1000b003db0742cfe9mr3344085wmb.34.1675280948355; 
 Wed, 01 Feb 2023 11:49:08 -0800 (PST)
X-Google-Smtp-Source: AK7set865rOyAfCK1mxw1zEAt6g762+7Tjb5VI7gN5LdKv1rhzf3RYow1W2NGQwaR4kYuXBRnvbwlA==
X-Received: by 2002:a05:600c:1f10:b0:3db:742:cfe9 with SMTP id
 bd16-20020a05600c1f1000b003db0742cfe9mr3344068wmb.34.1675280948114; 
 Wed, 01 Feb 2023 11:49:08 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 l4-20020a05600c16c400b003dd1b00bd9asm2451039wmn.32.2023.02.01.11.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 11:49:07 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  James Houghton <jthoughton@google.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 21/21] migration: Collapse huge pages again after
 postcopy finished
In-Reply-To: <20230117220914.2062125-22-peterx@redhat.com> (Peter Xu's message
 of "Tue, 17 Jan 2023 17:09:14 -0500")
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-22-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 20:49:06 +0100
Message-ID: <87a61xw4i5.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> When hugetlb-doublemap enabled, the pages will be migrated in small page
> sizes during postcopy.  When the migration finishes, the pgtable needs to
> be rebuilt explicitly for these ranges to have huge page being mapped again.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/ram.c        | 31 +++++++++++++++++++++++++++++++
>  migration/trace-events |  1 +
>  2 files changed, 32 insertions(+)
>
> diff --git a/migration/ram.c b/migration/ram.c
> index 4da56d925c..178739f8c3 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -3986,6 +3986,31 @@ static int ram_load_setup(QEMUFile *f, void *opaque)
>      return 0;
>  }
>  
> +#define  MADV_COLLAPSE_CHUNK_SIZE  (1UL << 30) /* 1G */
> +
> +static void ramblock_rebuild_huge_mappings(RAMBlock *rb)
> +{
> +    unsigned long addr, size;

This makes my head explode.

We have:

unsigned long
__u64
uint64_t

Used and mixed all around.

> +    assert(qemu_ram_is_hugetlb(rb));
> +
> +    addr = (unsigned long)qemu_ram_get_host_addr(rb);

Don't this cast should be uintptr_t?
At least on win64 it should fail, no?

> +    size = rb->mmap_length;

this is ram_addr_t.  It is uint64_t except with xen.
So it should fail on any 32 bit host.

Later, Juan.


