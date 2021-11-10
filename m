Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3516944BB72
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 06:50:50 +0100 (CET)
Received: from localhost ([::1]:40690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkgVV-0000Gd-9J
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 00:50:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkgU6-00080m-RB
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 00:49:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkgU5-0008Fb-Fx
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 00:49:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636523360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gkqEHVBtF3gM5Orhr76IngYzTKdsZsxTQDpJTAdOt1Y=;
 b=E3ok4ap/nrJReX9L5vDeVG2WIwpDr2+EK0gHPw2Ecud8nsfniJRewmD7P0jpCkefHAKNCV
 CAK7trFOTte2ispm8yhMiL9jgrITpfRU4PZ/XqLTCUMq++bh5bXyBM9wVEmsK7a/RRHvVU
 YfRGeooKYXBhxxKKU+wfAPZRFlbgtuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-W5zJwxCqMweP4ZL3Vas1mw-1; Wed, 10 Nov 2021 00:49:15 -0500
X-MC-Unique: W5zJwxCqMweP4ZL3Vas1mw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C41D18125C0;
 Wed, 10 Nov 2021 05:49:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AB7160854;
 Wed, 10 Nov 2021 05:49:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B508611380A7; Wed, 10 Nov 2021 06:49:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] monitor: Fix find_device_state() for IDs containing
 slashes
References: <20211019085711.86377-1-armbru@redhat.com>
Date: Wed, 10 Nov 2021 06:49:03 +0100
In-Reply-To: <20211019085711.86377-1-armbru@redhat.com> (Markus Armbruster's
 message of "Tue, 19 Oct 2021 10:57:11 +0200")
Message-ID: <87sfw45zn4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: damien.hedde@greensocs.com, pbonzini@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Recent commit 6952026120 "monitor: Tidy up find_device_state()"
> assumed the function's argument is "the device's ID or QOM path" (as
> documented for device_del).  It's actually either an absolute QOM
> path, or a QOM path relative to /machine/peripheral/.  Such a relative
> path is a device ID when it doesn't contain a slash.  When it does,
> the function now always fails.  Broke iotest 200, which uses relative
> path "vda/virtio-backend".
>
> It fails because object_resolve_path_component() resolves just one
> component, not a relative path.
>
> The obvious function to resolve relative paths is
> object_resolve_path().  It picks a parent automatically.  Too much
> magic, we want to specify the parent.  Create new
> object_resolve_path_at() for that, and use it in find_device_state().
>
> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Queued for 6.2 & PR sent.


