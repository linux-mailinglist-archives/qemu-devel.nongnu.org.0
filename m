Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D41357EA8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 11:03:06 +0200 (CEST)
Received: from localhost ([::1]:34124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUQZ7-0004Br-OQ
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 05:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUQWT-0002S0-Ss
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:00:25 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:35603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUQWR-0007J2-VD
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:00:21 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 w7-20020a1cdf070000b0290125f388fb34so4978wmg.0
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 02:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=DG00+Dmr2xnp1x26d6hTvLhH3+M3lJ/88qQIRVZ/mpU=;
 b=ETWUqdYK76PnLXhEBuXZHFrotDUdIdsSlL/9GdTuALjIO2vTuEMclqsbSxUEQXWbWX
 g9jHhI6rKFcd25UMZGK37qmyp1nz0QJtcD32ZSx+g0X2O6kqD5S7nz0gM4suiSkA37e8
 jUi9QHkbChCaN4FMQ7jfSb4Y6+5XW+GZZHI5Z30c+7qr/8g565wl4I6xlL2/LDKK+V2K
 uX+mNgRaaKnpJRJJ82Gmhx4Stop0GQhRuIlJNxmemdyRy7J6A19YDn1U9Rft5B6VieDK
 h8GMcQbbfzGv35fvKt2XQGX7W9mG8TOu6AYSi6r0PDpCtahapA15tUathZyNQkvEuuPt
 tWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=DG00+Dmr2xnp1x26d6hTvLhH3+M3lJ/88qQIRVZ/mpU=;
 b=IjxvCTJnETQ/Y3XMJWWqqZqrnONPg2fgTAyKBhlMpWrkX6USax9o6ThDpWd9Sfpx+5
 7VB3Apl9L6I1nKQpNRmFGxSj2aVfNvNKZqYtkzrfDOC2oRyCLjR2ptSJRM7wJDCEa5iF
 bD7z5Nl51qr99eNn64EQNqnKyHhxethK/Wyrfi3qhlCBW+jcgYo4j9D8hBBwP6PlTY9W
 WonksJ33cvpQxQp/BF4dehpDbNh2VJkhAjo4Aif8fW751Lhdxxe1K75ZQXLF95joCJ8/
 YlINPGcVrTPzzOHVsWybFfHdDvbUt03Ctd8LF5Xz5N+4vM9i9upPufFeEcFIdDXR+uZW
 bPFw==
X-Gm-Message-State: AOAM532fOQUpibXQ4slvtFr9JWi96FPNuv2jT7H8LCFowLRulhdYKZQA
 sCDLYv8XFTjeCRXOG7mk2KP2mQ==
X-Google-Smtp-Source: ABdhPJxsUkcX/S5t8XDBHUJdOrYJ7bJ6lBSsiuEdSptAE+6FasE0WgkPgY/1COcmXm7WWjW9Xl5h1Q==
X-Received: by 2002:a05:600c:2cd8:: with SMTP id
 l24mr7177143wmc.88.1617872418552; 
 Thu, 08 Apr 2021 02:00:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j1sm16184289wrq.90.2021.04.08.02.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 02:00:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D137D1FF7E;
 Thu,  8 Apr 2021 10:00:16 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-4-richard.henderson@linaro.org>
 <877dleuds3.fsf@linaro.org>
 <ade8e2d3-e1a6-3b84-7850-ceb4bcd59758@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 03/12] target/arm: Fix mte_checkN
Date: Thu, 08 Apr 2021 09:36:17 +0100
In-reply-to: <ade8e2d3-e1a6-3b84-7850-ceb4bcd59758@linaro.org>
Message-ID: <87y2dttalb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: 1921948@bugs.launchpad.net, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/7/21 11:39 AM, Alex Benn=C3=A9e wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> We were incorrectly assuming that only the first byte of an MTE access
>>> is checked against the tags.  But per the ARM, unaligned accesses are
>>> pre-decomposed into single-byte accesses.  So by the time we reach the
>>> actual MTE check in the ARM pseudocode, all accesses are aligned.
>>>
>>> Therefore, the first failure is always either the first byte of the
>>> access, or the first byte of the granule.
>>>
<snip>

