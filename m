Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB375B965C
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 10:29:58 +0200 (CEST)
Received: from localhost ([::1]:58222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYkFx-0003Bq-MH
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 04:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1oYjsO-0008FE-8z
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:05:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1oYjsL-0002SF-0T
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:05:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663229130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/R1hF4176GC+dGSt3uqWi4HR9wGQeQV5MLxg7jwnUGY=;
 b=BEafRTPf2xEhJBtck20/Q8uiE1qzl6JQtjyXPfTaumWj+OiE5eEDEKhV53ceqjI0Htf4X4
 bZ7Mv7NFfvJtDuTQp7i5Ij8BSl6uRHPQW6FROeQcoEp4KT3T0P2jVBMH+d3m5Tap7wJFBb
 DlpdzrL40kyGmOI88fSsAkTBQS1lQV4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-OIen9jc9Ngq5bkZ3VwCJ_g-1; Thu, 15 Sep 2022 04:05:27 -0400
X-MC-Unique: OIen9jc9Ngq5bkZ3VwCJ_g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E183E1C05AAE;
 Thu, 15 Sep 2022 08:05:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D1E3492CA4;
 Thu, 15 Sep 2022 08:05:22 +0000 (UTC)
Date: Thu, 15 Sep 2022 09:05:20 +0100
From: Eric Blake <eblake@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, dmitry.fomichev@wdc.com,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 damien.lemoal@opensource.wdc.com, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v9 1/7] include: add zoned device structs
Message-ID: <20220915080447.nti5wdhwgwtwv4ft@redhat.com>
References: <20220910052759.27517-1-faithilikerun@gmail.com>
 <20220910052759.27517-2-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220910052759.27517-2-faithilikerun@gmail.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Sat, Sep 10, 2022 at 01:27:53PM +0800, Sam Li wrote:
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> ---
>  include/block/block-common.h | 43 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/include/block/block-common.h b/include/block/block-common.h
> index fdb7306e78..36bd0e480e 100644
> --- a/include/block/block-common.h
> +++ b/include/block/block-common.h
> @@ -49,6 +49,49 @@ typedef struct BlockDriver BlockDriver;
>  typedef struct BdrvChild BdrvChild;
>  typedef struct BdrvChildClass BdrvChildClass;
>  
> +typedef enum BlockZoneOp {
> +    BLK_ZO_OPEN,
> +    BLK_ZO_CLOSE,
> +    BLK_ZO_FINISH,
> +    BLK_ZO_RESET,
> +} BlockZoneOp;
> +
> +typedef enum BlockZoneModel {
> +    BLK_Z_NONE = 0x0, /* Regular block device */
> +    BLK_Z_HM = 0x1, /* Host-managed zoned block device */
> +    BLK_Z_HA = 0x2, /* Host-aware zoned block device */
> +} BlockZoneModel;
> +
> +typedef enum BlockZoneCondition {
> +    BLK_ZS_NOT_WP = 0x0,
> +    BLK_ZS_EMPTY = 0x1,
> +    BLK_ZS_IOPEN = 0x2,
> +    BLK_ZS_EOPEN = 0x3,
> +    BLK_ZS_CLOSED = 0x4,
> +    BLK_ZS_RDONLY = 0xD,
> +    BLK_ZS_FULL = 0xE,
> +    BLK_ZS_OFFLINE = 0xF,
> +} BlockZoneCondition;
> +
> +typedef enum BlockZoneType {
> +    BLK_ZT_CONV = 0x1, /* Conventional random writes supported */
> +    BLK_ZT_SWR = 0x2, /* Sequential writes required */
> +    BLK_ZT_SWP = 0x3, /* Sequential writes preferred */
> +} BlockZoneType;
> +
> +/*
> + * Zone descriptor data structure.
> + * Provides information on a zone with all position and size values in bytes.

I'm glad that you chose bytes here for use in qemu.  But since the
kernel struct blk_zone uses sectors instead of bytes, is it worth
adding a sentence that we intentionally use bytes here, different from
Linux, to make it easier for reviewers to realize that scaling when
translating between qemu and kernel is necessary?

> + */
> +typedef struct BlockZoneDescriptor {
> +    uint64_t start;
> +    uint64_t length;
> +    uint64_t cap;
> +    uint64_t wp;
> +    BlockZoneType type;
> +    BlockZoneCondition cond;
> +} BlockZoneDescriptor;
> +
>  typedef struct BlockDriverInfo {
>      /* in bytes, 0 if irrelevant */
>      int cluster_size;
> -- 
> 2.37.3
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


