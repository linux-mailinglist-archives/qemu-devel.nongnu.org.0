Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E00968F333
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 17:33:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPnMW-0001mU-S3; Wed, 08 Feb 2023 11:32:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPnMS-0001mE-V1
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 11:31:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPnMR-0004eR-2Z
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 11:31:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675873913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NxF2s4k+oc4u8RKeGbFtEtM4GWFhqSFqQdCBKpMFNI8=;
 b=HnCO1jEwvrdLoZRu/1xJ3MtaoU7V6I9J+/CUD3wyfX6gxQJWG8PyGl3NeeCY9C0A3pXjSj
 ByY7wgNx4X61/S1Yk/6GHOMd/Uqi4MHSOWMHV8BbAyOTvNTlPX2QSuYmeHW7eJcikZ/xx4
 jF8fEZ/ACGt+iz08zIehOHAKAU9ZbLY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-HpCHFc44MA-bVkk7SZ7PnQ-1; Wed, 08 Feb 2023 11:31:52 -0500
X-MC-Unique: HpCHFc44MA-bVkk7SZ7PnQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10FB72A59547;
 Wed,  8 Feb 2023 16:31:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2CE91121314;
 Wed,  8 Feb 2023 16:31:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C47D721E6A1F; Wed,  8 Feb 2023 17:31:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v2 0/7] qapi: static typing conversion, pt5c
References: <20230208021306.870657-1-jsnow@redhat.com>
Date: Wed, 08 Feb 2023 17:31:50 +0100
In-Reply-To: <20230208021306.870657-1-jsnow@redhat.com> (John Snow's message
 of "Tue, 7 Feb 2023 21:12:59 -0500")
Message-ID: <878rh8unih.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

John Snow <jsnow@redhat.com> writes:

> This is part five (c), and focuses on sharing strict types between
> parser.py and expr.py.
>
> gitlab: https://gitlab.com/jsnow/qemu/-/commits/python-qapi-cleanup-pt5c
>
> Every commit should pass with:
>  - `isort -c qapi/`
>  - `flake8 qapi/`
>  - `pylint --rcfile=qapi/pylintrc qapi/`
>  - `mypy --config-file=qapi/mypy.ini qapi/`
>
> Some notes on this series:
>
> Patches 2 and 3 are almost entirely superseded by patch 5, but I wasn't
> as confident that Markus would like patch 5, so these patches aren't
> squashed quite as tightly as they could be -- I recommend peeking ahead
> at the cover letters before reviewing the actual patch diffs.

Yes, you're taking a somewhat roundabout path there.

I think I like PATCH 5 well enough.  Do you have a tighter squash in
mind?

> By the end of this series, the only JSON-y types we have left are:
>
> (A) QAPIExpression,
> (B) JSONValue,
> (C) _ExprValue.
>
> The argument I'm making here is that QAPIExpression and JSONValue are
> distinct enough to warrant having both types (for now, at least); and
> that _ExprValue is specialized enough to also warrant its inclusion.
>
> (Brutal honesty: my attempts at unifying this even further had even more
> hacks and unsatisfying conclusions, and fully unifying these types
> should probably wait until we're allowed to rely on some fairly modern
> Python versions.)

Feels okay to me.


