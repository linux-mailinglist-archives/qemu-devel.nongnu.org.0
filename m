Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 155604345ED
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 09:34:00 +0200 (CEST)
Received: from localhost ([::1]:33550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md66p-0003SU-84
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 03:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1md65g-00026n-Tg
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 03:32:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1md65f-0006k9-Gu
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 03:32:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634715166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=34+daDLgXiM5IGi/2V+CKQrj1bjn1QzvnuWyhZot5zQ=;
 b=TSDugbrZWQ/J2ADcsZk/P4JLRdz9YMFt2vnUKuZ9V4Tc83gIWZdCuKsj4Y3mQnLbUQl069
 fQt0JneL5+6RTc/h2cxzxLTuvbhENH4GJxTsIewjNFL+KZVVAtNasO6MwLd/BbmMqhbxTX
 NivUDK4IaN8I4Tnf0gVSBFtH7ppPMxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-axo2zW7fOwCzL-3qYZSgNQ-1; Wed, 20 Oct 2021 03:32:43 -0400
X-MC-Unique: axo2zW7fOwCzL-3qYZSgNQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E14919200C1;
 Wed, 20 Oct 2021 07:32:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08D0E10023B8;
 Wed, 20 Oct 2021 07:32:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B518D11380A7; Wed, 20 Oct 2021 09:32:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH v5 4/4] qapi/monitor: only allow 'keep'
 SetPasswordAction for VNC and deprecate
References: <20211019155443.1447372-1-s.reiter@proxmox.com>
 <20211019155443.1447372-5-s.reiter@proxmox.com>
Date: Wed, 20 Oct 2021 09:32:33 +0200
In-Reply-To: <20211019155443.1447372-5-s.reiter@proxmox.com> (Stefan Reiter's
 message of "Tue, 19 Oct 2021 17:54:43 +0200")
Message-ID: <87pms0qhgu.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan Reiter <s.reiter@proxmox.com> writes:

> VNC only supports 'keep' here, enforce this via a seperate
> SetPasswordActionVnc enum and mark the option 'deprecated' (as it is
> useless with only one value possible).
>
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
> ---
>  monitor/qmp-cmds.c |  5 -----
>  qapi/ui.json       | 21 ++++++++++++++++++++-
>  2 files changed, 20 insertions(+), 6 deletions(-)

Shouldn't we update docs/about/deprecated.rst?


