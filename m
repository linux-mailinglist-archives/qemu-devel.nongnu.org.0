Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 421295F7A70
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 17:23:03 +0200 (CEST)
Received: from localhost ([::1]:58392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogpBl-00026K-QP
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 11:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogoYG-0001si-Bb
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 10:42:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogoYB-0007k0-JZ
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 10:42:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665153726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V45D+iK9mMR3hQimkEg2Ef/QSyhL1orwW//0SmBcJFc=;
 b=GbJjCRmoUGaA8iMWhevFr7zPWncXvDUwqb0NnqMzDcijLn5A11O2sLaRYvelcEA+Auaimh
 MrGAPvLtwEw/JP4KMajZjsFAG6a4j+1gL6488i/Ud2AIIsIbCRNZgiFivQO3x3LQQht7dE
 yTsBAgX/KahhAk4IzeXr8LyXEC/ljcU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-IHoJ7H-yPdqXQVG1ec4e7Q-1; Fri, 07 Oct 2022 10:42:04 -0400
X-MC-Unique: IHoJ7H-yPdqXQVG1ec4e7Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A0BB85A59D;
 Fri,  7 Oct 2022 14:42:04 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D2D29D491;
 Fri,  7 Oct 2022 14:42:02 +0000 (UTC)
Date: Fri, 7 Oct 2022 16:42:01 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 01/11] block.c: assert bs->aio_context is written
 under BQL and drains
Message-ID: <Y0A6ucki/jdavty8@redhat.com>
References: <20220725122120.309236-1-eesposit@redhat.com>
 <20220725122120.309236-2-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725122120.309236-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
> Also here ->aio_context is read by I/O threads and written
> under BQL.
> 
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


