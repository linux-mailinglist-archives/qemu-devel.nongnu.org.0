Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7155230FD0E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:40:25 +0100 (CET)
Received: from localhost ([::1]:49226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kUK-0001Og-GH
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:40:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7k3a-0006o3-Gd
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:12:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7k3U-0003KV-Kh
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:12:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612465959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/S/vPiuri+VcnxOR3odXhOyHk6J6l1IgNDQ8N0YMiwc=;
 b=MqQimh/r2GBOK7zPP/Ue/IUoph08CUIfpMvhmsMAqXBdpJLBL1HNguML9B+IaTVVdhHoKd
 5o/a+3mvVjdtzVLm+uR/aY96lGuhJKzYkcv68A7EiIT1OKvYBfE9K/CJJmeAudBLXlLej/
 NBhrKG/LIK3nABKXAsyPbfTLUyziqww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-yUv16Di4NmuTP_hCW_W7QA-1; Thu, 04 Feb 2021 14:12:14 -0500
X-MC-Unique: yUv16Di4NmuTP_hCW_W7QA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3A3479EC1;
 Thu,  4 Feb 2021 19:12:13 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07F2B5C257;
 Thu,  4 Feb 2021 19:12:12 +0000 (UTC)
Subject: Re: [PATCH 1/2] migration: dirty-bitmap: Convert alias map inner
 members to a struct
To: Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org
References: <cover.1612356810.git.pkrempa@redhat.com>
 <8e40a7337e3b9a0a4f11ee3b0e2f3ae4c76f2dbd.1612356810.git.pkrempa@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f340cee7-21fd-4398-2d0f-a9c68c44be72@redhat.com>
Date: Thu, 4 Feb 2021 13:12:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <8e40a7337e3b9a0a4f11ee3b0e2f3ae4c76f2dbd.1612356810.git.pkrempa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 6:59 AM, Peter Krempa wrote:
> Currently the alias mapping hash stores just strings of the target
> objects internally. In further patches we'll be adding another member
> which will need to be stored in the map so convert the members to a
> struct.
> 
> Signed-off-by: Peter Krempa <pkrempa@redhat.com>
> ---
>  migration/block-dirty-bitmap.c | 37 ++++++++++++++++++++++++++++------
>  1 file changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
> index c61d382be8..b0403dd00c 100644
> --- a/migration/block-dirty-bitmap.c
> +++ b/migration/block-dirty-bitmap.c
> @@ -169,6 +169,18 @@ typedef struct DBMState {
> 
>  static DBMState dbm_state;
> 
> +typedef struct AliasMapInnerBitmap {
> +    char *string;
> +} AliasMapInnerBitmap;
> +
> +static void free_alias_map_inner_bitmap(void *amin_ptr)
> +{
> +    AliasMapInnerBitmap *amin = amin_ptr;
> +
> +    g_free(amin->string);

Do we want to allow free_alias_map_inner_bitmap(NULL)?

Looks like this patch works without it, but it's less future proof, so I
can add that if you agree.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


