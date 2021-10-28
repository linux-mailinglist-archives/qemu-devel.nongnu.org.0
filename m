Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924AE43DE61
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 12:03:41 +0200 (CEST)
Received: from localhost ([::1]:33260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg2G4-0005ti-5l
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 06:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mg2Dv-0004JI-Rr
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 06:01:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mg2Do-00011l-C0
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 06:01:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635415277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=onhFVt2/iHBg1kdXyRw8CV/tQw45Q0yr0Xq2QiTqiuQ=;
 b=WFTutGTP2IOrO10uq9lbpVghCLSsumkwMI/n2fojqLjPYzC+u7nZ8oXTH/lWonahh/u3to
 qkpZkOjhxU+pfzf/6Unbism93FOCpzFeQjqd1v34BfYP3MGEnnHwAvI9R8EtjeP1sNUGmG
 zNahW/t5Ucc7b/i/YwGEqn8c4Mms21g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-idClaCwDPYiZckILK-LizQ-1; Thu, 28 Oct 2021 06:01:14 -0400
X-MC-Unique: idClaCwDPYiZckILK-LizQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68917802B7A;
 Thu, 28 Oct 2021 10:01:13 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A47EC1009AB7;
 Thu, 28 Oct 2021 10:01:11 +0000 (UTC)
Date: Thu, 28 Oct 2021 12:01:10 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v5 2/8] python/machine: Handle QMP errors on close more
 meticulously
Message-ID: <YXp05svPZwSXOA/d@redhat.com>
References: <20211026175612.4127598-1-jsnow@redhat.com>
 <20211026175612.4127598-3-jsnow@redhat.com>
 <YXk1wbRWNLlvXxMU@redhat.com>
 <CAFn=p-bU3SjifQXDEBX07Fxy-G-TAj3hbBJYqMJQ=Xrr0bJqEw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-bU3SjifQXDEBX07Fxy-G-TAj3hbBJYqMJQ=Xrr0bJqEw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.10.2021 um 19:49 hat John Snow geschrieben:
> This reply is long, sorry.

And after writing half of a very long reply myself, I noticed that I was
just very confused, so sorry for making you write a long text for no
real reason (well, at least for my first point - for the second one,
your explanation was very helpful, so thanks for that).

Somehow I ended up completely ignoring the context of the code (it's run
as part of shutdown functions) and instead thought of the general
condition of QMP connections going away anywhere in the code.

I suppose this could be a relevant concern in an actually asynchronous
client that may read from the socket (and encounter an error if the QEMU
process has already gone away and closed the connection) at any time,
but that's not what machine.py is meant for, at least not for now.

So I'll just delete what I already wrote. This patch should be fine.

Kevin


