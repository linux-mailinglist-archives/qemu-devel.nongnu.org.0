Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4A63238ED
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 09:48:35 +0100 (CET)
Received: from localhost ([::1]:54524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEpqT-0006a1-JC
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 03:48:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lEpo4-0005im-7F
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 03:46:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lEpnz-0006Xb-U5
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 03:46:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614156357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=632E+Ws9kGLmQdocaI0YliGzuRUBWrQmtGlA6c0LARk=;
 b=OmeBGjU/i+MrbPomd5DsW5ZQtMjW5SpVDbHz22PXm2rHdxuWeXRzBzTURi/aXs1CvcF3vs
 FNMJ1KSnbLf3kAuVoklS3clmivAUd+EJeszaa3/LkPSfiuZlBkUHw2SB1dGOSroop282Ed
 fqMBQMmpGPwiNSUmqcbXdgyUVXes5J8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-XPKynLKIOz2sBLANGVSueQ-1; Wed, 24 Feb 2021 03:45:53 -0500
X-MC-Unique: XPKynLKIOz2sBLANGVSueQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22F86195D563
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 08:45:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E79C65D9D0;
 Wed, 24 Feb 2021 08:45:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5BB68113860F; Wed, 24 Feb 2021 09:45:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 0/6] qapi: Add support for aliases
References: <20210211183118.422036-1-kwolf@redhat.com>
Date: Wed, 24 Feb 2021 09:45:50 +0100
In-Reply-To: <20210211183118.422036-1-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 11 Feb 2021 19:31:12 +0100")
Message-ID: <87ft1l7t1d.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> This series introduces alias definitions for QAPI object types (structs
> and unions).
>
> This allows using the same QAPI type and visitor even when the syntax
> has some variations between different external interfaces such as QMP
> and the command line.
>
> It also provides a new tool for evolving the schema while maintaining
> backwards compatibility (possibly during a deprecation period).
>
> The first user is intended to be a QAPIfied -chardev command line
> option, for which I'll send a separate series. A git tag is available
> that contains both this series and the chardev changes that make use of
> it:
>
>     https://repo.or.cz/qemu/kevin.git qapi-alias-chardev-v2

I'm done.  Summary:

PATCH 1: Update to the big comment is still missing, but we can do that
last.  I also flagged a possible contract clarification.

PATCH 2: Nits.

PATCH 3: Commit message questions.

PATCH 4: This one gave me trouble, and I feel unable to summarize.  I'm
afraid you have to wade through my review to answer questions and
address issues as far as practical.  And then we try again with v3.

PATCH 5: Documentation tweaks.

PATCH 6: Please consider adding more positive tests, as discussed in
review of PATCH 5.


