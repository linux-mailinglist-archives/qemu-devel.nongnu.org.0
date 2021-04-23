Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B06368F72
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 11:34:07 +0200 (CEST)
Received: from localhost ([::1]:33554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZsCL-0006RA-UQ
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 05:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZsBE-00060E-9s
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 05:32:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZsBC-00024r-A6
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 05:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619170372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hyY5TkHrmJc2xB7DlqFjX/Fjr6QjUd1pZgRuukUwu0U=;
 b=eaZMqAqN6nCBaqRT5BEwjb4zNijCE7WrfDiu0A/bDfL6TZZe17B1SD6n/c4I0mR/8zOLlh
 2RHQ4lZLaH/aCvtpOzoPULVDPj2HJeYrbmQmUXETi96R0aI5cKmLOOmATwyyh2yAbpJxIm
 mPW3vSDp5BvD6bNBS+wZ4OIwQErFHUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-bdkrswbxO4G_ubRCqVeRZw-1; Fri, 23 Apr 2021 05:32:51 -0400
X-MC-Unique: bdkrswbxO4G_ubRCqVeRZw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E09C83DD20
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 09:32:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A8C460938;
 Fri, 23 Apr 2021 09:32:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C85C2113525D; Fri, 23 Apr 2021 11:32:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 4/9] ui/vdagent: core infrastructure
References: <20210423083351.2096734-1-kraxel@redhat.com>
 <20210423083351.2096734-5-kraxel@redhat.com>
Date: Fri, 23 Apr 2021 11:32:39 +0200
In-Reply-To: <20210423083351.2096734-5-kraxel@redhat.com> (Gerd Hoffmann's
 message of "Fri, 23 Apr 2021 10:33:46 +0200")
Message-ID: <87h7jxjqh4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gerd Hoffmann <kraxel@redhat.com> writes:

> The vdagent protocol allows the guest agent (spice-vdagent) and the
> spice client exchange messages to implement features which require
> guest cooperation, for example clipboard support.
>
> This is a qemu implementation of the spice client side.  This allows
> the spice guest agent talk to qemu directly when not using the spice
> protocol.
>
> usage: qemu \
>   -chardev vdagent,id=vdagent \
>   -device virtserialport,chardev=vdagent,name=com.redhat.spice.0
>
> This patch adds just the protocol basics: initial handshake and
> capability negotiation.  The following patches will add actual
> functionality and also add fields to the initially empty
> ChardevVDAgent qapi struct.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

For the QAPI schema:
Acked-by: Markus Armbruster <armbru@redhat.com>


