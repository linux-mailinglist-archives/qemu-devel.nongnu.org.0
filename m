Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A2060F9FB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 16:02:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo3Qz-0000xs-4C; Thu, 27 Oct 2022 10:00:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo3Qp-0000eP-Fj
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:00:30 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo3Qm-0004iw-DW
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:00:26 -0400
Received: by mail-wr1-x431.google.com with SMTP id g12so2310923wrs.10
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 07:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=firyMDU8AQ40MXvDbQoNcIEzzjYVHHHBcKMiZUs0Sms=;
 b=bgkpiMdlwZJCulk3qhjLne9yrgrmxLmuqEzdP9/FlqdQLaCBhjpxSRQ/BK1DkERGzS
 +eOLuKClk21LkPa7A4rtjvttNuMyM4RW8sPWR9Gs5VfGFNknD+f59hYud2sU38p+Zvif
 pVXGQvudKLHPYMH07W6P37YWJeMVIoYQi90ozNYAthPgOiNZqCVEuFMtX6HLgQuFtJ62
 MzubjUvyHN4qgD/ZAhXzeLVz9Rzlp5HNDDUBHI7/fMhibOWpG/sJTdJ87/kU0ffxI+uA
 SebPtLe/to863HIjlmfefhxZLNfx0PEemWfIB9BTKs+So5DoA1nUjwMtauBt3aYhA+Fw
 8Rgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=firyMDU8AQ40MXvDbQoNcIEzzjYVHHHBcKMiZUs0Sms=;
 b=cB6fvW2ZK53f+cdC+vQvNz7EFCsWXZZ6FgTe5BNBrbLxSh8iCEN4/EUHpibK2P3cbj
 hL5jg0s0C5XVEK6aEhVH/ELslaOwIQGNOE2c6V2QRQnw0tSiUFq8+MHbKjFbiYq+P/0n
 7vJ2k3Y7kji0t26kdyfK6ErYqojCNKw1Z/M1QR9uVrYiqGDty7QEf6onsVzNX8U8b5pp
 IZYAXQ7+WfLv8OPl9FmtgMSfPoOBtrGmg2PPvHrl2rA9kPtjgNE5mUgt20Py1vqR693O
 a1ARildsbGMAx22BgV39n7Sf5lLk3blGLQzXzrw6HvKCM60WJASO3k69ULy7yUtTQ6AB
 HkLw==
X-Gm-Message-State: ACrzQf1kM4wq6GT8JwxLFmZt/hsWPR3qqfROI8S/NrDzF/QrqMdKerGZ
 OljZJX8NtRwPPL4JTSAyKVyvdF13twlE/A==
X-Google-Smtp-Source: AMsMyM550Zrk3R8yiIhXPKOG1Arts1P/bdKG7c2cKWoR1jskJAcFnhi7hIio6a6A8KyZCqpHvu3dXw==
X-Received: by 2002:a05:6000:1a8b:b0:232:4311:4ff with SMTP id
 f11-20020a0560001a8b00b00232431104ffmr31357496wry.236.1666879218184; 
 Thu, 27 Oct 2022 07:00:18 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a5d438c000000b0023677fd2657sm1183789wrq.52.2022.10.27.07.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 07:00:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1F2C01FFB7;
 Thu, 27 Oct 2022 15:00:17 +0100 (BST)
References: <20221025105520.3016-1-quintela@redhat.com>
 <87mt9k6owd.fsf@linaro.org> <Y1ff32V9WXYH/hva@redhat.com>
 <875yg64kxp.fsf@linaro.org>
 <df8502a8-3ac2-8912-2fb9-3743198fc3d7@redhat.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] tests: Create fifo for test-io-channel-command
Date: Thu, 27 Oct 2022 14:59:04 +0100
In-reply-to: <df8502a8-3ac2-8912-2fb9-3743198fc3d7@redhat.com>
Message-ID: <87h6zp1i4u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Thomas Huth <thuth@redhat.com> writes:

