Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5292F4FD9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 17:25:21 +0100 (CET)
Received: from localhost ([::1]:43676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzixU-0000De-KI
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 11:25:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzivu-0007iH-QQ
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:23:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzivn-0007Al-DI
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:23:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610555013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dBReRf7J4Zd7M4Z/s/6QvKlwXedyQQxkafPSBJwj944=;
 b=K/NPFIYZlgfyHtSzQwyGbowMIaUgbTo5bsexBEun+3YVOSaPi5T8wf8MstB3ifmIsS6sNC
 LRMPbHeM+JSJloD7aaJdLw2MCIkz5PBWqEC2sfV5izBCDqVANTdVETIQqL6TXSpSIuwGNx
 oeLFz+6vWdFgmzmjA0P10usAeQmOg1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-P2NHTTooOJW0KrwnrzwuJA-1; Wed, 13 Jan 2021 11:23:31 -0500
X-MC-Unique: P2NHTTooOJW0KrwnrzwuJA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3861E180A086;
 Wed, 13 Jan 2021 16:23:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 881AA6F98F;
 Wed, 13 Jan 2021 16:23:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1B50211386A7; Wed, 13 Jan 2021 17:23:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 00/12] qapi: static typing conversion, pt1.5
References: <20201217015927.197287-1-jsnow@redhat.com>
Date: Wed, 13 Jan 2021 17:23:21 +0100
In-Reply-To: <20201217015927.197287-1-jsnow@redhat.com> (John Snow's message
 of "Wed, 16 Dec 2020 20:59:15 -0500")
Message-ID: <87zh1cvm9y.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

> Hi, this patchset enables strict optional checking in mypy for
> everything we have typed so far.
>
> In general, this patchset seeks to eliminate Optional[T] in favor of T
> wherever possible. Optional types used for object properties,
> function/method parameters and return values where we expect, in most
> cases, to be non-None is troublesome as it requires peppering the code
> with assertions about state. If and whenever possible, prefer using
> non-Optional types.
>
> Ironing out these issues allows us to be even stricter with our type
> checking, which improves consistency in subclass interface types and
> should make review a little nicer.
>
> This series is based on (but does not require) the 'qapi: sphinx-autodoc
> for qapi module' series.

Just two issues left that aren't entirely trivial: 1. mission creep
[PATCH 6+7], 2. integrating my "[PATCH 00/11] Drop support for QAPIGen
without a file name".


