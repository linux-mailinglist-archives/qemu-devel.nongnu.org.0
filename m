Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ACE575D23
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 10:15:12 +0200 (CEST)
Received: from localhost ([::1]:49856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCGTg-0003mI-2j
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 04:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oCGPg-0000s2-Bt; Fri, 15 Jul 2022 04:11:05 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:42568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oCGPa-0008Pq-DC; Fri, 15 Jul 2022 04:11:03 -0400
Received: by mail-lj1-x22c.google.com with SMTP id m9so2227786ljp.9;
 Fri, 15 Jul 2022 01:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=svVro2en4raHoSCI6uI9ZAH9sm+CzMBS+vz5nBc9CJk=;
 b=PyW9zPcS+XbOrxFJmPKsgxt8rBsQ7pnXs00Hs0UXo61MVi6aAj0g3GUrUaTHjvSN9F
 G4C5HFXHntJOuqOO6qfuA1BuWRlXbEucrNExtKKOBLdLRuvlgq9Fh3bP1yRkeGZ8GuBE
 /cU26uSBIt3hjb5qWAVgzJuPikJFxJS1/H2MfmxGLP1NkT/CLtwvIpwhJzqN4v1O/43X
 sKV7Pw3opAq0Z4d1dr5krBx35sun9fNkRqncw9cBSOtIzze3g06NEmd/lJ1zMeE3VZyP
 MiCvRmX050fWKVk4bp0BKlHaqc2ax0q5HLCdxf99VY6uJxz5Sy2OXcX3t5Zn33DZOVXe
 reZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=svVro2en4raHoSCI6uI9ZAH9sm+CzMBS+vz5nBc9CJk=;
 b=0qHdlASWVShybH3o269wDNCt7G4PnymxLjzhqYXUOnKig0CTz875Eoq/PSEWUdf9Hr
 7h60q5mGqym1SWAwK0U4XiMWOLh360YNLczxvfHNOXSDn/z+BJj6TG6sT2HpG/FwdBGF
 ZkCgMJwUgWaAya/6KsliYwBx+fwwvmq8QuiGztrPVKEmRKNbfkKD95fla934Ft81xyzC
 4YzGeIXe003+bms9pop9qLq5o215m5WlGmbcmKqc3Jtdrn3DyP47vw9r74d8qTO2mOjC
 iU3rhWHua4wpu9wUdobnxrYDle/2vTqNlh0yzsmaHI/wOTp9Cih+Eo7mx+BRlvJGozdy
 aHjA==
X-Gm-Message-State: AJIora+3SQHQb6VF0au8s2Zim+F/caJOAsBxWZSm0f2wR/E6qqRA1BLn
 Qs2w5eaYw/sWvGyna4vY/z0WwrdZkG5CZxDGeKU=
X-Google-Smtp-Source: AGRyM1vQ1xseSqWwpXb3lT2eGDF8mvqwaEFLKPVmk04PfwjhEicTj4rxYUqIaaIAo8GDTp+AVFygfTim289vhh9WT2g=
X-Received: by 2002:a2e:b892:0:b0:25b:ce73:675f with SMTP id
 r18-20020a2eb892000000b0025bce73675fmr6161793ljp.67.1657872654268; Fri, 15
 Jul 2022 01:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220713130322.25517-1-frankja@linux.ibm.com>
 <20220713130322.25517-10-frankja@linux.ibm.com>
In-Reply-To: <20220713130322.25517-10-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 15 Jul 2022 12:10:42 +0400
Message-ID: <CAJ+F1C+NuKMHYZWC9w0Q5DpvnyYBExqtk2agRx+7o6v_PjOcug@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] s390x: Introduce PV query interface
To: Janosch Frank <frankja@linux.ibm.com>
Cc: QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qemu-s390x list <qemu-s390x@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000a3fd8205e3d38e80"
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

