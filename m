Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA8A2DBCAB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 09:27:19 +0100 (CET)
Received: from localhost ([::1]:50148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpS9W-00076Q-E5
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 03:27:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpS5l-00059D-M0
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 03:23:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpS5i-0008KT-Of
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 03:23:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608107000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BqMwgUHSXERYaDzgk+yOsCG2CFP5QmRy4d6uKMdrIO4=;
 b=BvKM3TF5UtyfMDqslBjOHieYQ7zwGb9aMXGqGUv3CnsMVp6ZWlrZSAICJzqNgxprH3R1l0
 MUogf09wJ5BDGH/72W8pvDhoE578C4ga3dEg+t3oDX/j5wRHk5nO+LnDjRisp8JNf0RE5Z
 GHt9nZ3D9j2yy8aVooGZVaPQ3CL9aIs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-QpqiWGL6NXi8pWZvsdWi2A-1; Wed, 16 Dec 2020 03:23:19 -0500
X-MC-Unique: QpqiWGL6NXi8pWZvsdWi2A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 789C8100C662
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:23:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08A5D60C15;
 Wed, 16 Dec 2020 08:23:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7D09211329A5; Wed, 16 Dec 2020 09:23:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 03/12] qapi/main: handle theoretical None-return from
 re.match()
References: <20201214235327.1007124-1-jsnow@redhat.com>
 <20201214235327.1007124-4-jsnow@redhat.com>
Date: Wed, 16 Dec 2020 09:23:13 +0100
In-Reply-To: <20201214235327.1007124-4-jsnow@redhat.com> (John Snow's message
 of "Mon, 14 Dec 2020 18:53:18 -0500")
Message-ID: <87eejqtb0u.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Mypy cannot understand that this match can never be None, so help it
> along.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/main.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
> index 42517210b805..271d9e84da94 100644
> --- a/scripts/qapi/main.py
> +++ b/scripts/qapi/main.py
> @@ -23,7 +23,8 @@
>  
>  def invalid_prefix_char(prefix: str) -> Optional[str]:
>      match = re.match(r'([A-Za-z_.-][A-Za-z0-9_.-]*)?', prefix)

@match can't be None because the regexp always matches a prefix,
possibly the empty prefix.

> -    if match.end() != len(prefix):
> +    # match cannot be None, but mypy cannot infer that.
> +    if match and match.end() != len(prefix):
>          return prefix[match.end()]
>      return None

High-level logic:

       if there is an invalid prefix character:
           return it
       return None

The actual code takes the return None when the match fails.  If this
could happen, it would be wrong.  I can't, so it doesn't matter, but I
dislike it anyway.

Alternative 1: turn "match cannot be None" from comment to code

       match = re.match(r'([A-Za-z_.-][A-Za-z0-9_.-]*)?', prefix)
  +    assert match
       if match.end() != len(prefix):
           return prefix[match.end()]
       return None

Alternative 2: turn empty prefix into a special case

  -    match = re.match(r'([A-Za-z_.-][A-Za-z0-9_.-]*)?', prefix)
  +    match = re.match(r'[A-Za-z_.-][A-Za-z0-9_.-]*', prefix)
  +    if not match:
  +        return prefix[0]
       if match.end() != len(prefix):
           return prefix[match.end()]
       return None

I'd prefer alternative 1.


