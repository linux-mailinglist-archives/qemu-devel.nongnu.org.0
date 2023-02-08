Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C42268F8D3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 21:29:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPr48-0004F7-KC; Wed, 08 Feb 2023 15:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pPr44-0004C4-WD
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:29:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pPr43-0004Kg-JA
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:29:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675888151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VEONUuggXGbalrKqGIq3f5EkWJtOSr859FITpoBU2so=;
 b=bZRuxVK4oeGb3unF/uMi427eNmxSbWWmgVjKNS+wa1yHpbiE0r+k7nZNDodZwMNLckBdDz
 nHfBY1dkCFCqH/7nzOX6j+F7NakksAPyemOYlIghuedK/tcc9IBOLhLVHl/cTCJIxqKVBD
 WIucrWg/EytakuKZbe1tk5lVnKvBT5c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-WPUJRP7gM6mqRrE0Oi983A-1; Wed, 08 Feb 2023 15:29:07 -0500
X-MC-Unique: WPUJRP7gM6mqRrE0Oi983A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22B6685D064;
 Wed,  8 Feb 2023 20:29:07 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70831492C3F;
 Wed,  8 Feb 2023 20:29:06 +0000 (UTC)
Date: Wed, 8 Feb 2023 14:29:04 -0600
From: Eric Blake <eblake@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v3 6/6] ram: Document migration ram flags
Message-ID: <20230208202904.u7j3iu6ddsitg5zi@redhat.com>
References: <20230208133010.17323-1-quintela@redhat.com>
 <20230208133010.17323-7-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208133010.17323-7-quintela@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

On Wed, Feb 08, 2023 at 02:30:10PM +0100, Juan Quintela wrote:
> 0x80 is RAM_SAVE_FLAG_HOOK, it is in qemu-file now.
> Bigger usable flag is 0x200, noticing that.
> We can reuse RAM_SAVE_FLAG_FULL.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/ram.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 7952d5f01c..d95e26c03c 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -73,16 +73,19 @@
>   * RAM_SSAVE_FLAG_COMPRESS_PAGE just rename it.
>   */
>  
> -#define RAM_SAVE_FLAG_FULL     0x01 /* Obsolete, not used anymore */
> +/* RAM_SAVE_FLAG_FULL has been obsoleted since at least 2009, we can
> + * reuse it */

How about:

/* RAM_SAVE_FLAG_FULL was obsoleted in 2009, it can be reused now */

> +#define RAM_SAVE_FLAG_FULL     0x01
>  #define RAM_SAVE_FLAG_ZERO     0x02
>  #define RAM_SAVE_FLAG_MEM_SIZE 0x04
>  #define RAM_SAVE_FLAG_PAGE     0x08
>  #define RAM_SAVE_FLAG_EOS      0x10
>  #define RAM_SAVE_FLAG_CONTINUE 0x20
>  #define RAM_SAVE_FLAG_XBZRLE   0x40
> -/* 0x80 is reserved in migration.h start with 0x100 next */
> +/* 0x80 is reserved in qemu-file.h for RAM_SAVE_FLAG_HOOK */
>  #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
>  #define RAM_SAVE_FLAG_MULTIFD_SYNC     0x200
> +/* We can't use any flag that is bigger that 0x200 */

s/that is bigger that/bigger than/

>  
>  XBZRLECacheStats xbzrle_counters;
>  
> -- 
> 2.39.1
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


