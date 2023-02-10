Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EAA692321
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:18:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQW5u-0007TC-Fb; Fri, 10 Feb 2023 11:17:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQW5t-0007Sz-5b
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:17:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQW5r-0004dj-Bu
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:17:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676045866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FCtAT0haHCypsfrh43Fl6PLFZykTYxH9tSKKS+ZHSGI=;
 b=UUhz7HjI7a1PjlnqbQRAO0sv2GzlNuOCO0Clc5iHdXWO1Szef18qDLW0WRt8w3nRcSnrsW
 l9Z6i1l7B6A4ZlhwLmjNkclOj+DxHEEje5hON8IW7HKaoXerwPUc1NyQ4s3TsbN/PcTPVR
 TSqVf6aHvmEhcFhDRIqFfTAQTXGkK9M=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-93-bCmlcr1HPfKdvB6gNRnPyg-1; Fri, 10 Feb 2023 11:17:45 -0500
X-MC-Unique: bCmlcr1HPfKdvB6gNRnPyg-1
Received: by mail-ua1-f69.google.com with SMTP id
 89-20020a9f26e2000000b004183c5c5b7aso2038854uay.10
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:17:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FCtAT0haHCypsfrh43Fl6PLFZykTYxH9tSKKS+ZHSGI=;
 b=tK7ix/zKHOuygBut0tCHFZP5e33+IBLI7zt9crgJJT3lgximCf19ZUadtGdPjJJmj8
 ZVPsAi62yPAD5cUEZA/TCk5OAxVkAz9anyPlXDgIB2OuNdGnTXfWAHcpPA52bbkvLgXX
 gR6hcheOR1L2Zqrgf5P5MiicvPjlCfHAd64tZ/uVUmWZ08j9JlWeQ28se/EhUHBTf/Uh
 9VlrLqB8mmt12nNsPswsa1FolKjRpdZ4e+C4SKEWfgM/kTbEeH+bd0cJLW1ahWIsRHQj
 iqxxLzUGZ0IXm8S/y9ytnGsMYSXHUdYdEkgiMYZ9jf6F2Ye8dkwuQloudLlZX4mqUk0w
 VnAQ==
X-Gm-Message-State: AO0yUKV16pFNx1CA+7QaJVEquHSJmiVKa1Hbo3fDQBAyOrj+3iOYzZt6
 5ki4XzsaM/mQ84DuIT2DVhYjiBTEXvTMMEl3s/gBCVWmcVsbnJiZNt1aCOvWgK4C5sAqLXThpDc
 AvbXQsN0MDLumq7KBHtehrdKenuAHFqU=
X-Received: by 2002:a05:6102:32c7:b0:40e:46ce:29cf with SMTP id
 o7-20020a05610232c700b0040e46ce29cfmr3627043vss.27.1676045864803; 
 Fri, 10 Feb 2023 08:17:44 -0800 (PST)
X-Google-Smtp-Source: AK7set+HZZB1GW0TpSNlksPJQVngbTvtYoox85CvV0RYYaavM0gDFumrI9751EaDHKSY8GGsjiJR8ZQ5BwzTIWWFTCk=
X-Received: by 2002:a05:6102:32c7:b0:40e:46ce:29cf with SMTP id
 o7-20020a05610232c700b0040e46ce29cfmr3627026vss.27.1676045864489; Fri, 10 Feb
 2023 08:17:44 -0800 (PST)
MIME-Version: 1.0
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-4-jsnow@redhat.com>
 <3bb14d43-4dbe-62f3-679f-4b7823b29d41@redhat.com>
 <CAFn=p-Yyus2zipaUgLwonpMRdfZp-CKEisiXgZBLjgG6UxXagw@mail.gmail.com>
In-Reply-To: <CAFn=p-Yyus2zipaUgLwonpMRdfZp-CKEisiXgZBLjgG6UxXagw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 10 Feb 2023 17:17:32 +0100
Message-ID: <CABgObfa79AStZ8DnGEs2GmdZeLecijW3Um9O4XmguVNLwdfs2g@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] configure: Look for auxiliary Python installations
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Feb 10, 2023 at 4:28 PM John Snow <jsnow@redhat.com> wrote:
> PS, while you're here, how does this new loop interfere with your "custom=
 python specified" flag for meson? I think meson uses the version of python=
 *it* detects and not the configure script identified one, right? Does that=
 mean that e.g. the qapi generator gets run with the system default/meson v=
ersion and not the config version?

Yes, if neither --python nor --meson are specified, then it could
happen that a different python is used during ninja's execution vs.
what is used for "other stuff" (docker cross compilers and other
Makefile invocations of $(PYTHON)).

The meson version of Python is guaranteed to be at least 3.7 as soon
as we update to 0.63.x (which will be Real Soon Now), but it's ugly.
The main issue I anticipate could be a problem when running from a
virtual environment, so perhaps we can force usage of the internal
meson if neither --python nor --meson are specified, and VIRTUAL_ENV
is set and $VIRTUAL_ENV/bin/meson does not exist?

diff --git a/configure b/configure
index 06bcd9031903..001a79a90170 100755
--- a/configure
+++ b/configure
@@ -870,8 +870,18 @@ fi
 # Suppress writing compiled files
 python=3D"$python -B"

+has_meson() {
+  if test "${VIRTUAL_ENV:+set}" =3D set; then
+    # Ensure that Meson and Python come from the same virtual environment
+    test -x "$(VIRTUAL_ENV}/bin/meson" &&
+      test "$(command -v meson)" -ef "$(VIRTUAL_ENV}/bin/meson"
+  else
+    has meson
+  fi
+}
+
 if test -z "$meson"; then
-    if test "$explicit_python" =3D no && has meson && version_ge
"$(meson --version)" 0.63.0; then
+    if test "$explicit_python" =3D no && has_meson && version_ge
"$(meson --version)" 0.63.0; then
         meson=3Dmeson
     elif test "$git_submodules_action" !=3D 'ignore' ; then
         meson=3Dgit

I will include it when posting the final series.

> Do I need to adjust this loop to consider more binaries as "explicitly sp=
ecified"?

I don't think it's a huge problem. Outside virtual environments, the
most likely setting is that Meson uses python3 which in turn is the
most recent python3.X, so it should be fine overall.

Though part of me thinks that your new loop is slightly overengineered
and we should just require /usr/bin/env python3 and call it a day.

Paolo


