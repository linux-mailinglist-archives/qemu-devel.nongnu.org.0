Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967EC4E607C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 09:39:20 +0100 (CET)
Received: from localhost ([::1]:58516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXJ03-0001dZ-FP
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 04:39:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nXImw-0003Dx-6l
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:25:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nXIms-00052X-43
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:25:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648110341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oNJ7K95CKwldTHLAMYbgKFSp7RsP0JL6EbNUFXPbc3k=;
 b=eQoqRhgN+FVYS0m87UPKRsJ0p/z3+6e2qw/QgC7SMKLhsMItrl2IS1s0bQnORupTrXxk4i
 2MP26vaDj1KR8Vtu87i5KAGIzoJuTRV8aeRZJP0NdQlwb1EdqzKarVUn6J9qIVhBtefxog
 7KPzzC5/gYsb79K/amfRBJjeYlJoS5Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-vVnJ5t0xNI6Iavn_fWVlSg-1; Thu, 24 Mar 2022 04:25:40 -0400
X-MC-Unique: vVnJ5t0xNI6Iavn_fWVlSg-1
Received: by mail-ej1-f69.google.com with SMTP id
 hg13-20020a1709072ccd00b006dfa484ec23so2072396ejc.8
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 01:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oNJ7K95CKwldTHLAMYbgKFSp7RsP0JL6EbNUFXPbc3k=;
 b=zxvBg646+D80ki0J9/xJNWq5HryqpEVrRXyRG/e1N9bhTFWEVjITEZTkPxr1KfUIJ6
 x+BMoGZgUpQIHVwIv6O0Wgcm5NjwbKd8kI0OfGIt2jJ+B5YJCF/Brg73WmGccc0ooKMd
 2ODCW+G2LyKQt8mOul1xt0jLmLSR25YF38TfTSfFMc0EySkdu8ZMikzNHe+Ma8ByfTsD
 bFWssYMOAmYFCLz4dEPoCczQCyOorLv7rkdIFZpI9vMcE0TdxtRAjMM9lG3UsuCf8KjA
 NbV7W5QL2pOW43l+7yIJX5q2RtNAyos/9Uhs4SEmcOPvok1Ix4Le6q0itt1dCPIYBYKF
 6baQ==
X-Gm-Message-State: AOAM532DzRbmRPXLlNtjPp0vDTCBmsooGN/YhfQXCIqmXhJ06okHhW+7
 beJc2HYRjxiJ2NwVo4KjRPTM5tVD/1vr6XWbsZ0jBdxiiVBhLqWZ6XhGTEB0Bu6wzW1HJAN7iM7
 yAge64cFWQ5W/qa4=
X-Received: by 2002:a05:6402:42c2:b0:419:1997:62b9 with SMTP id
 i2-20020a05640242c200b00419199762b9mr5332149edc.97.1648110338939; 
 Thu, 24 Mar 2022 01:25:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4/eFZMfJhD/OuzBKDe/pYnOJJwQ4wjDmLuEm2RRhsXA2HDovextukrx8DjoyAizfq9UW+FQ==
X-Received: by 2002:a05:6402:42c2:b0:419:1997:62b9 with SMTP id
 i2-20020a05640242c200b00419199762b9mr5332134edc.97.1648110338790; 
 Thu, 24 Mar 2022 01:25:38 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 b19-20020aa7dc13000000b00418eef0a019sm1067661edu.34.2022.03.24.01.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 01:25:38 -0700 (PDT)
Date: Thu, 24 Mar 2022 09:25:37 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH-for-7.0] target/i386/hvf: Free ressources when vCPU is
 destroyed
Message-ID: <20220324092537.63991c50@redhat.com>
In-Reply-To: <20220322190745.37727-1-philippe.mathieu.daude@gmail.com>
References: <20220322190745.37727-1-philippe.mathieu.daude@gmail.com>
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
Cc: qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Mar 2022 20:07:45 +0100
Philippe Mathieu-Daud=C3=A9 <philippe.mathieu.daude@gmail.com> wrote:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20
> Both xsave_buf and hvf_caps are allocated in hvf_arch_init_vcpu(),
> free them in hvf_arch_vcpu_destroy().
>=20
> Reported-by: Mark Kanda <mark.kanda@oracle.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  target/i386/hvf/hvf.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> index fc12c02fb2..39fa4641b9 100644
> --- a/target/i386/hvf/hvf.c
> +++ b/target/i386/hvf/hvf.c
> @@ -163,7 +163,9 @@ void hvf_arch_vcpu_destroy(CPUState *cpu)
>      X86CPU *x86_cpu =3D X86_CPU(cpu);
>      CPUX86State *env =3D &x86_cpu->env;
> =20
> +    g_free(env->xsave_buf);
>      g_free(env->hvf_mmio_buf);
> +    g_free(hvf_state->hvf_caps);
>  }
> =20
>  static void init_tsc_freq(CPUX86State *env)


