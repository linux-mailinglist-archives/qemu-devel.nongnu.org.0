Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3126CD162
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 07:01:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phNvI-0004I5-Pa; Wed, 29 Mar 2023 01:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1phNv9-0004HX-1G
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 01:00:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1phNv7-0007E4-66
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 01:00:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680066023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=We+AZVUP/d8CpVL/j63W3UR9arAJANgsuPfOHKpyQb4=;
 b=BRiusR28lTBeGVt2FXj1MXWyGRkoDqiNJkRg6mAwM+OQuM63wN6i2X1bIjReGxG+Ja7kvs
 7k4sjMjC6Res1gBWr45HQWOdLJj2RWTLvB7CmNmd/UH/8o+ZGioWn5nYCK3GB6Plyzlv0o
 RwrXNFdaHynurUOe5k6CqDSY7koUW4E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-UtMw-WC0PGSD2c5rRzrKcA-1; Wed, 29 Mar 2023 01:00:19 -0400
X-MC-Unique: UtMw-WC0PGSD2c5rRzrKcA-1
Received: by mail-wm1-f69.google.com with SMTP id
 k1-20020a05600c1c8100b003ee6dbceb81so7508362wms.5
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 22:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680066018;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=We+AZVUP/d8CpVL/j63W3UR9arAJANgsuPfOHKpyQb4=;
 b=EwZ2CvZKq7GM2T+owew19Yzt29WXWqIaPbafCI/8R4/7Xqyg7jvNj0X6lXNw88Yf5r
 8JrBDKa7iERas3ar5ATv5xxctI91SqjDiJ9FGlIJcPtmFiTPMzsYuXYMa3r2QgODv+qx
 NgMfSS5FsBwzpF/2L6PX1W4/yQUVffwfbptvNh8JH/Zumon6shp9LSJC5zUclbhvA4jF
 uc1srR/9XdpEiZq9X4o3HGKkeJHT9qeI427h71LVWKYj+LoOI3DbE2DBVTW6/fZaGxxc
 +2dQZ+P7IhQnwq/ULkf9QPsZ7p7Ojzc4FjOeQ2STjLG+LWq4M6vmDbxpEMsPBAsxVg3Q
 tOCg==
X-Gm-Message-State: AAQBX9d+GBfx2s9knBfmubQfDVT9l4fNKHFfCQD0cURPi6+I1rIN+69s
 QFdvpl3cpYW7ueQRHizotcY3T/OhkHHf0CgP2qJe5qpNZvvsN3+AQgbc8j81qx0Kz4ZMPGgg6aX
 5519XyIZMmqEdrVI=
X-Received: by 2002:a05:6000:7:b0:2cd:e0a8:f2dc with SMTP id
 h7-20020a056000000700b002cde0a8f2dcmr14955491wrx.7.1680066018335; 
 Tue, 28 Mar 2023 22:00:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350YDOk0pvKdBoYaZ8VC7rjX27v+hYK6oK1AhzIPMsliLPfZOypHN1UqK4iziIPJoino86cEe/w==
X-Received: by 2002:a05:6000:7:b0:2cd:e0a8:f2dc with SMTP id
 h7-20020a056000000700b002cde0a8f2dcmr14955464wrx.7.1680066017945; 
 Tue, 28 Mar 2023 22:00:17 -0700 (PDT)
Received: from redhat.com ([2.52.18.165]) by smtp.gmail.com with ESMTPSA id
 e13-20020a5d4e8d000000b002ceacff44c7sm29232578wru.83.2023.03.28.22.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 22:00:17 -0700 (PDT)
Date: Wed, 29 Mar 2023 01:00:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 dmitry.fomichev@wdc.com, kvm@vger.kernel.org,
 damien.lemoal@opensource.wdc.com, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v9 0/5] Add zoned storage emulation to virtio-blk driver
