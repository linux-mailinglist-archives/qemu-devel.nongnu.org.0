Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058756EE974
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 23:15:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prPzq-0004Tu-KF; Tue, 25 Apr 2023 17:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1prPzo-0004TA-23
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 17:14:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1prPzm-0002KA-ME
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 17:14:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682457282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ljl/ynVwXIddBM56SZda5zvUn/5e6TZt8C6YM77Pl8c=;
 b=NbsGOxxck1okK9vtqce1cPmkAikAZOhhRCH46Ry3D4NHWNurAvdigh0PM6wmEqGf1BmSwM
 9LNzTkxaTlIPJdGLOS6fJRQMKcYZ8eqpC9vGidn5Lmge3XcgOgBcK6HdmRrJjjGZnoS9O1
 OA9M0EfzkHr422rZ/qbDUOhVlzowM44=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-m4-utMZLMqm4986HCTlRmQ-1; Tue, 25 Apr 2023 17:14:38 -0400
X-MC-Unique: m4-utMZLMqm4986HCTlRmQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F9481C05153;
 Tue, 25 Apr 2023 21:14:38 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84CCB2166B3A;
 Tue, 25 Apr 2023 21:14:37 +0000 (UTC)
Date: Tue, 25 Apr 2023 16:14:35 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, stefanha@redhat.com, pbonzini@redhat.com, 
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 15/20] block: Mark bdrv_co_debug_event() GRAPH_RDLOCK
Message-ID: <wbaypoi2ezaiuvetxttpp2mn7j3wdcxxt7ob77g4jss4wujl6y@fsnjs2fynuk4>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-16-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-16-kwolf@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, Apr 25, 2023 at 07:31:53PM +0200, Kevin Wolf wrote:
> From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> This adds GRAPH_RDLOCK annotations to declare that callers of
> bdrv_co_debug_event() need to hold a reader lock for the graph.
> 
> Unfortunately we cannot use a co_wrapper_bdrv_rdlock, because the
> function is called by mixed functions that run both in coroutine and
> non-coroutine context (for example blkdebug_open).

Is this statement still true after 8/20?

> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/block/block-io.h         | 9 +++++----
>  include/block/block_int-common.h | 4 ++--
>  block.c                          | 2 ++
>  3 files changed, 9 insertions(+), 6 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


