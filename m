Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131284AC802
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 18:55:12 +0100 (CET)
Received: from localhost ([::1]:37640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH8EJ-0002c9-57
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 12:55:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nH7bO-0003l0-B3
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:15:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nH7bI-0004Bh-U0
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:14:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644254092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YyNGPDMGS9oQHw1NTjwhW/9ckOh0yg7JwyQovGpBIks=;
 b=e9Eh49QG7kcUN6xY5DpKpELyBYpErjU4IQ7/kte8Kq1GKBRhWlc9KFdPq2eSJnd8w5U8C+
 uoGMy4Ms6iBUiwoGaHpWGKcI4nsoeR3//Wkj3hL3SWOwrkIGWWNgd0CeX0QSZn6yF4SfaA
 itFXPCyfBGrOkgHuHdCiHbXYA4ye5tE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-zrJNCltvNEGYypbx4V34cw-1; Mon, 07 Feb 2022 12:14:48 -0500
X-MC-Unique: zrJNCltvNEGYypbx4V34cw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A091181440E;
 Mon,  7 Feb 2022 17:14:44 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80EE72ED9C;
 Mon,  7 Feb 2022 17:14:39 +0000 (UTC)
Date: Mon, 7 Feb 2022 18:14:37 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v6 09/33] block: introduce assert_bdrv_graph_writable
Message-ID: <YgFTfbE4QyU6D/5F@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-10-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220121170544.2049944-10-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
> We want to be sure that the functions that write the child and
> parent list of a bs are under BQL and drain.
> 
> BQL prevents from concurrent writings from the GS API, while
> drains protect from I/O.
> 
> TODO: drains are missing in some functions using this assert.
> Therefore a proper assertion will fail. Because adding drains
> requires additional discussions, they will be added in future
> series.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

> diff --git a/block/io.c b/block/io.c
> index cb095deeec..3be08cad29 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -734,6 +734,17 @@ void bdrv_drain_all(void)
>      bdrv_drain_all_end();
>  }
>  
> +void assert_bdrv_graph_writable(BlockDriverState *bs)
> +{
> +    /*
> +     * TODO: this function is incomplete. Because the users of this
> +     * assert lack the necessary drains, check only for BQL.
> +     * Once the necessary drains are added,
> +     * assert also for qatomic_read(&bs->quiesce_counter) > 0
> +     */
> +    assert(qemu_in_main_thread());
> +}

This looks like a trivial function that could easily be static inline.

Kevin


