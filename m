Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 363693A68C8
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:16:06 +0200 (CEST)
Received: from localhost ([::1]:46828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnNl-00028o-9F
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lsnMF-0001Qj-On
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:14:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lsnMD-0006va-JY
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:14:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623680068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zTCBDVeTb2YUKn0PpFlnk5QQXXnkVDAVV1ua37nrNLo=;
 b=SCjqsAlcqjfustq2XTD1QBxjW1N1IvRk31T/1Rnmq/5WFDMlufaKolIq5lMGUz3AEE2wdn
 Wa0NdmPSqr+qK/WKnyMlS5YO0wcAe9hitm/hqejTHhGDidzkmDHBFAL8QSY7nkyKK4PXbb
 HhyJwEntk/NKIM6Jqq/YqXQQKnEdJWg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-AHtb2XjkMG-tcKFmoiBNVQ-1; Mon, 14 Jun 2021 10:14:26 -0400
X-MC-Unique: AHtb2XjkMG-tcKFmoiBNVQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9C78801B38
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 14:14:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CDD11037EAC;
 Mon, 14 Jun 2021 14:14:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2C5DE113865F; Mon, 14 Jun 2021 16:14:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v5 3/9] qapi: make gen_if/gen_endif take a simple string
References: <20210608120723.2268181-1-marcandre.lureau@redhat.com>
 <20210608120723.2268181-4-marcandre.lureau@redhat.com>
 <87zgvszkas.fsf@dusky.pond.sub.org>
Date: Mon, 14 Jun 2021 16:14:01 +0200
In-Reply-To: <87zgvszkas.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Mon, 14 Jun 2021 14:45:47 +0200")
Message-ID: <87pmwoy1na.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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

Markus Armbruster <armbru@redhat.com> writes:

> marcandre.lureau@redhat.com writes:
>
>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> Instead of building prepocessor conditions from a list of string, use
>> the result generated from QAPISchemaIfCond.cgen().
>
> I understand why you're doing this, but only because I know where you're
> headed.  By itself, it is not an improvement: you move C generation out
> of common.py into schema.py.  You need to explain why that's useful.
>
>>
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> ---
>>  scripts/qapi/common.py     | 24 +++++++++++-------------
>>  scripts/qapi/gen.py        |  4 ++--
>>  scripts/qapi/introspect.py |  4 ++--
>>  scripts/qapi/schema.py     |  3 +++
>>  scripts/qapi/types.py      | 20 ++++++++++----------
>>  scripts/qapi/visit.py      | 12 ++++++------
>>  6 files changed, 34 insertions(+), 33 deletions(-)
>
> Missing: qapi-code-gen.txt section "Configuring the schema" has an
> example, which needs to be updated.

Nope, that's in PATCH 1 already.

> When the generated code changes, always check the examples, and always
> consider describing the change in the commit message.

Describing the change in the commit message is even more useful when the
doc update isn't in the same patch.

[...]


