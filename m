Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C91F249CC36
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 15:22:27 +0100 (CET)
Received: from localhost ([::1]:45398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCjBq-0004DI-V3
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 09:22:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCiup-0005GX-Eh
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:04:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCiuk-0003ot-4x
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:04:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643205883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sx9zmdMVamLp20cJQPszWdQSdpYQZPJ5vvumxq88W7A=;
 b=e6Ep0uy80goKYrfHJL4C1Nvvt+j1Fmr5CWjSn5Zr+aSrf+4wnkR0/s+yvmw8krco26blxG
 jrHpktwYR0eyyrxZIdDyC8Un1bYAK9VpgV74aiZll2kkZSNOxNcqZFG1gElGmSfZ5ELH0R
 EBmtE8/nDGJxPFja14Ve/PnVbPVeOaw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-2fCPSYr5PISzwda93KPAFw-1; Wed, 26 Jan 2022 09:04:40 -0500
X-MC-Unique: 2fCPSYr5PISzwda93KPAFw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41E44824F8E;
 Wed, 26 Jan 2022 14:04:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-10.ams2.redhat.com
 [10.36.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ECD76E20A;
 Wed, 26 Jan 2022 14:04:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A80CB11384A5; Wed, 26 Jan 2022 15:04:37 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v5 7/7] qapi: generate trace events by default
References: <20220125215655.3111881-1-vsementsov@virtuozzo.com>
 <20220125215655.3111881-8-vsementsov@virtuozzo.com>
Date: Wed, 26 Jan 2022 15:04:37 +0100
In-Reply-To: <20220125215655.3111881-8-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 25 Jan 2022 22:56:55 +0100")
Message-ID: <87lez2twy2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 hreitz@redhat.com, stefanha@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> We don't generate trace events for tests/ and qga/ because that it is
> not simple and not necessary. We have corresponding comments in both
> tests/meson.build and qga/meson.build.
>
> Still to not miss possible future qapi code generation call, and not to
> forget to enable trace events generation, let's enable it by default.
> So, turn option --gen-trace into opposite --no-trace-events and use new

Let's call it --suppress-tracing.

> option only in tests/ and qga/ where we already have good comments why
> we don't generate trace events code.
>
> Note that this commit enables trace-events generation for qapi-gen.py
> call from tests/qapi-schema/meson.build and storage-daemon/meson.build.
> Still, both are kind of noop: tests/qapi-schema/ doesn't seem to
> generate any QMP command code and no .trace-events files anyway,
> storage-daemon/ uses common QMP command implementations and just
> generate empty .trace-events
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


