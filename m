Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F804AC871
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 19:23:24 +0100 (CET)
Received: from localhost ([::1]:45904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH8fb-0003MV-40
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 13:23:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nH8X5-0004Ef-MB
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 13:14:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nH8Wx-0006cn-K8
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 13:14:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644257666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GNC9Jj+0JSLhy1NsWrLfGx0fF4M/lgLgX10fVvSh71E=;
 b=a6I5zKvLu3M+vE6dOxoEuCSdt7pVuv1AlMQqf29ElFj0BN7FuXzKBq3Y/Bhtj0/g8K6J6M
 Eq3s0l9HoJtczn6FFAGIGqRm3GYUEyRIHMPtyDNeyFogxHTJw6+gn/mMr12zhAIDghTlVx
 U7f0lW17YYHvPhqQJwKNWmTVZwFM3Hk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-k1NCabX9PR2OL73eJrtwPQ-1; Mon, 07 Feb 2022 13:14:23 -0500
X-MC-Unique: k1NCabX9PR2OL73eJrtwPQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20D60196E6C1;
 Mon,  7 Feb 2022 18:14:21 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B2AB8795D;
 Mon,  7 Feb 2022 18:14:16 +0000 (UTC)
Date: Mon, 7 Feb 2022 19:14:14 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v6 31/33] include/qemu/job.h: introduce job->pre_run()
 and use it in amend
Message-ID: <YgFhdrOXde2CdyOE@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-32-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220121170544.2049944-32-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
> Introduce .pre_run() job callback. This cb will run in job_start,
> before the coroutine is created and runs run() in the job aiocontext.
> 
> Therefore, .pre_run() always runs in the main loop.
> We can use this function together with clean() cb to replace
> bdrv_child_refresh_perms in block_crypto_amend_options_generic_luks(),
> since that function can also be called from an iothread via
> .bdrv_co_amend().

How is this different from having the same code in the function that
creates the job, i.e. qmp_x_blockdev_amend()?

Almost all block jobs have some setup code in the function that creates
the job instead of doing everything in .run(), precisely because they
know this code runs in the main thread.

Is amend really so different from the other block jobs in this respect
that it needs a different solution?

> In addition, doing so we check for permissions in all bdrv
> in amend, not only crypto.
> 
> .pre_run() and .clean() take care of calling bdrv_amend_pre_run()
> and bdrv_amend_clean() respectively, to set up driver-specific flags
> and allow the crypto driver to temporarly provide the WRITE
> perm to qcrypto_block_amend_options().
> 
> .pre_run() is not yet invoked by job_start, but .clean() is.
> This is not a problem, since it will just be a redundant check
> and crypto will have the update->keys flag == false anyways.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

I find the way how you split the patches a bit confusing because the
patches aren't self-contained, but always refer to what the code will do
in the future, because after the patch it's dead code that isn't even
theoretically called until the final patch comes in.

Can we restructure this a bit? First a patch that adds a new JobDriver
callback (if really needed) along with the actual calls for it and
everything else that needs to be touched in the generic job
infrastructure. Second, new BlockDriver callbacks with all of the
plumbing code. Third, the amend job changes with a patch that doesn't
touch anything but block/amend.c and potentially block/crypto.c (the
latter could also be another separate patch).

This change with three or four patches could also be a candidate to be
split out into a separate smaller series.

Kevin


