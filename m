Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAEB14D74B
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 09:09:44 +0100 (CET)
Received: from localhost ([::1]:57056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ix4tT-00073O-Kf
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 03:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51993)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1ix4sY-0006FI-6s
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 03:08:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1ix4sX-0004So-Bf
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 03:08:46 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32488
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1ix4sX-0004Sc-8x
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 03:08:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580371724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uJ70q+sXoYEQKaGGJj7AMqehBgteFNggGPgWXEIjqUg=;
 b=G1YNvIzh3AsUUDE73auoW3hhFQRQXjAjTs8tnqHXzzy5jIc0gAH0lU17LMPbncHavBeMRA
 Z5S0uiPsRZo3r4uMKilS5IuZTT4HHNALQFxZfLGAEoLERcIEEYTFXTg/mm6dUFdj6fxsWF
 MD6z31VhVW+P+fMsDaduRyVPehWBOWU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-E8StmI-tNgGC94zsxd8s7g-1; Thu, 30 Jan 2020 03:08:43 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 705218010C2
 for <qemu-devel@nongnu.org>; Thu, 30 Jan 2020 08:08:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-131.ams2.redhat.com
 [10.36.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C51560C84;
 Thu, 30 Jan 2020 08:08:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 128E71138404; Thu, 30 Jan 2020 09:08:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v5 8/8] multifd: Add zstd compression multifd support
References: <20200129115655.10414-1-quintela@redhat.com>
 <20200129115655.10414-9-quintela@redhat.com>
Date: Thu, 30 Jan 2020 09:08:41 +0100
In-Reply-To: <20200129115655.10414-9-quintela@redhat.com> (Juan Quintela's
 message of "Wed, 29 Jan 2020 12:56:55 +0100")
Message-ID: <871rrhxt6e.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: E8StmI-tNgGC94zsxd8s7g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Juan Quintela <quintela@redhat.com> writes:

> Signed-off-by: Juan Quintela <quintela@redhat.com>

For QAPI:
Acked-by: Markus Armbruster <armbru@redhat.com>


