Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBC849817A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 14:53:54 +0100 (CET)
Received: from localhost ([::1]:46632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBzn7-0002zJ-0F
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 08:53:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nBzkL-0000lS-6y
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 08:51:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nBzkF-0000oB-W7
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 08:50:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643032250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u0YOUKxXMzB+VaTqKDmlxEr9DlpbB7ZaAjzI9Toctm8=;
 b=C0Wmz6x8DHmkbPckRCKd1bFhBHkz9BQ0dnj2P2tm4OHxJvYdp5QlO7aZDHwrswWElP6aAm
 jzAW70rbNdp+rW8V9JKzO2NT12pIeiEqnXt/UGrEqat5uuCpClPOUHNCa1YwRAaSfG+rht
 /Eb7vQpn2T6E11hFdp2SYSkH5sDgXks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-D-FgKJJRM7SYyy7DT4Sflw-1; Mon, 24 Jan 2022 08:50:44 -0500
X-MC-Unique: D-FgKJJRM7SYyy7DT4Sflw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C3601898291;
 Mon, 24 Jan 2022 13:50:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-3.ams2.redhat.com [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EAA7E84633;
 Mon, 24 Jan 2022 13:50:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 78C191138640; Mon, 24 Jan 2022 14:50:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v7 0/4] VNC-related HMP/QMP fixes
References: <20211021100135.4146766-1-s.reiter@proxmox.com>
Date: Mon, 24 Jan 2022 14:50:39 +0100
In-Reply-To: <20211021100135.4146766-1-s.reiter@proxmox.com> (Stefan Reiter's
 message of "Thu, 21 Oct 2021 12:01:31 +0200")
Message-ID: <87ee4x8cpc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fabian Ebner <f.ebner@proxmox.com>, Eric Blake <eblake@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan Reiter <s.reiter@proxmox.com> writes:

> Since the removal of the generic 'qmp_change' command, one can no longer replace
> the 'default' VNC display listen address at runtime (AFAIK). For our users who
> need to set up a secondary VNC access port, this means configuring a second VNC
> display (in addition to our standard one for web-access), but it turns out one
> cannot set a password on this second display at the moment, as the
> 'set_password' call only operates on the 'default' display.
>
> Additionally, using secret objects, the password is only read once at startup.
> This could be considered a bug too, but is not touched in this series and left
> for a later date.

Related: Vladimir recently posted a patch to add a new command for
changing VNC server listening addresses.  Daniel asked him to work it
into display-reload instead[1].  Vladimir complied[2].

Daniel, what do you think about this one?  Should it also use
display-reload?


[1] Message-ID: <YdRJ06CS4qoDJI/F@redhat.com>
https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg00292.html

[2] Message-ID: <20220118160909.2502374-1-vsementsov@virtuozzo.com>
https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg03864.html


