Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAEF6F7B90
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 05:31:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pum8d-0002n5-9P; Thu, 04 May 2023 23:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pum8b-0002kf-Dc
 for qemu-devel@nongnu.org; Thu, 04 May 2023 23:29:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pum8Z-0004lg-CE
 for qemu-devel@nongnu.org; Thu, 04 May 2023 23:29:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683257376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2xce8y6ZykJ3t5T5quDtZ3fUqdmHybaE09XNirBllm0=;
 b=RtbhnNQf1/y7hVL6qepxh/VArRiSyiHVj9eFcjPwWtNpG8cfkeBoUmO5KvwrlpS4EeUTVI
 naOtvKJwk1ZBRTy0y7PAHpP1K6ugPnWHqsNCoVbRDs8slThOceUvurGgldDrjt6ZxuNAXR
 SsCw7pTPrGbeDgUBBI+YLsJSID9gNrQ=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-VqyFGo8DOMKyf4zqcui_dA-1; Thu, 04 May 2023 23:29:33 -0400
X-MC-Unique: VqyFGo8DOMKyf4zqcui_dA-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4f0176dcc66so681368e87.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 20:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683257372; x=1685849372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2xce8y6ZykJ3t5T5quDtZ3fUqdmHybaE09XNirBllm0=;
 b=dQKA06mgz/DDw9LtgCLPSC4wUiBo9kknfP5L8+khTAHeKNQDaeRkQ7vRcLLsC9sIc+
 7OZOhtD5P+rsCXTXPIV/ENHwWBs5G5NhWxoMh5PV+evefaWKAV3unYPu5tj3bvLAa49/
 TTQT4hBBik9VyFEpZoRcpBI4wyIIDl4JYTBkrbkm3DpLbO3iaotEBKUh1kxVT3873Eya
 utgdYAQ3jus8r9vKUnqJJ9s6UX8fovMZTFT/24nYWQjGuluTsm4f9E5HcpbrAnqLB9Hu
 OueRk+F0iieRu+VCxfzrLWFB84mWokdaKSXZrQhhL+d4yl9gNKQ7yMclgcr80IxuihNX
 hWbw==
X-Gm-Message-State: AC+VfDxXUvQfsd9pj1JKubR8LH0zjSjav6EuqR70Usenb+B7dG+nIRiT
 0GXMuIxkfXXvHUuN1FbnaG75SxKI5LNSLGWI4Mn5QggiS2wrq4VQkZCn73a8yoxQpHIRP8nfPtf
 fb5RtZSNIV8BeKx66A57lT+MsfnS71us=
X-Received: by 2002:ac2:5921:0:b0:4db:1bab:98a4 with SMTP id
 v1-20020ac25921000000b004db1bab98a4mr112317lfi.32.1683257372100; 
 Thu, 04 May 2023 20:29:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ZIc2ihIVkQWL07H3QXlD/Hm9TFTps/5v4f1Xq4w7VzNUU4IHq0fAsTetFoj6M6CKX4E4dbSrwZvFluPasMCk=
X-Received: by 2002:ac2:5921:0:b0:4db:1bab:98a4 with SMTP id
 v1-20020ac25921000000b004db1bab98a4mr112313lfi.32.1683257371800; Thu, 04 May
 2023 20:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230503091337.2130631-1-lulu@redhat.com>
In-Reply-To: <20230503091337.2130631-1-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 5 May 2023 11:29:20 +0800
Message-ID: <CACGkMEvssDLX0OAuVE2ZwK_SAdhjUr7fnbH6kbMAOzzJKbsJig@mail.gmail.com>
Subject: Re: [RFC 0/7] vhost-vdpa: add support for iommufd
To: Cindy Lu <lulu@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

Hi Cindy

On Wed, May 3, 2023 at 5:13=E2=80=AFPM Cindy Lu <lulu@redhat.com> wrote:
>
> Hi All
> There is the RFC to support the IOMMUFD in vdpa device
> any comments are welcome
> Thanks
> Cindy

Please post the kernel patch as well as a reference.

Thanks

>
> Cindy Lu (7):
>   vhost: introduce new UAPI to support IOMMUFD
>   qapi: support iommufd in vdpa
>   virtio : add a ptr for vdpa_iommufd in VirtIODevice
>   net/vhost-vdpa: Add the check for iommufd
>   vhost-vdpa: Add the iommufd support in the map/unmap function
>   vhost-vdpa: init iommufd function in vhost_vdpa start
>   vhost-vdpa-iommufd: Add iommufd support for vdpa
>
>  hw/virtio/meson.build          |   2 +-
>  hw/virtio/vhost-vdpa-iommufd.c | 240 +++++++++++++++++++++++++++++++++
>  hw/virtio/vhost-vdpa.c         |  74 +++++++++-
>  include/hw/virtio/vhost-vdpa.h |  47 +++++++
>  include/hw/virtio/virtio.h     |   5 +
>  linux-headers/linux/vhost.h    |  72 ++++++++++
>  net/vhost-vdpa.c               |  31 +++--
>  qapi/net.json                  |   1 +
>  8 files changed, 451 insertions(+), 21 deletions(-)
>  create mode 100644 hw/virtio/vhost-vdpa-iommufd.c
>
> --
> 2.34.3
>


