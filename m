Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B246E9706
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 16:28:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVG0-0000Wj-5v; Thu, 20 Apr 2023 10:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ppVFw-0000WM-Ss
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:27:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ppVFu-0007ju-Lm
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:27:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682000845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lQMPmbYd73mDGx3stex95x0CVUcJbGX+pSikMsaudyM=;
 b=JBtGfvYltS4pTSSI+qHOwhpCca1UmYEI411b6mspeFUrQxafl24tU2TWL2YNDs8sFTL6ba
 /BW+VqSVERO5qJeRXLvSv8T0AEb2XCvfatNo/HxTNSySHxHmx36xR54nYP+wYQeL99BtWX
 S8Rulfv9F5DmcmXFw1JAIJLTv607PEA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-H9ZfeJFkPUGiU1Dfd2CL-g-1; Thu, 20 Apr 2023 10:27:24 -0400
X-MC-Unique: H9ZfeJFkPUGiU1Dfd2CL-g-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-3ef25aaeb5bso4760171cf.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 07:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682000843; x=1684592843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lQMPmbYd73mDGx3stex95x0CVUcJbGX+pSikMsaudyM=;
 b=MyF/O3ZPaADchKrlR0TaYD7hmbjDTep4pm+BYCJQUn61DAjluTv/hg6hK0sQJXNOK5
 vSqIuJilo49qvQC7kNUr0KxPEbOUm1IuCkdAEeBUU2eYvGoRG2R/8EIwuzOS3MiwSmcp
 8zDe/T8VcajsloFsVu11WVVlfbfNxFJUwGUp1WFvIxuASSZ3JXYm4VAWFFOuwb6rhz2G
 cHAdCET8jw/IC3h4KPyo2VGeni7o8836BKuiy0chtWwVgl2i3yWgWNyVaVW6l/ilaxhU
 bjL5eNbaVuY4/CUIMsflcJZeb/8V9guc5nv9Ja6UcpHLgaavvMXGf67i0o1Lya4sQQch
 kB3g==
X-Gm-Message-State: AAQBX9dsO2KBX4c+Ck51LwxvADVo2Bt/US6yjW+2J0t2Bz7BhG/qrXsM
 /cAZeIcLkEwyW3JLq1YVBcN5N8LRZbxdW/vyECE2jp0OFOigxrTgBqJBzLh4ezVmow5azLJ7nRu
 nQFiNWeAfWwpYmC0=
X-Received: by 2002:ac8:5c4a:0:b0:3e8:dc66:fedb with SMTP id
 j10-20020ac85c4a000000b003e8dc66fedbmr2551448qtj.56.1682000843479; 
 Thu, 20 Apr 2023 07:27:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y61LUtcQzgv4naumZ2ZFhEFKvmzYGVxaRKxp5gPKkTmbowUfLRT6ItpnjGvSit3gUAQR2HcQ==
X-Received: by 2002:ac8:5c4a:0:b0:3e8:dc66:fedb with SMTP id
 j10-20020ac85c4a000000b003e8dc66fedbmr2551414qtj.56.1682000843219; 
 Thu, 20 Apr 2023 07:27:23 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 dp1-20020a05620a2b4100b0074ded6ad058sm448528qkb.129.2023.04.20.07.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 07:27:22 -0700 (PDT)
Date: Thu, 20 Apr 2023 16:27:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: Re: [PATCH v2 3/3] softmmu/physmem: Fixup
 qemu_ram_block_from_host() documentation
Message-ID: <20230420162718.1fb0ecde@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230316153658.214487-4-david@redhat.com>
References: <20230316153658.214487-1-david@redhat.com>
 <20230316153658.214487-4-david@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 16 Mar 2023 16:36:58 +0100
David Hildenbrand <david@redhat.com> wrote:

> Let's fixup the documentation (e.g., removing traces of the ram_addr_t
                                                               ^^^^^^^^^
_t typo?

> parameter that no longer exists) and move it to the header file while at
> it.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/exec/cpu-common.h | 15 +++++++++++++++
>  softmmu/physmem.c         | 17 -----------------
>  2 files changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 6feaa40ca7..edef5bee21 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -75,6 +75,21 @@ void qemu_ram_remap(ram_addr_t addr, ram_addr_t length);
>  ram_addr_t qemu_ram_addr_from_host(void *ptr);
>  ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr);
>  RAMBlock *qemu_ram_block_by_name(const char *name);
> +
> +/*
> + * Translates a host ptr back to a RAMBlock and an offset in that RAMBlock.
> + *
> + * @ptr: The host pointer to transalte.
> + * @round_offset: Whether to round the result offset down to a target page
> + * @offset: Will be set to the offset within the returned RAMBlock.
> + *
> + * Returns: RAMBlock (or NULL if not found)
> + *
> + * By the time this function returns, the returned pointer is not protected
> + * by RCU anymore.  If the caller is not within an RCU critical section and
> + * does not hold the iothread lock, it must have other means of protecting the
> + * pointer, such as a reference to the memory region that owns the RAMBlock.
> + */
>  RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
>                                     ram_addr_t *offset);
>  ram_addr_t qemu_ram_block_host_offset(RAMBlock *rb, void *host);
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index fb412a56e1..36b33786fd 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2169,23 +2169,6 @@ ram_addr_t qemu_ram_block_host_offset(RAMBlock *rb, void *host)
>      return res;
>  }
>  
> -/*
> - * Translates a host ptr back to a RAMBlock, a ram_addr and an offset
> - * in that RAMBlock.
> - *
> - * ptr: Host pointer to look up
> - * round_offset: If true round the result offset down to a page boundary
> - * *ram_addr: set to result ram_addr
> - * *offset: set to result offset within the RAMBlock
> - *
> - * Returns: RAMBlock (or NULL if not found)
> - *
> - * By the time this function returns, the returned pointer is not protected
> - * by RCU anymore.  If the caller is not within an RCU critical section and
> - * does not hold the iothread lock, it must have other means of protecting the
> - * pointer, such as a reference to the region that includes the incoming
> - * ram_addr_t.
> - */
>  RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
>                                     ram_addr_t *offset)
>  {


