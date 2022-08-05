Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3D858A7E3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 10:17:04 +0200 (CEST)
Received: from localhost ([::1]:41572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJsVy-0002PW-Ut
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 04:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oJsHw-00071d-QC
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:02:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oJsHr-0002h1-Fx
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:02:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659686546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=83PgSG0FDRsg4pA2RVUEd+o2KM2HEwM8HJ05DCz3ZMA=;
 b=PtaUe0c8eCJlFO6uPxgYtHqcv9xY6n+hbyZQJX3IMA988qurJxWPz/ny8lFIj8Ft9FwLKn
 gasii8FG9NcoVWxr+pd0yXg3UjyAIQ+owHWYgBUlfKM+qsIsK8tE3xb8bKyGKB+VTiepZh
 st4Aaw+U06QpdozoW3wQFVT1hUWMd+w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-U-0da7ehPpmdpkdUhhSGqA-1; Fri, 05 Aug 2022 04:02:23 -0400
X-MC-Unique: U-0da7ehPpmdpkdUhhSGqA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28614185A79C;
 Fri,  5 Aug 2022 08:02:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA560492C3B;
 Fri,  5 Aug 2022 08:02:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9943721E6930; Fri,  5 Aug 2022 10:02:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  Cleber Rosa
 <crosa@redhat.com>,  qemu-block@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Xie Yongji <xieyongji@bytedance.com>,  Kyle Evans
 <kevans@freebsd.org>,  Peter Maydell <peter.maydell@linaro.org>,  John
 Snow <jsnow@redhat.com>,  Michael Roth <michael.roth@amd.com>,  Warner
 Losh <imp@bsdimp.com>,  Kevin Wolf <kwolf@redhat.com>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  Laurent Vivier <laurent@vivier.eu>,  Fam
 Zheng <fam@euphon.net>,  Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 11/15] qemu-common: move scripts/qapi
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
 <20220712093528.4144184-12-marcandre.lureau@redhat.com>
Date: Fri, 05 Aug 2022 10:02:15 +0200
In-Reply-To: <20220712093528.4144184-12-marcandre.lureau@redhat.com>
 (marcandre lureau's message of "Tue, 12 Jul 2022 13:35:24 +0400")
Message-ID: <87pmhf86ew.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> This is just moving qapi-gen.py and related subdir to qemu-common, to
> ease review and proceed step by step. The following patches will move
> related necessary code, tests etc.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

As moved files tend to become low-level annoyances for a long time, I'd
like to understand why you want to move them.  The commit message says
"to ease review", which I suspect isn't the real reason.  Perhaps you
explained all that elsewhere already, but I missed it.


