Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 032EB6C4D92
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:26:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezPe-0000ll-IW; Wed, 22 Mar 2023 10:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pezPX-0000lK-TB
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:25:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pezPV-0000wk-Q1
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:25:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679495152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DyzXCoG3+1CRpJ2a4w5YN5srqbMX2pKYaMARxjpzawY=;
 b=NqFNYIHfMMZ2Q/3Wq8vHsHhHcaYAT+If+l4wBvZPTmCtX79egirJwh9muxR4CTwBqfeSMn
 CTLtH5kTmbiIJUbmcdjx+/0Et5SLdZwuReRL+00nBctQ35F3FpPyxk262/OZm0LVMprIFV
 /Lq6l9qqLyPwd02iLNctOwLPRhLnBp4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-gzltf9nXNa6_hcF1UQrI5w-1; Wed, 22 Mar 2023 10:25:48 -0400
X-MC-Unique: gzltf9nXNa6_hcF1UQrI5w-1
Received: by mail-qt1-f200.google.com with SMTP id
 i2-20020ac84882000000b003d6fee1d438so10988761qtq.1
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 07:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679495148;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DyzXCoG3+1CRpJ2a4w5YN5srqbMX2pKYaMARxjpzawY=;
 b=MCat24XO3h+gQa0iPxYvLUtiyKwfOVSCxHwtani2SC2yxlLgdotlOygpL+rXJTbhAY
 osxcJQ6yzd2VPIamXiPxA3rXwwTwgzRRgS6211uuwFn0acghnGM6BNtK9CVuiDrHchl0
 +WwpyL4YY1lLWb1wLEv/exBhRKM7Htmo4jLixyXnlKlGjU4MHTaTqc0ikSiMVYcBx0DF
 +T50iIM1+CFv63CiWrEFdoFOfH9Y1o48uHr0Tfap4VemnYqhVWUhQoEs+E0NLM47HplF
 ynQ8PPfWQ3BRGiNJ9sChsdOytfNNPUdwSuOvKq6RhLM4u4zCXT0COUzazj370S+YxMAf
 Ap/w==
X-Gm-Message-State: AO0yUKU1g72g0AjrChoP7iJXAyua3Y2XgvjD+vJ6FuD/SCxlX+bjoZ9H
 05bBEJpmMAqvZNYZ2raEp6AJ0v9xKgfEZaRFhjMoT6I6eakpV1P0Qpvh+XpePxPZiOc2SHhaE6A
 WXHGIEshhfvrlyV4=
X-Received: by 2002:ac8:5f90:0:b0:3e3:7e16:5a8c with SMTP id
 j16-20020ac85f90000000b003e37e165a8cmr6023413qta.16.1679495148159; 
 Wed, 22 Mar 2023 07:25:48 -0700 (PDT)
X-Google-Smtp-Source: AK7set80fXhprYksNMaPgNBFgeOHEbiGnpRrgU+3G1ft5s6r6mbUd9tvFd47sdpSZUkbp/LGGpMENg==
X-Received: by 2002:ac8:5f90:0:b0:3e3:7e16:5a8c with SMTP id
 j16-20020ac85f90000000b003e37e165a8cmr6023379qta.16.1679495147919; 
 Wed, 22 Mar 2023 07:25:47 -0700 (PDT)
Received: from sgarzare-redhat (host-82-57-51-170.retail.telecomitalia.it.
 [82.57.51.170]) by smtp.gmail.com with ESMTPSA id
 u12-20020ac8750c000000b003e38f8d564fsm205997qtq.66.2023.03.22.07.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 07:25:47 -0700 (PDT)
Date: Wed, 22 Mar 2023 15:25:42 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, alvaro.karsz@solid-run.com,
 Laurent Vivier <lvivier@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 si-wei.liu@oracle.com, longpeng2@huawei.com,
 Cindy Lu <lulu@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Lei Yang <leiyang@redhat.com>
Subject: Re: [RFC PATCH for 8.1 3/6] vdpa: add vhost_vdpa_set_dev_features_fd
Message-ID: <20230322142542.3wnllk4cux4yfgxv@sgarzare-redhat>
References: <20230317145542.347368-1-eperezma@redhat.com>
 <20230317145542.347368-4-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230317145542.347368-4-eperezma@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
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

On Fri, Mar 17, 2023 at 03:55:39PM +0100, Eugenio Pérez wrote:
>This allows to set the features of a vhost-vdpa device from external
>subsystems like vhost-net.  It is used in subsequent patches to
>negotiate features and probe for CVQ ASID isolation.
>
>Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>---
> include/hw/virtio/vhost-vdpa.h |  1 +
> hw/virtio/vhost-vdpa.c         | 20 +++++++++++++-------
> 2 files changed, 14 insertions(+), 7 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


