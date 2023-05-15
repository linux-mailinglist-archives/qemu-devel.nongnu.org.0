Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B73A702E88
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:40:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXvX-0002m4-8U; Mon, 15 May 2023 09:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pyXvU-0002ku-RG
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:07:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pyXvR-00022l-9b
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:07:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684156060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k9Fa0HEhRxdVZe5uNN5yoLI+82dQV9oUN7icIfG9dw4=;
 b=VycLHvFGPzwPuc1a2sb0NJoVDcQzNS0A5pBYmmmILEeuoK/itNYJd4DJXjkKxcjFWwAwDO
 gxwCwVS4p/vvYlGRncO6T7q767qeGD47LT0fUVdo3nyHTAzKESUN7FAInU8xVaWvBXYy4M
 lR2dGdX1dQfIs5VVU2+HSBAET/ao/IY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-5Hgk1FgMPvSwyGuFlCfDkA-1; Mon, 15 May 2023 09:07:35 -0400
X-MC-Unique: 5Hgk1FgMPvSwyGuFlCfDkA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D40AA867946;
 Mon, 15 May 2023 13:07:33 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.135])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 209431121315;
 Mon, 15 May 2023 13:07:32 +0000 (UTC)
Date: Mon, 15 May 2023 15:07:31 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-block@nongnu.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PULL 09/28] block: bdrv/blk_co_unref() for calls in coroutine
 context
Message-ID: <ZGIuk9w6t9m+sYbN@redhat.com>
References: <20230510122111.46566-1-kwolf@redhat.com>
 <20230510122111.46566-10-kwolf@redhat.com>
 <e91bbebc-3b28-c05a-293c-c02f1fefe085@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e91bbebc-3b28-c05a-293c-c02f1fefe085@msgid.tls.msk.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 11.05.2023 um 17:32 hat Michael Tokarev geschrieben:
> 10.05.2023 15:20, Kevin Wolf wrote:
> > These functions must not be called in coroutine context, because they
> > need write access to the graph.
> 
> How important for this and 2 surrounding changes to be for 7.2-stable
> (if we'll ever release one)? It smells like real bugs are being fixed
> here, is it ever possible to hit those in 7.2?
> 
> Provided that whole no_coroutine_fn &Co infrastructure is missing there,
> including the no_co_wrapper parts?  It's not difficult to back-port some
> of that stuff to 7.2.

In theory this has always been wrong, but we've only seen actual bugs
manifesting in 8.0 with the other multiqueue-related changes. So I think
it's safe to skip them for 7.2.

The bug fixed by the previous patch (bdrv_activate()) might not even
theoretically be a problem while bdrv_co_activate() didn't exist, though
I haven't investigated this in detail.

Kevin


