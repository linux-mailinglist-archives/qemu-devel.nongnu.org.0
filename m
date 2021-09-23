Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC0D41676A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 23:23:58 +0200 (CEST)
Received: from localhost ([::1]:47612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTWCD-0006wR-Ic
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 17:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTWB4-00063P-2J
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 17:22:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTWB0-00025O-G5
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 17:22:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632432160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i5VLqd60ZDnN32R+Lri+ovxmt2vr805NUOS1WU6wVq0=;
 b=HdYp2WQ1kRf6hKLb/5IfKhsHlufGxmYQbhYVGThyZl0A0PFysZGyy/bVKo/jvCu0OH95WC
 mBEJzSq4atCSpv3JSY6KIuioJKqaCJhogquSNdk6TxCa/qvM0BSUkEIMqCWOag8jhfshDA
 KLP5sCVxkRNc0WQ8hUsUnixyppsHsws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-Jxk1jGFRPu2Hh-qW4Hqfmw-1; Thu, 23 Sep 2021 17:22:36 -0400
X-MC-Unique: Jxk1jGFRPu2Hh-qW4Hqfmw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70E5FA40C0;
 Thu, 23 Sep 2021 21:22:35 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C59419C59;
 Thu, 23 Sep 2021 21:22:22 +0000 (UTC)
Date: Thu, 23 Sep 2021 16:22:21 -0500
From: "eblake@redhat.com" <eblake@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH v4] Prevent vhost-user-blk-test hang
Message-ID: <20210923212221.3xpweokv7jmz6c7w@redhat.com>
References: <20210923151610.26615-1-raphael.norwitz@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20210923151610.26615-1-raphael.norwitz@nutanix.com>
User-Agent: NeoMutt/20210205-773-8890a5
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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

On Thu, Sep 23, 2021 at 03:16:17PM +0000, Raphael Norwitz wrote:
> In the vhost-user-blk-test, as of now there is nothing stoping
> vhost-user-blk in QEMU writing to the socket right after forking off the
> storage daemon before it has a chance to come up properly, leaving the
> test hanging forever. This intermittently hanging test has caused QEMU
> automation failures reported multiple times on the mailing list [1].
> 
> This change makes the storage-daemon notify the vhost-user-blk-test
> that it is fully initialized and ready to handle client connections by
> creating a pidfile on initialiation. This ensures that the storage-daemon
> backend won't miss vhost-user messages and thereby resolves the hang.
> 
> [1] https://lore.kernel.org/qemu-devel/CAFEAcA8kYpz9LiPNxnWJAPSjc=nv532bEdyfynaBeMeohqBp3A@mail.gmail.com/
> 
> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
> Accidentally left a raw free() in v3. Converted it to g_free() here.
> 
>  tests/qtest/vhost-user-blk-test.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
> index 6f108a1b62..6898f55f11 100644
> --- a/tests/qtest/vhost-user-blk-test.c
> +++ b/tests/qtest/vhost-user-blk-test.c
> @@ -24,6 +24,7 @@
>  #define TEST_IMAGE_SIZE         (64 * 1024 * 1024)
>  #define QVIRTIO_BLK_TIMEOUT_US  (30 * 1000 * 1000)
>  #define PCI_SLOT_HP             0x06
> +#define PIDFILE_RETRIES         5
>  
>  typedef struct {
>      pid_t pid;
> @@ -885,7 +886,8 @@ static void start_vhost_user_blk(GString *cmd_line, int vus_instances,
>                                   int num_queues)
>  {
>      const char *vhost_user_blk_bin = qtest_qemu_storage_daemon_binary();
> -    int i;
> +    int i, retries;
> +    char *daemon_pidfile_path;
>      gchar *img_path;
>      GString *storage_daemon_command = g_string_new(NULL);
>      QemuStorageDaemonState *qsd;
> @@ -898,6 +900,9 @@ static void start_vhost_user_blk(GString *cmd_line, int vus_instances,
>              " -object memory-backend-memfd,id=mem,size=256M,share=on "
>              " -M memory-backend=mem -m 256M ");
>  
> +    daemon_pidfile_path = g_strdup_printf("/tmp/daemon-%d", getpid());
> +    g_assert_cmpint((uintptr_t) daemon_pidfile_path, !=, (uintptr_t) NULL);

Feels verbose compared to:
g_assert(daemon_pidfile_path)

For that matter, can g_strdup_printf() ever return NULL?  On memory
error, it exit()s rather than returning.  So this assert feels like
overkill.

Otherwise,

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


