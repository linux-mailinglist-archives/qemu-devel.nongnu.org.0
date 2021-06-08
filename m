Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BBA3A052D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 22:34:34 +0200 (CEST)
Received: from localhost ([::1]:37630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqiQj-0002x0-3e
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 16:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqiPj-0001TP-Oo
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:33:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqiPg-0005PK-Si
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623184407;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=N7VKVZijz4h+qXuKo3mrrMVkUU7uBpZSR1piUnI+vWk=;
 b=CgyT2R9y1j1waWlc7c+1q7P8hQ+G75qZrgth0AtaEHBCwjOwI6ZNzkpDpxfIF0ZzL97mfT
 pRHT0UN/OSFSf1Yu2b4C6z+qwocHpwvSJvhWwCeez+5MNbwnpz2BordYt4egBvyhj5gkCg
 O7uIhC2EBWgg14+LNgiXUVnGl/TGqCs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-lC8I6PVuPYCFDFpscY0_cQ-1; Tue, 08 Jun 2021 16:33:26 -0400
X-MC-Unique: lC8I6PVuPYCFDFpscY0_cQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A9548015C6;
 Tue,  8 Jun 2021 20:33:25 +0000 (UTC)
Received: from redhat.com (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3809E1001281;
 Tue,  8 Jun 2021 20:33:20 +0000 (UTC)
Date: Tue, 8 Jun 2021 21:33:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] tests/unit/test-char.c: Fix error handling issues
Message-ID: <YL/UDQmc/H4b9cvZ@redhat.com>
References: <20210608170607.21902-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210608170607.21902-1-peter.maydell@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 06:06:06PM +0100, Peter Maydell wrote:
> Coverity spots some minor error-handling issues in this test code.
> These are mostly due to the test code assuming that the glib test
> macros g_assert_cmpint() and friends will always abort on failure.
> This is not the case: if the test case chooses to call
> g_test_set_nonfatal_assertions() then they will mark the test case as
> a failure and continue.  (This is different to g_assert(),
> g_assert_not_reached(), and assert(), which really do all always kill
> the process.) The idea is that you use g_assert() for things
> which are really assertions, as you would in normal QEMU code,
> and g_assert_cmpint() and friends for "this check is the thing
> this test case is testing" checks.
> 
> In fact this test case does not currently set assertions to be
> nonfatal, but we should ideally be aiming to get to a point where we
> can set that more generally, because the test harness gives much
> better error reporting (including minor details like "what was the
> name of the test case that actually failed") than a raw assert/abort
> does.  So we mostly fix the Coverity nits by making the error-exit
> path return early if necessary, rather than by converting the
> g_assert_cmpint()s to g_assert()s.
> 
> Fixes: Coverity CID 1432505, 1432514, 1432600, 1451384
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> We had some previous not-very-conclusive discussion about
> g_assert_foo vs g_assert in this thread:
> https://lore.kernel.org/qemu-devel/CAFEAcA9juOChqrh5orybJQwpQsyEZ5z3Dvmy7fjX0DW4Nbgmrg@mail.gmail.com/
> This patch is in some sense me asserting my opinion about the
> right thing to do. You might disagree...

In that thread you show a difference in the TAP output when
g_test_set_nonfatal_assertions is enabled. Instead of it
reporting an abort, it reports an error against the test
and carries on running.

> I think that improving the quality of the failure reporting
> in 'make check' is useful, and that we should probably turn
> on g_test_set_nonfatal_assertions() everywhere. (The worst that
> can happen is that instead of crashing on the assert we proceed
> and crash a bit later, I think.) Awkwardly we don't have a single
> place where we could put that call, so I guess it's a coccinelle
> script to add it to every test's main() function.

Yes, it is a bit of a philosophical question which behaviour
is better - immediate exit, vs report & carry on.  In the
Perl world the normal is to report & carry on so you get
full results for the entire suite. In python / C world it
has been more common to immediately exit.

The report & carry on obviously results in cascading errors
unless you take extra steps to skip stuff you know is going
to cascade. You did some examples of that here with the extra
'goto fail' jumps.

The flipside is that if you have a test that fails 6
different scenarios it is nice to see all 6 failures upfront,
instead of having to play whack-a-mole fixing one and then
discovering the next failure, then fixing that and discovering
the next failure, etc.


When we discussed this last on IRC, I suggested that we
introduce a 'q_test_init' that wraps around g_test_init.
This q_test_init could set g_test_set_nonfatal_assertions
and call 'g_test_init'.

This would avoid need for coccinelle script, as a sed
s/g_test_init/q_test_init/ would suffice. We can stuff
other logic into q_test_Init if we wanted to. Perhaps
a private TMPDIR for example.

>  tests/unit/test-char.c | 36 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/unit/test-char.c b/tests/unit/test-char.c
> index 5b3b48ebacd..43630ab57f8 100644
> --- a/tests/unit/test-char.c
> +++ b/tests/unit/test-char.c
> @@ -214,6 +214,10 @@ static void char_mux_test(void)
>      qemu_chr_fe_take_focus(&chr_be2);
>  
>      base = qemu_chr_find("mux-label-base");
> +    g_assert_nonnull(base);
> +    if (base == 0) {
> +        goto fail;
> +    }
>      g_assert_cmpint(qemu_chr_be_can_write(base), !=, 0);
>  
>      qemu_chr_be_write(base, (void *)"hello", 6);
> @@ -333,6 +337,7 @@ static void char_mux_test(void)
>      g_assert_cmpint(strlen(data), !=, 0);
>      g_free(data);
>  
> +fail:
>      qemu_chr_fe_deinit(&chr_be1, false);
>      qemu_chr_fe_deinit(&chr_be2, true);
>  }
> @@ -486,6 +491,9 @@ static void char_pipe_test(void)
>      chr = qemu_chr_new("pipe", tmp, NULL);
>      g_assert_nonnull(chr);
>      g_free(tmp);
> +    if (!chr) {
> +        goto fail;
> +    }
>  
>      qemu_chr_fe_init(&be, chr, &error_abort);
>  
> @@ -493,12 +501,20 @@ static void char_pipe_test(void)
>      g_assert_cmpint(ret, ==, 9);
>  
>      fd = open(out, O_RDWR);
> +    g_assert_cmpint(fd, >=, 0);
> +    if (fd < 0) {
> +        goto fail;
> +    }
>      ret = read(fd, buf, sizeof(buf));
>      g_assert_cmpint(ret, ==, 9);
>      g_assert_cmpstr(buf, ==, "pipe-out");
>      close(fd);
>  
>      fd = open(in, O_WRONLY);
> +    g_assert_cmpint(fd, >=, 0);
> +    if (fd < 0) {
> +        goto fail;
> +    }
>      ret = write(fd, "pipe-in", 8);
>      g_assert_cmpint(ret, ==, 8);
>      close(fd);
> @@ -518,6 +534,7 @@ static void char_pipe_test(void)
>  
>      qemu_chr_fe_deinit(&be, true);
>  
> +fail:
>      g_assert(g_unlink(in) == 0);
>      g_assert(g_unlink(out) == 0);
>      g_assert(g_rmdir(tmp_path) == 0);
> @@ -556,7 +573,10 @@ static int make_udp_socket(int *port)
>      socklen_t alen = sizeof(addr);
>      int ret, sock = qemu_socket(PF_INET, SOCK_DGRAM, 0);
>  
> -    g_assert_cmpint(sock, >, 0);
> +    g_assert_cmpint(sock, >=, 0);
> +    if (sock < 0) {
> +        return sock;
> +    }
>      addr.sin_family = AF_INET ;
>      addr.sin_addr.s_addr = htonl(INADDR_ANY);
>      addr.sin_port = 0;
> @@ -586,6 +606,9 @@ static void char_udp_test_internal(Chardev *reuse_chr, int sock)
>      } else {
>          int port;
>          sock = make_udp_socket(&port);
> +        if (sock < 0) {
> +            return;
> +        }
>          tmp = g_strdup_printf("udp:127.0.0.1:%d", port);
>          chr = qemu_chr_new("client", tmp, NULL);
>          g_assert_nonnull(chr);
> @@ -1224,6 +1247,10 @@ static void char_file_fifo_test(void)
>      }
>  
>      fd = open(fifo, O_RDWR);
> +    g_assert_cmpint(fd, >=, 0);
> +    if (fd < 0) {
> +        goto fail;
> +    }
>      ret = write(fd, "fifo-in", 8);
>      g_assert_cmpint(ret, ==, 8);
>  
> @@ -1253,6 +1280,7 @@ static void char_file_fifo_test(void)
>  
>      qemu_chr_fe_deinit(&be, true);
>  
> +fail:
>      g_unlink(fifo);
>      g_free(fifo);
>      g_unlink(out);
> @@ -1371,7 +1399,7 @@ static int chardev_change_denied(void *opaque)
>  
>  static void char_hotswap_test(void)
>  {
> -    char *chr_args;
> +    char *chr_args = NULL;
>      Chardev *chr;
>      CharBackend be;
>  
> @@ -1385,6 +1413,9 @@ static void char_hotswap_test(void)
>      int port;
>      int sock = make_udp_socket(&port);
>      g_assert_cmpint(sock, >, 0);
> +    if (sock < 0) {
> +        goto fail;
> +    }
>  
>      chr_args = g_strdup_printf("udp:127.0.0.1:%d", port);
>  
> @@ -1422,6 +1453,7 @@ static void char_hotswap_test(void)
>      object_unparent(OBJECT(chr));
>  
>      qapi_free_ChardevReturn(ret);
> +fail:
>      g_unlink(filename);
>      g_free(filename);
>      g_rmdir(tmp_path);
> -- 
> 2.20.1
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


