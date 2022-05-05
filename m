Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7FD51BDD8
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 13:15:07 +0200 (CEST)
Received: from localhost ([::1]:44026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmZRp-0005pF-PD
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 07:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmZCX-0000T1-DB
 for qemu-devel@nongnu.org; Thu, 05 May 2022 06:59:17 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:20822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmZCV-0005zo-Tw
 for qemu-devel@nongnu.org; Thu, 05 May 2022 06:59:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651748355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h8ne3Khn4etN/xrpUdyFIcbD18zbaL0bQF8DGdnvtus=;
 b=UUBcIudVHVwNL5IVtLsaHQZBLVjXmMYQScsDJKWeHsKkSkdOIKgcdBXfNA7Dv+CvnKpu0u
 yUxqUDFFrMWJT7YpeNfPZkOU9Qmxd18LsCCEZHZ7gs3fYOc5AaiKpLAmpT6goTg9Zma88i
 ACPwB+bRo7ihTx57NGT1Yayq93Ikxds=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-wsVAoEwqNXK1Ijp7-H1lDw-1; Thu, 05 May 2022 06:59:12 -0400
X-MC-Unique: wsVAoEwqNXK1Ijp7-H1lDw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2CBC3810D2C;
 Thu,  5 May 2022 10:59:11 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 519BB9E93;
 Thu,  5 May 2022 10:59:06 +0000 (UTC)
Date: Thu, 5 May 2022 12:59:05 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: John Snow <jsnow@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Cleber Rosa <crosa@redhat.com>
Subject: Re: iotests and python dependencies
Message-ID: <YnOt+Q6p0fbJzWzy@redhat.com>
References: <CAFn=p-ZCF0VU=xrcbCnqmVvEndsMgiFSZOZv_Orm2EdX-Yk--A@mail.gmail.com>
 <YnOQAP1J94zH1pEK@redhat.com>
 <6f3c3414-f837-85c9-b401-d856f091ddf4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f3c3414-f837-85c9-b401-d856f091ddf4@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.74; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Am 05.05.2022 um 11:28 hat Paolo Bonzini geschrieben:
> On 5/5/22 10:51, Kevin Wolf wrote:
> > If not, I guess it would be enough if iotests just checks that the venv
> > exists and all of the dependencies are there in the right version and
> > error out if not, telling the user to run 'make check-venv'.
> > 
> > Or actually, it could just unconditionally run 'make check-venv' by
> > itself, which is probably easier to implement than checking the
> > dependencies and more convenient for the user, too.
> 
> Note that you would still have to add a 'check-block: check-venv'
> dependency in the Makefile, otherwise two "instances" of check-venv
> could run in parallel.

Good point. I only considered manual invocations, but for 'make
check-block' that sounds right.

> One small complication is that on BSD systems the binary is actually
> called "gmake", so you'd have to pass the variable somehow

I guess we could just export $MAKE as an environment variable?

Kevin