--000000000000a3fd8205e3d38e80
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jul 13, 2022 at 5:18 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:

> Introduce an interface over which we can get information about UV data.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  hw/s390x/pv.c              | 61 ++++++++++++++++++++++++++++++++++++++
>  hw/s390x/s390-virtio-ccw.c |  5 ++++
>  include/hw/s390x/pv.h      | 10 +++++++
>  3 files changed, 76 insertions(+)
>
> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
> index 401b63d6cb..a5af4ddf46 100644
> --- a/hw/s390x/pv.c
> +++ b/hw/s390x/pv.c
> @@ -20,6 +20,11 @@
>  #include "exec/confidential-guest-support.h"
>  #include "hw/s390x/ipl.h"
>  #include "hw/s390x/pv.h"
> +#include "target/s390x/kvm/kvm_s390x.h"
> +
> +static bool info_valid;
> +static struct kvm_s390_pv_info_vm info_vm;
> +static struct kvm_s390_pv_info_dump info_dump;
>
>  static int __s390_pv_cmd(uint32_t cmd, const char *cmdname, void *data)
>  {
> @@ -56,6 +61,42 @@ static int __s390_pv_cmd(uint32_t cmd, const char
> *cmdname, void *data)
>      }                                  \
>  }
>
> +int s390_pv_query_info(void)
> +{
> +    struct kvm_s390_pv_info info =3D {
> +        .header.id =3D KVM_PV_INFO_VM,
> +        .header.len_max =3D sizeof(info.header) + sizeof(info.vm),
> +    };
> +    int rc;
> +
> +    /* Info API's first user is dump so they are bundled */
> +    if (!kvm_s390_get_protected_dump()) {
> +        return 0;
> +    }
> +
> +    rc =3D s390_pv_cmd(KVM_PV_INFO, &info);
> +    if (rc) {
> +        error_report("KVM PV INFO cmd %x failed: %s",
> +                     info.header.id, strerror(rc));
> +        return rc;
> +    }
> +    memcpy(&info_vm, &info.vm, sizeof(info.vm));
> +
> +    info.header.id =3D KVM_PV_INFO_DUMP;
> +    info.header.len_max =3D sizeof(info.header) + sizeof(info.dump);
> +    rc =3D s390_pv_cmd(KVM_PV_INFO, &info);
> +    if (rc) {
> +        error_report("KVM PV INFO cmd %x failed: %s",
> +                     info.header.id, strerror(rc));
> +        return rc;
> +    }
> +
> +    memcpy(&info_dump, &info.dump, sizeof(info.dump));
> +    info_valid =3D true;
> +
> +    return rc;
> +}
> +
>  int s390_pv_vm_enable(void)
>  {
>      return s390_pv_cmd(KVM_PV_ENABLE, NULL);
> @@ -114,6 +155,26 @@ void s390_pv_inject_reset_error(CPUState *cs)
>      env->regs[r1 + 1] =3D DIAG_308_RC_INVAL_FOR_PV;
>  }
>
> +uint64_t kvm_s390_pv_dmp_get_size_cpu(void)
> +{
> +    return info_dump.dump_cpu_buffer_len;
> +}
> +
> +uint64_t kvm_s390_pv_dmp_get_size_complete(void)
> +{
> +    return info_dump.dump_config_finalize_len;
> +}
> +
> +uint64_t kvm_s390_pv_dmp_get_size_mem(void)
> +{
> +    return info_dump.dump_config_mem_buffer_per_1m;
> +}
> +
> +bool kvm_s390_pv_info_basic_valid(void)
> +{
> +    return info_valid;
> +}
> +
>  #define TYPE_S390_PV_GUEST "s390-pv-guest"
>  OBJECT_DECLARE_SIMPLE_TYPE(S390PVGuest, S390_PV_GUEST)
>
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index cc3097bfee..f9401e392b 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -366,6 +366,11 @@ static int s390_machine_protect(S390CcwMachineState
> *ms)
>
>      ms->pv =3D true;
>
> +    rc =3D s390_pv_query_info();
> +    if (rc) {
> +        goto out_err;
>

Maybe it's not necessary to make it fatal on error?

lgtm otherwise


> +    }
> +
>      /* Set SE header and unpack */
>      rc =3D s390_ipl_prepare_pv_header();
>      if (rc) {
> diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
> index 1f1f545bfc..6fa55bf70e 100644
> --- a/include/hw/s390x/pv.h
> +++ b/include/hw/s390x/pv.h
> @@ -38,6 +38,7 @@ static inline bool s390_is_pv(void)
>      return ccw->pv;
>  }
>
> +int s390_pv_query_info(void);
>  int s390_pv_vm_enable(void);
>  void s390_pv_vm_disable(void);
>  int s390_pv_set_sec_parms(uint64_t origin, uint64_t length);
> @@ -46,8 +47,13 @@ void s390_pv_prep_reset(void);
>  int s390_pv_verify(void);
>  void s390_pv_unshare(void);
>  void s390_pv_inject_reset_error(CPUState *cs);
> +uint64_t kvm_s390_pv_dmp_get_size_cpu(void);
> +uint64_t kvm_s390_pv_dmp_get_size_mem(void);
> +uint64_t kvm_s390_pv_dmp_get_size_complete(void);
> +bool kvm_s390_pv_info_basic_valid(void);
>  #else /* CONFIG_KVM */
>  static inline bool s390_is_pv(void) { return false; }
> +static inline int s390_pv_query_info(void) { return 0; }
>  static inline int s390_pv_vm_enable(void) { return 0; }
>  static inline void s390_pv_vm_disable(void) {}
>  static inline int s390_pv_set_sec_parms(uint64_t origin, uint64_t length=
)
> { return 0; }
> @@ -56,6 +62,10 @@ static inline void s390_pv_prep_reset(void) {}
>  static inline int s390_pv_verify(void) { return 0; }
>  static inline void s390_pv_unshare(void) {}
>  static inline void s390_pv_inject_reset_error(CPUState *cs) {};
> +static inline uint64_t kvm_s390_pv_dmp_get_size_cpu(void) { return 0; }
> +static inline uint64_t kvm_s390_pv_dmp_get_size_mem(void) { return 0; }
> +static inline uint64_t kvm_s390_pv_dmp_get_size_complete(void) { return
> 0; }
> +static inline bool kvm_s390_pv_info_basic_valid(void) { return false; }
>  #endif /* CONFIG_KVM */
>
>  int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000a3fd8205e3d38e80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 13, 2022 at 5:18 PM Jan=
osch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com">frankja@linux.ibm.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Introduce an interface over which we can get information about UV data.<b=
r>
<br>
Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" t=
arget=3D"_blank">frankja@linux.ibm.com</a>&gt;<br>
---<br>
=C2=A0hw/s390x/pv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 61 ++=
++++++++++++++++++++++++++++++++++++<br>
=C2=A0hw/s390x/s390-virtio-ccw.c |=C2=A0 5 ++++<br>
=C2=A0include/hw/s390x/pv.h=C2=A0 =C2=A0 =C2=A0 | 10 +++++++<br>
=C2=A03 files changed, 76 insertions(+)<br>
<br>
diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c<br>
index 401b63d6cb..a5af4ddf46 100644<br>
--- a/hw/s390x/pv.c<br>
+++ b/hw/s390x/pv.c<br>
@@ -20,6 +20,11 @@<br>
=C2=A0#include &quot;exec/confidential-guest-support.h&quot;<br>
=C2=A0#include &quot;hw/s390x/ipl.h&quot;<br>
=C2=A0#include &quot;hw/s390x/pv.h&quot;<br>
+#include &quot;target/s390x/kvm/kvm_s390x.h&quot;<br>
+<br>
+static bool info_valid;<br>
+static struct kvm_s390_pv_info_vm info_vm;<br>
+static struct kvm_s390_pv_info_dump info_dump;<br>
<br>
=C2=A0static int __s390_pv_cmd(uint32_t cmd, const char *cmdname, void *dat=
a)<br>
=C2=A0{<br>
@@ -56,6 +61,42 @@ static int __s390_pv_cmd(uint32_t cmd, const char *cmdna=
me, void *data)<br>
=C2=A0 =C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0}<br>
<br>
+int s390_pv_query_info(void)<br>
+{<br>
+=C2=A0 =C2=A0 struct kvm_s390_pv_info info =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .<a href=3D"http://header.id" rel=3D"noreferre=
r" target=3D"_blank">header.id</a> =3D KVM_PV_INFO_VM,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .header.len_max =3D sizeof(info.header) + size=
of(info.vm),<br>
+=C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 int rc;<br>
+<br>
+=C2=A0 =C2=A0 /* Info API&#39;s first user is dump so they are bundled */<=
br>
+=C2=A0 =C2=A0 if (!kvm_s390_get_protected_dump()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 rc =3D s390_pv_cmd(KVM_PV_INFO, &amp;info);<br>
+=C2=A0 =C2=A0 if (rc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;KVM PV INFO cmd %x failed: =
%s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0<a href=3D"http://info.header.id" rel=3D"noreferrer" target=3D"_blank">i=
nfo.header.id</a>, strerror(rc));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return rc;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 memcpy(&amp;info_vm, &amp;info.vm, sizeof(info.vm));<br>
+<br>
+=C2=A0 =C2=A0 <a href=3D"http://info.header.id" rel=3D"noreferrer" target=
=3D"_blank">info.header.id</a> =3D KVM_PV_INFO_DUMP;<br>
+=C2=A0 =C2=A0 info.header.len_max =3D sizeof(info.header) + sizeof(info.du=
mp);<br>
+=C2=A0 =C2=A0 rc =3D s390_pv_cmd(KVM_PV_INFO, &amp;info);<br>
+=C2=A0 =C2=A0 if (rc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;KVM PV INFO cmd %x failed: =
%s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0<a href=3D"http://info.header.id" rel=3D"noreferrer" target=3D"_blank">i=
nfo.header.id</a>, strerror(rc));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return rc;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 memcpy(&amp;info_dump, &amp;info.dump, sizeof(info.dump));<b=
r>
+=C2=A0 =C2=A0 info_valid =3D true;<br>
+<br>
+=C2=A0 =C2=A0 return rc;<br>
+}<br>
+<br>
=C2=A0int s390_pv_vm_enable(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0return s390_pv_cmd(KVM_PV_ENABLE, NULL);<br>
@@ -114,6 +155,26 @@ void s390_pv_inject_reset_error(CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;regs[r1 + 1] =3D DIAG_308_RC_INVAL_FOR_PV;<br>
=C2=A0}<br>
<br>
+uint64_t kvm_s390_pv_dmp_get_size_cpu(void)<br>
+{<br>
+=C2=A0 =C2=A0 return info_dump.dump_cpu_buffer_len;<br>
+}<br>
+<br>
+uint64_t kvm_s390_pv_dmp_get_size_complete(void)<br>
+{<br>
+=C2=A0 =C2=A0 return info_dump.dump_config_finalize_len;<br>
+}<br>
+<br>
+uint64_t kvm_s390_pv_dmp_get_size_mem(void)<br>
+{<br>
+=C2=A0 =C2=A0 return info_dump.dump_config_mem_buffer_per_1m;<br>
+}<br>
+<br>
+bool kvm_s390_pv_info_basic_valid(void)<br>
+{<br>
+=C2=A0 =C2=A0 return info_valid;<br>
+}<br>
+<br>
=C2=A0#define TYPE_S390_PV_GUEST &quot;s390-pv-guest&quot;<br>
=C2=A0OBJECT_DECLARE_SIMPLE_TYPE(S390PVGuest, S390_PV_GUEST)<br>
<br>
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c<br>
index cc3097bfee..f9401e392b 100644<br>
--- a/hw/s390x/s390-virtio-ccw.c<br>
+++ b/hw/s390x/s390-virtio-ccw.c<br>
@@ -366,6 +366,11 @@ static int s390_machine_protect(S390CcwMachineState *m=
s)<br>
<br>
=C2=A0 =C2=A0 =C2=A0ms-&gt;pv =3D true;<br>
<br>
+=C2=A0 =C2=A0 rc =3D s390_pv_query_info();<br>
+=C2=A0 =C2=A0 if (rc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_err;<br></blockquote><div><br></div><=
div>Maybe it&#39;s not necessary to make it fatal on error?</div><div><br><=
/div><div>lgtm otherwise<br></div><div>=C2=A0<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Set SE header and unpack */<br>
=C2=A0 =C2=A0 =C2=A0rc =3D s390_ipl_prepare_pv_header();<br>
=C2=A0 =C2=A0 =C2=A0if (rc) {<br>
diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h<br>
index 1f1f545bfc..6fa55bf70e 100644<br>
--- a/include/hw/s390x/pv.h<br>
+++ b/include/hw/s390x/pv.h<br>
@@ -38,6 +38,7 @@ static inline bool s390_is_pv(void)<br>
=C2=A0 =C2=A0 =C2=A0return ccw-&gt;pv;<br>
=C2=A0}<br>
<br>
+int s390_pv_query_info(void);<br>
=C2=A0int s390_pv_vm_enable(void);<br>
=C2=A0void s390_pv_vm_disable(void);<br>
=C2=A0int s390_pv_set_sec_parms(uint64_t origin, uint64_t length);<br>
@@ -46,8 +47,13 @@ void s390_pv_prep_reset(void);<br>
=C2=A0int s390_pv_verify(void);<br>
=C2=A0void s390_pv_unshare(void);<br>
=C2=A0void s390_pv_inject_reset_error(CPUState *cs);<br>
+uint64_t kvm_s390_pv_dmp_get_size_cpu(void);<br>
+uint64_t kvm_s390_pv_dmp_get_size_mem(void);<br>
+uint64_t kvm_s390_pv_dmp_get_size_complete(void);<br>
+bool kvm_s390_pv_info_basic_valid(void);<br>
=C2=A0#else /* CONFIG_KVM */<br>
=C2=A0static inline bool s390_is_pv(void) { return false; }<br>
+static inline int s390_pv_query_info(void) { return 0; }<br>
=C2=A0static inline int s390_pv_vm_enable(void) { return 0; }<br>
=C2=A0static inline void s390_pv_vm_disable(void) {}<br>
=C2=A0static inline int s390_pv_set_sec_parms(uint64_t origin, uint64_t len=
gth) { return 0; }<br>
@@ -56,6 +62,10 @@ static inline void s390_pv_prep_reset(void) {}<br>
=C2=A0static inline int s390_pv_verify(void) { return 0; }<br>
=C2=A0static inline void s390_pv_unshare(void) {}<br>
=C2=A0static inline void s390_pv_inject_reset_error(CPUState *cs) {};<br>
+static inline uint64_t kvm_s390_pv_dmp_get_size_cpu(void) { return 0; }<br=
>
+static inline uint64_t kvm_s390_pv_dmp_get_size_mem(void) { return 0; }<br=
>
+static inline uint64_t kvm_s390_pv_dmp_get_size_complete(void) { return 0;=
 }<br>
+static inline bool kvm_s390_pv_info_basic_valid(void) { return false; }<br=
>
=C2=A0#endif /* CONFIG_KVM */<br>
<br>
=C2=A0int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);<br=
>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000a3fd8205e3d38e80--