Message-ID: <20230329005755-mutt-send-email-mst@kernel.org>
References: <20230327144553.4315-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327144553.4315-1-faithilikerun@gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Mar 27, 2023 at 10:45:48PM +0800, Sam Li wrote:
> This patch adds zoned storage emulation to the virtio-blk driver. It
> implements the virtio-blk ZBD support standardization that is
> recently accepted by virtio-spec. The link to related commit is at
> 
> https://github.com/oasis-tcs/virtio-spec/commit/b4e8efa0fa6c8d844328090ad15db65af8d7d981
> 
> The Linux zoned device code that implemented by Dmitry Fomichev has been
> released at the latest Linux version v6.3-rc1.
> 
> Aside: adding zoned=on alike options to virtio-blk device will be
> considered in following-up plan.
> 
> Note: Sorry to send it again because of the previous incoherent patches caused
> by network error.

virtio bits look ok.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

merge through block layer tree I'm guessing?


> v9:
> - address review comments
>   * add docs for zoned emulation use case [Matias]
>   * add the zoned feature bit to qmp monitor [Matias]
>   * add the version number for newly added configs of accounting [Markus]
> 
> v8:
> - address Stefan's review comments
>   * rm aio_context_acquire/release in handle_req
>   * rename function return type
>   * rename BLOCK_ACCT_APPEND to BLOCK_ACCT_ZONE_APPEND for clarity
> 
> v7:
> - update headers to v6.3-rc1
> 
> v6:
> - address Stefan's review comments
>   * add accounting for zone append operation
>   * fix in_iov usage in handle_request, error handling and typos
> 
> v5:
> - address Stefan's review comments
>   * restore the way writing zone append result to buffer
>   * fix error checking case and other errands
> 
> v4:
> - change the way writing zone append request result to buffer
> - change zone state, zone type value of virtio_blk_zone_descriptor
> - add trace events for new zone APIs
> 
> v3:
> - use qemuio_from_buffer to write status bit [Stefan]
> - avoid using req->elem directly [Stefan]
> - fix error checkings and memory leak [Stefan]
> 
> v2:
> - change units of emulated zone op coresponding to block layer APIs
> - modify error checking cases [Stefan, Damien]
> 
> v1:
> - add zoned storage emulation
> 
> Sam Li (5):
>   include: update virtio_blk headers to v6.3-rc1
>   virtio-blk: add zoned storage emulation for zoned devices
>   block: add accounting for zone append operation
>   virtio-blk: add some trace events for zoned emulation
>   docs/zoned-storage:add zoned emulation use case
> 
>  block/qapi-sysemu.c                          |  11 +
>  block/qapi.c                                 |  18 +
>  docs/devel/zoned-storage.rst                 |  17 +
>  hw/block/trace-events                        |   7 +
>  hw/block/virtio-blk-common.c                 |   2 +
>  hw/block/virtio-blk.c                        | 405 +++++++++++++++++++
>  hw/virtio/virtio-qmp.c                       |   2 +
>  include/block/accounting.h                   |   1 +
>  include/standard-headers/drm/drm_fourcc.h    |  12 +
>  include/standard-headers/linux/ethtool.h     |  48 ++-
>  include/standard-headers/linux/fuse.h        |  45 ++-
>  include/standard-headers/linux/pci_regs.h    |   1 +
>  include/standard-headers/linux/vhost_types.h |   2 +
>  include/standard-headers/linux/virtio_blk.h  | 105 +++++
>  linux-headers/asm-arm64/kvm.h                |   1 +
>  linux-headers/asm-x86/kvm.h                  |  34 +-
>  linux-headers/linux/kvm.h                    |   9 +
>  linux-headers/linux/vfio.h                   |  15 +-
>  linux-headers/linux/vhost.h                  |   8 +
>  qapi/block-core.json                         |  68 +++-
>  qapi/block.json                              |   4 +
>  21 files changed, 794 insertions(+), 21 deletions(-)
> 
> -- 
> 2.39.2


