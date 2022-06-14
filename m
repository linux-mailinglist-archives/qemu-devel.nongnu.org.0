Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C600D54AF5C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 13:35:30 +0200 (CEST)
Received: from localhost ([::1]:37532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o14pV-0003rH-CV
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 07:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o14n4-0002oR-HJ
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 07:32:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o14n0-0005bI-IO
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 07:32:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655206373;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=H7jPL/mXBcc3gbp6/LTyKu7jZDBOok28vKuXHBsHV+o=;
 b=BtT9NJ70M2nxfxhReEAW7o1p3xFrENB+Rbohav/smejCiQf52CPHvFPKJ4z6uce32h7odu
 d/OpvyvUTYtfckYpvCZOvbkDIJz3epfkAFgSZaH5qpS/KPbSIBOpSSz1mfu/td9exC5tIF
 abo2OeVBFje6cCBX+78fVOXw07Rp9xs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-eAuhee18Mu-MD1rTvktLBg-1; Tue, 14 Jun 2022 07:32:47 -0400
X-MC-Unique: eAuhee18Mu-MD1rTvktLBg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D2F913183C3;
 Tue, 14 Jun 2022 11:32:38 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E1764010E32;
 Tue, 14 Jun 2022 11:32:28 +0000 (UTC)
Date: Tue, 14 Jun 2022 12:32:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrey Ryabinin <arbn@yandex-team.com>
Cc: qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, yc-core@yandex-team.ru
Subject: Re: [PATCH 0/2] Make local migration with TAP network device possible
Message-ID: <Yqhxxs6x2sVLlTWk@redhat.com>
References: <20220614111843.24960-1-arbn@yandex-team.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220614111843.24960-1-arbn@yandex-team.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 14, 2022 at 02:18:41PM +0300, Andrey Ryabinin wrote:
> Hi
> 
> These couple patches aims to  make possible local migration (within one host)
> on the same TAP device used by source and destination QEMU
> 
> The scenario looks like this
>  1. Create TAP devices and pass file descriptors to source QEMU
>  2. Launch destination QEMU (-incoming defer) and pass same descriptors to it.
>  3. Start migration
> 
> 
> Regarding the first patch: It makes possible to receive file descriptor in non-blocking
> state. But I probably didn't cover all FD users which might need to set blocking state after
> the patch. So I'm hopping for the hints where else, besides fd_start_incoming_migration()
> I need to put qemu_socket_set_block() calls.

You'll need to check all callers of

qio_channel_readv_full
qio_channel_readv_full_all
qio_channel_readv_full_all_eof

and identify which pass a non-NULL parameter for 'fds'. If the caller
does NOT have a qemu_setnonblock call on the FD it gets back, then you
have to assume it is expecting it in blocking mode and so need to
add qemu_setblock


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


