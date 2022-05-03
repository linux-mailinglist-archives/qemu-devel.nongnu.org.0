Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9F5518C9E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 20:52:17 +0200 (CEST)
Received: from localhost ([::1]:43154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlxdA-0000u9-PZ
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 14:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nlxZW-0007oV-7T
 for qemu-devel@nongnu.org; Tue, 03 May 2022 14:48:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nlxZU-0001xp-Jp
 for qemu-devel@nongnu.org; Tue, 03 May 2022 14:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651603708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ho06QajLtin9k8DTDAt/m8Rezlnq/nM3DPRxTsYPk9I=;
 b=AfbqXJlDgPFZDj/QpMmnp3QZ8mmeZOx9kUueNCz5KbcOOJP9Eu/ClWS/N60JeKoRIP1yCg
 q9qXZCNctnpSoC3vG8Y6ORUngsye7GjFD45GFLntguIwBpNw6c3a4Ss5oanpkzi4j4cYUc
 xYc7gIzqOC7BdhX3g8y6Y9sZhN3rrPk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-IePC-WPdMsmkK33o41keUw-1; Tue, 03 May 2022 14:48:26 -0400
X-MC-Unique: IePC-WPdMsmkK33o41keUw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8433E3C13A08;
 Tue,  3 May 2022 18:48:05 +0000 (UTC)
Received: from redhat.com (unknown [10.22.10.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 195D4112131E;
 Tue,  3 May 2022 18:48:05 +0000 (UTC)
Date: Tue, 3 May 2022 13:48:03 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 3/4] block: Print protocol-specific information
Message-ID: <20220503184803.dgouwfwc6rsflui2@redhat.com>
References: <20220503145529.37070-1-hreitz@redhat.com>
 <20220503145529.37070-4-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503145529.37070-4-hreitz@redhat.com>
User-Agent: NeoMutt/20220415-26-c08bba
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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

On Tue, May 03, 2022 at 04:55:28PM +0200, Hanna Reitz wrote:
> Make bdrv_image_info_dump() print protocol-specific information.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  block/qapi.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

(and now I should probably go write a patch to expose protocol
information for NBD...)

> 
> diff --git a/block/qapi.c b/block/qapi.c
> index 293983cf82..169ea08f70 100644
> --- a/block/qapi.c
> +++ b/block/qapi.c
> @@ -921,4 +921,9 @@ void bdrv_image_info_dump(ImageInfo *info)
>          bdrv_image_info_specific_dump(info->format_specific,
>                                        "Format specific information:\n");
>      }
> +
> +    if (info->has_protocol_specific) {
> +        bdrv_image_info_specific_dump(info->protocol_specific,
> +                                      "Protocol specific information:\n");
> +    }
>  }
> -- 
> 2.35.1
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


