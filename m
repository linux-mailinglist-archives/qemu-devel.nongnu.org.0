Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3003730E271
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 19:24:54 +0100 (CET)
Received: from localhost ([::1]:43422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Mpg-0005Gb-UC
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 13:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l7Mod-0004Eq-Gw
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 13:23:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l7Mob-0001r1-6H
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 13:23:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612376624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j+iXiIuG4N+32EQ3zfz5EjR12MNtPAniowSSeFZsZSI=;
 b=WXVftPwu4VOZuvQzJtf0aiP52C2a6GVORj8r6aEDPUVYjpQ9DvXlDkRRAfPcdfHd7+L5/e
 phJrX8K6BQU938olXAaMzw+TOrqOVajM0Qw0pVLc4e9oIb+WANOt9Z3f8anEcRWPVcLOJM
 YwCDzbcwM/ptUER2FPLWUsrZWoxpk4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-YzlnpDwxOT-aubmMAwlcYA-1; Wed, 03 Feb 2021 13:23:41 -0500
X-MC-Unique: YzlnpDwxOT-aubmMAwlcYA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3A58AFA89;
 Wed,  3 Feb 2021 18:23:40 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-32.ams2.redhat.com [10.36.115.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A82C5D9E8;
 Wed,  3 Feb 2021 18:23:39 +0000 (UTC)
Date: Wed, 3 Feb 2021 19:23:37 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 19/36] block: fix bdrv_replace_node_common
Message-ID: <20210203182337.GF5507@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-20-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201127144522.29991-20-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
> inore_children thing doesn't help to track all propagated permissions
> of children we want to ignore. The simplest way to correctly update
> permissions is update graph first and then do permission update. In
> this case we just referesh permissions for the whole subgraph (in
> topological-sort defined order) and everything is correctly calculated
> automatically without any ignore_children.
> 
> So, refactor bdrv_replace_node_common to first do graph update and then
> refresh the permissions.
> 
> Test test_parallel_exclusive_write() now pass, so move it out of
> debugging "if".
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> diff --git a/tests/test-bdrv-graph-mod.c b/tests/test-bdrv-graph-mod.c
> index 0d62e05ddb..93a5941a9b 100644
> --- a/tests/test-bdrv-graph-mod.c
> +++ b/tests/test-bdrv-graph-mod.c
> @@ -294,20 +294,11 @@ static void test_parallel_perm_update(void)
>      bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
>  
>      assert(c_fl1->perm & BLK_PERM_WRITE);
> +    bdrv_unref(top);
>  }

Why do have this addition in this patch? Shouldn't the changed function
behave the same as before with respect to referenced nodes?

Kevin


