Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB1335EF39
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 10:24:23 +0200 (CEST)
Received: from localhost ([::1]:51218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWaow-0000Nb-Ew
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 04:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWalo-0003jW-9G
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:21:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWalm-0005hT-Hu
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618388465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4KAB8iwYthkrqmlERqaXgbudUn9ZIPaZk16Sx3iZLsA=;
 b=hz8rE6qTD8bmVyLEvOjCzsfJZYM9iz34vkzomMzY/kcZIf/9232yMPcSdAmJ9W8SGfvItV
 oi6GvBoH9NG9CNdskwj1TPqvXSsmKIFxJ17TJebzbkHpKNM/7eyPmjCfeU5PRL0vohsrDr
 wClu6yLUXzHLLeLLIOFM0OGse2y9ckU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-3RTKBM7HPDyYsg6rBciSbQ-1; Wed, 14 Apr 2021 04:21:03 -0400
X-MC-Unique: 3RTKBM7HPDyYsg6rBciSbQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9DAC188352A
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 08:21:02 +0000 (UTC)
Received: from localhost (ovpn-114-209.ams2.redhat.com [10.36.114.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9602E62499;
 Wed, 14 Apr 2021 08:21:02 +0000 (UTC)
Date: Wed, 14 Apr 2021 06:44:32 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH RFC 6/7] qmp_protocol: add QMP client implementation
Message-ID: <YHaBQOYfMSuXoMAj@stefanha-x1.localdomain>
References: <20210413155553.2660523-1-jsnow@redhat.com>
 <20210413155553.2660523-7-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210413155553.2660523-7-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dEiqshZc7QG12RjM"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: armbru@redhat.com, crosa@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--dEiqshZc7QG12RjM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 13, 2021 at 11:55:52AM -0400, John Snow wrote:
> +    async def _execute(self, msg: Message) -> object:
> +        """
> +        The same as `execute_msg()`, but without safety mechanisms.
> +
> +        Does not assign an execution ID and does not check that the form
> +        of the message being sent is valid.
> +
> +        This method *Requires* an 'id' parameter to be set on the
> +        message, it will not set one for you like `execute()` or
> +        `execute_msg()`.
> +
> +        Do not use "__aqmp#00000" style IDs, use something else to avoid
> +        potential clashes. If this ID clashes with an ID presently
> +        in-use or otherwise clashes with the auto-generated IDs, the
> +        response routing mechanisms in _on_message may very well fail
> +        loudly enough to cause the entire loop to crash.
> +
> +        The ID should be a str; or at least something JSON
> +        serializable. It *must* be hashable.
> +        """
> +        exec_id = cast(str, msg['id'])
> +        self.logger.debug("Execute(%s): '%s'", exec_id,
> +                          msg.get('execute', msg.get('exec-oob')))
> +
> +        queue: asyncio.Queue[Message] = asyncio.Queue(maxsize=1)
> +        task = create_task(self._bh_execute(msg, queue))

We're already in a coroutine, can we await queue.get() ourselves instead
of creating a new task?

I guess this is done in order to use Task.cancel() in _bh_disconnect()
but it seems simpler to use queue both for success and cancellation.
Fewer tasks are easier to reason about.

--dEiqshZc7QG12RjM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmB2gUAACgkQnKSrs4Gr
c8iHVAf/URDv9c1swQpKRD2DiK1ktEX30RUVnQmycOKptGsj+O6hrLiCuXNeAD60
OHN4XIFw+xd0PgLLnwUMFIUOksfyqsdXxe4WT9f/g7o71hqLEnNmo6KMdK+J9VbP
S0AkwRIQFAhM+1W2y8f4DVnqUcsvckjLwXuJmYNDDY1wb7KesT1ZgD8rwCeaGtGO
KnP6YVkloWzIpMbn3Bxyi/cZsSTWgIJN879dWFmoNVaunddDInTkhae0aa2kSrFx
W4yTBoIISQI2/GqbNKvI1tO2RSQVB6DprwMRJNLfkM9cJudiEXDkGyL2R+g8U+k2
mAAev02Fpcmfxzc3y0IWXlJRGsgevA==
=0W+k
-----END PGP SIGNATURE-----

--dEiqshZc7QG12RjM--


