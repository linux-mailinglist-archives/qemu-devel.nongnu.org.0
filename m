Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B813518271
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 12:39:05 +0200 (CEST)
Received: from localhost ([::1]:35726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlpvr-0008RS-Uk
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 06:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nlppk-0003bz-Se
 for qemu-devel@nongnu.org; Tue, 03 May 2022 06:32:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nlppi-0003Wb-0J
 for qemu-devel@nongnu.org; Tue, 03 May 2022 06:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651573961;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z50dRTOyAxdl+oBVW19gV/EnvCB61xVf1gFS5oCACs0=;
 b=ZnEpSRE8h2I+epi62WPhg+T2pyUxHWF4CEiHo62B8KOddnJgxSKzKgjEMcoR8ldMSOpOL0
 glTwB/9ObgNLzVJcBCW8bn56OM9EMsO/9FjRhw6Zijj679GVG9ih+grm3z1LSqZQUH+yvB
 NC8dbZpzoGLGcXm6h3jDbMrAoDXUZpI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-lghFzXyPNtuWkkvkxSOlmA-1; Tue, 03 May 2022 06:32:40 -0400
X-MC-Unique: lghFzXyPNtuWkkvkxSOlmA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E9B71C0512C
 for <qemu-devel@nongnu.org>; Tue,  3 May 2022 10:32:40 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5586A40D2820;
 Tue,  3 May 2022 10:32:39 +0000 (UTC)
Date: Tue, 3 May 2022 11:32:37 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 19/26] chardev: replace qemu_set_nonblock()
Message-ID: <YnEExdNyYVVqVAmD@redhat.com>
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-20-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220426092715.3931705-20-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
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

On Tue, Apr 26, 2022 at 01:27:08PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Those calls are either for non-socket fd, or are POSIX-specific. Use the
> dedicated GLib API. (qemu_set_nonblock() is for socket-like)
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  chardev/char-fd.c     | 4 ++--
>  chardev/char-pty.c    | 5 ++++-
>  chardev/char-serial.c | 5 ++++-
>  chardev/char-stdio.c  | 5 ++++-
>  4 files changed, 14 insertions(+), 5 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


