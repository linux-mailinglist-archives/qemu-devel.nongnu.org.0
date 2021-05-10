Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF98378D07
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:40:43 +0200 (CEST)
Received: from localhost ([::1]:47486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg69J-0005Id-Kz
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:40:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lg67T-0002Tv-1r
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:38:48 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lg67Q-0004TD-0E
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:38:46 -0400
Received: by mail-wr1-x42c.google.com with SMTP id m9so16691462wrx.3
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 06:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Vgdkj82/sEIoh0pPzrW1137Mh1FDjGCBgz+08yafOTg=;
 b=JNV/7AAvR7SfWoJBcdGxx7ev1iAAs/4Zd/8YwBC7/nNxNjHiKWBON/k86pjFN12FxT
 Bu3dvot+pokTYI3zf7Ki1LBxg6QLgk1XhSG24ISGHLlhfhS/MuNud5jSbx7dscSzFqjA
 ybUxGWdHSVCxr5xHSQc9zt891sRTE1e2VYVLM5vJMpI6xyluAAQW1BT5sSnS86iHLHeL
 0odlZVtXGsEdlIpDCfnaWK/y4RnXLWyBkNMMojOr5zPqbrQwq0YH/QDQ6CfE2OpMWSst
 G8IE7WGceBF45lC95PM4eULD1jRH/+veC8XKGEK2MkbC1c7aG/jbAhbbS0jQuqbl0w+s
 mPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Vgdkj82/sEIoh0pPzrW1137Mh1FDjGCBgz+08yafOTg=;
 b=coe6BmdGjLuXENYGU0gFC9Ty0FQPBrtftQRMIYVXctLmQRlKjUzPSBZpLL/Vh6g67f
 jQQgYqokn+Xq2wF2UqT8pfej3SKKkfblaGl4TSldUugkhttXsP3JXoNVH7q77s1T3zRd
 zmHGN90y9YS4uQLkFHQNQ/egGoEX/kki6eTiflOb1vthIRy03ZHpXNEHseH2P2XS97T9
 L5PRNJcfUobTFXtUoh3RrENlWTQlSfyvd5iq0xKSpSFznskwUtGtnVuEcmoH9vMZwaJe
 Yu30F9hpyAA/AMbPclwOoquhj5sm1fvQ/g9jpTuHMsyOgXXrYLdY/PfStJHfVW7ki84m
 WLaA==
X-Gm-Message-State: AOAM532TuA8aF6Zt81rBZiBfe7GijDugLe0SNaXaljUlnak/XzCTEImA
 aE8P3Y6AKpn1AFrDKT7mRxh4bWzCHZ5+Bw==
X-Google-Smtp-Source: ABdhPJxJpH5MD/0HtFSY37aQVoYoEf+AtZ7pTnGwV/Eg9unSHe3h+c8gX4cVSxzr/iixb23q6hmzvg==
X-Received: by 2002:a5d:5488:: with SMTP id h8mr30027363wrv.81.1620653922451; 
 Mon, 10 May 2021 06:38:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o9sm27100055wmh.19.2021.05.10.06.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 06:38:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B23CD1FF7E;
 Mon, 10 May 2021 14:38:40 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 00/72] Convert floatx80 and float128 to FloatParts
Date: Mon, 10 May 2021 14:36:25 +0100
In-reply-to: <20210508014802.892561-1-richard.henderson@linaro.org>
Message-ID: <87bl9iyahr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Reorg everything using QEMU_GENERIC and multiple inclusion to
> reduce the amount of code duplication between the formats.
>
> The use of QEMU_GENERIC means that we need to use pointers instead
> of structures, which means that even the smaller float formats
> need rearranging.
>
> I've carried it through to completion within fpu/, so that we don't
> have (much) of the legacy code remaining.  There is some floatx80
> stuff in target/m68k and target/i386 that's still hanging around.

FWIW I could enable a few more tests although extF80_lt_quiet still has
some failures on equality tests:

