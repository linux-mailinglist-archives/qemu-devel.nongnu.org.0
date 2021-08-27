Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0303F9F49
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:57:33 +0200 (CEST)
Received: from localhost ([::1]:60092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJh2i-0007UF-Rl
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mJh1G-0006lc-Ve
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 14:56:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mJh1C-0005kb-2Q
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 14:56:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630090556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GuaaiI7ps7pC947Eco058fNG/MWx2GVrMdzZDRHBYVc=;
 b=NaPSZaabmY0N2+OImZ6+4k8Nb18ydguM+b8GUkuYI3eXKQbb30W4MeAKL0lJCLGWlLPyzT
 zNPev/TVUYjiZpJvCDdlY38iyi/zccGnQy5DwvpYzV4fU4jj/tWD2z7uCoUuVMYhQLFNq/
 UTAnsV6FJrt3XRUFa2N651e2l6l11Ro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-4b86KLE4PD621fMLn-RLEA-1; Fri, 27 Aug 2021 14:55:53 -0400
X-MC-Unique: 4b86KLE4PD621fMLn-RLEA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F15BD801B3D;
 Fri, 27 Aug 2021 18:55:51 +0000 (UTC)
Received: from redhat.com (ovpn-112-96.phx2.redhat.com [10.3.112.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA3AD1017CCB;
 Fri, 27 Aug 2021 18:55:42 +0000 (UTC)
Date: Fri, 27 Aug 2021 13:55:41 -0500
From: "eblake@redhat.com" <eblake@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH 2/2] Prevent vhost-user-blk-test hang
Message-ID: <20210827185541.ehmhgoznavtyogfc@redhat.com>
References: <20210827164954.13951-1-raphael.norwitz@nutanix.com>
 <20210827164954.13951-2-raphael.norwitz@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20210827164954.13951-2-raphael.norwitz@nutanix.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 27, 2021 at 04:50:47PM +0000, Raphael Norwitz wrote:
> In the vhost-user-blk-test, as of now there is nothing stoping

stopping

> vhost-user-blk in QEMU writing to the socket right after forking off the
> storage daemon before it has a chance to come up properly, leaving the
> test hanging forever. This intermittently hanging test has caused QEMU
> automation failures reported multiple times on the mailing list [1].
> 
> This change makes the storage-daemon notify the vhost-user-blk-test
> that it is fully initialized and ready to handle client connections via
> a pipefd before allowing the test to proceed. This ensures that the
> storage-daemon backend won't miss vhost-user messages and thereby
> resolves the hang.

As I said on patch 1, I think the proper fix here is to utilize the
--pidfile option.

> 
> [1] https://lore.kernel.org/qemu-devel/CAFEAcA8kYpz9LiPNxnWJAPSjc=nv532bEdyfynaBeMeohqBp3A@mail.gmail.com/
> 
> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
>  tests/qtest/vhost-user-blk-test.c | 33 ++++++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
> index 6f108a1b62..b62af449df 100644
> --- a/tests/qtest/vhost-user-blk-test.c
> +++ b/tests/qtest/vhost-user-blk-test.c
> @@ -21,6 +21,8 @@
>  #include "libqos/vhost-user-blk.h"
>  #include "libqos/libqos-pc.h"
>  
> +const char *daemon_msg = "Block exports setup\n";
> +
>  #define TEST_IMAGE_SIZE         (64 * 1024 * 1024)
>  #define QVIRTIO_BLK_TIMEOUT_US  (30 * 1000 * 1000)
>  #define PCI_SLOT_HP             0x06
> @@ -885,7 +887,8 @@ static void start_vhost_user_blk(GString *cmd_line, int vus_instances,
>                                   int num_queues)
>  {
>      const char *vhost_user_blk_bin = qtest_qemu_storage_daemon_binary();
> -    int i;
> +    int i, err, pipe_fds[2];
> +    char buf[32] = {0};
>      gchar *img_path;
>      GString *storage_daemon_command = g_string_new(NULL);
>      QemuStorageDaemonState *qsd;
> @@ -898,6 +901,12 @@ static void start_vhost_user_blk(GString *cmd_line, int vus_instances,
>              " -object memory-backend-memfd,id=mem,size=256M,share=on "
>              " -M memory-backend=mem -m 256M ");
>  
> +    err = pipe(pipe_fds);
> +    if (err != 0) {
> +        fprintf(stderr, "start_vhost_user_blk: pipe() failed %m\n");
> +        abort();
> +    }

Instead of setting up a pipe()...

> +
>      for (i = 0; i < vus_instances; i++) {
>          int fd;
>          char *sock_path = create_listen_socket(&fd);
> @@ -914,22 +923,40 @@ static void start_vhost_user_blk(GString *cmd_line, int vus_instances,
>                                 i + 1, sock_path);
>      }
>  
> +    g_string_append_printf(storage_daemon_command, "--printset");

...change this to request the --pidfile option...

> +
>      g_test_message("starting vhost-user backend: %s",
>                     storage_daemon_command->str);
> +
>      pid_t pid = fork();
>      if (pid == 0) {
> +        close(pipe_fds[0]);
> +
>          /*
>           * Close standard file descriptors so tap-driver.pl pipe detects when
>           * our parent terminates.
>           */
>          close(0);
> -        close(1);
>          open("/dev/null", O_RDONLY);
> -        open("/dev/null", O_WRONLY);
> +        close(1);
> +        dup2(pipe_fds[1], 1);
>  
>          execlp("/bin/sh", "sh", "-c", storage_daemon_command->str, NULL);
>          exit(1);
>      }
> +
> +    close(pipe_fds[1]);
> +
> +    err = read(pipe_fds[0], buf, 20);
> +    if (err < 0) {
> +        fprintf(stderr, "Failed to read from storage-daemon pipe %m\n");
> +        abort();
> +    } else if (strcmp(buf, daemon_msg) != 0) {
> +        fprintf(stderr, "qemu-storage-daemon did not write expected messaage "
> +                "to the pipe. Total bytes read: %d. Got: %s\n", err, buf);
> +        abort();
> +    }

...and instead of trying to read() from a pipe, you instead wait until
the pid file exists.

> +
>      g_string_free(storage_daemon_command, true);
>  
>      qsd = g_new(QemuStorageDaemonState, 1);
> -- 
> 2.20.1
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


