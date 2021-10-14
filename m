Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0755842D543
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 10:38:38 +0200 (CEST)
Received: from localhost ([::1]:36136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mawG5-0001Xl-5T
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 04:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mawEE-00009y-VG
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 04:36:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mawEC-0001Gw-Dx
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 04:36:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634200599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=42oZmDoDnpbyhlJ3KEK3TuKZJYaudMbjIeLu84F12PQ=;
 b=he21KysX0HJ8zY+MKAOCzxd86d1ERpshfUzuPR1a8Pxsgoh3UhkkI1o/4Y3Oz1AqhlJMrH
 fL3bteTyvBmkg4ys6FA0wF3Q8A3RnVeqRmngua/oBkD+IOtpOfJxo1YiFtDTghhQt+gEfe
 8Z018E6feAAVClJA6f1ZL8w92W/4/9g=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-Xr5zbfsFN5yrPr7-1qX6eQ-1; Thu, 14 Oct 2021 04:36:38 -0400
X-MC-Unique: Xr5zbfsFN5yrPr7-1qX6eQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 c25-20020a056402143900b003dc19782ea8so1025670edx.3
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 01:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=42oZmDoDnpbyhlJ3KEK3TuKZJYaudMbjIeLu84F12PQ=;
 b=zL3Gs8b2NY25/dQy5Fo2e4pF1D9pUJ/lvtSLjy2GlbctwPAiv9Y8D2OCXvSGg57SUu
 30dlj3pxnfwyAsHK9y8VI8IjWl4DWbcfr9x360XxJDynIiWJGGbE27R8k750CFmO9JjM
 YWozUW5GPk24epJh6bjXXOWKxKLiN8YK9ZFwz23nEUsrEhjKJJFssg8KiZXR+BdiqsSe
 swiD0tvu9GFCCKblUr7H0bwkTHuaENWplxUQr1bEhXOIEYdy6UaEBbJZZHh7nnKwdI0E
 ZGJ+uUqJzrs5QCJErpoRWN/hBXObj1mUcFKU0tVhD4ftHTDIkzyLa0XzmW2XW72y4x7t
 ES9g==
X-Gm-Message-State: AOAM533husvwBSY8798F97MvkBJh2JcGY3bZF0cghvTIPYLllkMzieVR
 4iSSLQGLEBixDrDASW+R8SGdp/49rrWrWiTVDyFly1rnL0LTdziVti49Sx6SLUgPS1LTJeIRAxW
 78sW4bA4YsGG9iFI=
X-Received: by 2002:a50:cd02:: with SMTP id z2mr6627632edi.241.1634200597083; 
 Thu, 14 Oct 2021 01:36:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyruXGSe+2objH3xCJm2GWQw+hxdqy5FdfVPp0TeYK8CEbTs+Yya8dirvqpV0vfE1r3zYAkIg==
X-Received: by 2002:a50:cd02:: with SMTP id z2mr6627612edi.241.1634200596930; 
 Thu, 14 Oct 2021 01:36:36 -0700 (PDT)
Received: from steredhat (host-79-34-250-211.business.telecomitalia.it.
 [79.34.250.211])
 by smtp.gmail.com with ESMTPSA id d14sm1359199ejd.92.2021.10.14.01.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 01:36:36 -0700 (PDT)
Date: Thu, 14 Oct 2021 10:36:34 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Luc Michel <lmichel@kalray.eu>
Subject: Re: [PATCH] hw/elf_ops.h: switch to ssize_t for elf loader return type
Message-ID: <20211014083634.n7bj4rv2gzbgzopg@steredhat>
References: <20211006192839.17720-1-lmichel@kalray.eu>
MIME-Version: 1.0
In-Reply-To: <20211006192839.17720-1-lmichel@kalray.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 06, 2021 at 09:28:39PM +0200, Luc Michel wrote:
>Until now, int was used as the return type for all the ELF
>loader related functions. The returned value is the sum of all loaded
>program headers "MemSize" fields.
>
>Because of the overflow check in elf_ops.h, trying to load an ELF bigger
>than INT_MAX will fail. Switch to ssize_t to remove this limitation.
>
>Signed-off-by: Luc Michel <lmichel@kalray.eu>
>---
> include/hw/elf_ops.h | 25 +++++++++---------
> include/hw/loader.h  | 60 ++++++++++++++++++++++----------------------
> hw/core/loader.c     | 60 +++++++++++++++++++++++---------------------
> 3 files changed, 74 insertions(+), 71 deletions(-)
>
>diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
>index 1c37cec4ae..5c2ea0339e 100644
>--- a/include/hw/elf_ops.h
>+++ b/include/hw/elf_ops.h
>@@ -310,24 +310,25 @@ static struct elf_note *glue(get_elf_note_type, SZ)(struct elf_note *nhdr,
>     }
>
>     return nhdr;
> }
>
>-static int glue(load_elf, SZ)(const char *name, int fd,
>-                              uint64_t (*elf_note_fn)(void *, void *, bool),
>-                              uint64_t (*translate_fn)(void *, uint64_t),
>-                              void *translate_opaque,
>-                              int must_swab, uint64_t *pentry,
>-                              uint64_t *lowaddr, uint64_t *highaddr,
>-                              uint32_t *pflags, int elf_machine,
>-                              int clear_lsb, int data_swab,
>-                              AddressSpace *as, bool load_rom,
>-                              symbol_fn_t sym_cb)
>+static ssize_t glue(load_elf, SZ)(const char *name, int fd,
>+                                  uint64_t (*elf_note_fn)(void *, void *, bool),
>+                                  uint64_t (*translate_fn)(void *, uint64_t),
>+                                  void *translate_opaque,
>+                                  int must_swab, uint64_t *pentry,
>+                                  uint64_t *lowaddr, uint64_t *highaddr,
>+                                  uint32_t *pflags, int elf_machine,
>+                                  int clear_lsb, int data_swab,
>+                                  AddressSpace *as, bool load_rom,
>+                                  symbol_fn_t sym_cb)
> {
>     struct elfhdr ehdr;
>     struct elf_phdr *phdr = NULL, *ph;
>-    int size, i, total_size;
>+    int size, i;
>+    ssize_t total_size;
>     elf_word mem_size, file_size, data_offset;
>     uint64_t addr, low = (uint64_t)-1, high = 0;
>     GMappedFile *mapped_file = NULL;
>     uint8_t *data = NULL;
>     int ret = ELF_LOAD_FAILED;

Since we assign `total_size` to `ret` and we return `ret`, `ret` should 
be ssize_t too, right?

The rest LGTM.

Thanks,
Stefano


