Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBFD518270
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 12:38:53 +0200 (CEST)
Received: from localhost ([::1]:34996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlpvg-0007wc-KE
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 06:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nlpqw-00040k-2L
 for qemu-devel@nongnu.org; Tue, 03 May 2022 06:33:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nlpqt-0003fm-Vr
 for qemu-devel@nongnu.org; Tue, 03 May 2022 06:33:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651574035;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ASMNo3KyspxC26aFTWujRspETu2hh7+PksQPG1Sa9T0=;
 b=VIJXtHT9HulEwwGkfWehIefl7Y+hSYjzlRyXOgvOJ3hleJJ6CnGaq7PgdXvJVytkpFBGkq
 YACOWwtR+Q/919nbu4qJKiHE9hBRXZDFFFZgf3G/mQtsqfF/dGtz4yRseNZXQjRKfLVjF0
 R+Krsm3qzW5swKpUpVNw5qPXVvmC8Mw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-i1tQCdxyOmahaZult5LEcQ-1; Tue, 03 May 2022 06:33:53 -0400
X-MC-Unique: i1tQCdxyOmahaZult5LEcQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF82C3C025AD
 for <qemu-devel@nongnu.org>; Tue,  3 May 2022 10:33:53 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B6092166B41;
 Tue,  3 May 2022 10:33:49 +0000 (UTC)
Date: Tue, 3 May 2022 11:33:47 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 20/26] io: replace qemu_set{_non}block()
Message-ID: <YnEFC+PFIw460ExJ@redhat.com>
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-21-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220426092715.3931705-21-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

On Tue, Apr 26, 2022 at 01:27:09PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Those calls are non-socket fd, or are POSIX-specific. Use the dedicated
> GLib API. (qemu_set_nonblock() is for socket-like)
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  io/channel-command.c | 16 +++++++++-------
>  io/channel-file.c    | 13 +++++++++----
>  2 files changed, 18 insertions(+), 11 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


