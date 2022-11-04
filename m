Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E879861A11A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 20:35:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or2TD-0004To-6L; Fri, 04 Nov 2022 15:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1or2T6-0004TN-GU
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 15:35:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1or2T4-0003Zp-Tn
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 15:35:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667590506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=duWhRfKyGKMvhktLbmzr3JmN/mIgLwjcC5x8/Lq3IHg=;
 b=igc4//1R5IHj9xcGHgrtfh5yuLHsL/1cJE7UXl6OfCiXqGCf4mLSpWYYYs2bxIoeRszz9C
 DCqhx9cr8OYPrHnY71En9vB5RS/UDX4xNy4cF9I7jgb6a1gBftZ/tbTW6R0rOcSdQOxm4m
 8XnCHdse67cwkVkiOHdd8YZbwwk82CQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-dTvy2YbyMxSD5pVY6ffeEQ-1; Fri, 04 Nov 2022 15:35:04 -0400
X-MC-Unique: dTvy2YbyMxSD5pVY6ffeEQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FC22185A79C;
 Fri,  4 Nov 2022 19:35:04 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B359440C835A;
 Fri,  4 Nov 2022 19:35:03 +0000 (UTC)
Date: Fri, 4 Nov 2022 14:35:02 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, michael.roth@amd.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v3 09/30] nbd/server: Clean up abuse of
 BlockExportOptionsNbd member @arg
Message-ID: <20221104193502.l6bg5duodrowbvfp@redhat.com>
References: <20221104160712.3005652-1-armbru@redhat.com>
 <20221104160712.3005652-10-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104160712.3005652-10-armbru@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Nov 04, 2022 at 05:06:51PM +0100, Markus Armbruster wrote:
> block-export-add argument @name defaults to the value of argument
> @node-name.
> 
> nbd_export_create() implements this by copying @node_name to @name.
> It leaves @has_node_name false, violating the "has_node_name ==
> !!node_name" invariant.  Unclean.  Falls apart when we elide
> @has_node_name (next commit): then QAPI frees the same value twice,
> once for @node_name and once @name.  iotest 307 duly explodes.
> 
> Goes back to commit c62d24e906 "blockdev-nbd: Boxed argument type for
> nbd-server-add" (v5.0.0).  Got moved from qmp_nbd_server_add() to
> nbd_export_create() (commit 56ee86261e), then copied back (commit
> b6076afcab).  Commit 8675cbd68b "nbd: Utilize QAPI_CLONE for type
> conversion" (v5.2.0) cleaned up the copy in qmp_nbd_server_add()
> noting
> 
>     Second, our assignment to arg->name is fishy: the generated QAPI code
>     for qapi_free_NbdServerAddOptions does not visit arg->name if
>     arg->has_name is false, but if it DID visit it, we would have
>     introduced a double-free situation when arg is finally freed.
> 
> Exactly.  However, the copy in nbd_export_create() remained dirty.
> 
> Clean it up.  Since the value stored in member @name is not actually
> used outside this function, use a local variable instead of modifying
> the QAPI object.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Cc: qemu-block@nongnu.org
> ---
>  nbd/server.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


