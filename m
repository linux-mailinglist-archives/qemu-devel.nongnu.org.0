Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E4E518228
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 12:19:07 +0200 (CEST)
Received: from localhost ([::1]:47302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlpcX-0003hX-KZ
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 06:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nlpaX-0002id-8g
 for qemu-devel@nongnu.org; Tue, 03 May 2022 06:17:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nlpaU-0000d4-Fv
 for qemu-devel@nongnu.org; Tue, 03 May 2022 06:16:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651573017;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PUpUzcerXgqfOTZxn6j1LtqJ9S8aR52ppjf+RjoHvXA=;
 b=KxC3Kq2+R8eax1jY5feEawIXRoMCXcoWgcCuuNtPlUO/1rdy7AGTg6OhKt7NXkHRm/rlxi
 W/E4BK7hxiS9Hmq7sn7bZVDwTHpsH8KF9Dps8UpvSG1DOVuCI77tRBmgGVVmPdrLgiI0eb
 LdjmvAXdFKtS9IQCjZic3eigBZiqoGI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-CXEpNzujPgGfaVifi1NTlw-1; Tue, 03 May 2022 06:16:55 -0400
X-MC-Unique: CXEpNzujPgGfaVifi1NTlw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85B84801210
 for <qemu-devel@nongnu.org>; Tue,  3 May 2022 10:16:55 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D88C40D1CF;
 Tue,  3 May 2022 10:16:54 +0000 (UTC)
Date: Tue, 3 May 2022 11:16:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:virtiofs" <virtio-fs@redhat.com>
Subject: Re: [PATCH v2 15/26] virtiofsd: replace pipe() with
 g_unix_open_pipe(CLOEXEC)
Message-ID: <YnEBFEVcSN2Jarwf@redhat.com>
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-16-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220426092715.3931705-16-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

On Tue, Apr 26, 2022 at 01:27:04PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  tools/virtiofsd/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


