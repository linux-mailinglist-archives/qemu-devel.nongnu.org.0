Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1AD6E2A64
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 21:02:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnOg4-00061r-Kf; Fri, 14 Apr 2023 15:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pnOfz-0005wP-9Y
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 15:01:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pnOfw-0000TD-Mr
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 15:01:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681498894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TCB+NNUOrogMvR0c+OI54bouDZIlhzSw+zhdUNb/4eE=;
 b=Pr04VReSwNs7uq52kMqNieP7OtUTar5lR9LXvSfwt/vyemiIdy9YBsAjJkYlrvGvrrxbwi
 Qq5cg3xeCs1uRnedlbWI5GiGU2iWj8rQI9MlqPxcLeS1mwtsuJOJ0oIKKyGdt/Zv/YCqqP
 sjA46UlSLAlQnG72Lah/tnZedAD540o=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581--7KN5FRHPbWjU87Q1KB6pA-1; Fri, 14 Apr 2023 15:01:32 -0400
X-MC-Unique: -7KN5FRHPbWjU87Q1KB6pA-1
Received: by mail-ed1-f72.google.com with SMTP id
 q19-20020a50c353000000b0050683052191so1528315edb.19
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 12:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681498891; x=1684090891;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TCB+NNUOrogMvR0c+OI54bouDZIlhzSw+zhdUNb/4eE=;
 b=H2ogjT/Xn3udXcLPVc96OxkSBp0gMuCaVswaDK9YN7PBNXsZa7azJ5h6EXHAqYaJLz
 LVjkOoFuPwOs3rlFkSTYyvcP7dgGVhzg8OYtzUpcKUUXVo69JfYlrGWlaV9mgRd6A4wD
 2dhHPhd/6r14quCkwbRP/NrgzZLTc3upUAOo8Ph8jXtVoyR8fvT3/SY1uY1ij5dWlEmn
 GgGpbNGXPy1W6p/aaisJ29HvjroDW8w2RNis+dkh5hDV3njVOqrDhVMLH90XMMq5NxwO
 2GOiCBNLxDUVZuHUbVi47mD1VM6tn1UciLYFfKMc7dkGf7roPE3UrZzLQB/J39h+gr6g
 /wWg==
X-Gm-Message-State: AAQBX9dneYl2qau93hg1SwWW3VpI/jqb3ln5LLTS8lMqprpKGcmyHlm8
 yaSE6EtEurwupbOqPrj7qdmTBsIKhyeZB3bsrK5zyfWm1IgOydq1HYJPrN0wDUHrRfIctK7eL0P
 rPYRMcT1/d4t10XTkyos6VKlZUkz1syw=
X-Received: by 2002:a17:906:1e43:b0:94a:5615:fbbd with SMTP id
 i3-20020a1709061e4300b0094a5615fbbdmr50513ejj.15.1681498891043; 
 Fri, 14 Apr 2023 12:01:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350YuDwSHcuFDiWmr+BqYn+GxrKx6zxq8ZwpPPgyU7nILZgOTXeJW7/QH9f90RmE8ZC/WW0wEwLcI77lGlR+jK9Y=
X-Received: by 2002:a17:906:1e43:b0:94a:5615:fbbd with SMTP id
 i3-20020a1709061e4300b0094a5615fbbdmr50503ejj.15.1681498890747; Fri, 14 Apr
 2023 12:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230413150724.404304-1-peter.maydell@linaro.org>
 <20230413150724.404304-2-peter.maydell@linaro.org>
In-Reply-To: <20230413150724.404304-2-peter.maydell@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 14 Apr 2023 23:01:19 +0400
Message-ID: <CAMxuvaxBEVN7hca0-hXntHFCUAMVK7L1D8PtpHFu1cM=8dak9Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] qtest: Don't assert on "-qtest chardev:myid"
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="00000000000012d27605f95078e3"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000012d27605f95078e3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2023 at 7:07=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org>
wrote:

> If the -qtest command line argument is passed a string that says
> "use this chardev for I/O", then it will assert:
>
> $ ./build/clang/qemu-system-i386 -chardev file,path=3D/dev/null,id=3Dmyid
> -qtest chardev:myid
> Unexpected error in qtest_set_chardev() at ../../softmmu/qtest.c:1011:
> qemu-system-i386: Cannot find character device 'qtest'
> Aborted (core dumped)
>
> This is because in qtest_server_init() we assume that when we create
> the chardev with qemu_chr_new() it will always have the name "qtest".
> This is true if qemu_chr_new() had to create a new chardev, but not
> true if one already existed and is being referred to with
> "chardev:myid".
>
> Use the name of the chardev we get back from qemu_chr_new() as the
> string to set the qtest 'chardev' property to, instead of hardcoding
> it to "qtest".
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  softmmu/qtest.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/softmmu/qtest.c b/softmmu/qtest.c
> index 34bd2a33a76..26852996b5b 100644
> --- a/softmmu/qtest.c
> +++ b/softmmu/qtest.c
> @@ -867,7 +867,7 @@ void qtest_server_init(const char *qtest_chrdev, cons=
t
> char *qtest_log, Error **
>      }
>
>      qtest =3D object_new(TYPE_QTEST);
> -    object_property_set_str(qtest, "chardev", "qtest", &error_abort);
> +    object_property_set_str(qtest, "chardev", chr->label, &error_abort);
>      if (qtest_log) {
>          object_property_set_str(qtest, "log", qtest_log, &error_abort);
>      }
> --
> 2.34.1
>
>

--00000000000012d27605f95078e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 13, 2023 at 7:07=E2=80=AF=
PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.mayd=
ell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">If the -qtest command line argument is passed a string that s=
ays<br>
&quot;use this chardev for I/O&quot;, then it will assert:<br>
<br>
$ ./build/clang/qemu-system-i386 -chardev file,path=3D/dev/null,id=3Dmyid -=
qtest chardev:myid<br>
Unexpected error in qtest_set_chardev() at ../../softmmu/qtest.c:1011:<br>
qemu-system-i386: Cannot find character device &#39;qtest&#39;<br>
Aborted (core dumped)<br>
<br>
This is because in qtest_server_init() we assume that when we create<br>
the chardev with qemu_chr_new() it will always have the name &quot;qtest&qu=
ot;.<br>
This is true if qemu_chr_new() had to create a new chardev, but not<br>
true if one already existed and is being referred to with<br>
&quot;chardev:myid&quot;.<br>
<br>
Use the name of the chardev we get back from qemu_chr_new() as the<br>
string to set the qtest &#39;chardev&#39; property to, instead of hardcodin=
g<br>
it to &quot;qtest&quot;.<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:mar=
candre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;<br><br>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0softmmu/qtest.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/softmmu/qtest.c b/softmmu/qtest.c<br>
index 34bd2a33a76..26852996b5b 100644<br>
--- a/softmmu/qtest.c<br>
+++ b/softmmu/qtest.c<br>
@@ -867,7 +867,7 @@ void qtest_server_init(const char *qtest_chrdev, const =
char *qtest_log, Error **<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0qtest =3D object_new(TYPE_QTEST);<br>
-=C2=A0 =C2=A0 object_property_set_str(qtest, &quot;chardev&quot;, &quot;qt=
est&quot;, &amp;error_abort);<br>
+=C2=A0 =C2=A0 object_property_set_str(qtest, &quot;chardev&quot;, chr-&gt;=
label, &amp;error_abort);<br>
=C2=A0 =C2=A0 =C2=A0if (qtest_log) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object_property_set_str(qtest, &quot;log&=
quot;, qtest_log, &amp;error_abort);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--00000000000012d27605f95078e3--


