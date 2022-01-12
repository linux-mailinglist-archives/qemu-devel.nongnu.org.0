Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F4048C518
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 14:49:53 +0100 (CET)
Received: from localhost ([::1]:52302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7e0e-0002ro-Bi
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 08:49:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n7cka-00083j-EH
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 07:29:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n7ckX-0004XU-8M
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 07:29:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641990548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hyxh/c3huptLwXjjPvFMEyHeVFndbV/RtH6+x2c9/gQ=;
 b=f94Ah2aEbx26uJZwdlKQhaqf0J60cUq5SQYosSzsX1aPacbts67/m0yQ29Ed2S+03+eP4R
 /xHz8d+bnwvKYjk0Abuh2mbWCdfYUrMD6emNNTLUNpqsJLEePYrQPyY20cXlIOfBbiefLi
 MrHYrCDclGJ3d1tl0JdcXpGQ8WsNZWM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-HrS3sVZbP4iy22DLoLlLtA-1; Wed, 12 Jan 2022 07:29:05 -0500
X-MC-Unique: HrS3sVZbP4iy22DLoLlLtA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96E0581EE62;
 Wed, 12 Jan 2022 12:29:04 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DF9F84A2B;
 Wed, 12 Jan 2022 12:28:59 +0000 (UTC)
Date: Wed, 12 Jan 2022 13:28:57 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 0/2] qemu-img convert: Fix sparseness detection
Message-ID: <Yd7JiZvU69Zb26Tn@redhat.com>
References: <20211217164654.1184218-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20211217164654.1184218-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: hreitz@redhat.com, pl@kamp.de, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.12.2021 um 17:46 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Hi all!
> 
> 01: only update test output rebasing on master
> 02: replaced with my proposed solution.

Thanks, applied to the block branch.

Kevin


