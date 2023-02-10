Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577A76928D2
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 21:58:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQaRf-00005S-Dk; Fri, 10 Feb 2023 15:56:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pQaRb-00005E-Hx
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 15:56:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pQaRZ-0001EF-D5
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 15:56:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676062588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4A0bbNtWezaOUgInMGL9UdAdGELBxrNdIvl0jo4bH0M=;
 b=LLRJ2Oy8LQE7beCzQT9SKF0DDDiq1x+9zS5yoqW0KT+iVQj+JIbxm0iTk1WxSemnU264UC
 k8indQ7MwwYTRoXVzBMRXd44Dv1KxOIM49QjWUUqHIDsD6Wc7W5zAlAdtc61HvxttBP/nH
 9TObBElQGdFdYDiKOze4Yx17CcqiVvE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-wpBp-MMEMOiNFgbuJLn77Q-1; Fri, 10 Feb 2023 15:56:24 -0500
X-MC-Unique: wpBp-MMEMOiNFgbuJLn77Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55361811E9C;
 Fri, 10 Feb 2023 20:56:24 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78CC12166B29;
 Fri, 10 Feb 2023 20:56:23 +0000 (UTC)
Date: Fri, 10 Feb 2023 14:56:21 -0600
From: Eric Blake <eblake@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v4 4/4] ram: Document migration ram flags
Message-ID: <20230210205621.jmtqbyd2gsjeycrg@redhat.com>
References: <20230209233730.38288-1-quintela@redhat.com>
 <20230209233730.38288-5-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209233730.38288-5-quintela@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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

On Fri, Feb 10, 2023 at 12:37:30AM +0100, Juan Quintela wrote:
> 0x80 is RAM_SAVE_FLAG_HOOK, it is in qemu-file now.
> Bigger usable flag is 0x200, noticing that.
> We can reuse RAM_SAVe_FLAG_FULL.

SAVE

> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/ram.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 32fab7b5ee..3648cfc357 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -67,22 +67,26 @@
>  /***********************************************************/
>  /* ram save/restore */
>  
> -/* RAM_SAVE_FLAG_ZERO used to be named RAM_SAVE_FLAG_COMPRESS, it
> +/*
> + * RAM_SAVE_FLAG_ZERO used to be named RAM_SAVE_FLAG_COMPRESS, it
>   * worked for pages that where filled with the same char.  We switched

As long as you're in the area,

s/where/were/

>   * it to only search for the zero value.  And to avoid confusion with
>   * RAM_SSAVE_FLAG_COMPRESS_PAGE just rename it.

s/SSAVE/SAVE/

>   */
> -
> -#define RAM_SAVE_FLAG_FULL     0x01 /* Obsolete, not used anymore */
> +/*
> + * RAM_SAVE_FLAG_FULL was obsoleted in 2009, it can be reused now
> + */
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
> +/* We can't use any flag that is bigger than 0x200 */

Spelling fixes are trivial; feel free to add:

Reviewed-by: Eric Blake <eblake@redhat.com>


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


