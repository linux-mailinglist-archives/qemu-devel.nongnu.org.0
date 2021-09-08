Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ED64039CA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 14:30:03 +0200 (CEST)
Received: from localhost ([::1]:60458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwiI-00006C-9r
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 08:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNwez-0005kR-8E
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:26:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNwex-0002LA-Lr
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631103994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WkD8nqexLetrk7nAT45C0Bgwnsb8GeHF2bPooj3p1d8=;
 b=WA35jnnccf19oziC0dTnSN1sikmDSKZGr8jbPcTHwVJi2JfqKjtZYFaLNPx4OZwLebqgPx
 n9o+0HpDbB+aol5BiQY88dZtyB6AbZ0e/pxS60yPm0ob/o6//kEVGuLOgWsW8tYGmcr7JA
 uqH2rXgUapxHVEifBW0mxMUbiiixOdI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-F0xS5cIhO-y4JKstLLdSaA-1; Wed, 08 Sep 2021 08:26:33 -0400
X-MC-Unique: F0xS5cIhO-y4JKstLLdSaA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 760DA814270
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 12:26:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD48F5C1BB;
 Wed,  8 Sep 2021 12:26:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 42EE71138606; Wed,  8 Sep 2021 14:26:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [RFC v3 05/32] scripts/qapi: add
 QAPISchemaVisitor.visit_module_end
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-6-marcandre.lureau@redhat.com>
Date: Wed, 08 Sep 2021 14:26:23 +0200
In-Reply-To: <20210907121943.3498701-6-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Tue, 7 Sep 2021 16:19:16 +0400")
Message-ID: <87mtonw8wg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Used in following patches to generate code after visiting a module.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  scripts/qapi/schema.py | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 1f6301c394..6455a8f425 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -128,6 +128,9 @@ def visit_end(self):
>      def visit_module(self, name):
>          pass
> =20
> +    def visit_module_end(self, name) -> None:
> +        pass
> +
>      def visit_needed(self, entity):
>          # Default to visiting everything
>          return True
> @@ -207,6 +210,7 @@ def visit(self, visitor):
>          for entity in self._entity_list:
>              if visitor.visit_needed(entity):
>                  entity.visit(visitor)
> +        visitor.visit_module_end(self.name)
> =20
> =20
>  class QAPISchemaInclude(QAPISchemaEntity):

QAPISchema.visit(vis) now calls:

    vis.visit_begin
    for each module:
        vis.visit_module(module.name)
        for each entity in module
            entity.visit(vis)
        vis.visit_module_end(module.name)
    vis.visit_end

The .visit_module_end() isn't strictly necessary (we could do its work
in .visit_module() and .visit_end()).  But it's probably simpler this
way.

Let's rename .visit_module() to .visit_module_begin(), for symmetry with
.visit_begin(), .visit_end().


