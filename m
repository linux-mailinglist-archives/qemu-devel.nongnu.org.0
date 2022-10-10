Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A135F9D18
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 12:53:56 +0200 (CEST)
Received: from localhost ([::1]:58852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohqPz-00014H-70
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 06:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ohqMd-0005co-1O
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 06:50:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ohqMZ-0000U1-UK
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 06:50:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665399023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BvNmGgUQRx5CpCyC77okwpQdJRk5SNjdpVFrVp+/Cp4=;
 b=fgDA6nuotQ3omteG2z2NdC5yYURX7cwdJ8bL9wn2Cu2YeTMzxj32ambI3CMS1yZYlpWGiG
 0rtNpJgjLK/3TN4HHyKIpJcohzvL0nuKAuiAEQWOaX2nAu8rl0eRF/omlaKaLXpuOfMiaR
 0vJGNbv0iOrSpcL3QZp8KulZmxiXK3o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-H5WFMztoP4ifP3Gg4E5JKA-1; Mon, 10 Oct 2022 06:50:20 -0400
X-MC-Unique: H5WFMztoP4ifP3Gg4E5JKA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C206F185A792;
 Mon, 10 Oct 2022 10:50:19 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44ACF112D401;
 Mon, 10 Oct 2022 10:50:15 +0000 (UTC)
Date: Mon, 10 Oct 2022 12:50:14 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 07/11] block-backend: implement .change_aio_ctx in
 child_root
Message-ID: <Y0P45nyuqwlTS7Tu@redhat.com>
References: <20220725122120.309236-1-eesposit@redhat.com>
 <20220725122120.309236-8-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725122120.309236-8-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.07.2022 um 14:21 hat Emanuele Giuseppe Esposito geschrieben:
> blk_root_change_aio_ctx() is very similar to blk_root_can_set_aio_ctx(),
> but implements a new transaction so that if all check pass, the new
> transaction's .commit will take care of changing the BlockBackend
> AioContext. blk_root_set_aio_ctx_commit() is the same as
> blk_root_set_aio_ctx().
> 
> Note: bdrv_child_try_change_aio_context() is not called by
> anyone at this point.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


