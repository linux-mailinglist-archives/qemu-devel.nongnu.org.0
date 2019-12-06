Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74E2115638
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 18:12:01 +0100 (CET)
Received: from localhost ([::1]:41559 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idH96-0001Pi-E4
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 12:12:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60129)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1idFvc-0001kn-Kj
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:54:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1idFva-0001zV-Sd
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:54:00 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46528
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1idFva-0001yB-KO
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:53:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575647637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XMyXLnZx1HcSf6nldweKgc+mzWm5UABf0c3JdxyhcTg=;
 b=hvDggZFjzp+rMIWWJPrYC2NVC1IrbnrPYmuTQEZvBprG3LF1eCwfLZgjfzzgOuYjnd0M+7
 EyuOOl4CjNcqLE80E1LNcTgfaQ8g+Vsh9FiublNSjcdlqGx6dJ2HQSR0uL8HPfoCa/GiCd
 JrPW/nS6s8txUzjH8aD8lg/k3LSYf88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-FKOyL7pfOUa6xLnZQhe2ig-1; Fri, 06 Dec 2019 10:53:56 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE284801E76;
 Fri,  6 Dec 2019 15:53:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 802B519C7F;
 Fri,  6 Dec 2019 15:53:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1203E1138606; Fri,  6 Dec 2019 16:53:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v8 06/21] qdev-monitor: well form error hint helpers
References: <20191205174635.18758-1-vsementsov@virtuozzo.com>
 <20191205174635.18758-7-vsementsov@virtuozzo.com>
Date: Fri, 06 Dec 2019 16:53:53 +0100
In-Reply-To: <20191205174635.18758-7-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 5 Dec 2019 20:46:20 +0300")
Message-ID: <87blslcuwe.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: FKOyL7pfOUa6xLnZQhe2ig-1
X-Mimecast-Spam-Score: 0
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Make qbus_list_bus and qbus_list_dev hint append helpers well formed:
> switch errp paramter to Error *const * type, as it has uncommon
> behavior: not change the pointer to return error, but operate on
> already existent error object.
> Rename functions to be error_append_*_hint.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

"well form error hint helpers" tells me nothing.  PATCH 03 does the same
(less function renames), and is titled "make Error **errp const where it
is appropriate".  I like that better.  No big deal, and certainly not
worth a respin by itself.  I'm happy to touch up commit messages in my
tree.


