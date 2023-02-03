Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D99B6897AB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 12:24:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNuAq-0003wO-WE; Fri, 03 Feb 2023 06:24:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNuAp-0003vi-Br
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:24:07 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNuAn-0006Y8-M3
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:24:07 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso3574717wmq.5
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 03:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qxOKK+R2PC3Ftz8InUgfl9ppFnB+b4jbA8fhLK137J8=;
 b=XYj4Weg6iv+a4HISa/Pbq5JN2Y0+wnBmgFYPCVC3V/cpVtWJdR7CGXAhn1fWR0Et68
 oGOimeGRPcoI6DqfJTWc/XpMy+4lF1wIUP0P3fbCte1zs2Ty7cwg1+clD7CLHp3l3C9C
 cnGMu1QgtjNfFgm49mGFgnnfr7CO3yTQUBZIpyr9mOzwbROTEuVV173Umb07GvzYAaHr
 ORy37FpceHazwxa4NYa4YkWJY3qfp/NCiMSK8tf1SH2639hPlIoZvvoF0jvxAmSlkTbT
 V0Y8aP6sm5ioRQYTY+3YHlb12CSWC86BCmMRtyoU+r9eVdcMfXEJOb6/HFNu2n46RlbO
 4DlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qxOKK+R2PC3Ftz8InUgfl9ppFnB+b4jbA8fhLK137J8=;
 b=RQhe+fvuEccuAxO6PYx/h5rfL6GKl0AHa5dOFlkCsy01NXZYx0JdPD0DWw+uYDABNb
 EnWsirggFjIZ61eSnwpYZQfmiKdb8ykrAZBHb9GKVW+Oi78+lrglXVA9PUaOrXpAd+Xe
 MeujldbCwolVmYKDR3TwVeSel19xvr8zlBwg7GtCr2tKQhBOvaQGg6hM+0vqjtkqCeBj
 AKl+XIuonDUXxq2GS6jsaBCQ/EvaxL6hBnVL/YnN5Z4l2sgoNH5tB9TfZT2N4VxzjrWT
 JBU4byRPmR53WuxFmRB9BSgSETzcexT56Qjj4MqxcY2mHejVT3KgIosBqJ4gPYH3mhAW
 mGaw==
X-Gm-Message-State: AO0yUKUURoL18/iC+1Uwe120x3sh+TJC59Te3O0c02VrLT6ImfeMU3Tg
 +KaG+s9VySVdJMojMyAnNz4U8g==
X-Google-Smtp-Source: AK7set+OSL6qVZbbbLSBuLJvsOTCNDkrfn0d1Onsddv4/4n2acstJXSGdKqkTWBcqjShbh5LqPp+ww==
X-Received: by 2002:a05:600c:3c90:b0:3d9:e5f9:984c with SMTP id
 bg16-20020a05600c3c9000b003d9e5f9984cmr10986139wmb.2.1675423443629; 
 Fri, 03 Feb 2023 03:24:03 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c315000b003dd1aa227afsm2509860wmo.31.2023.02.03.03.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 03:24:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B91651FFB7;
 Fri,  3 Feb 2023 11:24:02 +0000 (GMT)
References: <b7de2f25-c6a4-d053-2e27-ed8f13996182@rev.ng>
User-agent: mu4e 1.9.19; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: anjo@rev.ng
Cc: qemu-devel@nongnu.org, "ale@rev.ng" <ale@rev.ng>, iii@linux.ibm.com,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: ASan reports use-after-free when running munmap-pthread
Date: Fri, 03 Feb 2023 11:23:08 +0000
In-reply-to: <b7de2f25-c6a4-d053-2e27-ed8f13996182@rev.ng>
Message-ID: <87wn4zj8kt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Anton Johansson <anjo@rev.ng> writes:

> Hi,
>
> I was running check-tcg with ASan enabled on master, and ran into
> the following use-after-free. There appears to be a race between
> jump cache invalidation and thread destruction (?)
>
> I thought I'd post here since I noticed some previous discussion on the=20
> topic, and I'm not sure myself what a proper fix would look like.

Something like:

