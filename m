Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7915A612206
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 11:54:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooiWt-0005Rr-Ib; Sat, 29 Oct 2022 05:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1ooiWr-0005RY-Nx
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 05:53:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1ooiWq-0007qV-CE
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 05:53:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667037203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rdZn7y14Z2lBdOE/GKWFkMdLdYCX3jxISu+53T9OFw4=;
 b=Ley3P6TDxjNlDO9xOPxEPVozeRVgYgAPm7Z2KdLnEZ8uOjX7i6GyO0NfGss9UzBKL/7sQu
 khWeDw+iZFiX8nFCgsGEGS3Dc8Eniw5hPPBC2j5cLh5h6J3mmyF6u2LX1yND/GyUky+3dq
 KHW3vw6MbOzFSy6v2FG7fdavG68Y3P8=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-380-jGLaxReANLadn-phkpfsAQ-1; Sat, 29 Oct 2022 05:53:21 -0400
X-MC-Unique: jGLaxReANLadn-phkpfsAQ-1
Received: by mail-io1-f71.google.com with SMTP id
 r197-20020a6b8fce000000b006c3fc33424dso5658887iod.5
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 02:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rdZn7y14Z2lBdOE/GKWFkMdLdYCX3jxISu+53T9OFw4=;
 b=zFEmfcMZ+lQ7cLlC8sDzTs134BtEP1uGBFuVJp+WnXV2sw1foG5qkVkrwD9s7MS6Mn
 Y1j9WwVOdRasDotFAvXnmiLz4lfEO/f1G+nHz7NR8BcJNWhPxHolFDPbX4os87a/BEyA
 JoxkrJvEmBfMGdVO3xkK+9cfZkVngYqjwEJg4nY3qRO+cUz2u4wBldrtgxYlKb/dC5DX
 LoSajLCLOErLFlA5dJ0rW6sUZAunOXlvEl4ftkG8irSGhTs5SAna9uAFJ7HrifYDu8to
 Zv60hzUab+BiB/gRqiHYhY9q5OfEd/9GdNnWF7y1Z4WdmoUYv4jWGWfMmeQLKHvu6Y71
 9imA==
X-Gm-Message-State: ACrzQf22zx3QzFXwN9dpVEVLpQfBK84NZqTeX2DEvBu/2ll2bXYHjGgw
 GfqmNpAThOCKvAttD6I7tihxBnF9CnYoj1vp7tMRR1r+tk8RG21FL7qDKthVigxV7CzCvwG+IQ4
 VeeUnIxbzzKiFrRoEdJPco1xSyVwN/yU=
X-Received: by 2002:a05:6e02:144e:b0:300:5408:669d with SMTP id
 p14-20020a056e02144e00b003005408669dmr1656061ilo.106.1667037200231; 
 Sat, 29 Oct 2022 02:53:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4zeYrixVPCmmSKWdgy1zzGySJ4JyylDRfLuMD9+fZXJWqyNf009nQBEGU43m3lC98bCDR9ANVZJVfuyp4+lTk=
X-Received: by 2002:a05:6e02:144e:b0:300:5408:669d with SMTP id
 p14-20020a056e02144e00b003005408669dmr1656056ilo.106.1667037200063; Sat, 29
 Oct 2022 02:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221028131635.710267-1-afaria@redhat.com>
In-Reply-To: <20221028131635.710267-1-afaria@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Sat, 29 Oct 2022 10:52:44 +0100
Message-ID: <CAELaAXyOMQbCcSJCouDUzm0u+UjideL8P1NAA2bUXMxbaSRQfg@mail.gmail.com>
Subject: Re: [PATCH] block/blkio: Add virtio-blk-vfio-pci BlockDriver
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 28, 2022 at 2:17 PM Alberto Faria <afaria@redhat.com> wrote:
> libblkio 1.1.0 [1] introduces a virtio-blk-vfio-pci driver, which
> accesses a virtio-blk PCI device using VFIO. Add a corresponding
> BlockDriver.
>
> [1] https://gitlab.com/libblkio/libblkio/-/tree/v1.1.0
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>

I forgot to mention this is based on Stefan's block tree:
https://gitlab.com/stefanha/qemu/-/commits/block


