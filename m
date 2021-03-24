Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C615A347927
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 14:00:43 +0100 (CET)
Received: from localhost ([::1]:42962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP37q-00063g-TW
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 09:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lP356-0004tm-P3
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 08:57:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lP354-0002mj-CQ
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 08:57:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616590668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cVKalvZ+G9KYrA9QU6YIGIXoAPrJqb5q3ktlQ+U/RwM=;
 b=CRN0uTdSFK5BrZGI1HnD3gFx5CmBu1KZGOcSIEEARW06DFp5lG9zehGjQgLfArHTOGEbrh
 EOf41EgHUQyLXvjRUwL4uUCkWQt3CA4ZTJyMxYnQcaAJKnAylRmrk37WOrwYvpTWzYWTXT
 EId0ooYH8wyj52Xvm3cmqfD9wiQpvI0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-tMRdem-RPrGkJZz3c-iH5A-1; Wed, 24 Mar 2021 08:57:46 -0400
X-MC-Unique: tMRdem-RPrGkJZz3c-iH5A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8218480006E;
 Wed, 24 Mar 2021 12:57:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 451A019C71;
 Wed, 24 Mar 2021 12:57:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 69BAF180039A; Wed, 24 Mar 2021 13:57:43 +0100 (CET)
Date: Wed, 24 Mar 2021 13:57:43 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v2 7/7] ui/gtk: add clipboard support
Message-ID: <20210324125743.zuivmbhje465bfne@sirius.home.kraxel.org>
References: <20210318091647.3233178-1-kraxel@redhat.com>
 <20210318091647.3233178-8-kraxel@redhat.com>
 <CAJ+F1CJqhUX1vnbXOAo8adpkb=rNcJSzMpeGVQnTGT5UuuALJg@mail.gmail.com>
 <20210324101650.irnpfnklksfnejic@sirius.home.kraxel.org>
 <CAJ+F1C+HKdo_MK4rgw4pOpVzRnUu3Pu8O9YrjwFu8ZxGQCP+3A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+HKdo_MK4rgw4pOpVzRnUu3Pu8O9YrjwFu8ZxGQCP+3A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> I fail to see how that works, imagine the other end is the same code (qemu
> in the guest), it will take clipboard ownership and it is in a endless
> loop, isn't it?

Notifications on guest-triggered clipboard updates will not be sent back
to the guest, exactly to avoid that kind of loop.  See self_update
checks in vdagent_clipboard_notify().  gtk and vnc notify callbacks have
simliar checks for simliar reasons ;)

take care,
  Gerd


