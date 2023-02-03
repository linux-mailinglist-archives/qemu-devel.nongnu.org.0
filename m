Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFBF68A668
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 23:59:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO50L-0001r8-7j; Fri, 03 Feb 2023 17:58:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pO50J-0001qo-87
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 17:57:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pO50H-0005f5-Fe
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 17:57:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675465076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a+NSP+Z0EW/ZlCEuvyAcfW+6bx7FMmyj9/emoJ4Rgyo=;
 b=Lrts81l6ejxHBjedK/usHoOdzIiDJ7X+/mRDufcv73iJt20qhWNRg6GG7QG7bdMUDNhQHB
 qm/t8D+fytO9JHCPWztdjGsSqlv/gSROaH+juzdjSqSS52JhDOOdkQpQXf2r/RZzniQ0sj
 5va5lDvGZMyN208fheAtmO1p0KrYiUk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-Ly5yFhMbPAmxrFYc9MQ_ZQ-1; Fri, 03 Feb 2023 17:57:55 -0500
X-MC-Unique: Ly5yFhMbPAmxrFYc9MQ_ZQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23371811E6E;
 Fri,  3 Feb 2023 22:57:55 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A46A492C14;
 Fri,  3 Feb 2023 22:57:54 +0000 (UTC)
Date: Fri, 3 Feb 2023 16:57:52 -0600
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, mjt@tls.msk.ru
Subject: Re: [PATCH 4/5] docs: flesh out qcow2 format driver description
Message-ID: <20230203225752.syg2j5p24wtldu4t@redhat.com>
References: <20230201211234.301918-1-stefanha@redhat.com>
 <20230201211234.301918-5-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201211234.301918-5-stefanha@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

On Wed, Feb 01, 2023 at 04:12:33PM -0500, Stefan Hajnoczi wrote:
> Put the create options in alphabetical order, add compression_type and
> extended_l2, and also mention the common runtime options. I did not add
> rarely-used runtime options because I think it's too much information.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/system/qemu-block-drivers.rst.inc | 91 ++++++++++++++++++++------
>  1 file changed, 70 insertions(+), 21 deletions(-)
> 
> diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
> index ec9ebb2066..af72817763 100644
> --- a/docs/system/qemu-block-drivers.rst.inc
> +++ b/docs/system/qemu-block-drivers.rst.inc
> @@ -59,13 +59,27 @@ options that are supported for it.
>  .. option:: qcow2
>  
>    QEMU image format, the most versatile format. Use it to have smaller
> -  images (useful if your filesystem does not supports holes, for example
> -  on Windows), zlib based compression and support of multiple VM
> +  images (useful if your filesystem does not support holes, for example
> +  on Windows), zlib/zstd compression and support of multiple VM

And sneaking in a grammar fix for "support", I see ;)

Reviewed-by: Eric Blake <eblake@Redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


