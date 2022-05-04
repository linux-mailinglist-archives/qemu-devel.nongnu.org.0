Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6F0519A9B
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 10:50:53 +0200 (CEST)
Received: from localhost ([::1]:34302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmAih-0005hX-5h
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 04:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmAeS-0004m3-W7
 for qemu-devel@nongnu.org; Wed, 04 May 2022 04:46:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmAeP-00043h-NO
 for qemu-devel@nongnu.org; Wed, 04 May 2022 04:46:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651653984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u0vA+eQWMnvtBxurd7eTdLcoFRx9/7niHHpi3Vp0fpU=;
 b=Sgmgi5je0RiohURvhQNnEtWN8vE1J6KWUpL5MyD7Ughqme/AMtoS03HCaHLp12aOOSXU+/
 VmnfVlm6u5DYDOZNsOh0rZl7ZI7E4siof3CWKFqcMUBSAzFI7uUHbGWzE8uqocFVG8wq7N
 oEYLhUxTqi0ljqjDWDsj9Uv2BU3uW7w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-KJM57s9zOZGPHEjUrouBKQ-1; Wed, 04 May 2022 04:46:23 -0400
X-MC-Unique: KJM57s9zOZGPHEjUrouBKQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2527829AB3FE;
 Wed,  4 May 2022 08:46:23 +0000 (UTC)
Received: from redhat.com (dhcp-192-180.str.redhat.com [10.33.192.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4985CC28101;
 Wed,  4 May 2022 08:46:22 +0000 (UTC)
Date: Wed, 4 May 2022 10:46:21 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 4/4] block/file: Add file-specific image info
Message-ID: <YnI9XZkxiNNJX3dC@redhat.com>
References: <20220503145529.37070-1-hreitz@redhat.com>
 <20220503145529.37070-5-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503145529.37070-5-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Am 03.05.2022 um 16:55 hat Hanna Reitz geschrieben:
> Add some (optional) information that the file driver can provide for
> image files, namely the extent size.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  qapi/block-core.json | 26 ++++++++++++++++++++++++--
>  block/file-posix.c   | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index e7d6c2e0cc..728da051ae 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -139,16 +139,29 @@
>        '*encryption-format': 'RbdImageEncryptionFormat'
>    } }
>  
> +##
> +# @ImageInfoSpecificFile:
> +#
> +# @extent-size: Extent size (if available)
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'ImageInfoSpecificFile',
> +  'data': {
> +      '*extent-size': 'size'
> +  } }

It's not "the extent size" (the whole point of extents is that they
don't have a fixed size like blocks), but an extent size *hint* that
tells the filesystem the minimum size to allocate for an extent. The
xfs_io man page calls it the preferred extent size for allocatino, which
works for the documentation if you prefer, but BlockdevCreateOptionsFile
has 'extent-size-hint', so I'd prefer consistency on the wire at least.

Kevin