I replicated the original test case as a kunit test:

  static void kmalloc_node_oob_span_right(struct kunit *test)
  {
          char *ptr;
          size_t size =3D 128;

          ptr =3D kmalloc_node(size, GFP_KERNEL, 0);
          KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);

          KUNIT_EXPECT_KASAN_FAIL(test, *(volatile unsigned long *)(ptr + 1=
24) =3D 0);
          kfree(ptr);
  }

which before this fix triggered:

  [    6.753429]     # kmalloc_node_oob_span_right: EXPECTATION FAILED at l=
ib/test_kasan.c:163
  [    6.753429]     Expected ({ do { extern void __compiletime_assert_337(=
void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ON=
CE()."))); if (!((sizeof(
  fail_data.report_expected) =3D=3D sizeof(char) || sizeof(fail_data.report=
_expected) =3D=3D sizeof(short) || sizeof(fail_data.report_expected) =3D=3D=
 sizeof(int) || sizeof(fail_data.repo
  rt_expected) =3D=3D sizeof(long)) || sizeof(fail_data.report_expected) =
=3D=3D sizeof(long long))) __compiletime_assert_337(); } while (0); (*(cons=
t volatile typeof( _Generic((fail_d
  ata.report_expected), char: (char)0, unsigned char: (unsigned char)0, sig=
ned char: (signed char)0, unsigned short: (unsigned short)0, signed short: =
(signed short)0, unsigned
   int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigne=
d long)0, signed long: (signed long)0, unsigned long long: (unsigned long l=
ong)0, signed long long:
  (signed long long)0, default: (fail_data.report_expected))) *
  [    6.759388]     not ok 4 - kmalloc_node_oob_span_right

And is OK by the end of the series:

  [    6.587381] The buggy address belongs to the object at ffff000003325800
  [    6.587381]  which belongs to the cache kmalloc-128 of size 128
  [    6.588372] The buggy address is located 0 bytes to the right of
  [    6.588372]  128-byte region [ffff000003325800, ffff000003325880)
  [    6.589354] The buggy address belongs to the page:
  [    6.589948] page:(____ptrval____) refcount:1 mapcount:0 mapping:000000=
0000000000 index:0x0 pfn:0x43325
  [    6.590911] flags: 0x3fffc0000000200(slab)
  [    6.591648] raw: 03fffc0000000200 dead000000000100 dead000000000122 fd=
ff000002401200
  [    6.592346] raw: 0000000000000000 0000000080100010 00000001ffffffff 00=
00000000000000
  [    6.593007] page dumped because: kasan: bad access detected
  [    6.593532]
  [    6.593775] Memory state around the buggy address:
  [    6.594360]  ffff000003325600: f3 f3 f3 f3 f3 f3 f3 f3 fe fe fe fe fe =
fe fe fe
  [    6.594991]  ffff000003325700: fd fd fd fd fd fd fd fd fe fe fe fe fe =
fe fe fe
  [    6.595594] >ffff000003325800: f8 f8 f8 f8 f8 f8 f8 f8 fe fe fe fe fe =
fe fe fe
  [    6.596180]                                            ^
  [    6.596714]  ffff000003325900: f7 f7 f7 f7 fe fe fe fe fe fe fe fe fe =
fe fe fe
  [    6.597309]  ffff000003325a00: f4 f4 fe fe fe fe fe fe fe fe fe fe fe =
fe fe fe
  [    6.597925] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  [    6.598513] Disabling lock debugging due to kernel taint
  [    6.600353]     ok 1 - kmalloc_node_oob_span_right
  [    6.600554] ok 1 - kasan

But it still fails this patch until:

 target/arm: Fix unaligned checks for mte_check1, mte_probe1

So I guess that is the one that should have the buglink.

Anyway code wise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

