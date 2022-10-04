Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7B75F4237
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 13:45:16 +0200 (CEST)
Received: from localhost ([::1]:38134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofgMM-0001ob-P4
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 07:45:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofgGu-0006D9-HQ
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 07:39:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofgGq-00080h-DJ
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 07:39:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664883571;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S1Por7ddMjHqJ/yF+Wjzu19zXZ12V4uNBCqFNpzpKxc=;
 b=ZT+nzuD5nO5ik9uFg4d7N6+o25rNKlknaWEbAAwUTPphsz8Yrf/Te3Z4B6NPalbbh5FHXi
 YvnQ6gkQGS7ml6nO0nxbKfeGdRqIWiYmEjjnJU6hhTzkgWQ7SGHWXuk6a7NTw/To5sKD8g
 dsNWy1ny2JcuNpGf+z5MwZwGbwocQik=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-impOW50dPmGfG_nnkn6S8A-1; Tue, 04 Oct 2022 07:39:29 -0400
X-MC-Unique: impOW50dPmGfG_nnkn6S8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B7C7299E760;
 Tue,  4 Oct 2022 11:39:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A3BA1415119;
 Tue,  4 Oct 2022 11:39:27 +0000 (UTC)
Date: Tue, 4 Oct 2022 12:39:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, ncopa@alpinelinux.org,
 Laurent Vivier <laurent@vivier.eu>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [RFC PATCH] plugins: add [pre|post]fork helpers to linux-user
 [!TESTED]
Message-ID: <YzwbbIvYgxQv+7Am@redhat.com>
References: <20221004113330.2167736-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221004113330.2167736-1-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 04, 2022 at 12:33:30PM +0100, Alex Bennée wrote:
> Special care needs to be taken in ensuring locks are in a consistent
> state across fork events. Add helpers so the plugin system can ensure
> that.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/358
> ---
>  include/qemu/plugin.h | 24 ++++++++++++++++++++++++
>  linux-user/main.c     |  2 ++
>  plugins/core.c        | 20 ++++++++++++++++++++
>  3 files changed, 46 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Daniel P. Berrangé <berrange@redhat.com>

I confirm it fixes the plugin hangs from #358.

Much much much less frequently, I can still hit the g_slice hangs
described in

 https://gitlab.com/qemu-project/qemu/-/issues/285


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


