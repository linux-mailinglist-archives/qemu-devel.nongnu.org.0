Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2832DEDCF
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 09:11:42 +0100 (CET)
Received: from localhost ([::1]:41142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqXL3-0004h1-Dc
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 03:11:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqXJY-00045v-3e
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 03:10:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqXJV-0003YG-PB
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 03:10:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608365404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h9Bhn6bbZPodUHWYY5uEseZkmHNalWCu5OkBQ1UUE6Y=;
 b=NfFV7B3calFVb5zkxV2RUu1eqZMO4m+JGTI+5C64XkDczQnoQ/pqYqlZPBXWWcIbZ9BMbP
 F2njLa6vDsHFgWOZLDLAv7dwEpli/rmjfgXW2EwCzOrP3gtNoEH1rDZJ3PhQtZf7wB1fVd
 Gktk12Ju6Bet5bIP030DFD+O9lI6290=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-67Tgdq0ZMlCe4gWmt6FShQ-1; Sat, 19 Dec 2020 03:10:03 -0500
X-MC-Unique: 67Tgdq0ZMlCe4gWmt6FShQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABE5315725;
 Sat, 19 Dec 2020 08:10:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D30710023B2;
 Sat, 19 Dec 2020 08:09:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3E71E1130358; Sat, 19 Dec 2020 09:09:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH v12 0/7] Introduce 'yank' oob qmp command to recover
 from hanging qemu
References: <cover.1607858747.git.lukasstraub2@web.de>
 <878s9z43tf.fsf@dusky.pond.sub.org>
Date: Sat, 19 Dec 2020 09:09:56 +0100
In-Reply-To: <878s9z43tf.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Tue, 15 Dec 2020 14:05:48 +0100")
Message-ID: <87eejmz06j.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_TONAME_EQ_TOLOCAL_SHORT=1.999, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Lukas Straub <lukasstraub2@web.de> writes:
>
>> Hello Everyone,
>> So here is v12.
>> @Marc-Andr=C3=A9 Lureau, We still need an ACK for the chardev patch.
>
> Marc-Andr=C3=A9?  Would be good to get this wrapped before Christmas.

No go.

Unless someone objects, I'll merge this when I'm back (mid January) with
or without an ACK for chardev.


