Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401ED6EF203
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:30:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcOY-0004W8-2y; Wed, 26 Apr 2023 06:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prcOV-0004Vz-UU
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:29:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prcOU-00017S-6o
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:29:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682504941;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=xlu5lKhDe28leiKQhwbGlsN31YYpoBmS/tLwGTgd4kc=;
 b=euZtaDllG96oyfT5LLAjHWCbMbmUUyJLlXQ35uKDIuskkYjLYAnE/hwQswUtChYw5ak43Y
 pGdHvDXj+5SdWS9/G9vtLbhWRuhGWeIf2uSFnFl95FIEGzhy25bQH74i84EzC23wB9W6FL
 JBPe1sLT4y+UoWdnC4anHnID4WZXUBE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-xH0vVjLRN8SlUXsxkpz_4g-1; Wed, 26 Apr 2023 06:28:59 -0400
X-MC-Unique: xH0vVjLRN8SlUXsxkpz_4g-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f16fa91923so38339115e9.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682504938; x=1685096938;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xlu5lKhDe28leiKQhwbGlsN31YYpoBmS/tLwGTgd4kc=;
 b=XfBm3EJJa0r88hJ+baO8UqWMMsv9r2+l7lSouzJnkwhz6JumiewC2FyxZ2rPBd2Dn9
 /4tMnVLglpQj4W8ZdwS2sVwlYMRVa02WKcp/GI960r9Sfr0BZ4J+iUG9CgLBiUTJyyuW
 yxfkoMceZ2zVNNLkS/f7rYbeA6YvdnipUVKQ8XLDsAe/r79kYnWhVZjElqlUEiXXuKi3
 Uq5clvI4pIUkJEZCL9+OTlv3ig3iYU20cpevPhCjLl/Ar+49T3+sjJDoEjIhM0Ctt6Ec
 7nW4vB4Ps5M5t8H69Q4GgnoZTCC1FiEcRKiKLyyViokQI8jRll3bJRUqcVucPgUHnNX2
 se3g==
X-Gm-Message-State: AAQBX9eNqdt8/yqjezOKpq9i5gjKerW15usy1QubB3s+nNhXYk51v3gI
 qJjtfKeG0cPE524wh1m24L7NDXvbVw054yK/HcvTXRw47khoyvJpXd8tCqOiZD7BKkvDEOEvERO
 TZocBRhcPbcvWPIk=
X-Received: by 2002:a1c:ed01:0:b0:3f1:8c59:4713 with SMTP id
 l1-20020a1ced01000000b003f18c594713mr13079071wmh.12.1682504938241; 
 Wed, 26 Apr 2023 03:28:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350YuAHxIJHaP6Qn3G9se9XctUREKLrdA6jzVceHcKu2MkWTyr3iUnbRQ2+A7kq+MBAZzVBzzug==
X-Received: by 2002:a1c:ed01:0:b0:3f1:8c59:4713 with SMTP id
 l1-20020a1ced01000000b003f18c594713mr13079055wmh.12.1682504937959; 
 Wed, 26 Apr 2023 03:28:57 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 p13-20020a7bcc8d000000b003ee63fe5203sm17618444wma.36.2023.04.26.03.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:28:57 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org,  berrange@redhat.com,  peterx@redhat.com,
 dgilbert@redhat.com,  lsoaresp@redhat.com
Subject: Re: [PATCH] multifd: Avoid busy-wait in multifd_send_pages()
In-Reply-To: <20230425160555.67373-1-manish.mishra@nutanix.com> (manish
 mishra's message of "Tue, 25 Apr 2023 16:05:55 +0000")
References: <20230425160555.67373-1-manish.mishra@nutanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 26 Apr 2023 12:28:56 +0200
Message-ID: <87v8hjey3b.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

"manish.mishra" <manish.mishra@nutanix.com> wrote:
> multifd_send_sync_main() posts request on the multifd channel
> but does not call sem_wait() on channels_ready semaphore, making
> the channels_ready semaphore count keep increasing.
> As a result, sem_wait() on channels_ready in multifd_send_pages()
> is always non-blocking hence multifd_send_pages() keeps searching
> for a free channel in a busy loop until a channel is freed.
>
> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
> ---
>  migration/multifd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/migration/multifd.c b/migration/multifd.c
> index cce3ad6988..43d26e7012 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -615,6 +615,7 @@ int multifd_send_sync_main(QEMUFile *f)
>  
>          trace_multifd_send_sync_main_signal(p->id);
>  
> +        qemu_sem_wait(&multifd_send_state->channels_ready);
>          qemu_mutex_lock(&p->mutex);
>  
>          if (p->quit) {

We need this, but I think it is better to put it on the second loop.

> @@ -919,7 +920,7 @@ int multifd_save_setup(Error **errp)
>      multifd_send_state = g_malloc0(sizeof(*multifd_send_state));
>      multifd_send_state->params = g_new0(MultiFDSendParams, thread_count);
>      multifd_send_state->pages = multifd_pages_init(page_count);
> -    qemu_sem_init(&multifd_send_state->channels_ready, 0);
> +    qemu_sem_init(&multifd_send_state->channels_ready, thread_count);
>      qatomic_set(&multifd_send_state->exiting, 0);
>      multifd_send_state->ops = multifd_ops[migrate_multifd_compression()];

I think this bit is wrong.
We should not set the channels ready until the thread is ready and
channel is created.

What do you think about this patch:

From bcb0ef9b97b858458c403d2e4dc9e0dbd96721b3 Mon Sep 17 00:00:00 2001
From: Juan Quintela <quintela@redhat.com>
Date: Wed, 26 Apr 2023 12:20:36 +0200
Subject: [PATCH] multifd: Fix the number of channels ready

We don't wait in the sem when we are doing a sync_main.  Make it wait
there.  To make things clearer, we mark the channel ready at the
begining of the thread loop.

This causes a busy loop in multifd_send_page().
Found-by: manish.mishra <manish.mishra@nutanix.com>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 903df2117b..e625e8725e 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -635,6 +635,7 @@ int multifd_send_sync_main(QEMUFile *f)
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDSendParams *p = &multifd_send_state->params[i];
 
+        qemu_sem_wait(&multifd_send_state->channels_ready);
         trace_multifd_send_sync_main_wait(p->id);
         qemu_sem_wait(&p->sem_sync);
 
@@ -668,6 +669,7 @@ static void *multifd_send_thread(void *opaque)
     p->num_packets = 1;
 
     while (true) {
+        qemu_sem_post(&multifd_send_state->channels_ready);
         qemu_sem_wait(&p->sem);
 
         if (qatomic_read(&multifd_send_state->exiting)) {
@@ -736,7 +738,6 @@ static void *multifd_send_thread(void *opaque)
             if (flags & MULTIFD_FLAG_SYNC) {
                 qemu_sem_post(&p->sem_sync);
             }
-            qemu_sem_post(&multifd_send_state->channels_ready);
         } else if (p->quit) {
             qemu_mutex_unlock(&p->mutex);
             break;
-- 
2.40.0



