Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1893AC7C9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 11:37:28 +0200 (CEST)
Received: from localhost ([::1]:37584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luAwJ-0008FJ-4a
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 05:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1luAvQ-0006xc-QG
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:36:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1luAvP-0003sj-5u
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:36:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624008990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i0b2WeKYnDnIJM84ZZvpIt0RHtFjXyl5V9pY9yGdn8I=;
 b=YuAyzT+ZwlY9bz6f04Ap6++WsV46P2AUMaantFBYs9pP3VbhebfaBjbBytnDd5DJf0oY5z
 Zp1zeCu1Gp3A5ZQ0I6SIrqFnbsNOpktVJvdyPiQln3UFD1IddNYBB0K9mV/tMV+hng4UeC
 jhlZAynB32QwymlHJRYnrYk83MRP28o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-dqA-zdYKOhSpywx82rfo8Q-1; Fri, 18 Jun 2021 05:36:29 -0400
X-MC-Unique: dqA-zdYKOhSpywx82rfo8Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AC9D8030AF
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 09:36:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 318CC604CC;
 Fri, 18 Jun 2021 09:36:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8DF22113865F; Fri, 18 Jun 2021 11:36:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v5 9/9] qapi: make 'if' condition strings simple
 identifiers
References: <20210608120723.2268181-1-marcandre.lureau@redhat.com>
 <20210608120723.2268181-10-marcandre.lureau@redhat.com>
Date: Fri, 18 Jun 2021 11:36:24 +0200
In-Reply-To: <20210608120723.2268181-10-marcandre.lureau@redhat.com>
 (marcandre lureau's message of "Tue, 8 Jun 2021 16:07:23 +0400")
Message-ID: <87r1gztsyv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jsnow@redhat.com, Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Change the 'if' condition strings to be C-agnostic and be simple
> identifiers.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Tested-by: John Snow <jsnow@redhat.com>

[...]

> diff --git a/tests/qapi-schema/doc-good.txt b/tests/qapi-schema/doc-good.=
txt
> index 726727af74..27b7ce8799 100644
> --- a/tests/qapi-schema/doc-good.txt
> +++ b/tests/qapi-schema/doc-good.txt
> @@ -43,7 +43,7 @@ Example:
>  Values
>  ~~~~~~
> =20
> -"one" (**If: **"defined(IFONE)")
> +"one" (**If: **"IFONE")

Preexisting: the text generated for conditionals is crap.  Your patch
doesn't make it any worse.

>     The _one_ {and only}
> =20
>  "two"
> @@ -62,7 +62,7 @@ Features
>  If
>  ~~
> =20
> -"defined(IFCOND)"
> +"IFCOND"
> =20
> =20
>  "Base" (Object)
> @@ -87,7 +87,7 @@ Another paragraph (but no "var": line)
>  Members
>  ~~~~~~~
> =20
> -"var1": "string" (**If: **"defined(IFSTR)")
> +"var1": "string" (**If: **"IFSTR")
>     Not documented
> =20
> =20

[...]


