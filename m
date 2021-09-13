Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9805408FDA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:47:01 +0200 (CEST)
Received: from localhost ([::1]:53302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmIW-0000Bx-MR
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlP4-0008GF-SA
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:49:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlOx-0007MO-Oz
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:49:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631537375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UGjQUNv4V2P/zgDx+YbpwccifxOMcmHM5i7PVqg7ioo=;
 b=XodpXP2eQC5qZwGqNYK3IILZlifeISyiHShd8oYi0nJgDWUUWBN2h3e1FqlnBdeHw53y3t
 tGSM99sKwuoaGDOR0OX2pY2JyNjZVrzj8ooTTYZ/LIgh96sGqGK2vd1XIin6d19HdXcuZF
 9UiHm1y+Jd3yJB5emNaeB0gwjt+vF6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-D-4v8rb5Po-s99nQ80-cXw-1; Mon, 13 Sep 2021 08:49:32 -0400
X-MC-Unique: D-4v8rb5Po-s99nQ80-cXw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20CBD824FAA;
 Mon, 13 Sep 2021 12:49:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 23C8219724;
 Mon, 13 Sep 2021 12:49:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AD7DF113865F; Mon, 13 Sep 2021 14:49:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 00/22] qapi: Remove simple unions from the schema language
References: <20210913123932.3306639-1-armbru@redhat.com>
Date: Mon, 13 Sep 2021 14:49:21 +0200
In-Reply-To: <20210913123932.3306639-1-armbru@redhat.com> (Markus Armbruster's
 message of "Mon, 13 Sep 2021 14:39:10 +0200")
Message-ID: <87o88w1vzi.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, eblake@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, marcandre.lureau@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Simple unions predate flat unions.  Having both complicates the QAPI
> schema language and the QAPI generator.  We haven't been using simple
> unions in new code for a long time, because they are less flexible and
> somewhat awkward on the wire.
>
> Get rid of them.  We should've done this long ago.
>
> This adds some boilerplate to the schema:
>
>     $ git-diff --shortstat master qapi
>      7 files changed, 461 insertions(+), 59 deletions(-)
>
> Well worth the language simplification, in my opinion:
>
>     $ git-diff --stat master scripts/ docs/
>      docs/devel/qapi-code-gen.rst | 137 ++++++++++---------------------------------
>      scripts/qapi/common.py       |  19 ++----
>      scripts/qapi/expr.py         |  48 +++++++--------
>      scripts/qapi/schema.py       | 101 +++++++------------------------
>      4 files changed, 80 insertions(+), 225 deletions(-)
>
> The complete diffstat looks even better, but is somewhat misleading,
> because it's dominated by two tests rewritten in a much more compact
> way.
>
> This series is based on my "[PULL 0/5] QAPI patches patches for
> 2021-09-13".
>
> Based-on: <20210913095038.3040776-1-armbru@redhat.com>

In master now.


