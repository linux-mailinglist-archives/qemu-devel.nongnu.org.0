Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D27353C227F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 12:54:08 +0200 (CEST)
Received: from localhost ([::1]:38934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1o91-0003FG-HA
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 06:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1o7W-0002Xv-S0
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 06:52:34 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:34484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1o7U-00043Y-Qs
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 06:52:34 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso6287832wmc.1
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 03:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=qYe5xnZWng2624eHMvka4+ZtEfGVsUbQtFn8tqyIV/o=;
 b=FSMcc2IBVp0b4GRuacRJCfXi6MDW9uccWR9xtY7dVIIcnHaSBjLcD/pegcCi5GOXQu
 GjkRGAyJlDQ86ZbMnsaB9KzhNemlPKTVybkZWO5I5cieJStXFc8TqlkKuEEhrvQWJiFa
 3JpYt2qxPV6bPFpDfTbfROzJtY7dDiCs5/xywAzqOvFbU0zEX1AUKRE95pJY1kwdASjH
 EPiy4h2jyKBGZ9ohxzRzVJPOHR3jGfMX0EAB3EBZ5lD32xudI6ZHiTZRlnpqd5aDR7p3
 2n28QKUaoHzFFUmvKMK/u1VOC9zoBhH85UBbVO9+N+my2SQOHtMK+6vAtJAXl6BuvKSw
 51MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=qYe5xnZWng2624eHMvka4+ZtEfGVsUbQtFn8tqyIV/o=;
 b=RPwGdv347IIxwzJjcTDwhKUioYsZ6VY3aFDwFSdNM8I55bcIoSZyFvXD1siJciDa6o
 TXvFCLE7Rl2pli4tv0T9oOnMECbdZc0hsFiUp7phC4BmbBxVgHCU1bJ/1mMo4fl7WvZ5
 GD36MpXECgqWjOWFtTA99Le1gMsBq9BaZNYWMLyv8474LtQ/mUJIF2sEMIwToRnZKTdq
 7CG1/AwMfRTDNyHIaEDFUzdrYyB/TYx8/Oz9s8jDZjv4S61InI7sDPK5OcY+DHYOTf6L
 /b0mSurrq4TwVVRFo3pSy1dH3c8yYswRrxosA3zfB44qZmoWCq6YDCv8zKoHK9jtEhxS
 E1hQ==
X-Gm-Message-State: AOAM531TdjIc4lUXwpxWX1V6HxSgiWybqfe+uGYXANVnI15nzP8xEOn8
 vGtc6nZxwprGw+eCB7Kp1m5//A==
X-Google-Smtp-Source: ABdhPJw35d4w2mBqZNdkRdhd4FM4WE3WxDQeo0bGDgAAEHeBW9ICPnJa1wkW8LRSGx9UYOgA/GwdcA==
X-Received: by 2002:a1c:de88:: with SMTP id v130mr14996687wmg.98.1625827950685; 
 Fri, 09 Jul 2021 03:52:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u12sm4953952wrt.50.2021.07.09.03.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 03:52:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 04E8F1FF7E;
 Fri,  9 Jul 2021 11:52:29 +0100 (BST)
References: <20210708190941.16980-1-alex.bennee@linaro.org>
 <20210708190941.16980-27-alex.bennee@linaro.org>
 <277c97f3-b2d8-639f-a251-099287e5a733@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 26/39] tests/tcg: make test-mmap a little less
 aggressive
Date: Fri, 09 Jul 2021 11:51:24 +0100
In-reply-to: <277c97f3-b2d8-639f-a251-099287e5a733@linaro.org>
Message-ID: <87y2afsqs3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, pbonzini@redhat.com,
 aaron@os.amperecomputing.com, qemu-devel@nongnu.org, robhenry@microsoft.com,
 f4bug@amsat.org, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, stefanha@redhat.com, crosa@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 7/8/21 12:09 PM, Alex Benn=C3=A9e wrote:
