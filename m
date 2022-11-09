Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 118FC622BB3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 13:37:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oskKD-0001LU-6S; Wed, 09 Nov 2022 07:37:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oskKB-0001K4-3e
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 07:36:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oskK9-00085D-FI
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 07:36:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667997416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/ukSIsHSPBZGiWqwFecW4OFx9FOR5HhGS0CLQ7P26EM=;
 b=Ol25S6vTEiUehWhAQoUw8P0nDFkEkKdBOaDMCw6rNKoMmb1rdDg3PXFFVWCNyq3Kfg/Zt3
 GKxWC00NxOBEga2cLjmDUST3WMUR24H6kxuRcmT6VjqLL96DjvqCKBxlrN2NSiTSf4kf1E
 SJ2Km7Z6PjMAK/lyVDlAMmkEbUMw5sc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-LL0iLvBKOa-6WhM-AxnFoQ-1; Wed, 09 Nov 2022 07:36:55 -0500
X-MC-Unique: LL0iLvBKOa-6WhM-AxnFoQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC09F833A0F;
 Wed,  9 Nov 2022 12:36:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1AB1492B17;
 Wed,  9 Nov 2022 12:36:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 93D1921E6921; Wed,  9 Nov 2022 13:36:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  Keith Busch
 <kbusch@kernel.org>,  Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH 1/2] hw/nvme: fix incorrect use of errp/local_err
References: <20221109105357.30430-1-its@irrelevant.dk>
 <20221109105357.30430-2-its@irrelevant.dk>
Date: Wed, 09 Nov 2022 13:36:53 +0100
In-Reply-To: <20221109105357.30430-2-its@irrelevant.dk> (Klaus Jensen's
 message of "Wed, 9 Nov 2022 11:53:56 +0100")
Message-ID: <87a650nw2i.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Klaus Jensen <its@irrelevant.dk> writes:

> From: Klaus Jensen <k.jensen@samsung.com>
>
> Make nvme_check_constraints() return an int and fix incorrect use of
> errp/local_err.
>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

One more question: what exactly do you mean by "incorrect use of
errp/local_err"?  Is it incorrect in the sense of "behaves badly", or
merely in the sense of "doesn't use the Error API the way it wants to be
used"?


