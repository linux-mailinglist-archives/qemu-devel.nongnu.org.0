Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7AD6AE264
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:28:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYIq-0004E7-MY; Tue, 07 Mar 2023 09:28:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pZYIo-00046p-Jz
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:28:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pZYIn-0006kU-8Z
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:28:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678199308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=viOYvhqAi9AWAtfl8i+QVP7XsjpDQIZoMyQhFwRy47g=;
 b=EWpfwCg75JriRIJJGFlaGgRCqKxkkKuzCkOa/TKHqsoG9LJ90v9VHLD0CclQwyOyrfGedg
 H6McOY8gUrYxBAR2ENEgboLu4+CSgHpBfLdn4LKaOvCNWbM+UQg9xw3HKrCdcYCBlNA+7q
 DZ46O+d1tBTBCaatYjKYPxn1Dt42lGo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-GLgts6XlPaOANo-X-3JySg-1; Tue, 07 Mar 2023 09:28:25 -0500
X-MC-Unique: GLgts6XlPaOANo-X-3JySg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64F17811E6E;
 Tue,  7 Mar 2023 14:28:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3ECE135454;
 Tue,  7 Mar 2023 14:28:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1E8D521E6A1F; Tue,  7 Mar 2023 15:28:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH] qapi: give available enum values in error string
References: <20230307112212.2437449-1-marcandre.lureau@redhat.com>
 <87ttyw91mw.fsf@pond.sub.org>
 <CAMxuvawaO1jzXQBqFONuu8OfXovGgjAoOfirU1-GB_F=R++9Jg@mail.gmail.com>
Date: Tue, 07 Mar 2023 15:28:24 +0100
In-Reply-To: <CAMxuvawaO1jzXQBqFONuu8OfXovGgjAoOfirU1-GB_F=R++9Jg@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Tue, 7 Mar 2023
 17:11:44 +0400")
Message-ID: <878rg87i0n.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:


[...]

> We hit an interesting limit of the API though, because error_setg() with
> &error_fatal will fail immediately before append_hint().
>
> But we can work around it by using a ERRP_GUARD() !

error.h again:

     * Create an error and add additional explanation:
     *     error_setg(errp, "invalid quark");
     *     error_append_hint(errp, "Valid quarks are up, down, strange, "
     *                       "charm, top, bottom.\n");
---> * This may require use of ERRP_GUARD(); more on that below.

;)

> sending v2

Thanks!


