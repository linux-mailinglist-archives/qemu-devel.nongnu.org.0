Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F276A6978
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 10:07:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXIQl-0002Yd-Rh; Wed, 01 Mar 2023 04:07:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXIQk-0002YE-HX
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:07:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXIQi-0003h5-It
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:07:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677661640;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=U+iejTLeCJuoXd0tH9wGr3nVL7f+w48njNqWaVVQxlw=;
 b=hJAl23rpLVfwz6cxDQbpUIh3hRcF6ujBTi7W3w4UehZ9PSavHJAsxPGVMAnId6cEpXMYrc
 Kbl1qW/DcW6iUHcOB6G2rO106JJtF8ruXcZbbd6bkoLa7nwooDkHh0+/8h6Uesf2f4wNGo
 a+wzr++qZca1w5JTAWpa5BYJjYNOLXk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-Yd9EHIBvOcmKATr5LBShWw-1; Wed, 01 Mar 2023 04:07:16 -0500
X-MC-Unique: Yd9EHIBvOcmKATr5LBShWw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47C291C02D2C;
 Wed,  1 Mar 2023 09:07:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 344E1492B00;
 Wed,  1 Mar 2023 09:07:15 +0000 (UTC)
Date: Wed, 1 Mar 2023 09:07:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: michael.roth@amd.com, kkostiuk@redhat.com, marcandre.lureau@gmail.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 4/4] qga: test: Add tests for `merge-output` flag
Message-ID: <Y/8VwOClKyHfWWqH@redhat.com>
References: <cover.1677617035.git.dxu@dxuuu.xyz>
 <46322f524542aa2147939efc1e814c9d1d273919.1677617035.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <46322f524542aa2147939efc1e814c9d1d273919.1677617035.git.dxu@dxuuu.xyz>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 28, 2023 at 01:48:04PM -0700, Daniel Xu wrote:
