Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAB64E3FEF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 14:58:19 +0100 (CET)
Received: from localhost ([::1]:58710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWf1e-0006ZV-28
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 09:58:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nWf00-0005Hx-Qk
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 09:56:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nWezz-0000NY-54
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 09:56:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647957394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rEnlirW372nmB3J3wABai4eGIbIUqFnFLm6F038KosI=;
 b=JF8puVqyAhpSxztKthS7URRr/ng+0hMMbC0fZSUbQpoSKtUgeYMBvgVjGr3r5Jj9Lv75Fh
 9jidozhQ+vbMSTxaXljmMNTctQ+HNeVIbqCIT94ObpFMECa5wFWVxuB5gMYdCwkMYS9xFo
 AfKcAoGOQtBNVvnBFl7deNfGPE2NSwc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-UGWk1iy8Oj6WtP8AN3eazQ-1; Tue, 22 Mar 2022 09:56:33 -0400
X-MC-Unique: UGWk1iy8Oj6WtP8AN3eazQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 q25-20020a50aa99000000b004192a64d410so4351415edc.16
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 06:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rEnlirW372nmB3J3wABai4eGIbIUqFnFLm6F038KosI=;
 b=4o60RpO/L9WTa0OixfKMS6qy1yLQmpTYTza2bvfo+9wI19ips/k8ZYg7A+EYzP9JIc
 54ZEA5PSqdmL3PL9eFG3FYvJMz2RiwOArmWXdBTkjCyc+me9f5RFZXPaDYcofd8Kusgv
 S1fcJ5YBsPc8dK9Li+zaOE86zyTdBPAgdplb3NGS8IMRIWcsr3laQdMXVWiNLkOgf355
 ErvlM96LHp9Q1k1ITxbsrxt/F/hdjytvIk9yRehIVeoibeeWdoccE/HGN0YLA0siBpp5
 EHS1sXXc7RIZMZky5T2694cWn7fu0ibYRweqM0whKOyQhNbFF4/+b6YPwTgt/n/94UnZ
 44rg==
X-Gm-Message-State: AOAM531fHqqszUf7rY8ihEuGoFVZwRpw4FBw88pr9mwiS+HzlnM9utzW
 F3nwE0AH9blPB9bO4fmXq72Ix3lyMT5YoDpFuF3hh+2nOPS3x3Z5xhCzGoMVZtsL2Gzcd5PoH0E
 MTwfANEnixtxwjck=
X-Received: by 2002:a17:906:7307:b0:6da:92e1:9c83 with SMTP id
 di7-20020a170906730700b006da92e19c83mr26188104ejc.459.1647957391648; 
 Tue, 22 Mar 2022 06:56:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqBDQ65WMaJo5YSmdmuEtqdEirNOnVZJFZPa01uqnSh7sZWzQZ74jeDQEobs73nT3uW/Wuyw==
X-Received: by 2002:a17:906:7307:b0:6da:92e1:9c83 with SMTP id
 di7-20020a170906730700b006da92e19c83mr26188081ejc.459.1647957391402; 
 Tue, 22 Mar 2022 06:56:31 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a17090637c300b006d8631b2935sm8268071ejc.186.2022.03.22.06.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 06:56:31 -0700 (PDT)
Date: Tue, 22 Mar 2022 14:56:29 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=        
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [RFC PATCH-for-7.0 v4] target/i386/kvm: Free xsave_buf when
 destroying vCPU
Message-ID: <20220322145629.7e0b3b8c@redhat.com>
In-Reply-To: <20220322120522.26200-1-philippe.mathieu.daude@gmail.com>
References: <20220322120522.26200-1-philippe.mathieu.daude@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kvm@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Mar 2022 13:05:22 +0100
Philippe Mathieu-Daud=C3=A9         <philippe.mathieu.daude@gmail.com> wrot=
e:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20
> Fix vCPU hot-unplug related leak reported by Valgrind:
>=20
>   =3D=3D132362=3D=3D 4,096 bytes in 1 blocks are definitely lost in loss =
record 8,440 of 8,549
>   =3D=3D132362=3D=3D    at 0x4C3B15F: memalign (vg_replace_malloc.c:1265)
>   =3D=3D132362=3D=3D    by 0x4C3B288: posix_memalign (vg_replace_malloc.c=
:1429)
>   =3D=3D132362=3D=3D    by 0xB41195: qemu_try_memalign (memalign.c:53)
>   =3D=3D132362=3D=3D    by 0xB41204: qemu_memalign (memalign.c:73)
>   =3D=3D132362=3D=3D    by 0x7131CB: kvm_init_xsave (kvm.c:1601)
>   =3D=3D132362=3D=3D    by 0x7148ED: kvm_arch_init_vcpu (kvm.c:2031)
>   =3D=3D132362=3D=3D    by 0x91D224: kvm_init_vcpu (kvm-all.c:516)
>   =3D=3D132362=3D=3D    by 0x9242C9: kvm_vcpu_thread_fn (kvm-accel-ops.c:=
40)
>   =3D=3D132362=3D=3D    by 0xB2EB26: qemu_thread_start (qemu-thread-posix=
.c:556)
>   =3D=3D132362=3D=3D    by 0x7EB2159: start_thread (in /usr/lib64/libpthr=
ead-2.28.so)
>   =3D=3D132362=3D=3D    by 0x9D45DD2: clone (in /usr/lib64/libc-2.28.so)
>=20
> Reported-by: Mark Kanda <mark.kanda@oracle.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Based on a series from Mark:
> https://lore.kernel.org/qemu-devel/20220321141409.3112932-1-mark.kanda@or=
acle.com/
>=20
> RFC because currently no time to test
> ---
>  target/i386/kvm/kvm.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index ef2c68a6f4..e93440e774 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -2072,6 +2072,8 @@ int kvm_arch_destroy_vcpu(CPUState *cs)
>      X86CPU *cpu =3D X86_CPU(cs);
>      CPUX86State *env =3D &cpu->env;
> =20
> +    g_free(env->xsave_buf);
> +
>      if (cpu->kvm_msr_buf) {
>          g_free(cpu->kvm_msr_buf);
>          cpu->kvm_msr_buf =3D NULL;


shouldn't we do the same in hvf_arch_vcpu_destroy() ?


