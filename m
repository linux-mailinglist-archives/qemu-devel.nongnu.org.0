Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985595EC950
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 18:21:56 +0200 (CEST)
Received: from localhost ([::1]:47140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odDLH-0004SO-LH
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 12:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1odBZa-0000uC-BH
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:28:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1odBZY-00089i-SE
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:28:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664288912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uRWi5ToXjbdLQBNwvatDCfExVzWkWMY04dDYOihAhQY=;
 b=YZU88GvWHY0WYufihNLZiSG9MsPFGhSCgJeBl3cjeUuM4zbXJauUbi2bzI2U0Ec93B7fjB
 7ZHVjgWchfq0a3lld9CTXGgV3zqzFhI4bEYBqH39fHUo4H3ZjZWHq7IpaVjkvBP+wEWMyw
 2iXRB2QdV4wR4lBIwG/ixqDfWMSh+vI=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-402-bHaWAB0kOEe8jn5_XvX3_w-1; Tue, 27 Sep 2022 10:28:31 -0400
X-MC-Unique: bHaWAB0kOEe8jn5_XvX3_w-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-11eadf59e50so3667956fac.8
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uRWi5ToXjbdLQBNwvatDCfExVzWkWMY04dDYOihAhQY=;
 b=wcMqYoeJpAY8it6CwGsaWiBu+OG5mrruMHja4A1GVV60fuXiqXrew3I0yRDIPiHMDs
 wUsbVwPjrDXXHY4lzIE3A7bEjspxC7AaREvJlIdAYrGO1tYS9txTJqxmFbx9mO+YzclC
 kM8c/AieKwrMU52CYHrv1kHJI+0fbTGr/SsYIqKPrzEcWooncjTjT9k2zJAxcX6lmhEP
 OAf81PZH+mw9QT0I6cS0WkEU/uMrn+DO1OyXmS6XScTk65aHbKAP5yJuFXuKJ4bOqJ8R
 ozdxKioZ0fjstcaqWL15wpsDEFJCfrtg/Pi93jmYuO5fMBMDNriWhI1yCrFsF0d40N9r
 nYdg==
X-Gm-Message-State: ACrzQf3+xxrCXQXK3HmaeCiQ+lc9wIgw51qOBN7VSz5ObV6HJie0oSxR
 UaWv2hWCWmIbEl0SbZ/9fwQSY1G+Tsa6es9EeU6jk/E646ytOnLSBHORL5cE6T3/O/XTeKYZkhq
 nRHOzrIrxGmeVmkT/QY+AKi6pk98sDyU=
X-Received: by 2002:a05:6808:21a3:b0:350:cca1:9f40 with SMTP id
 be35-20020a05680821a300b00350cca19f40mr1978839oib.205.1664288908646; 
 Tue, 27 Sep 2022 07:28:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7mx0Fb93XsTdMdeWUT8OxlXEsFcDe3f/8/P5DO4MVJHDT3n5YJRz6dvyjVtI/ScJNv+/b58nC6mCEWfqd7xyI=
X-Received: by 2002:a05:6808:21a3:b0:350:cca1:9f40 with SMTP id
 be35-20020a05680821a300b00350cca19f40mr1978826oib.205.1664288908448; Tue, 27
 Sep 2022 07:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-19-bmeng.cn@gmail.com>
In-Reply-To: <20220927110632.1973965-19-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Sep 2022 18:28:17 +0400
Message-ID: <CAMxuvazVqfnyi-vwX2FJ47SY1K26hyriMi_DCvNmvhcj3whjeg@mail.gmail.com>
Subject: Re: [PATCH v4 18/54] tests/qtest: vhost-user-test: Avoid using
 hardcoded /tmp
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 27, 2022 at 3:07 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This case was written to use hardcoded /tmp directory for temporary
> files. Update to use g_dir_make_tmp() for a portable implementation.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> Changes in v4:
> - Update error reporting
>
> Changes in v3:
> - Split to a separate patch
> - Ensure g_autofree variable is initialized
>
>  tests/qtest/vhost-user-test.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.=
c
> index d7d6cfc9bd..84498941a6 100644
> --- a/tests/qtest/vhost-user-test.c
> +++ b/tests/qtest/vhost-user-test.c
> @@ -482,8 +482,8 @@ static TestServer *test_server_new(const gchar *name,
>          struct vhost_user_ops *ops)
>  {
>      TestServer *server =3D g_new0(TestServer, 1);
> -    char template[] =3D "/tmp/vhost-test-XXXXXX";
> -    const char *tmpfs;
> +    g_autofree const char *tmpfs =3D NULL;
> +    GError *err =3D NULL;
>
>      server->context =3D g_main_context_new();
>      server->loop =3D g_main_loop_new(server->context, FALSE);
> @@ -491,9 +491,11 @@ static TestServer *test_server_new(const gchar *name=
,
>      /* run the main loop thread so the chardev may operate */
>      server->thread =3D g_thread_new(NULL, thread_function, server->loop)=
;
>
> -    tmpfs =3D g_mkdtemp(template);
> +    tmpfs =3D g_dir_make_tmp("vhost-test-XXXXXX", &err);
>      if (!tmpfs) {
> -        g_test_message("g_mkdtemp on path (%s): %s", template, strerror(=
errno));
> +        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
> +                       err->message);
> +        g_error_free(err);

You missed the opportunity to use g_autoptr(GError), ok anyway
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

>      }
>      g_assert(tmpfs);
>
> --
> 2.34.1
>


