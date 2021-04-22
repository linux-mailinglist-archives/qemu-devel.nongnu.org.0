Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C143686B8
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 20:44:10 +0200 (CEST)
Received: from localhost ([::1]:44364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZeJ7-0002qQ-1L
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 14:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lZeH7-0002KR-BG
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 14:42:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lZeGx-000640-FA
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 14:42:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619116908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xfPGm14YG0zbVr3Lu2fQjqOmkV/VSTm6mBoDPEpfu/g=;
 b=S3cD6e7S+4N/AFvvLuSSQzQ9/xb2n76btw+oubwpdy5EsoDwlsCaqkfF9vEfpmHdWGc+mJ
 HJVTKnKfeydE2zLvXAq3ra36E6Ifs+B+bE+ZXyVnb/pPzzzAZn0v9B6kL/m3k0Nn8l6lcz
 KkH5CCFUD8ZhbTvbWKpH+dSOxOu4ySU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-_879ODCDMOSkQEJqmD_DMQ-1; Thu, 22 Apr 2021 14:41:43 -0400
X-MC-Unique: _879ODCDMOSkQEJqmD_DMQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCF04108C31D;
 Thu, 22 Apr 2021 18:41:20 +0000 (UTC)
Received: from [10.3.113.39] (ovpn-113-39.phx2.redhat.com [10.3.113.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 848695C261;
 Thu, 22 Apr 2021 18:41:20 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] block: Add BDRV_O_NO_SHARE for blk_new_open()
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210422164344.283389-1-kwolf@redhat.com>
 <20210422164344.283389-2-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <3944ca92-87f9-1ffc-8886-91da46632831@redhat.com>
Date: Thu, 22 Apr 2021 13:41:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210422164344.283389-2-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/21 11:43 AM, Kevin Wolf wrote:
> Normally, blk_new_open() just shares all permissions. This was fine
> originally when permissions only protected against uses in the same
> process because no other part of the code would actually get to access
> the block nodes opened with blk_new_open(). However, since we use it for
> file locking now, unsharing permissions becomes desirable.
> 
> Add a new BDRV_O_NO_SHARE flag that is used in blk_new_open() to unshare
> any permissions that can be unshared.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/block/block.h |  1 +
>  block/block-backend.c | 19 +++++++++++++------
>  2 files changed, 14 insertions(+), 6 deletions(-)

> 
> diff --git a/include/block/block.h b/include/block/block.h
> index b3f6e509d4..735db05a39 100644
> --- a/include/block/block.h
> +++ b/include/block/block.h
> @@ -101,6 +101,7 @@ typedef struct HDGeometry {
>      uint32_t cylinders;
>  } HDGeometry;
>  
> +#define BDRV_O_NO_SHARE    0x0001 /* don't share permissons */

permissions


With the typo fix,

Reviewed-by: Eric Blake <eblake@redhat.com>


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


