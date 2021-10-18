Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03563431343
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:23:17 +0200 (CEST)
Received: from localhost ([::1]:48712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcOrU-0007wo-4K
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mcOqf-0007Hg-In
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:22:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mcOqe-0000lV-7O
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:22:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634548943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NCgIcEli4Hy6fZUSUfvUzm3uph2JXpVHIhNHgqUR3PM=;
 b=h70QfCl1h0f3zRKzEoRATCUcjMtswtUylxCWFGfxBzPnHEGQ+7hxFoZExziLwscglCwT0B
 VBVr/YkHB9Zm2v9aEXmoe5dbPXB6seSVcf6AiT0+DXRKaD2rWMy4Jzbj/Xgis3JjkekR0L
 pvM4ZEyZYrliqge4n5bI6psMfPdzysE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-BELvnE8lPOKnZZvVpLs0yA-1; Mon, 18 Oct 2021 05:22:22 -0400
X-MC-Unique: BELvnE8lPOKnZZvVpLs0yA-1
Received: by mail-ed1-f72.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso13709560edj.20
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 02:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NCgIcEli4Hy6fZUSUfvUzm3uph2JXpVHIhNHgqUR3PM=;
 b=OiRkhDCjKS376fC63qbcCzDHSAISVu5Oecf6d6kzwUx6RmR7jH75Zen0agqtQChZ0D
 yWlTMqZLK2HNap0pgEghfxKpiNWlnW4rtCkJBF7t5ed8SUIjqoT4mXCcioeuIfODqZwU
 KdATbp8DMV2esbFse4lDZ+qg0ME5b63apE2pejahqYNS4eITCOe2ocRt8yphAJ7B0xov
 6jbyfUD+RI/gzeNtYkipg7OXiD1XXfsvuIxVNd4GvkRJsNvBxoOJJYY8TqVFNhVEl8CC
 3gRalz/C8ep+hRJSiNjgc7IMbSuJsAU6vfQai6re2SgAOhjbBiom42ALUWGCSmyLJp+J
 NFZw==
X-Gm-Message-State: AOAM533TAk78lFgo2ErM14ELSLn1oFSPeI9Tacb204GaDnur0BmRntFx
 X3ulrks+XTYibaIPup3BC/FjQj6cT3Yoxndd85HuYVRdDoLbPjY8QWH/t8CDgrnI6A7hHClExWL
 bUPveu7FpFrbdM98=
X-Received: by 2002:a05:6402:50d0:: with SMTP id
 h16mr42591342edb.303.1634548941071; 
 Mon, 18 Oct 2021 02:22:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLLdY/SVE2A5EbgQs4aDLHqEJGy6ba3tgCEPVcVoMb9SEfTRVa7uSMHp1edmAC0OuA6o84Ow==
X-Received: by 2002:a05:6402:50d0:: with SMTP id
 h16mr42591306edb.303.1634548940833; 
 Mon, 18 Oct 2021 02:22:20 -0700 (PDT)
Received: from steredhat (host-79-34-250-211.business.telecomitalia.it.
 [79.34.250.211])
 by smtp.gmail.com with ESMTPSA id z19sm8608806ejw.44.2021.10.18.02.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 02:22:20 -0700 (PDT)
Date: Mon, 18 Oct 2021 11:22:18 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [PATCH v4 3/3] vdpa: Check for iova range at mappings changes
Message-ID: <20211018092218.i6wwq4burrjhbzyw@steredhat>
References: <20211014141236.923287-1-eperezma@redhat.com>
 <20211014141236.923287-4-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211014141236.923287-4-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 14, 2021 at 04:12:36PM +0200, Eugenio Pérez wrote:
>Check vdpa device range before updating memory regions so we don't add
>any outside of it, and report the invalid change if any.
>
>Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>---
> include/hw/virtio/vhost-vdpa.h |  2 ++
> hw/virtio/vhost-vdpa.c         | 62 +++++++++++++++++++++++++---------
> hw/virtio/trace-events         |  1 +
> 3 files changed, 49 insertions(+), 16 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