modified   accel/tcg/tb-maint.c
@@ -858,9 +858,7 @@ static void tb_jmp_cache_inval_tb(TranslationBlock *tb)
         CPU_FOREACH(cpu) {
             CPUJumpCache *jc =3D cpu->tb_jmp_cache;
=20
-            if (qatomic_read(&jc->array[h].tb) =3D=3D tb) {
-                qatomic_set(&jc->array[h].tb, NULL);
-            }
+            qatomic_cmpxchg(&jc->array[h].tb, tb, NULL);
         }
     }

?


>
> Tested on arm/aarch64/x86_64-linux-user.
>
> Here's a snippet of the ASan output:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D187529=3D=3DERROR: AddressSanitizer: heap-use-after-free on address=
 0x62d000f433b0 at pc
> 0x55cfefe00246 bp 0x7f4725f400b0 sp 0x7f4725f400a0
> READ of size 8 at 0x62d000f433b0 thread T2
>     #0 0x55cfefe00245 in tb_jmp_cache_inval_tb /home/aj/git/qemu-upstream=
/build/../accel/tcg/tb-maint.c:861
>     #1 0x55cfefe00245 in do_tb_phys_invalidate /home/aj/git/qemu-upstream=
/build/../accel/tcg/tb-maint.c:900
>     #2 0x55cfefe0088a in tb_phys_invalidate__locked
> /home/aj/git/qemu-upstream/build/../accel/tcg/tb-maint.c:916
>     #3 0x55cfefe0088a in tb_invalidate_phys_range
> /home/aj/git/qemu-upstream/build/../accel/tcg/tb-maint.c:1000
>     #4 0x55cfefe7ecf9 in target_munmap /home/aj/git/qemu-upstream/build/.=
./linux-user/mmap.c:766
>     #5 0x55cfefea5815 in do_syscall1 /home/aj/git/qemu-upstream/build/../=
linux-user/syscall.c:10105
>     #6 0x55cfefe9c950 in do_syscall /home/aj/git/qemu-upstream/build/../l=
inux-user/syscall.c:13329
>     #7 0x55cfefb97255 in cpu_loop ../linux-user/x86_64/../i386/cpu_loop.c=
:233
>     #8 0x55cfefec7af4 in clone_func /home/aj/git/qemu-upstream/build/../l=
inux-user/syscall.c:6633
>     #9 0x7f4726bbb8fc  (/usr/lib/libc.so.6+0x868fc)
>     #10 0x7f4726c3da5f  (/usr/lib/libc.so.6+0x108a5f)
>
> 0x62d000f433b0 is located 28592 bytes inside of 32768-byte region [0x62d0=
00f3c400,0x62d000f44400)
> freed by thread T387 here:
>     #0 0x7f47270be672 in __interceptor_free /usr/src/debug/gcc/libsanitiz=
er/asan/asan_malloc_linux.cpp:52
>     #1 0x55cfefd071b8 in cpu_exec_unrealizefn /home/aj/git/qemu-upstream/=
build/../cpu.c:180
>     #2 0x55cfefeea287 in property_set_bool /home/aj/git/qemu-upstream/bui=
ld/../qom/object.c:2285
>     #3 0x55cfefee603b in object_property_set /home/aj/git/qemu-upstream/b=
uild/../qom/object.c:1420
>     #4 0x55cfefeef21c in object_property_set_qobject
> /home/aj/git/qemu-upstream/build/../qom/qom-qobject.c:28
>
> previously allocated by thread T0 here:
>     #0 0x7f47270bf411 in __interceptor_calloc /usr/src/debug/gcc/libsanit=
izer/asan/asan_malloc_linux.cpp:77
>     #1 0x7f4726e77681 in g_malloc0 (/usr/lib/libglib-2.0.so.0+0x53681)
>     #2 0x55cfefed7cfe in device_set_realized /home/aj/git/qemu-upstream/b=
uild/../hw/core/qdev.c:510
>     #3 0x55cfefeea287 in property_set_bool /home/aj/git/qemu-upstream/bui=
ld/../qom/object.c:2285
>     #4 0x55cfefee603b in object_property_set /home/aj/git/qemu-upstream/b=
uild/../qom/object.c:1420
>     #5 0x55cfefeef21c in object_property_set_qobject
> /home/aj/git/qemu-upstream/build/../qom/qom-qobject.c:28


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

