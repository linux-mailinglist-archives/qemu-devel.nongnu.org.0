Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC69699268
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 11:57:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSbwJ-0004fy-68; Thu, 16 Feb 2023 05:56:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pSbw7-0004ap-SH
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:56:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pSbw6-0002ZA-34
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:56:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676544980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xYn5R0dnNWiiEGZ4+fYrWgCIjsgKLgddyXUljf1pquY=;
 b=E4tTGehWyid4Sp/hAXQUBGpvB4iApl5l5cvyCDP+XMMbZAwzRsZho8d7/wgh3jaVNcMu2j
 q6+AQhbcFhqa/tprm4KyBhGlDJXtscHunqkoQQ+YSd/rq/z7S3Hvnwi4yS2I13LGe+AsAN
 asli/63Pj1YaFgHkIHhXFwUWjHodZvs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-j9y23RCjOaOWEbDCuY_Eqg-1; Thu, 16 Feb 2023 05:56:17 -0500
X-MC-Unique: j9y23RCjOaOWEbDCuY_Eqg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BE593C14860;
 Thu, 16 Feb 2023 10:56:17 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6620492B17;
 Thu, 16 Feb 2023 10:56:15 +0000 (UTC)
Date: Thu, 16 Feb 2023 11:56:14 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: "Denis V. Lunev" <den@openvz.org>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: Re: [PATCH 1/1] block: improve error logging in bdrv_reopen_prepare()
Message-ID: <Y+4LzlLXuv90fKve@redhat.com>
References: <20230213103134.1703111-1-den@openvz.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213103134.1703111-1-den@openvz.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 13.02.2023 um 11:31 hat Denis V. Lunev geschrieben:
> The error generated when the option could not be changed inside
> bdrv_reopen_prepare() does not give a clue about problematic
> BlockDriverState as we could get very long tree of devices.
> 
> The patch adds node name to the error report in the same way as done
> above.
> 
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Hanna Reitz <hreitz@redhat.com>
> CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Truly fascinating how inconsistent error reporting is in
bdrv_reopen_prepare(). Some places use the node name, some places device
or node name, some places filename and some places nothing. Your choice
is as good as any.

The only problem I can see with this patch is that qemu-iotests 245
needs an update, too.

Kevin


