Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 292E168E1CE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 21:24:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPUUr-0002zh-Jj; Tue, 07 Feb 2023 15:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPUUp-0002zN-CQ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:23:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPUUo-0000sM-1S
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:23:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675801396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6db5YoXwSRl5OSAfT1V1jFFCbYlVwIqx1+V2VS3cEjI=;
 b=SLLdQRp4nO4mfCyDhKQnUm5ukve8AA0hVCkLLiL/PafG/LHgmy2rKygV1AEXby4xW9NkOv
 nsH4EUizSep+Wy+C5I2Vf2csj3gSlEZbnkjikXN29RT/cgWl4mpQcwlNX/Ynwd+ZWmOQHm
 dEIn8qAbz9guo71g+67lk9HyWle0gL0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-668-TQp0HUhHMIOE4PqfDcaymQ-1; Tue, 07 Feb 2023 15:23:15 -0500
X-MC-Unique: TQp0HUhHMIOE4PqfDcaymQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 c10-20020a05621401ea00b004c72d0e92bcso8275634qvu.12
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 12:23:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6db5YoXwSRl5OSAfT1V1jFFCbYlVwIqx1+V2VS3cEjI=;
 b=SNcDvYay5x/GoR2krf0XlXSdTaqeUoq/VNzjHpgtHc3ktNQzPSLq/LmHOSNarxqCCR
 W9P+gkLpW3ZSR6si5hdOhQEC1IJ3kzw1umu/Ofp0lANldsxvSoICLgnfDVS6icAh+Qzh
 v4TJPacK9BnB343v5TFykNMj8yDpn5wYtoGpRyChHa/tmE+Q5ECIuY4j1m6OGzTSI4Ti
 ry4yfjNbYDEz9DYuSVCXIa2ZhTcW6ImwyvrFII5zQaLXkQTdYXMlgitBhTAUEpjqHidt
 XdH0Fac0XAZOtLEE0Agca2G80gO6qDO8V8zX72oqgn1+FnOobYEWR0khTerKYD0iNTAH
 ZXOQ==
X-Gm-Message-State: AO0yUKUn/6AV4AUnGJ/HYw7jCYeEGPg/AT32zeqfGrDEmQ6/lmtsYxTb
 B6Sr9ove7KKDkuxFdoHxWzejxIVr+qP93VK2uv6s6x9q8xQLIuJ0xX+QqkUVK9LQg2CtFXadtHy
 PyvH1G/j+DW4XjfU=
X-Received: by 2002:ac8:4e51:0:b0:3b8:36f8:830e with SMTP id
 e17-20020ac84e51000000b003b836f8830emr8654078qtw.6.1675801394455; 
 Tue, 07 Feb 2023 12:23:14 -0800 (PST)
X-Google-Smtp-Source: AK7set9SuAMD8lD+Yr4OsFYLNoaDk2/zNHE67bJ6Nn3ures3zDyNQwmhgvmaJVtRuUrGVEemxqoD0Q==
X-Received: by 2002:ac8:4e51:0:b0:3b8:36f8:830e with SMTP id
 e17-20020ac84e51000000b003b836f8830emr8654048qtw.6.1675801394146; 
 Tue, 07 Feb 2023 12:23:14 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 x14-20020ac8018e000000b003ba19e53e43sm7066708qtf.25.2023.02.07.12.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 12:23:13 -0800 (PST)
Date: Tue, 7 Feb 2023 15:23:12 -0500
From: Peter Xu <peterx@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH V2] memory: RAM_NAMED_FILE flag
Message-ID: <Y+KzMDdc+F9zHMh2@x1n>
References: <1675796613-235716-1-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1675796613-235716-1-git-send-email-steven.sistare@oracle.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 07, 2023 at 11:03:33AM -0800, Steve Sistare wrote:
> migrate_ignore_shared() is an optimization that avoids copying memory
> that is visible and can be mapped on the target.  However, a
> memory-backend-ram or a memory-backend-memfd block with the RAM_SHARED
> flag set is not migrated when migrate_ignore_shared() is true.  This is
> wrong, because the block has no named backing store, and its contents will
> be lost.  To fix, ignore shared memory iff it is a named file.  Define a
> new flag RAM_NAMED_FILE to distinguish this case.

There's also TYPE_MEMORY_BACKEND_EPC.  Reading the commit message it seems
it can still be used in similar ways.  Pasting commit message from c6c0232:

    Because of its unique requirements, Linux manages EPC separately from
    normal memory.  Similar to memfd, the device /dev/sgx_vepc can be
    opened to obtain a file descriptor which can in turn be used to mmap()
    EPC memory.

I'm not sure whether it means that should apply for RAM_NAMED_FILE too,
neither do I think it's super important..  Still better to define it
properly.

Another comment is, AFAIK this patch will modify senamtics of the old
capability "x-ignore-shared".  But I'd say in a sensible way.  Maybe worth
directly modify qapi/migration.json to reflect it (especially it's x-
prefixed) to something like:

# @x-ignore-shared: If enabled, QEMU will not migrate named shared memory
#                   (since 4.0) 

Thanks,

-- 
Peter Xu


