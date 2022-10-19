Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9517960408F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 12:04:37 +0200 (CEST)
Received: from localhost ([::1]:51262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol5w9-0001g8-Ty
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 06:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ol5iL-0001P1-Oe
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 05:50:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ol5iK-0005Kg-93
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 05:50:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666173011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q13Zljine8NYLmlywe5rmxPVqAy5lSN/h2moiI7BxAE=;
 b=C6585kQk0MbChydaGrvUSXAza0oIqpgRMIX7P1sfct7zOTlnLDqC0y+3IGrzSQ3WIc+ozx
 QU4nALAZxyTfbNK7Jbbex/l8qjki++1h5hjYt+sVjrNafBR0woEDwNb58GEKf6g9MW3tf/
 cMCrTXV4shToIdPqJ5pPlodDimGlfKs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-516-CDt5h8FIMsGcuCWUns41bw-1; Wed, 19 Oct 2022 05:50:10 -0400
X-MC-Unique: CDt5h8FIMsGcuCWUns41bw-1
Received: by mail-qk1-f198.google.com with SMTP id
 i11-20020a05620a404b00b006eeb0791c1aso14428572qko.10
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 02:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q13Zljine8NYLmlywe5rmxPVqAy5lSN/h2moiI7BxAE=;
 b=xDqADQo0V2HOqC8escuiGuqcD6aA/3zCTkrV/hLC/iJ1QdrIsxEybY5vTa2yOQgA40
 yq/RdOTQQHgnzO4zGMvPMfmzIVYlS8bN1tAw1xl425TFckLbJCc2CGDGxL1ajuVcmNCY
 b1AncvRMyLYI8Qh7MHG//kupCjgH/jqYwJxcYFyneqUAYDKWDjxld3LdYcEj6rlL761K
 eNUuxGIAexhZmiZK1TnRzRnlGIeT8B0lvizVshpu3/zAn4YKz+Un0OtmJ5FXwacrnhRw
 gy1lWlLcr8Bz3HO8qOFbWyJsNw9/sgGd/Am/ArRS+sW4Qs5wzkV2r/gFh3rrMdLAmTVb
 dGAQ==
X-Gm-Message-State: ACrzQf2STQq7nP05tRvcQlVx2j6bNnYOF3L4H/tVE0DE6o8exE7ppGpZ
 sJY8c5Ar1ukcvAaxim3ML+JbxVzi9WizXNlwmomPABe8aTmGliOYCY45po/eQInEdL2v164Hwme
 q9SubEOMrmsXDeRI=
X-Received: by 2002:a05:6214:1cc5:b0:4af:91d5:8d1a with SMTP id
 g5-20020a0562141cc500b004af91d58d1amr5809060qvd.70.1666173010071; 
 Wed, 19 Oct 2022 02:50:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM56gHKjjQhPsp33XGQabhZ+AnwdHcKqqT4flSr5IqTjuEGIcWSnjErbQxhQSXwsvC6bpdyidQ==
X-Received: by 2002:a05:6214:1cc5:b0:4af:91d5:8d1a with SMTP id
 g5-20020a0562141cc500b004af91d58d1amr5809036qvd.70.1666173009835; 
 Wed, 19 Oct 2022 02:50:09 -0700 (PDT)
Received: from sgarzare-redhat ([5.179.190.19])
 by smtp.gmail.com with ESMTPSA id
 fg11-20020a05622a580b00b0039cb9b6c390sm3741239qtb.79.2022.10.19.02.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 02:50:09 -0700 (PDT)
Date: Wed, 19 Oct 2022 11:50:00 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Kevin Wolf <kwolf@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 afaria@redhat.com, Jeff Cody <codyprime@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 integration@gluster.org, Peter Xu <peterx@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Denis V. Lunev" <den@openvz.org>
Subject: Re: [PATCH v7 09/13] block: add BlockRAMRegistrar
Message-ID: <20221019095000.aiac6suclammwrj6@sgarzare-redhat>
References: <20221013185908.1297568-1-stefanha@redhat.com>
 <20221013185908.1297568-10-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221013185908.1297568-10-stefanha@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 13, 2022 at 02:59:04PM -0400, Stefan Hajnoczi wrote:
>Emulated devices and other BlockBackend users wishing to take advantage
>of blk_register_buf() all have the same repetitive job: register
>RAMBlocks with the BlockBackend using RAMBlockNotifier.
>
>Add a BlockRAMRegistrar API to do this. A later commit will use this
>from hw/block/virtio-blk.c.
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>---
> MAINTAINERS                          |  1 +
> include/sysemu/block-ram-registrar.h | 37 ++++++++++++++++++
> block/block-ram-registrar.c          | 58 ++++++++++++++++++++++++++++
> block/meson.build                    |  1 +
> 4 files changed, 97 insertions(+)
> create mode 100644 include/sysemu/block-ram-registrar.h
> create mode 100644 block/block-ram-registrar.c

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


