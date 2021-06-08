Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC6639F814
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 15:46:26 +0200 (CEST)
Received: from localhost ([::1]:35438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqc3l-0004Va-OQ
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 09:46:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqc2n-0003hV-NZ
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:45:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqc2l-0003Go-FK
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:45:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623159922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5FJg6G2ci8cBPe2lxNcuvVEg6/beSWovwgO3nnBw0Wo=;
 b=GARmnV2tRqk62m9WVYZsnes8rh6g71ovt9bpmulmO1hPftpgPut+fRmkalYaSLX9g8xdcr
 ScKwc8nq4t6RlOfdOi9i38x6gWVmTVR3ogELXxLSEoWU+qFbU9lhxGW+dQr5Qr3abKtaNl
 znMFDKg3OOsaEw7+nszgSTrSlNjkfRw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-faQvGBSgMuyZ2jk7LvDlTQ-1; Tue, 08 Jun 2021 09:45:21 -0400
X-MC-Unique: faQvGBSgMuyZ2jk7LvDlTQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAE69803622
 for <qemu-devel@nongnu.org>; Tue,  8 Jun 2021 13:45:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CECA5D6A1;
 Tue,  8 Jun 2021 13:45:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0A61E113865F; Tue,  8 Jun 2021 15:45:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] object: add more commands to preconfig mode
References: <20210511153938.505687-1-pbonzini@redhat.com>
Date: Tue, 08 Jun 2021 15:45:19 +0200
In-Reply-To: <20210511153938.505687-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Tue, 11 May 2021 11:39:38 -0400")
Message-ID: <87czswzd00.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This has been committed already, but here goes anyway...

Paolo Bonzini <pbonzini@redhat.com> writes:

> Creating and destroying QOM objects does not require a fully constructed
> machine.  Allow running object-add and object-del before machine
> initialization has concluded.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Well, *some* QOM objects do require a fully constructed machine (or else
device_add should be allowd in preconfig).  object-add creates only
*user-creatable* QOM objects (the ones implementing
TYPE_USER_CREATABLE).

How can we be sure the user-creatable objects we have don't require a
fully constructed machine?

What stops future user-creatable objects from requiring one?  Would be
bad, because they'd work fine in casual testing, and explode when used
in the (somewhat exotic) preconfig state.

In case it helps, let me list the user-creatable QOM types.  QMP command

    {"execute": "qom-list-types", "arguments": {"implements": "qtest"}}

gets us the ones compiled into a specific system emulator.  My x86_64
coughs up

    "authz-list"
    "authz-list-file"
    "authz-pam"
    "authz-simple"
    "can-bus"
    "can-host-socketcan"
    "colo-compare"
    "cryptodev-backend"
    "cryptodev-backend-builtin"
    "cryptodev-vhost-user"
    "dbus-vmstate"
    "filter-buffer"
    "filter-dump"
    "filter-mirror"
    "filter-redirector"
    "filter-replay"
    "filter-rewriter"
    "input-barrier"
    "input-linux"
    "iothread"
    "memory-backend-file"
    "memory-backend-memfd"
    "memory-backend-ram"
    "pr-manager-helper"
    "qtest"
    "rng-builtin"
    "rng-egd"
    "rng-random"
    "secret"
    "secret_keyring"
    "sev-guest"
    "throttle-group"
    "tls-cipher-suites"
    "tls-creds-anon"
    "tls-creds-psk"
    "tls-creds-x509"
    "x-remote-object"

I could do this for all system emulators, but I prefer differently
boring; code inspection finds two more:

    "pef-guest"
    "s390-pv-guest"


