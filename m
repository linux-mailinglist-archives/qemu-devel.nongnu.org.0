Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1982F4E73
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:24:38 +0100 (CET)
Received: from localhost ([::1]:36832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzi0j-0005zo-Ta
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:24:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzhrG-0006DO-98
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzhr8-0000G9-T4
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610550879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DqKoIeus0NGBleOJR/CS2CZn+e8QbwQq75otuoQ4NHA=;
 b=dD2tP4qCTRpaddp+YB/ovyxmG1o0j/2LGGT95RJ2vNzDvDChqTdVMCJQYqljOWOA9zcEwi
 CnyVkiTdTzyvSfL9sIdnmNDLn9osSXuAQbWVZq5m9IagCf5xpoI2Wqqtk2zF5lCzpv16vL
 9w4nYsA/X9Xyq/AYOCmqJ7tgTmzIscI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-o4VKtNo3OFC0amOxeE89wg-1; Wed, 13 Jan 2021 10:14:37 -0500
X-MC-Unique: o4VKtNo3OFC0amOxeE89wg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A1161081B2F;
 Wed, 13 Jan 2021 15:14:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 659DB5E1B4;
 Wed, 13 Jan 2021 15:14:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F03AB11386A7; Wed, 13 Jan 2021 16:14:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 04/12] qapi/gen: assert that _start_if is not None in
 _wrap_ifcond
References: <20201217015927.197287-1-jsnow@redhat.com>
 <20201217015927.197287-5-jsnow@redhat.com>
Date: Wed, 13 Jan 2021 16:14:30 +0100
In-Reply-To: <20201217015927.197287-5-jsnow@redhat.com> (John Snow's message
 of "Wed, 16 Dec 2020 20:59:19 -0500")
Message-ID: <87im80yill.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> We already assert this in end_if, but that's opaque to mypy. Do it in
> _wrap_ifcond instead. Same effect at runtime, but mypy can now infer
> the type in _wrap_ifcond's body.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/gen.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> index b40f18eee3c..a6dc991b1d0 100644
> --- a/scripts/qapi/gen.py
> +++ b/scripts/qapi/gen.py
> @@ -130,11 +130,11 @@ def start_if(self, ifcond: List[str]) -> None:
>          self._start_if = (ifcond, self._body, self._preamble)
>  
>      def end_if(self) -> None:
> -        assert self._start_if
>          self._wrap_ifcond()
>          self._start_if = None
>  
>      def _wrap_ifcond(self) -> None:
> +        assert self._start_if
>          self._body = _wrap_ifcond(self._start_if[0],
>                                    self._start_if[1], self._body)
>          self._preamble = _wrap_ifcond(self._start_if[0],

Let's inline ._wrap_ifcond() into .end_if().  Not a blocker, of course.


