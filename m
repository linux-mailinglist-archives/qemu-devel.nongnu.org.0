Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5134AC7CB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 18:43:26 +0100 (CET)
Received: from localhost ([::1]:49206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH82v-0007PZ-DJ
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 12:43:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nH7RM-0002nx-Fv
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:04:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nH7RI-0002J1-TJ
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:04:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644253457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=015BXLKq9YGvMxl11bCOFmB+TqzlBXwMImDKrXdsqow=;
 b=IvK5+pMpo/4dipaUAuI6/yWaQEE+RmaSk/wqaL0UH09yBcu0YgUGsfL0m3YmadgZI9GBr+
 U5ml8QuoIR6WgQabmHHCXY7N3wIyMDBXsfwkyiIJDfyivHhwxBHPNYNO5iJMY8WUo0YyhJ
 u1Rsx0o0A0hZHGAB0Dozx+iiX2tBLb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-q3A32LSKPHOV0jVTGhBv_g-1; Mon, 07 Feb 2022 12:04:14 -0500
X-MC-Unique: q3A32LSKPHOV0jVTGhBv_g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42565344E4;
 Mon,  7 Feb 2022 17:04:12 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD5CD5BC4C;
 Mon,  7 Feb 2022 17:04:07 +0000 (UTC)
Date: Mon, 7 Feb 2022 18:04:05 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v6 05/33] include/sysemu/block-backend: split header into
 I/O and global state (GS) API
Message-ID: <YgFRBS8GAZUDtqWX@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-6-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220121170544.2049944-6-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 21.01.2022 um 18:05 hat Emanuele Giuseppe Esposito geschrieben:
> Similarly to the previous patches, split block-backend.h
> in block-backend-io.h and block-backend-global-state.h
> 
> In addition, remove "block/block.h" include as it seems
> it is not necessary anymore, together with "qemu/iov.h"
> 
> block-backend-common.h contains the structures shared between
> the two headers, and the functions that can't be categorized as
> I/O or global state.
> 
> Assertions are added in the next patch.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

The same "GS or I/O" category is needed for drain and other polling
functions here (mainly the synchronous I/O functions like blk_pread()
etc.).

Most of these functions just wrap the bdrv_*() counterpart, so I'm not
reviewing them in detail now. I don't expect surprises as long as both
interfaces are consistent.

> diff --git a/block/block-backend.c b/block/block-backend.c
> index 23e727199b..6f91dcc85d 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -79,6 +79,7 @@ struct BlockBackend {
>      bool allow_aio_context_change;
>      bool allow_write_beyond_eof;
>  
> +    /* Protected by BQL lock */
>      NotifierList remove_bs_notifiers, insert_bs_notifiers;
>      QLIST_HEAD(, BlockBackendAioNotifier) aio_notifiers;

This should be just "BQL" (like in patch 2) because the L in "BQL"
already means "lock", so "BQL lock" would be the "Big QEMU lock lock".
(More instances in this patch.)

Kevin