> On 26/10/2022 18.18, Alex Benn=C3=A9e wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>>> CC'ing Marc-Andr=C3=A9 as original author of the change
>>>
>>> On Tue, Oct 25, 2022 at 01:57:23PM +0100, Alex Benn=C3=A9e wrote:
>>>>
>>>> Juan Quintela <quintela@redhat.com> writes:
>>>>
>>>>> Previous commit removed the creation of the fifo.  Without it, I get
>>>>> random failure during tests with high load, please consider
>>>>> reintroduce it.
>>>>>
>>>>> My guess is that there is a race between the two socats when we leave
>>>>> them to create the channel, better return to the previous behavior.
>>>>>
>>>>> I can't reproduce the problem when I run ./test-io-channel-command
>>>>> test alone, I need to do the make check.  And any (unrelated) change
>>>>> can make it dissapear.
>>>>
>>>> I was chasing a similar problem with this test although I don't see it
>>>> timeout while running (I don't think our unit tests time out). I'm
>>>> provisionally queuing this to testing/next unless anyone objects.
>>>
>>> It won't build on Win32 since that platform lacks mkfifo.
>>>
>>> The test normally works since socat will call mknod to create
>>> the fifo.
>>>
>>> I think the problem is that we have a race condition where the
>>> client socat runs before the server socat, and so won't see the
>>> fifo. This will be where high load triggers problems.
>> Ok I shall drop the patch from testing/next - we need a better
>> solution.
>
> Could we maybe at least revert the patch that introduced the problem?
> ... the failing test is annoying ...

I'm trying to fix it now but I haven't been able to get one of the
socat's to not race with the other:

--8<---------------cut here---------------start------------->8---
modified   tests/unit/test-io-channel-command.c
@@ -19,6 +19,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include <glib/gstdio.h>
 #include "io/channel-command.h"
 #include "io-channel-helpers.h"
 #include "qapi/error.h"
@@ -33,25 +34,26 @@ static char *socat =3D NULL;
=20
 static void test_io_channel_command_fifo(bool async)
 {
+    g_autofree gchar *tmpdir =3D g_dir_make_tmp("qemu-test-io-channel.XXXX=
XX", NULL);
+    g_autofree gchar *fifo =3D g_strdup_printf("%s/%s", tmpdir, TEST_FIFO);
+    g_autoptr(GString) srcargs =3D g_string_new(socat);
+    g_autoptr(GString) dstargs =3D g_string_new(socat);
+    g_auto(GStrv) srcargv;
+    g_auto(GStrv) dstargv;
     QIOChannel *src, *dst;
     QIOChannelTest *test;
-    const char *srcargv[] =3D {
-        socat, "-", SOCAT_SRC, NULL,
-    };
-    const char *dstargv[] =3D {
-        socat, SOCAT_DST, "-", NULL,
-    };
=20
-    if (!socat) {
-        g_test_skip("socat is not found in PATH");
-        return;
-    }
+    g_string_append_printf(srcargs, " - PIPE:%s,wronly,creat=3D1,excl=3D1"=
, fifo);
+    g_string_append_printf(dstargs, " PIPE:%s,rdonly,creat=3D0 -", fifo);
+
+    srcargv =3D g_strsplit(srcargs->str, " ", -1);
+    dstargv =3D g_strsplit(dstargs->str, " ", -1);
=20
-    unlink(TEST_FIFO);
-    src =3D QIO_CHANNEL(qio_channel_command_new_spawn(srcargv,
+    src =3D QIO_CHANNEL(qio_channel_command_new_spawn((const char**) srcar=
gv,
                                                     O_WRONLY,
                                                     &error_abort));
-    dst =3D QIO_CHANNEL(qio_channel_command_new_spawn(dstargv,
+
+    dst =3D QIO_CHANNEL(qio_channel_command_new_spawn((const char**) dstar=
gv,
                                                     O_RDONLY,
                                                     &error_abort));
=20
@@ -62,17 +64,27 @@ static void test_io_channel_command_fifo(bool async)
     object_unref(OBJECT(src));
     object_unref(OBJECT(dst));
=20
-    unlink(TEST_FIFO);
+    g_rmdir(tmpdir);
 }
=20
=20
 static void test_io_channel_command_fifo_async(void)
 {
+    if (!socat) {
+        g_test_skip("socat is not found in PATH");
+        return;
+    }
+
     test_io_channel_command_fifo(true);
 }
=20
 static void test_io_channel_command_fifo_sync(void)
 {
+    if (!socat) {
+        g_test_skip("socat is not found in PATH");
+        return;
+    }
+
     test_io_channel_command_fifo(false);
 }
--8<---------------cut here---------------end--------------->8---


>
>  Thomas


--=20
Alex Benn=C3=A9e

