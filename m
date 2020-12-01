Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6732CAD21
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 21:16:36 +0100 (CET)
Received: from localhost ([::1]:36366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkC4h-0001f9-CC
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 15:16:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kkC3k-0000zB-DA
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:15:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kkC3h-000672-W3
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:15:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606853731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0mANszw1ZqPFSjxUCJcpbcC4Fz6Kz3WAC3wseDgdVqo=;
 b=iMJsQcKiBvBm+nBehQl3S+pIQF7KsVWXkcADKRrTMW9I+Y5Fumgyk2uFj9zXsalAomAszk
 huTZYXlARX6dyUjjoDc2r31/msqCmdJSPwTBU3TbHQCtV/gQTwdQ9C/OJ5Xzue7MtXOJrJ
 4dTrOcywudiM5WcgRIonu1eZBqWMXAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-c9zIgo4NNLKVdJhjB6SVFQ-1; Tue, 01 Dec 2020 15:15:27 -0500
X-MC-Unique: c9zIgo4NNLKVdJhjB6SVFQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCB0B1007461;
 Tue,  1 Dec 2020 20:15:25 +0000 (UTC)
Received: from [10.3.113.230] (ovpn-113-230.phx2.redhat.com [10.3.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1371060BFA;
 Tue,  1 Dec 2020 20:15:23 +0000 (UTC)
To: Alex Chen <alex.chen@huawei.com>
References: <20201201061349.110262-1-alex.chen@huawei.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH] qemu-nbd: Fix a memleak in nbd_client_thread()
Message-ID: <e2180a73-b2e8-4613-00dd-2850e07c2c46@redhat.com>
Date: Tue, 1 Dec 2020 14:15:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201201061349.110262-1-alex.chen@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/20 12:13 AM, Alex Chen wrote:
> When the qio_channel_socket_connect_sync() fails
> we should goto 'out_socket' label to free the 'sioc' instead of
> goto 'out' label.
> In addition, now the 'out' label is useless, delete it.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  qemu-nbd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index 47587a709e..643b0777c0 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -275,7 +275,7 @@ static void *nbd_client_thread(void *arg)
>                                          saddr,
>                                          &local_error) < 0) {
>          error_report_err(local_error);
> -        goto out;
> +        goto out_socket;
>      }
>  
>      ret = nbd_receive_negotiate(NULL, QIO_CHANNEL(sioc),
> @@ -325,7 +325,6 @@ out_fd:
>      close(fd);
>  out_socket:
>      object_unref(OBJECT(sioc));
> -out:
>      g_free(info.name);
>      kill(getpid(), SIGTERM);
>      return (void *) EXIT_FAILURE;
> 

While the patch looks correct, we have a lot of duplication.  Simpler
might be a solution with only one exit label altogether:

diff --git i/qemu-nbd.c w/qemu-nbd.c
index a7075c5419d7..d7bdcd0011ba 100644
--- i/qemu-nbd.c
+++ w/qemu-nbd.c
@@ -265,8 +265,8 @@ static void *nbd_client_thread(void *arg)
     char *device = arg;
     NBDExportInfo info = { .request_sizes = false, .name = g_strdup("") };
     QIOChannelSocket *sioc;
-    int fd;
-    int ret;
+    int fd = -1;
+    int ret = EXIT_FAILURE;
     pthread_t show_parts_thread;
     Error *local_error = NULL;

@@ -278,26 +278,24 @@ static void *nbd_client_thread(void *arg)
         goto out;
     }

-    ret = nbd_receive_negotiate(NULL, QIO_CHANNEL(sioc),
-                                NULL, NULL, NULL, &info, &local_error);
-    if (ret < 0) {
+    if (nbd_receive_negotiate(NULL, QIO_CHANNEL(sioc),
+                              NULL, NULL, NULL, &info, &local_error) < 0) {
         if (local_error) {
             error_report_err(local_error);
         }
-        goto out_socket;
+        goto out;
     }

     fd = open(device, O_RDWR);
     if (fd < 0) {
         /* Linux-only, we can use %m in printf.  */
         error_report("Failed to open %s: %m", device);
-        goto out_socket;
+        goto out;
     }

-    ret = nbd_init(fd, sioc, &info, &local_error);
-    if (ret < 0) {
+    if (nbd_init(fd, sioc, &info, &local_error) < 0) {
         error_report_err(local_error);
-        goto out_fd;
+        goto out;
     }

     /* update partition table */
@@ -311,24 +309,18 @@ static void *nbd_client_thread(void *arg)
         dup2(STDOUT_FILENO, STDERR_FILENO);
     }

-    ret = nbd_client(fd);
-    if (ret) {
-        goto out_fd;
+    if (nbd_client(fd) == 0) {
+        ret = EXIT_SUCCESS;
     }
-    close(fd);
-    object_unref(OBJECT(sioc));
-    g_free(info.name);
-    kill(getpid(), SIGTERM);
-    return (void *) EXIT_SUCCESS;

-out_fd:
-    close(fd);
-out_socket:
+ out:
+    if (fd >= 0) {
+        close(fd);
+    }
     object_unref(OBJECT(sioc));
-out:
     g_free(info.name);
     kill(getpid(), SIGTERM);
-    return (void *) EXIT_FAILURE;
+    return (void *) (intptr_t) ret;
 }
 #endif /* HAVE_NBD_DEVICE */




-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


