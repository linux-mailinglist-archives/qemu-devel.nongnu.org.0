Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0B15F9EFC
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 14:59:39 +0200 (CEST)
Received: from localhost ([::1]:37566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohsNe-0000ze-7a
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 08:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ohsKb-0005CE-HE
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 08:56:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ohsKX-000797-MM
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 08:56:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665406584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qhR75YgSxlrJNzFXg24m93WT+osK101u3wFZIkRHw0w=;
 b=dkPXDiKiyReGILrqq65HncHm2vDtaEMxIk1Pn2s4d+W/uSMibtAXAC1XHq3/3nRuRFIPXN
 rnqd7liW/oW+g20dS2yN4vdSD0Mp4BUm1j0tF4G+WOH3mOvia/r7OXUi6mC1Ef8dUP6/DF
 JQwJV+WnZjExu0CCJtDjKnT5VWSXBvU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-BeRWiUFbMYCZ5LJ9aIwpdw-1; Mon, 10 Oct 2022 08:56:23 -0400
X-MC-Unique: BeRWiUFbMYCZ5LJ9aIwpdw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19BC329AA39C;
 Mon, 10 Oct 2022 12:56:23 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B50AB2157F30;
 Mon, 10 Oct 2022 12:56:21 +0000 (UTC)
Date: Mon, 10 Oct 2022 14:56:20 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 08/11] block: use the new _change_ API instead of
 _can_set_ and _set_
Message-ID: <Y0QWdMAoB3HEAHvo@redhat.com>
References: <20220725122120.309236-1-eesposit@redhat.com>
 <20220725122120.309236-9-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725122120.309236-9-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.07.2022 um 14:21 hat Emanuele Giuseppe Esposito geschrieben:
> Replace all direct usage of ->can_set_aio_ctx and ->set_aio_ctx,
> and call bdrv_child_try_change_aio_context() in
> bdrv_try_set_aio_context(), the main function called through
> the whole block layer.
> 
> From this point onwards, ->can_set_aio_ctx and ->set_aio_ctx
> won't be used anymore.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


