Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC666F7143
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:41:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoN-0006yi-Ob; Thu, 04 May 2023 13:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1puYpp-00060y-Vd
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:17:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1puYpo-0003yf-DZ
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:17:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683206243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7aFpYmcuATl1gAOaNXAYWy0wCpW9ro2vd1/p/OnTR7M=;
 b=cwWabDHV7XOznOEu+rmxzzacLxgt8WBJiXgBnopO4A2uNk4iK9hcxOieD02jbjXxl45ZTb
 W0Sb9aR/HknTxVCsQ5Rs3uNs8bWlqwvfwMJp5QUBaZ+XexETWKoevw3kdL+lvNvm8/KOFu
 6LhzQGj/4ixgmcT54BIyMO4Kt6eQZ3Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-XLhfm-5MMFO8-CY14BWoXg-1; Thu, 04 May 2023 09:17:20 -0400
X-MC-Unique: XLhfm-5MMFO8-CY14BWoXg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6A0E2999B34;
 Thu,  4 May 2023 13:17:19 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36E7540C94A9;
 Thu,  4 May 2023 13:17:19 +0000 (UTC)
Date: Thu, 4 May 2023 08:17:17 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, stefanha@redhat.com, eesposit@redhat.com, 
 pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 12/20] mirror: Require GRAPH_RDLOCK for accessing a
 node's parent list
Message-ID: <vvrehglysx4vfeuusciyfamfshz54u3dqhqb3cnenjzalysiqi@ekx46ms77hv7>
References: <20230504115750.54437-1-kwolf@redhat.com>
 <20230504115750.54437-13-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504115750.54437-13-kwolf@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, May 04, 2023 at 01:57:42PM +0200, Kevin Wolf wrote:
> This adds GRAPH_RDLOCK annotations to declare that functions accessing
> the parent list of a node need to hold a reader lock for the graph. As
> it happens, they already do.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  block/mirror.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/block/mirror.c b/block/mirror.c
> index 80fa345071..b5c4ae31f3 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -1416,7 +1416,7 @@ static MirrorOp *coroutine_fn active_write_prepare(MirrorBlockJob *s,
>      return op;
>  }
>  
> -static void coroutine_fn active_write_settle(MirrorOp *op)
> +static void coroutine_fn GRAPH_RDLOCK active_write_settle(MirrorOp *op)
>  {
>      uint64_t start_chunk = op->offset / op->s->granularity;
>      uint64_t end_chunk = DIV_ROUND_UP(op->offset + op->bytes,
> -- 
> 2.40.1
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