>> -	for (i =3D 0; i < 0x1fff; i++)
>> +	for (i =3D 0; i < 0x1ff; i++)
>>   	{
>>   		size_t len;
>>     		len =3D pagesize + (pagesize * i & 7);
>
> There's really no point in i >=3D 8.
>
> We release all of the memory at the end of the loop; we'll probably
> get back the same pages on the 8'th iteration.
>
>
>> -	for (i =3D 0; i < 0x2fff; i++)
>> +	for (i =3D 0; i < 0x2ff; i++)
>
> I'm not sure why this one is iterating more than twice?

OK cutting it down to 8 and 2 with white space cleanup and removing the
timeout hack gives:

--8<---------------cut here---------------start------------->8---
tests/tcg: make test-mmap a little less aggressive

The check_aligned_anonymous_unfixed_mmaps and
check_aligned_anonymous_unfixed_colliding_mmaps do a lot of mmap's and
copying of data. This is especially unfriendly to targets like hexagon
which have quite large pages and need to do sanity checks on each
memory access.

While we are at it clean-up the white space and style issues from the
legacy code. As we no longer do quite so much needless memory access
we can also remove the hexagon timeout hack.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

---
v3
  - style and whitespace cleanups, reduce loop even further.
  - remove hexagon timeout hack

2 files changed, 102 insertions(+), 113 deletions(-)
tests/tcg/multiarch/test-mmap.c   | 206 +++++++++++++++++++----------------=
---
tests/tcg/hexagon/Makefile.target |   9 --

modified   tests/tcg/multiarch/test-mmap.c
@@ -49,64 +49,62 @@ size_t test_fsize;
=20
 void check_aligned_anonymous_unfixed_mmaps(void)
 {
-	void *p1;
-	void *p2;
-	void *p3;
-	void *p4;
-	void *p5;
-	uintptr_t p;
-	int i;
-
-	fprintf(stdout, "%s", __func__);
-	for (i =3D 0; i < 0x1fff; i++)
-	{
-		size_t len;
-
-		len =3D pagesize + (pagesize * i & 7);
-		p1 =3D mmap(NULL, len, PROT_READ,=20
-			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
-		p2 =3D mmap(NULL, len, PROT_READ,=20
-			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
-		p3 =3D mmap(NULL, len, PROT_READ,=20
-			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
-		p4 =3D mmap(NULL, len, PROT_READ,=20
-			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
-		p5 =3D mmap(NULL, len, PROT_READ,=20
-			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
-
-		/* Make sure we get pages aligned with the pagesize. The
-		   target expects this.  */
-		fail_unless (p1 !=3D MAP_FAILED);
-		fail_unless (p2 !=3D MAP_FAILED);
-		fail_unless (p3 !=3D MAP_FAILED);
-		fail_unless (p4 !=3D MAP_FAILED);
-		fail_unless (p5 !=3D MAP_FAILED);
-		p =3D (uintptr_t) p1;
-		D(printf ("p=3D%x\n", p));
-		fail_unless ((p & pagemask) =3D=3D 0);
-		p =3D (uintptr_t) p2;
-		fail_unless ((p & pagemask) =3D=3D 0);
-		p =3D (uintptr_t) p3;
-		fail_unless ((p & pagemask) =3D=3D 0);
-		p =3D (uintptr_t) p4;
-		fail_unless ((p & pagemask) =3D=3D 0);
-		p =3D (uintptr_t) p5;
-		fail_unless ((p & pagemask) =3D=3D 0);
-
-		/* Make sure we can read from the entire area.  */
-		memcpy (dummybuf, p1, pagesize);
-		memcpy (dummybuf, p2, pagesize);
-		memcpy (dummybuf, p3, pagesize);
-		memcpy (dummybuf, p4, pagesize);
-		memcpy (dummybuf, p5, pagesize);
-
-		munmap (p1, len);
-		munmap (p2, len);
-		munmap (p3, len);
-		munmap (p4, len);
-		munmap (p5, len);
-	}
-	fprintf(stdout, " passed\n");
+    void *p1;
+    void *p2;
+    void *p3;
+    void *p4;
+    void *p5;
+    uintptr_t p;
+    int i;
+    fprintf(stdout, "%s", __func__);
+    for (i =3D 0; i < 8; i++) {
+        size_t len;
+        len =3D pagesize + (pagesize * i);
+        p1 =3D mmap(NULL, len, PROT_READ,
+                  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+        p2 =3D mmap(NULL, len, PROT_READ,
+                  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+        p3 =3D mmap(NULL, len, PROT_READ,
+                  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+        p4 =3D mmap(NULL, len, PROT_READ,
+                  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+        p5 =3D mmap(NULL, len, PROT_READ,
+                  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+
+        /*
+         * Make sure we get pages aligned with the pagesize. The
+         * target expects this.
+         */
+        fail_unless (p1 !=3D MAP_FAILED);
+        fail_unless (p2 !=3D MAP_FAILED);
+        fail_unless (p3 !=3D MAP_FAILED);
+        fail_unless (p4 !=3D MAP_FAILED);
+        fail_unless (p5 !=3D MAP_FAILED);
+        p =3D (uintptr_t) p1;
+        D(printf ("p=3D%x\n", p));
+        fail_unless ((p & pagemask) =3D=3D 0);
+        p =3D (uintptr_t) p2;
+        fail_unless ((p & pagemask) =3D=3D 0);
+        p =3D (uintptr_t) p3;
+        fail_unless ((p & pagemask) =3D=3D 0);
+        p =3D (uintptr_t) p4;
+        fail_unless ((p & pagemask) =3D=3D 0);
+        p =3D (uintptr_t) p5;
+        fail_unless ((p & pagemask) =3D=3D 0);
+
+        /* Make sure we can read from the entire area.  */
+        memcpy (dummybuf, p1, pagesize);
+        memcpy (dummybuf, p2, pagesize);
+        memcpy (dummybuf, p3, pagesize);
+        memcpy (dummybuf, p4, pagesize);
+        memcpy (dummybuf, p5, pagesize);
+        munmap (p1, len);
+        munmap (p2, len);
+        munmap (p3, len);
+        munmap (p4, len);
+        munmap (p5, len);
+    }
+    fprintf(stdout, " passed\n");
 }
=20
 void check_large_anonymous_unfixed_mmap(void)
@@ -135,52 +133,52 @@ void check_large_anonymous_unfixed_mmap(void)
=20
 void check_aligned_anonymous_unfixed_colliding_mmaps(void)
 {
-	char *p1;
-	char *p2;
-	char *p3;
-	uintptr_t p;
-	int i;
-
-	fprintf(stdout, "%s", __func__);
-	for (i =3D 0; i < 0x2fff; i++)
-	{
-		int nlen;
-		p1 =3D mmap(NULL, pagesize, PROT_READ,=20
-			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
-		fail_unless (p1 !=3D MAP_FAILED);
-		p =3D (uintptr_t) p1;
-		fail_unless ((p & pagemask) =3D=3D 0);
-		memcpy (dummybuf, p1, pagesize);
-
-		p2 =3D mmap(NULL, pagesize, PROT_READ,=20
-			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
-		fail_unless (p2 !=3D MAP_FAILED);
-		p =3D (uintptr_t) p2;
-		fail_unless ((p & pagemask) =3D=3D 0);
-		memcpy (dummybuf, p2, pagesize);
-
-
-		munmap (p1, pagesize);
-		nlen =3D pagesize * 8;
-		p3 =3D mmap(NULL, nlen, PROT_READ,=20
-			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
-		fail_unless (p3 !=3D MAP_FAILED);
-
-		/* Check if the mmaped areas collide.  */
-		if (p3 < p2=20
-		    && (p3 + nlen) > p2)
-			fail_unless (0);
-
-		memcpy (dummybuf, p3, pagesize);
-
-		/* Make sure we get pages aligned with the pagesize. The
-		   target expects this.  */
-		p =3D (uintptr_t) p3;
-		fail_unless ((p & pagemask) =3D=3D 0);
-		munmap (p2, pagesize);
-		munmap (p3, nlen);
-	}
-	fprintf(stdout, " passed\n");
+    char *p1;
+    char *p2;
+    char *p3;
+    uintptr_t p;
+    int i;
+
+    fprintf(stdout, "%s", __func__);
+    for (i =3D 0; i < 2; i++) {
+        int nlen;
+        p1 =3D mmap(NULL, pagesize, PROT_READ,
+              MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+        fail_unless (p1 !=3D MAP_FAILED);
+        p =3D (uintptr_t) p1;
+        fail_unless ((p & pagemask) =3D=3D 0);
+        memcpy (dummybuf, p1, pagesize);
+
+        p2 =3D mmap(NULL, pagesize, PROT_READ,
+              MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+        fail_unless (p2 !=3D MAP_FAILED);
+        p =3D (uintptr_t) p2;
+        fail_unless ((p & pagemask) =3D=3D 0);
+        memcpy (dummybuf, p2, pagesize);
+
+
+        munmap (p1, pagesize);
+        nlen =3D pagesize * 8;
+        p3 =3D mmap(NULL, nlen, PROT_READ,
+              MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+        fail_unless (p3 !=3D MAP_FAILED);
+
+        /* Check if the mmaped areas collide.  */
+        if (p3 < p2
+            && (p3 + nlen) > p2) {
+            fail_unless (0);
+        }
+
+        memcpy (dummybuf, p3, pagesize);
+
+        /* Make sure we get pages aligned with the pagesize. The
+           target expects this.  */
+        p =3D (uintptr_t) p3;
+        fail_unless ((p & pagemask) =3D=3D 0);
+        munmap (p2, pagesize);
+        munmap (p3, nlen);
+    }
+    fprintf(stdout, " passed\n");
 }
=20
 void check_aligned_anonymous_fixed_mmaps(void)
modified   tests/tcg/hexagon/Makefile.target
@@ -18,15 +18,6 @@
 # Hexagon doesn't support gdb, so skip the EXTRA_RUNS
 EXTRA_RUNS =3D
=20
-# Hexagon has 64K pages, so increase the timeout to keep
-# test-mmap from timing out
-ifeq ($(CONFIG_DEBUG_TCG),y)
-TIMEOUT=3D800
-else
-TIMEOUT=3D500
-endif
-
-
 CFLAGS +=3D -Wno-incompatible-pointer-types -Wno-undefined-internal
 CFLAGS +=3D -fno-unroll-loops
--8<---------------cut here---------------end--------------->8---

--=20
Alex Benn=C3=A9e

