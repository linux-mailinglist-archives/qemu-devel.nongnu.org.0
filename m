Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAFF48638D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 12:14:45 +0100 (CET)
Received: from localhost ([::1]:38784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QjE-0000qa-O8
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 06:14:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5QdW-0004AV-R6
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 06:08:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5QdU-0000wj-1f
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 06:08:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641467326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AO2j0ocrJGrXS+8IYw/yQyr2Y7C92jPHb6OD0Mb39YI=;
 b=Ewv6iehgNoisq+2R5jEVQ1X9IdRKsBe2PKDllwjk9zRouBFEHB6p9wYTrM4kqEo/trOxp8
 nPDJGvcwel43mi4lHJJYywR2mrSDrJcJEmBSaM7RMGXhau3UVxKP1Q49Lp2qIjVKqMDqkg
 tRFLfXOU+J//C/7U1JtxtQn+H32QiL0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-vEJpMLxEPwmLRxQNWnxKag-1; Thu, 06 Jan 2022 06:08:44 -0500
X-MC-Unique: vEJpMLxEPwmLRxQNWnxKag-1
Received: by mail-wr1-f71.google.com with SMTP id
 q2-20020adfab02000000b001a3ed59eb96so1090908wrc.20
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 03:08:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AO2j0ocrJGrXS+8IYw/yQyr2Y7C92jPHb6OD0Mb39YI=;
 b=zeldUPxw/rWZ+b3EMdXkCat82hsZKPZ2YWlZ9vkhroKzYQnaiJfbGimxn8xsx76nnI
 +xSxOay3dglMOprA6BlFlTY7bGJcIjUSZ8EdL/AzABiUs1lbHXoN14DE8ySr6HvPW684
 BfI4MlP0l091qZoRh2AyNCNvJNZLyJfS4cmftYTO/8yPLH2FhMbG+BXNCsoSvOnaV9zB
 NgRABwI8fZt+5o89P4lqce1jzgPIRLbckXuVR+CZvsVlEbkBcPWte3KAEQpNGGqN3z2+
 c585YtdRugbdnriUxbn9C9LY766rs0fAMAkKDq2R3lfk+g9WbvTQfwYxmVtFWBpSEz6B
 9gDg==
X-Gm-Message-State: AOAM530dUAnWTSSXFNyAitYHFb/JVU6T68Pixsbu6bhOcEmwr37WEL0f
 rvmPWnDLYIUemtrLJ41rtRuQmvDbegI3bERbgmV6bMOSUAc7PkNtcq1FJGIHdFEj+zs7+47TW5s
 vs1bg7YqvN7sjVoI=
X-Received: by 2002:a05:600c:2150:: with SMTP id
 v16mr6586431wml.10.1641467323449; 
 Thu, 06 Jan 2022 03:08:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOkqgAnKN48diKfYzJ/LN9hEM3B2RLyrfJtAEpjd0sePT51WKvN18WGffGciEyCmHzem/1sA==
X-Received: by 2002:a05:600c:2150:: with SMTP id
 v16mr6586401wml.10.1641467323198; 
 Thu, 06 Jan 2022 03:08:43 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id l12sm5915975wmq.2.2022.01.06.03.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 03:08:42 -0800 (PST)
Date: Thu, 6 Jan 2022 06:08:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 0/9] hw/dma: Use dma_addr_t type definition when
 relevant
Message-ID: <20220106060800-mutt-send-email-mst@kernel.org>
References: <20220104085431.2122999-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20220104085431.2122999-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 04, 2022 at 09:54:22AM +0100, Philippe Mathieu-Daudé wrote:
> Since v1:
> - Addressed David review comment (stick to dma_addr_t type)
> - Addressed Peter review comment (incorrect doc string)


PCI things:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

who's merging all this? Yourself?

> Hi,
> 
> This series aims to clarify a bit the DMA API, in particular the
> 'size' argument which is not clear enough (as we use multiple types
> for it). This helps avoiding build failures on 32-bit host [*] (and
> likely overflows calculation too IMO).
> 
> Some units using the DMA API are first removed from user-mode
> emulation to avoid build failure (they shouldn't be there in
> the first place).
> 
> Then some variables are renamed for clarity (no functional change).
> 
> Finally we replace misuses with dma_addr_t typedef. The previous
> patch which failed on 32-bit host applied on top (not failing anymore).
> 
> Regards,
> 
> Phil.
> 
> [*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg858825.html
> 
> Supersedes: <20211231114901.976937-1-philmd@redhat.com>
> 
> Philippe Mathieu-Daudé (9):
>   hw/nvram: Restrict stub to sysemu and tools
>   hw/pci: Restrict pci-bus stub to sysemu
>   hw/pci: Document pci_dma_map()
>   hw/dma: Remove CONFIG_USER_ONLY check
>   hw/rdma/rdma_utils: Rename rdma_pci_dma_map 'len' argument
>   hw/scsi: Rename SCSIRequest::resid as 'residual'
>   hw/dma: Fix format string issues using dma_addr_t
>   hw/dma: Use dma_addr_t type definition when relevant
>   hw/dma: Let dma_buf_read() / dma_buf_write() propagate MemTxResult
> 
>  hw/rdma/rdma_utils.h   |  2 +-
>  include/hw/pci/pci.h   | 12 ++++++
>  include/hw/scsi/scsi.h |  4 +-
>  include/sysemu/dma.h   | 31 ++++++++-------
>  hw/ide/ahci.c          | 10 ++---
>  hw/nvme/ctrl.c         |  6 +--
>  hw/rdma/rdma_utils.c   | 14 +++----
>  hw/scsi/megasas.c      | 85 +++++++++++++++++++++++++++++-------------
>  hw/scsi/scsi-bus.c     | 12 +++---
>  hw/scsi/scsi-disk.c    |  4 +-
>  softmmu/dma-helpers.c  | 34 +++++++----------
>  hw/nvram/meson.build   |  6 ++-
>  hw/rdma/trace-events   |  2 +-
>  stubs/meson.build      |  4 +-
>  14 files changed, 134 insertions(+), 92 deletions(-)
> 
> -- 
> 2.33.1
> 


