Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6308265E2C5
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 02:58:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDFWZ-000083-0A; Wed, 04 Jan 2023 20:58:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDFWV-00007S-6n
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 20:58:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDFWT-0002W9-Jl
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 20:58:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672883904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+Qd+NGnwA0BW8WwEZwYMXKv6Wxbu/71MZRwI+JmFp9Y=;
 b=OEP4c3fgqU7Mmtvm4EC2Ck8F1o0plJuOPhz2Cl8PoKXTgQvndnkLZ44DcLYQx+2yS87ZF1
 m0sxKFpoNj2oey606kMGnerGPk78G4nswnLm0RG5eLFG4cDa2knv5HpOfRXGWEBhkGnH8p
 gbz+lEuv9Tfa2u7iSkG9+pXIDckZaEE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-524-_m6bene4MYiVxB0iCxfYAg-1; Wed, 04 Jan 2023 20:58:23 -0500
X-MC-Unique: _m6bene4MYiVxB0iCxfYAg-1
Received: by mail-ed1-f69.google.com with SMTP id
 i8-20020a05640242c800b004852914ce42so16427459edc.6
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 17:58:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Qd+NGnwA0BW8WwEZwYMXKv6Wxbu/71MZRwI+JmFp9Y=;
 b=LDpBTpX9Fq7Aj4rbKhEnZlmZr4MV/OeatSMtsqesDDqq0Am3VrjYjM89m9FmPPITbY
 ByQ9Jdy9ZPniEZGzPQlgkO6xiMwpG/F+244AdaPjz2RrkhnHvIHjlXLF6u2MIpiEkLXE
 xrOUo+ZseGaYwmLcqy7+3fWQmWgz3xCuolg1Q/aSse8TpWBngNPLxxhGYQ3O6mHbz8m9
 bOwBRcld09UGofYFPbJ6SoW8ZljUikHDBCJw45lnxophROF/qgxNbKT2thnNuEL3VSCY
 f0xuBUijssk8k8XOsdw/wOCKj+4dJfhhgUtgbIjI08Yr1p+QlAD7YxTaOHfwt/yM3RWh
 +1Ng==
X-Gm-Message-State: AFqh2krQbTnwe8xeygFe8yCzAjxKrU82hBylgv7z5tol1KyjXyyt4b1f
 tuyvvqCRTLyTTcRzaFr92mN6x8ijKJ0Dl4knO42K0UVQVUneOPg0uW4p0R2WhWIPEwB5u9JvWIi
 +23sgZUD115Uw5iQ=
X-Received: by 2002:a17:906:3f8b:b0:83f:b41a:2e9d with SMTP id
 b11-20020a1709063f8b00b0083fb41a2e9dmr44853528ejj.16.1672883902208; 
 Wed, 04 Jan 2023 17:58:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsu1Zqo1zbC6v97JsantJrg1lMzS3DQE4jmVlR1N76Q4SZ2gqyflLxVvD9RyrlwR6dlI/0Sjg==
X-Received: by 2002:a17:906:3f8b:b0:83f:b41a:2e9d with SMTP id
 b11-20020a1709063f8b00b0083fb41a2e9dmr44853519ejj.16.1672883901992; 
 Wed, 04 Jan 2023 17:58:21 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 vb4-20020a170907d04400b0078db18d7972sm15909570ejc.117.2023.01.04.17.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 17:58:21 -0800 (PST)
Date: Wed, 4 Jan 2023 20:58:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Marcel Holtmann <marcel@holtmann.org>
Cc: qemu-devel@nongnu.org, xieyongji@bytedance.com, pbonzini@redhat.com
Subject: Re: [PATCH v4 00/12] Compiler warning fixes for libvhost-user,libvduse
Message-ID: <20230104205302-mutt-send-email-mst@kernel.org>
References: <cover.1671741278.git.marcel@holtmann.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1671741278.git.marcel@holtmann.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Thu, Dec 22, 2022 at 09:36:39PM +0100, Marcel Holtmann wrote:
> The libvhost-user and libvduse libraries are also useful for external
> usage outside of QEMU and thus it would be nice if their files could
> be just copied and used. However due to different compiler settings, a
> lot of manual fixups are needed. This is the first attempt at some
> obvious fixes that can be done without any harm to the code and its
> readability.
> 
> Marcel Holtmann (12):
>   libvhost-user: Provide _GNU_SOURCE when compiling outside of QEMU
>   libvhost-user: Replace typeof with __typeof__
>   libvhost-user: Cast rc variable to avoid compiler warning
>   libvhost-user: Use unsigned int i for some for-loop iterations
>   libvhost-user: Declare uffdio_register early to make it C90 compliant
>   libvhost-user: Change dev->postcopy_ufd assignment to make it C90 compliant
>   libvduse: Provide _GNU_SOURCE when compiling outside of QEMU
>   libvduse: Switch to unsigned int for inuse field in struct VduseVirtq
>   libvduse: Fix assignment in vring_set_avail_event
>   libvhost-user: Fix assignment in vring_set_avail_event
>   libvhost-user: Add extra compiler warnings
>   libvduse: Add extra compiler warnings


series looks good to me.

Paolo I understand you are merging this?

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

>  subprojects/libvduse/libvduse.c           |  9 ++++--
>  subprojects/libvduse/meson.build          |  8 ++++-
>  subprojects/libvhost-user/libvhost-user.c | 36 +++++++++++++----------
>  subprojects/libvhost-user/meson.build     |  8 ++++-
>  4 files changed, 42 insertions(+), 19 deletions(-)
> 
> -- 
> 2.38.1
> 
> 
> 


