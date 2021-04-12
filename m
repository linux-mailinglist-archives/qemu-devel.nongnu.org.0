Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4A935C74A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 15:13:04 +0200 (CEST)
Received: from localhost ([::1]:36860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVwND-00071B-4D
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 09:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lVwLG-0006Dm-C7
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 09:11:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lVwKy-00019H-QR
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 09:11:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618233042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SqhJCcsFxAUbQhJYu5UxyNT0UhoZRZ1pZsxwhFvLVlo=;
 b=OG6tKEFR/ffkeOGC3J+EJnWIWqEVUBplOlik8YZ33n1Pu5vEpwsruswtII31yL2S2XG05U
 PGdGz0rn+ABA2NVSXJd4BsZ+Bp68WXHD/efbt9MgYX58dPfJbm2X2QPa0vzVN0bEjjfwr2
 WjaDh2quV3CFkQhQfOuoruHPiy4JbEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-bvOtUd4pPf6GELDSp7V-Cg-1; Mon, 12 Apr 2021 09:10:39 -0400
X-MC-Unique: bvOtUd4pPf6GELDSp7V-Cg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 798E1195D562;
 Mon, 12 Apr 2021 13:10:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2DC75D6DC;
 Mon, 12 Apr 2021 13:10:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5B541113525D; Mon, 12 Apr 2021 15:10:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Li Zhang <li.zhang@ionos.com>
Subject: Re: [PATCH 2/2] Support monitor chardev hotswap with QMP
References: <20210315170636.704201-1-zhlcindy@gmail.com>
 <20210315170636.704201-2-zhlcindy@gmail.com>
 <CAEM4iGG67hQDPVrKbSsSpsrpbc12+ky=ROh26QUqO5C0+q0jXg@mail.gmail.com>
 <874kgykmgv.fsf@dusky.pond.sub.org>
 <CAEM4iGG4F7eBNXDhjtnFGiy2paJxVuZOm7xYWTMrm9MKEgU8JA@mail.gmail.com>
Date: Mon, 12 Apr 2021 15:10:32 +0200
In-Reply-To: <CAEM4iGG4F7eBNXDhjtnFGiy2paJxVuZOm7xYWTMrm9MKEgU8JA@mail.gmail.com>
 (Li Zhang's message of "Mon, 12 Apr 2021 14:41:19 +0200")
Message-ID: <871rbf7inr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Lukas Straub <lukasstraub2@web.de>, alexandr.iarygin@profitbricks.com,
 QEMU <qemu-devel@nongnu.org>, Li Zhang <li.zhang@cloud.ionos.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>, Li Zhang <zhlcindy@gmail.com>,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Li Zhang <li.zhang@ionos.com> writes:

> Hi Markus,
>
> Any suggestions on this patch?

I understand PATCH 1/2 got superseded by Lukas's "[PATCH v8 0/4] yank:
Add chardev tests and fixes".  I trust Marc-Andr=C3=A9 will take care of it
in due time.

Before I look at the actual patch: does this patch depend on Lukas's fix
or your "[PATCH 1/2] Fix the segment fault when calling
yank_register_instance"?


