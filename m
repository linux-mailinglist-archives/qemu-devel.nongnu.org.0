Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F165F6336
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 11:03:40 +0200 (CEST)
Received: from localhost ([::1]:55004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogMn4-0007Wc-HL
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 05:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogMCI-0008N5-7r
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:25:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogMCF-0004w1-FZ
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:25:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665044734;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DOM+4P0FSRi9naV5liXYAmhT8/2yh9OMmHBHPfDz4SA=;
 b=Dsi/p2TKb4vm0ekefvYMhdrhM1lav0ROXBaInKlNEY0zzyRzq1hW0qlFt2xUdfsRfMoH85
 zH7Tjhk2fMHO4suPYzE6HqFG+m3D1ayzBXve7jJcZqrR+b8ykaJplhZDukU7S/DaMJ1Yrf
 g7b33UVWqDyVjSDWwBklzxrugrPzIio=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-s-6vlGTOPL6Bq06Fgxr5Jg-1; Thu, 06 Oct 2022 04:25:32 -0400
X-MC-Unique: s-6vlGTOPL6Bq06Fgxr5Jg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0ABD38041C7
 for <qemu-devel@nongnu.org>; Thu,  6 Oct 2022 08:25:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0D59400E88C;
 Thu,  6 Oct 2022 08:25:30 +0000 (UTC)
Date: Thu, 6 Oct 2022 09:25:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 2/5] tests/channel-helper: set blocking in main thread
Message-ID: <Yz6Q90gX45EZ50Ip@redhat.com>
References: <20221006081222.2606746-1-marcandre.lureau@redhat.com>
 <20221006081222.2606746-3-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221006081222.2606746-3-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Oct 06, 2022 at 12:12:19PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The /io/channel/command/echo tests run the reader side and the writer
> side with the same underlying command channel. Setting the blocking mode
> of the fd/handles while the other end is already reading/writing may
> create issues (deadlock in win32 when earlier attempt of this series
> were using SetNamedPipeHandleState). Let's just do it before spawning
> the threads to avoid further concurrency issues.

Curious, makes me wonder why I did this in the threads in the first
place...

> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  tests/unit/io-channel-helpers.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


> 
> diff --git a/tests/unit/io-channel-helpers.c b/tests/unit/io-channel-helpers.c
> index ff156ed3c4..c0799c21c2 100644
> --- a/tests/unit/io-channel-helpers.c
> +++ b/tests/unit/io-channel-helpers.c
> @@ -25,7 +25,6 @@
>  struct QIOChannelTest {
>      QIOChannel *src;
>      QIOChannel *dst;
> -    bool blocking;
>      size_t len;
>      size_t niov;
>      char *input;
> @@ -42,8 +41,6 @@ static gpointer test_io_thread_writer(gpointer opaque)
>  {
>      QIOChannelTest *data = opaque;
>  
> -    qio_channel_set_blocking(data->src, data->blocking, NULL);
> -
>      qio_channel_writev_all(data->src,
>                             data->inputv,
>                             data->niov,
> @@ -58,8 +55,6 @@ static gpointer test_io_thread_reader(gpointer opaque)
>  {
>      QIOChannelTest *data = opaque;
>  
> -    qio_channel_set_blocking(data->dst, data->blocking, NULL);
> -
>      qio_channel_readv_all(data->dst,
>                            data->outputv,
>                            data->niov,
> @@ -113,7 +108,9 @@ void qio_channel_test_run_threads(QIOChannelTest *test,
>  
>      test->src = src;
>      test->dst = dst;
> -    test->blocking = blocking;
> +
> +    qio_channel_set_blocking(test->dst, blocking, NULL);
> +    qio_channel_set_blocking(test->src, blocking, NULL);
>  
>      reader = g_thread_new("reader",
>                            test_io_thread_reader,
> -- 
> 2.37.3
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


