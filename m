Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E59B31A548
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:23:21 +0100 (CET)
Received: from localhost ([::1]:52812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAe2C-0000jH-JU
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:23:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAdVq-0002LP-9V
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAdVn-0007zf-T7
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613155790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U1LxCV0qrxG0iwcBCr4sh0kpsUEPjRmIXi2svmIks+s=;
 b=ewmvpVrMgvVRB2TCQo4NZi5oxMdIKNMgJNSmARzLohWj3kPwZZZSC0G9FSgmGCvE60UyKD
 Ke8zH8ZTn3VuvS3Z6DbAR04ddbciSxwSJsDuwxwT6lq2bCDTq9qLpfizOcXOA9Xp7mExXF
 lcsw5kNXMJ4BEjF7CL76MeIovpUAC9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-SBITr6wFPLySrJ4U5DCqaA-1; Fri, 12 Feb 2021 13:49:48 -0500
X-MC-Unique: SBITr6wFPLySrJ4U5DCqaA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C13FB1020C30;
 Fri, 12 Feb 2021 18:49:46 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CBE650DDB;
 Fri, 12 Feb 2021 18:49:46 +0000 (UTC)
To: Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org
References: <cover.1613150869.git.pkrempa@redhat.com>
 <b20afb675917b86f6359ac3591166ac6d4233573.1613150869.git.pkrempa@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v3 2/3] migration: dirty-bitmap: Allow control of bitmap
 persistence
Message-ID: <1d60ed69-fa46-6698-a93b-2bf215f1fbdb@redhat.com>
Date: Fri, 12 Feb 2021 12:49:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b20afb675917b86f6359ac3591166ac6d4233573.1613150869.git.pkrempa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 11:34 AM, Peter Krempa wrote:
> Bitmap's source persistence is transported over the migration stream and
> the destination mirrors it. In some cases the destination might want to
> persist bitmaps which are not persistent on the source (e.g. the result
> of merge of bitmaps from a number of layers on the source when migrating

Sorry for not proposing this grammar tweak earlier, but
s/merge of/merging/

> into a squashed image) but currently it would need to create another set
> of persistent bitmaps and merge them.
> 
> This patch adds a 'transform' property to the alias map which allows to
> override the persistence of migrated bitmaps both on the source and

Once again, we encounter the non-idiomatic "allows to ${VERB}"; the
easiest solutions are "allows ${SUBJECT} to ${VERB}" or "allows
${VERB}ing". I'll go with the latter.

> destination sides.
> 
> Signed-off-by: Peter Krempa <pkrempa@redhat.com>
> ---
>  migration/block-dirty-bitmap.c | 30 +++++++++++++++++++++++++++---
>  qapi/migration.json            | 19 ++++++++++++++++++-
>  2 files changed, 45 insertions(+), 4 deletions(-)
> 

> @@ -806,7 +819,16 @@ static int dirty_bitmap_load_start(QEMUFile *f, DBMLoadState *s)
>          return -EINVAL;
>      }
> 
> -    if (flags & DIRTY_BITMAP_MIG_START_FLAG_PERSISTENT) {
> +    if (s->bmap_inner &&
> +        s->bmap_inner->has_transform &&
> +        s->bmap_inner->transform &&

This leg of the conjunction is always true (if has_transform is set,
transform is necessarily non-NULL).

> +        s->bmap_inner->transform->has_persistent) {
> +        persistent = s->bmap_inner->transform->persistent;
> +    } else {
> +        persistent = flags & DIRTY_BITMAP_MIG_START_FLAG_PERSISTENT;
> +    }
> +
> +    if (persistent) {
>          bdrv_dirty_bitmap_set_persistence(s->bitmap, true);
>      }
> 

> @@ -544,12 +557,16 @@
>  # @alias: An alias name for migration (for example the bitmap name on
>  #         the opposite site).
>  #
> +# @transform: Allows to modify properties of the migrated bitmap.

Allows the modification of

I can make those tweaks while queuing.
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