> This commit adds a test to ensure `merge-output` functions as expected.
> We also add a negative test to ensure we haven't regressed previous
> functionality.
> 
> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
> ---
>  tests/unit/test-qga.c | 157 +++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 140 insertions(+), 17 deletions(-)
> 
> diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
> index b4e0a14573..717f3d1103 100644
> --- a/tests/unit/test-qga.c
> +++ b/tests/unit/test-qga.c
> @@ -755,6 +755,31 @@ static void test_qga_fsfreeze_status(gconstpointer fix)
>      g_assert_cmpstr(status, ==, "thawed");
>  }
>  
> +static QDict *wait_for_guest_exec_completion(int fd, int64_t pid)
> +{
> +    QDict *ret = NULL;
> +    int64_t now;
> +    bool exited;
> +    QDict *val;
> +
> +    now = g_get_monotonic_time();
> +    do {
> +        ret = qmp_fd(fd,
> +                     "{'execute': 'guest-exec-status',"
> +                     " 'arguments': { 'pid': %" PRId64 " } }", pid);
> +        g_assert_nonnull(ret);
> +        val = qdict_get_qdict(ret, "return");
> +        exited = qdict_get_bool(val, "exited");
> +        if (!exited) {
> +            qobject_unref(ret);
> +        }
> +    } while (!exited &&
> +             g_get_monotonic_time() < now + 5 * G_TIME_SPAN_SECOND);
> +    g_assert(exited);
> +
> +    return ret;
> +}
> +
>  static void test_qga_guest_exec(gconstpointer fix)
>  {
>      const TestFixture *fixture = fix;
> @@ -762,9 +787,8 @@ static void test_qga_guest_exec(gconstpointer fix)
>      QDict *val;
>      const gchar *out;
>      g_autofree guchar *decoded = NULL;
> -    int64_t pid, now, exitcode;
> +    int64_t pid, exitcode;
>      gsize len;
> -    bool exited;
>  
>      /* exec 'echo foo bar' */
>      ret = qmp_fd(fixture->fd, "{'execute': 'guest-exec', 'arguments': {"
> @@ -777,23 +801,10 @@ static void test_qga_guest_exec(gconstpointer fix)
>      g_assert_cmpint(pid, >, 0);
>      qobject_unref(ret);
>  
> -    /* wait for completion */
> -    now = g_get_monotonic_time();
> -    do {
> -        ret = qmp_fd(fixture->fd,
> -                     "{'execute': 'guest-exec-status',"
> -                     " 'arguments': { 'pid': %" PRId64 " } }", pid);
> -        g_assert_nonnull(ret);
> -        val = qdict_get_qdict(ret, "return");
> -        exited = qdict_get_bool(val, "exited");
> -        if (!exited) {
> -            qobject_unref(ret);
> -        }
> -    } while (!exited &&
> -             g_get_monotonic_time() < now + 5 * G_TIME_SPAN_SECOND);
> -    g_assert(exited);
> +    ret = wait_for_guest_exec_completion(fixture->fd, pid);
>  
>      /* check stdout */
> +    val = qdict_get_qdict(ret, "return");
>      exitcode = qdict_get_int(val, "exitcode");
>      g_assert_cmpint(exitcode, ==, 0);
>      out = qdict_get_str(val, "out-data");
> @@ -802,6 +813,114 @@ static void test_qga_guest_exec(gconstpointer fix)
>      g_assert_cmpstr((char *)decoded, ==, "\" test_str \"");
>  }
>  
> +static void test_qga_guest_exec_output_no_merge(gconstpointer fix)
> +{
> +    const TestFixture *fixture = fix;
> +    g_autoptr(QDict) ret = NULL;
> +    QDict *val;
> +    const gchar *out, *err;
> +    g_autofree guchar *out_decoded = NULL;
> +    g_autofree guchar *err_decoded = NULL;
> +    int64_t pid, exitcode;
> +    gsize len;
> +
> +    /* exec 'echo foo bar' */
> +    ret = qmp_fd(fixture->fd, "{'execute': 'guest-exec', 'arguments': {"
> +                 " 'path': '/bin/bash',"
> +                 " 'arg': [ '-c', 'for i in $(seq 4); do if (( $i %% 2 )); then echo stdout; else echo stderr 1>&2; fi; done;' ],"
> +                 " 'capture-output': true } }");

Surely /bin/bash isn't going to exist on most (all?) Windows deployments,
and so this test will fail on Windows builds ?


> +    g_assert_nonnull(ret);
> +    qmp_assert_no_error(ret);
> +    val = qdict_get_qdict(ret, "return");
> +    pid = qdict_get_int(val, "pid");
> +    g_assert_cmpint(pid, >, 0);
> +    qobject_unref(ret);
> +
> +    ret = wait_for_guest_exec_completion(fixture->fd, pid);
> +
> +    val = qdict_get_qdict(ret, "return");
> +    exitcode = qdict_get_int(val, "exitcode");
> +    g_assert_cmpint(exitcode, ==, 0);
> +
> +    /* check stdout */
> +    out = qdict_get_str(val, "out-data");
> +    out_decoded = g_base64_decode(out, &len);
> +    g_assert_cmpint(len, ==, 14);
> +    g_assert_cmpstr((char *)out_decoded, ==, "stdout\nstdout\n");
> +
> +    /* check stderr */
> +    err = qdict_get_try_str(val, "err-data");
> +    err_decoded = g_base64_decode(err, &len);
> +    g_assert_cmpint(len, ==, 14);
> +    g_assert_cmpstr((char *)err_decoded, ==, "stderr\nstderr\n");
> +}
> +
> +#if defined(G_OS_WIN32)
> +static void test_qga_guest_exec_output_merge(gconstpointer fix)
> +{
> +    const TestFixture *fixture = fix;
> +    g_autoptr(QDict) ret = NULL;
> +    QDict *val;
> +    const gchar *class, *desc;
> +    g_autofree guchar *decoded = NULL;
> +
> +    /* exec 'echo foo bar' */
> +    ret = qmp_fd(fixture->fd, "{'execute': 'guest-exec', 'arguments': {"
> +                 " 'path': '/bin/bash',"
> +                 " 'arg': [ '-c', 'for i in $(seq 4); do if (( $i %% 2 )); then echo stdout; else echo stderr 1>&2; fi; done;' ],"

Looks odd to be invoking bash, though in this case its harmless as we
don't get that far. Still would suggest using 'cmd.exe' as the
example though.

> +                 " 'capture-output': true,"
> +                 " 'merge-output': true } }");
> +
> +    g_assert_nonnull(ret);
> +    val = qdict_get_qdict(ret, "error");
> +    g_assert_nonnull(val);
> +    class = qdict_get_str(val, "class");
> +    desc = qdict_get_str(val, "desc");
> +    g_assert_cmpstr(class, ==, "GenericError");
> +    g_assert_cmpint(strlen(desc), >, 0);
> +}
> +#else
> +static void test_qga_guest_exec_output_merge(gconstpointer fix)
> +{
> +    const TestFixture *fixture = fix;
> +    g_autoptr(QDict) ret = NULL;
> +    QDict *val;
> +    const gchar *out, *err;
> +    g_autofree guchar *decoded = NULL;
> +    int64_t pid, exitcode;
> +    gsize len;
> +
> +    /* exec 'echo foo bar' */
> +    ret = qmp_fd(fixture->fd, "{'execute': 'guest-exec', 'arguments': {"
> +                 " 'path': '/bin/bash',"
> +                 " 'arg': [ '-c', 'for i in $(seq 4); do if (( $i %% 2 )); then echo stdout; else echo stderr 1>&2; fi; done;' ],"
> +                 " 'capture-output': true,"
> +                 " 'merge-output': true } }");
> +    g_assert_nonnull(ret);
> +    qmp_assert_no_error(ret);
> +    val = qdict_get_qdict(ret, "return");
> +    pid = qdict_get_int(val, "pid");
> +    g_assert_cmpint(pid, >, 0);
> +    qobject_unref(ret);
> +
> +    ret = wait_for_guest_exec_completion(fixture->fd, pid);
> +
> +    val = qdict_get_qdict(ret, "return");
> +    exitcode = qdict_get_int(val, "exitcode");
> +    g_assert_cmpint(exitcode, ==, 0);
> +
> +    /* check stdout */
> +    out = qdict_get_str(val, "out-data");
> +    decoded = g_base64_decode(out, &len);
> +    g_assert_cmpint(len, ==, 28);
> +    g_assert_cmpstr((char *)decoded, ==, "stdout\nstderr\nstdout\nstderr\n");
> +
> +    /* check stderr */
> +    err = qdict_get_try_str(val, "err-data");
> +    g_assert_null(err);
> +}
> +#endif
> +
>  static void test_qga_guest_exec_invalid(gconstpointer fix)
>  {
>      const TestFixture *fixture = fix;
> @@ -972,6 +1091,10 @@ int main(int argc, char **argv)
>      g_test_add_data_func("/qga/blockedrpcs", NULL, test_qga_blockedrpcs);
>      g_test_add_data_func("/qga/config", NULL, test_qga_config);
>      g_test_add_data_func("/qga/guest-exec", &fix, test_qga_guest_exec);
> +    g_test_add_data_func("/qga/guest-exec-output-no-merge", &fix,
> +                         test_qga_guest_exec_output_no_merge);
> +    g_test_add_data_func("/qga/guest-exec-output-merge", &fix,
> +                         test_qga_guest_exec_output_merge);
>      g_test_add_data_func("/qga/guest-exec-invalid", &fix,
>                           test_qga_guest_exec_invalid);
>      g_test_add_data_func("/qga/guest-get-osinfo", &fix,
> -- 
> 2.39.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


