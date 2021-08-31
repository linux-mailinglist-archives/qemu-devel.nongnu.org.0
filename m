Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6E33FC7EF
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:13:19 +0200 (CEST)
Received: from localhost ([::1]:43042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3Zk-00058g-En
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2u4-0002qB-5K
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:30:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2u2-0002dy-MQ
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:30:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630413008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qYZj3hZiAq+4JigblpvUmgGUL08VF/PepXeRCS7SMfc=;
 b=Q41rLtMqiv/JfqaBzpBfZt4r8y1/LOAc83sOdIK+NtnJsCSrEt9m6PyaZ1sr7U9v3U+Fet
 CEs2tCT4I82HXFz9slVRO6y4/mbS1JNE8JP/0UUfdZjfurfVFAJfNOjspOMmAMfK4PtfO/
 /42HElOx00jrw0QnauZt6bMMXl+SFpo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-bN4ZrMcjM2ex0xTziHwhMg-1; Tue, 31 Aug 2021 08:30:07 -0400
X-MC-Unique: bN4ZrMcjM2ex0xTziHwhMg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAAE5CC62B;
 Tue, 31 Aug 2021 12:30:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 744376A05B;
 Tue, 31 Aug 2021 12:30:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 621891800936; Tue, 31 Aug 2021 14:30:01 +0200 (CEST)
Date: Tue, 31 Aug 2021 14:30:01 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v3 00/18] Clipboard fixes (for 6.1?)
Message-ID: <20210831123001.jnot6uohtdeaobgt@sirius.home.kraxel.org>
References: <20210805135715.857938-1-marcandre.lureau@redhat.com>
 <CAJ+F1C+sFJaHbg5bP+cqH6Dg=XfX9k-BKfFqEDSw3OMNcPen9w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+sFJaHbg5bP+cqH6Dg=XfX9k-BKfFqEDSw3OMNcPen9w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: QEMU <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > Marc-André Lureau (18):
> >   ui/vdagent: fix leak on error path
> >   ui/vdagent: remove copy-pasta comment
> >   ui/gtk-clipboard: use existing macros
> >   ui/gtk-clipboard: fix clipboard enum typo
> >   ui/clipboard: add helper to retrieve current clipboard
> >   ui/clipboard: add qemu_clipboard_peer_owns() helper
> >   ui/clipboard: add qemu_clipboard_peer_release() helper
> >   ui/clipboard: release owned grabs on unregister
> >   ui/vdagent: disconnect handlers and reset state on finalize
> >   ui/vdagent: reset outbuf on disconnect
> >   ui/vdagent: split clipboard recv message handling
> >   ui/vdagent: use qemu_clipboard_peer_release helper
> >   ui/vdagent: use qemu_clipboard_info helper
> >   ui/vdagent: send empty clipboard when unhandled
> >   ui/gtk-clipboard: use qemu_clipboard_info helper
> >   ui/vdagent: send release when no clipboard owner
> >   ui/gtk-clipboard: emit release clipboard events
> >   ui/vdagent: add a migration blocker

Looks all sane to me.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

> Ping
> 
> Since Gerd is lowering his maintainer responsibilities, is anyone else
> interested?

Don't be shy, send a pull request?

take care,
  Gerd


