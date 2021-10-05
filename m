Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8493A4220B1
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 10:29:37 +0200 (CEST)
Received: from localhost ([::1]:57504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXfpQ-00085b-JR
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 04:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mXfkc-0002w2-Fv
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:24:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mXfkY-0007xi-Hp
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:24:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633422271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RXD1SssiAV6SkA/5njXa6lTkPlqTl58WpvHBqyL0+Hs=;
 b=UaHgaTvp/ri+lSf+Ykq8tSyIGRDSEgl+7FXD8McYfHS8eVSvlp6qqSTyfkOW0LMzuL9be6
 C2od4B0XwCGVOyq/X6ApaPYZRTFiKlo07cUz4TiiGUcP7t0XL2X5sxaRjV4NUxng9e0K/4
 MaLgPIRaCXgNyYy0PjzOtFhWLP11DZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-8CTcjcH6NEei1pPJ4s25rQ-1; Tue, 05 Oct 2021 04:24:30 -0400
X-MC-Unique: 8CTcjcH6NEei1pPJ4s25rQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1E4C1084681
 for <qemu-devel@nongnu.org>; Tue,  5 Oct 2021 08:24:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C996917C58;
 Tue,  5 Oct 2021 08:24:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6336B113865F; Tue,  5 Oct 2021 10:24:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] qapi: Make some ObjectTypes depend on the build settings
References: <20210928160232.432980-1-thuth@redhat.com>
Date: Tue, 05 Oct 2021 10:24:25 +0200
In-Reply-To: <20210928160232.432980-1-thuth@redhat.com> (Thomas Huth's message
 of "Tue, 28 Sep 2021 18:02:32 +0200")
Message-ID: <87sfxfyj46.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> Some of the ObjectType entries already depend on CONFIG_* switches.
> Some others also only make sense with certain configurations, but
> are currently always listed in the ObjectType enum. Let's make them
> depend on the correpsonding CONFIG_* switches, too, so that upper
> layers (like libvirt) have a better way to determine which features
> are available in QEMU.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

All these look good to me.  I didn't look for more.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


