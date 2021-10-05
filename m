Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5D6422F24
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:24:26 +0200 (CEST)
Received: from localhost ([::1]:33230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXoAz-00021o-PK
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mXnKA-0000x8-H5
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:29:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mXnK8-0001An-EO
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633451386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3uxsHAh16LiJJ8PCbuevPNImpiaNMLfYHzrBbzHgc8w=;
 b=WcBEOqLFmaFxcrFpaXDH27saRp6YiEKf/uaQ23zx55HPWTczscRmkEhjfQps9/kBQI/K1y
 0HQtO+uMZdXFuUH+6WSrbw0IojanRrku6uT/9p5nQSG/ytLQwWz6i+TjbEUhDffEi4/4+M
 3kEtzlYRNzmMQoGg+dSpM6N5yvd/YAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-uAk6kxosNTKm5u6nBgk9PQ-1; Tue, 05 Oct 2021 12:29:44 -0400
X-MC-Unique: uAk6kxosNTKm5u6nBgk9PQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC77CEC1CE;
 Tue,  5 Oct 2021 16:29:42 +0000 (UTC)
Received: from redhat.com (ovpn-113-79.phx2.redhat.com [10.3.113.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C821F17A82;
 Tue,  5 Oct 2021 16:29:16 +0000 (UTC)
Date: Tue, 5 Oct 2021 11:29:15 -0500
From: Eric Blake <eblake@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 03/25] block/block-backend.c: assertions for
 block-backend
Message-ID: <20211005162915.mywhslrram67sxfo@redhat.com>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-4-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-4-eesposit@redhat.com>
User-Agent: NeoMutt/20210205-814-5cca94
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 10:31:53AM -0400, Emanuele Giuseppe Esposito wrote:
> All the global state (GS) API functions will check that
> qemu_in_main_thread() returns true. If not, it means
> that the safety of BQL cannot be guaranteed, and
> they need to be moved to I/O.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block/block-backend.c  | 89 +++++++++++++++++++++++++++++++++++++++++-
>  softmmu/qdev-monitor.c |  2 +
>  2 files changed, 90 insertions(+), 1 deletion(-)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index d31ae16b99..9cd3b27b53 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -227,6 +227,7 @@ static void blk_root_activate(BdrvChild *child, Error **errp)
>  
>  void blk_set_force_allow_inactivate(BlockBackend *blk)
>  {
> +    g_assert(qemu_in_main_thread());

Why g_assert()?

> @@ -661,6 +676,7 @@ bool monitor_add_blk(BlockBackend *blk, const char *name, Error **errp)
>  {
>      assert(!blk->name);
>      assert(name && name[0]);
> +    g_assert(qemu_in_main_thread());

especially why mixed spellings?

Per osdep.h, we don't support builds with NDEBUG or G_DISABLE_ASSERT
defined to their non-default values, so behavior isn't really
different, but consistency says we use 'assert' more frequently than
'g_assert'.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


