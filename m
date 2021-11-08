Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1342F447BA0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 09:13:31 +0100 (CET)
Received: from localhost ([::1]:49366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjzmU-0004yz-7h
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 03:13:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mjzim-00025e-IM
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:09:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mjzii-000363-Aj
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:09:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636358975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fCHV+3DKCVn2TyHdAfTZB5Pm8EBU2QBsMRzhmzlik3w=;
 b=PWVrXd7yY/t9//gXwpDE81GGAInW9+v2unnccos6YYf8TzHs/jdwct7902bexRPrr6h6Dw
 Z2nX2BwwMXPisbVYjyo9Eggqw7zZv2IKSxWNw2PqbOg4T2GElDnrBMgumK1j3EM/og9cGq
 80ougmjLZr5vPR7XHYHTYwlKnysYgXQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-iiK0gjWRPkuJWcoon8meDA-1; Mon, 08 Nov 2021 03:09:34 -0500
X-MC-Unique: iiK0gjWRPkuJWcoon8meDA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 615D7100E320
 for <qemu-devel@nongnu.org>; Mon,  8 Nov 2021 08:09:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65A241037F53;
 Mon,  8 Nov 2021 08:09:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E568111380A7; Mon,  8 Nov 2021 09:09:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Artificially target-dependend compiles
References: <87czneyaw3.fsf@dusky.pond.sub.org>
 <2e4b52b0-b1fc-58c5-9631-fbf9d7f927fc@redhat.com>
 <87fss9u3zj.fsf@dusky.pond.sub.org>
Date: Mon, 08 Nov 2021 09:09:22 +0100
In-Reply-To: <87fss9u3zj.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Sat, 06 Nov 2021 08:40:00 +0100")
Message-ID: <87ilx3nk5p.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

[...]

> I just ran into an instance that may be clearer.
>
> The "rocker" device is target-independent (hw/net/meson.build adds it to
> softmmu_ss), but linked only for selected targets (hw/net/Kconfig has
> depends on PCI && MSI_NONBROKEN).
>
> This makes our build machinery put CONFIG_ROCKER in
> $TARGET-softmmu-config-devices.h, and poison it in config-poison.h.
> Feels uncalled for.

Hmm, maybe not.

Our build process links the rocker stuff for selected targets.

The QAPI schema provides rocker definitions unconditionally.
QAPI-generated rocker code gets linked for all targets.  The
command handlers resolve to the real ones when on the selected targets,
else to stubs.

This works and is fairly simple.  We link a bit of useless code
(QAPI-generated and stubs).  query-qmp-schema can't tell us whether
rocker is present, which is sad, but there's a work-around:
qom-list-types.

We may still run into cases where we really want query-qmp-schema to
tell, say because there is no easy work-around.

Making the QAPI schema definitions properly conditional does the trick,
but makes code artificially target-dependent, slowing down the build.
It can also lead to extra #ifdeffery, because now useless code doesn't
compile anymore.

Simply not poisoning the CONFIG_FOO when the FOO code is actually
target-independent avoids the target-dependency, but also messes up
introspection: new the FOO stuff is present for all targets when *any*
of them has it.  This cure feels worse than the disease.

Needs more thought.