./tests/fp/fp-test -l 1 -r all extF80_lt_quiet
>> Testing extF80_lt_quiet
46464 tests total.
Errors found in extF80_lt_quiet:
+0000.0000000000000000  +0000.0000000000000000  =3D> 1 .....  expected 0 ..=
...
+0000.0000000000000000  -0000.0000000000000000  =3D> 1 .....  expected 0 ..=
...
+0000.0000000000000001  +0000.0000000000000001  =3D> 1 .....  expected 0 ..=
...
+0000.7FFFFFFFFFFFFFFF  +0000.7FFFFFFFFFFFFFFF  =3D> 1 .....  expected 0 ..=
...
+0000.7FFFFFFFFFFFFFFE  +0000.7FFFFFFFFFFFFFFE  =3D> 1 .....  expected 0 ..=
...
+0001.8000000000000000  +0001.8000000000000000  =3D> 1 .....  expected 0 ..=
...
+0001.8000000000000001  +0001.8000000000000001  =3D> 1 .....  expected 0 ..=
...
+0001.FFFFFFFFFFFFFFFF  +0001.FFFFFFFFFFFFFFFF  =3D> 1 .....  expected 0 ..=
...
+0001.FFFFFFFFFFFFFFFE  +0001.FFFFFFFFFFFFFFFE  =3D> 1 .....  expected 0 ..=
...
+3FBF.8000000000000000  +3FBF.8000000000000000  =3D> 1 .....  expected 0 ..=
...
+3FBF.8000000000000001  +3FBF.8000000000000001  =3D> 1 .....  expected 0 ..=
...
+3FBF.FFFFFFFFFFFFFFFF  +3FBF.FFFFFFFFFFFFFFFF  =3D> 1 .....  expected 0 ..=
...
+3FBF.FFFFFFFFFFFFFFFE  +3FBF.FFFFFFFFFFFFFFFE  =3D> 1 .....  expected 0 ..=
...
+3FFD.8000000000000000  +3FFD.8000000000000000  =3D> 1 .....  expected 0 ..=
...
+3FFD.8000000000000001  +3FFD.8000000000000001  =3D> 1 .....  expected 0 ..=
...
+3FFD.FFFFFFFFFFFFFFFF  +3FFD.FFFFFFFFFFFFFFFF  =3D> 1 .....  expected 0 ..=
...
+3FFD.FFFFFFFFFFFFFFFE  +3FFD.FFFFFFFFFFFFFFFE  =3D> 1 .....  expected 0 ..=
...
+3FFE.8000000000000000  +3FFE.8000000000000000  =3D> 1 .....  expected 0 ..=
...
+3FFE.8000000000000001  +3FFE.8000000000000001  =3D> 1 .....  expected 0 ..=
...
+3FFE.FFFFFFFFFFFFFFFF  +3FFE.FFFFFFFFFFFFFFFF  =3D> 1 .....  expected 0 ..=
...
9618 tests performed; 20 errors found.

However the rest can be enabled:

tests/fp: enable more tests

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

1 file changed, 6 insertions(+), 6 deletions(-)
tests/fp/meson.build | 12 ++++++------

modified   tests/fp/meson.build
@@ -556,7 +556,9 @@ softfloat_conv_tests =3D {
                       'extF80_to_f64 extF80_to_f128 ' +
                       'f128_to_f16',
     'int-to-float': 'i32_to_f16 i64_to_f16 i32_to_f32 i64_to_f32 ' +
-                    'i32_to_f64 i64_to_f64 i32_to_f128 i64_to_f128',
+                    'i32_to_f64 i64_to_f64 ' +
+                    'i32_to_extF80 i64_to_extF80 ' +
+                    'i32_to_f128 i64_to_f128',
     'uint-to-float': 'ui32_to_f16 ui64_to_f16 ui32_to_f32 ui64_to_f32 ' +
                      'ui32_to_f64 ui64_to_f64 ui64_to_f128 ' +
                      'ui32_to_extF80 ui64_to_extF80',
@@ -581,7 +583,7 @@ softfloat_conv_tests =3D {
                      'extF80_to_ui64 extF80_to_ui64_r_minMag ' +
                      'f128_to_ui64 f128_to_ui64_r_minMag',
     'round-to-integer': 'f16_roundToInt f32_roundToInt ' +
-                        'f64_roundToInt f128_roundToInt'
+                        'f64_roundToInt extF80_roundToInt f128_roundToInt'
 }
 softfloat_tests =3D {
     'eq_signaling' : 'compare',
@@ -602,18 +604,16 @@ fptest_args =3D ['-s', '-l', '1']
 fptest_rounding_args =3D ['-r', 'all']
=20
 # Conversion Routines:
-# FIXME: i32_to_extF80 (broken), i64_to_extF80 (broken)
-#        extF80_roundToInt (broken)
 foreach k, v : softfloat_conv_tests
   test('fp-test-' + k, fptest,
        args: fptest_args + fptest_rounding_args + v.split(),
        suite: ['softfloat', 'softfloat-conv'])
 endforeach
=20
-# FIXME: extF80_{lt_quiet, rem} (broken),
+# FIXME: extF80_{lt_quiet} (broken),
 #        extF80_{mulAdd} (missing)
 foreach k, v : softfloat_tests
-  extF80_broken =3D ['lt_quiet', 'rem'].contains(k)
+  extF80_broken =3D ['lt_quiet'].contains(k)
   test('fp-test-' + k, fptest,
        args: fptest_args + fptest_rounding_args +
              ['f16_' + k, 'f32_' + k, 'f64_' + k, 'f128_' + k] +

--=20
Alex Benn=C3=A9e

