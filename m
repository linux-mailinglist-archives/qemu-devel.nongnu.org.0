Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B676968D0
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:08:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxqn-0000CK-EL; Tue, 14 Feb 2023 11:08:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRxql-0000Bw-17; Tue, 14 Feb 2023 11:08:11 -0500
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRxqi-00027E-OP; Tue, 14 Feb 2023 11:08:10 -0500
Received: by mail-vk1-xa2b.google.com with SMTP id v81so8212421vkv.5;
 Tue, 14 Feb 2023 08:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1676390887;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xgLdr5Xto2TmAnyBwcyuFb4TJ/tsFaLx03bgaR7hvSs=;
 b=j2Mteq31kHR5HOw16c5HFsub9AXiwG9iRWEmXYdDs2jaZWs7ms7VivHiEW8SHiTOIy
 d46Qt6YdXUffCXbG3uOURH5Go2cTisaJkEuQh73a0+jrVqmdos5OUPJc3grQhJo1j8zZ
 mxk4jd+T0fh3KlcCyZFdYFJ4EHoPAXkXD7GI86lQ2Ov1BH2ijtar0ubhCos31ErWFQnT
 Xejvp9/fZHMDgpCUh4W+PPDw8oKIeAtWxY0B157K0ouieX5/dj9JjmeequZ6GD5ulcYE
 OVfAQDgLqUwDiQv30xuo46lqxdePlzi2bNq0V2HDq9ddzD/JbRn6181FQ9dGK/E2uZDo
 lEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676390887;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xgLdr5Xto2TmAnyBwcyuFb4TJ/tsFaLx03bgaR7hvSs=;
 b=AjuO7j5WTZG27t8mfnzzi4nXywjWB6F5FRdR5Rjupb75mY2jux8MVgE1WAJ/TkeOcw
 Pr8aXcJp/+3NLtLu9Upt0dtEUlHxSbs/5U9uT5cq3ANBLz/v5ubg0oRoRLxdvit1y4KJ
 4wnk5FiQRBOceTUEIfw8AjX7N3u5+4BrhYQYNlZoO03coZ/I+ZOPHcq2TFWNHhXuZa2t
 f2TN5ykdFJZRLcWFwO+Hs2LMfymVGBSg1YkSxUNUiTU1OmIwgA0deIkOSu11ESNZic3h
 AktdaNUsZegVUG9hDJEuPPVTc0C/iIiKhV3dv0BSwjF4IY/do/tTA9MrQCnlWw47NFoG
 R0lw==
X-Gm-Message-State: AO0yUKVrrSCx7xT6GxzOo4Ix4xITEbhKLVWyRYk1GkIbSLuN7EfmwFh5
 /1ts6Bu6fkxkyD0j5Btae1wMs+OtVkpvxUpfVeg=
X-Google-Smtp-Source: AK7set+7hf6CVhv746KbrPHwkkoRDM1iJunYPOzALMPtCrhYim5mF3pa+4+/uNW3fwpqdPUjB4FHHBz3rRssleeyKbw=
X-Received: by 2002:a05:6122:124c:b0:3d5:911f:daed with SMTP id
 b12-20020a056122124c00b003d5911fdaedmr447077vkp.39.1676390887209; Tue, 14 Feb
 2023 08:08:07 -0800 (PST)
MIME-Version: 1.0
References: <20230213184338.46712-1-philmd@linaro.org>
 <20230213184338.46712-5-philmd@linaro.org>
In-Reply-To: <20230213184338.46712-5-philmd@linaro.org>
From: Bernhard Beschow <shentey@gmail.com>
Date: Tue, 14 Feb 2023 17:07:51 +0100
Message-ID: <CAG4p6K5Rfeya9A5pD_HEUMazGOy6KU=PmQPK7JsgFEfoQx4gKQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/14] hw/char/serial-pci-multi: Factor
 multi_serial_class_initfn() out
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 qemu-block@nongnu.org, 
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>, 
 Richard Henderson <richard.henderson@linaro.org>, Li Qiang <liq3ea@163.com>, 
 Thomas Huth <thuth@redhat.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, 
 xiaoqiang zhao <zxq_yx_007@163.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005651b505f4ab2b07"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=shentey@gmail.com; helo=mail-vk1-xa2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--0000000000005651b505f4ab2b07
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2023 at 7:46 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org>
wrote:

> Extract code common to multi_2x_serial_pci_class_initfn() and
> multi_4x_serial_pci_class_initfn() to multi_serial_class_initfn().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/char/serial-pci-multi.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c
> index e56c0bc841..704be5c294 100644
> --- a/hw/char/serial-pci-multi.c
> +++ b/hw/char/serial-pci-multi.c
> @@ -155,14 +155,14 @@ static Property multi_4x_serial_pci_properties[] =
=3D {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> -static void multi_2x_serial_pci_class_initfn(ObjectClass *klass, void
> *data)
> +static void multi_serial_class_initfn(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>      PCIDeviceClass *pc =3D PCI_DEVICE_CLASS(klass);
> +
>      pc->realize =3D multi_serial_pci_realize;
>      pc->exit =3D multi_serial_pci_exit;
>      pc->vendor_id =3D PCI_VENDOR_ID_REDHAT;
> -    pc->device_id =3D PCI_DEVICE_ID_REDHAT_SERIAL2;
>      pc->revision =3D 1;
>      pc->class_id =3D PCI_CLASS_COMMUNICATION_SERIAL;
>      dc->vmsd =3D &vmstate_pci_multi_serial;
> @@ -170,19 +170,22 @@ static void
> multi_2x_serial_pci_class_initfn(ObjectClass *klass, void *data)
>      set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>  }
>
> +static void multi_2x_serial_pci_class_initfn(ObjectClass *klass, void
> *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    PCIDeviceClass *pc =3D PCI_DEVICE_CLASS(klass);
> +
> +    pc->device_id =3D PCI_DEVICE_ID_REDHAT_SERIAL2;
> +    device_class_set_props(dc, multi_2x_serial_pci_properties);
> +}
> +
>  static void multi_4x_serial_pci_class_initfn(ObjectClass *klass, void
> *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>      PCIDeviceClass *pc =3D PCI_DEVICE_CLASS(klass);
> -    pc->realize =3D multi_serial_pci_realize;
> -    pc->exit =3D multi_serial_pci_exit;
> -    pc->vendor_id =3D PCI_VENDOR_ID_REDHAT;
> +
>      pc->device_id =3D PCI_DEVICE_ID_REDHAT_SERIAL4;
> -    pc->revision =3D 1;
> -    pc->class_id =3D PCI_CLASS_COMMUNICATION_SERIAL;
> -    dc->vmsd =3D &vmstate_pci_multi_serial;
>      device_class_set_props(dc, multi_4x_serial_pci_properties);
> -    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>  }
>
>  static void multi_serial_init(Object *o)
> @@ -202,6 +205,7 @@ static const TypeInfo multi_serial_pci_types[] =3D {
>          .parent         =3D TYPE_PCI_DEVICE,
>          .instance_size  =3D sizeof(PCIMultiSerialState),
>          .instance_init  =3D multi_serial_init,
> +        .class_init     =3D multi_serial_class_initfn,
>          .abstract       =3D true,
>          .interfaces     =3D (InterfaceInfo[]) {
>              { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> --
> 2.38.1
>
>
>
This patch hits an assert for me:

    qemu-system-x86_64: ../src/qom/object.c:1279:
object_class_property_add: Assertion `!object_class_property_find(klass,
name)' failed.

with the following backtrace:

Thread 1 "qemu-system-x86" received signal SIGABRT, Aborted.
__pthread_kill_implementation (threadid=3D<optimized out>, signo=3Dsigno@en=
try=3D6,
no_tid=3Dno_tid@entry=3D0) at pthread_kill.c:44
44            return INTERNAL_SYSCALL_ERROR_P (ret) ?
INTERNAL_SYSCALL_ERRNO (ret) : 0;
(gdb) bt
#0  __pthread_kill_implementation (threadid=3D<optimized out>,
signo=3Dsigno@entry=3D6, no_tid=3Dno_tid@entry=3D0) at pthread_kill.c:44
#1  0x00007ffff6c91953 in __pthread_kill_internal (signo=3D6,
threadid=3D<optimized out>) at pthread_kill.c:78
#2  0x00007ffff6c42ea8 in __GI_raise (sig=3Dsig@entry=3D6) at
../sysdeps/posix/raise.c:26
#3  0x00007ffff6c2c53d in __GI_abort () at abort.c:79
#4  0x00007ffff6c2c45c in __assert_fail_base
    (fmt=3D0x7ffff6da5d68 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n",
assertion=3D0x5555560b9998 "!object_class_property_find(klass, name)",
file=3D0x5555560b94be "../src/qom/object.c", line=3D1279, function=3D<optim=
ized
out>) at assert.c:92
#5  0x00007ffff6c3b9f6 in __assert_fail
    (assertion=3Dassertion@entry=3D0x5555560b9998
"!object_class_property_find(klass, name)", file=3Dfile@entry=3D0x5555560b9=
4be
"../src/qom/object.c", line=3Dline@entry=3D1279,
function=3Dfunction@entry=3D0x5555560b9d00
<__PRETTY_FUNCTION__.21> "object_class_property_add") at assert.c:101
#6  0x0000555555dbb690 in object_class_property_add
    (klass=3Dklass@entry=3D0x5555569af820, name=3Dname@entry=3D0x555555fbe0=
4b
"chardev1", type=3D0x5555561230dd "str", get=3D0x555555db2ad0 <field_prop_g=
et>,
set=3D0x555555db36d0 <field_prop_set>, release=3D0x5555559f8f90 <release_ch=
r>,
opaque=3D0x5555563cc900 <multi_4x_serial_pci_properties>) at
../src/qom/object.c:1279
#7  0x0000555555db3e6d in qdev_class_add_property (prop=3D0x5555563cc900
<multi_4x_serial_pci_properties>, name=3D0x555555fbe04b "chardev1",
klass=3D0x5555569af820)
    at ../src/hw/core/qdev-properties.c:889
#8  device_class_set_props (dc=3D0x5555569af820, props=3D<optimized out>) a=
t
../src/hw/core/qdev-properties.c:955
#9  0x0000555555dba590 in type_initialize (ti=3D0x5555567f4840) at
../src/qom/object.c:1094
#10 object_class_foreach_tramp (key=3D<optimized out>, value=3D0x5555567f48=
40,
opaque=3D0x7fffffffe260) at ../src/qom/object.c:1081
#11 0x00007ffff70bcda8 in g_hash_table_foreach (hash_table=3D0x5555567b92a0=
 =3D
{...}, func=3D0x555555dba530 <object_class_foreach_tramp>,
user_data=3D0x7fffffffe260)
    at ../glib/glib/ghash.c:2098
#12 0x0000555555dbaac6 in object_class_foreach (opaque=3D0x7fffffffe258,
include_abstract=3Dfalse, implements_type=3D<optimized out>, fn=3D0x555555d=
b8a70
<object_class_get_list_tramp>)
    at ../src/qom/object.c:87
#13 object_class_get_list (implements_type=3Dimplements_type@entry=3D0x5555=
5603bb98
"machine", include_abstract=3Dinclude_abstract@entry=3Dfalse) at
../src/qom/object.c:1160
#14 0x0000555555b68df7 in select_machine (errp=3D<optimized out>,
qdict=3D0x55555684a4e0) at ../src/softmmu/vl.c:1580
#15 qemu_create_machine (qdict=3D0x55555684a4e0) at ../src/softmmu/vl.c:201=
5
#16 qemu_init (argc=3D<optimized out>, argv=3D0x7fffffffe548) at
../src/softmmu/vl.c:3542
#17 0x000055555596f07e in main (argc=3D<optimized out>, argv=3D<optimized o=
ut>)
at ../src/softmmu/main.c:47

--0000000000005651b505f4ab2b07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 13, 2023 at 7:46 PM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Extract code common to multi_2x_serial_pci_class_initfn() and<br>
multi_4x_serial_pci_class_initfn() to multi_serial_class_initfn().<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
---<br>
=C2=A0hw/char/serial-pci-multi.c | 22 +++++++++++++---------<br>
=C2=A01 file changed, 13 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c<br>
index e56c0bc841..704be5c294 100644<br>
--- a/hw/char/serial-pci-multi.c<br>
+++ b/hw/char/serial-pci-multi.c<br>
@@ -155,14 +155,14 @@ static Property multi_4x_serial_pci_properties[] =3D =
{<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_END_OF_LIST(),<br>
=C2=A0};<br>
<br>
-static void multi_2x_serial_pci_class_initfn(ObjectClass *klass, void *dat=
a)<br>
+static void multi_serial_class_initfn(ObjectClass *klass, void *data)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
=C2=A0 =C2=A0 =C2=A0PCIDeviceClass *pc =3D PCI_DEVICE_CLASS(klass);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0pc-&gt;realize =3D multi_serial_pci_realize;<br>
=C2=A0 =C2=A0 =C2=A0pc-&gt;exit =3D multi_serial_pci_exit;<br>
=C2=A0 =C2=A0 =C2=A0pc-&gt;vendor_id =3D PCI_VENDOR_ID_REDHAT;<br>
-=C2=A0 =C2=A0 pc-&gt;device_id =3D PCI_DEVICE_ID_REDHAT_SERIAL2;<br>
=C2=A0 =C2=A0 =C2=A0pc-&gt;revision =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0pc-&gt;class_id =3D PCI_CLASS_COMMUNICATION_SERIAL;<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;vmsd =3D &amp;vmstate_pci_multi_serial;<br>
@@ -170,19 +170,22 @@ static void multi_2x_serial_pci_class_initfn(ObjectCl=
ass *klass, void *data)<br>
=C2=A0 =C2=A0 =C2=A0set_bit(DEVICE_CATEGORY_INPUT, dc-&gt;categories);<br>
=C2=A0}<br>
<br>
+static void multi_2x_serial_pci_class_initfn(ObjectClass *klass, void *dat=
a)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+=C2=A0 =C2=A0 PCIDeviceClass *pc =3D PCI_DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 pc-&gt;device_id =3D PCI_DEVICE_ID_REDHAT_SERIAL2;<br>
+=C2=A0 =C2=A0 device_class_set_props(dc, multi_2x_serial_pci_properties);<=
br>
+}<br>
+<br>
=C2=A0static void multi_4x_serial_pci_class_initfn(ObjectClass *klass, void=
 *data)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
=C2=A0 =C2=A0 =C2=A0PCIDeviceClass *pc =3D PCI_DEVICE_CLASS(klass);<br>
-=C2=A0 =C2=A0 pc-&gt;realize =3D multi_serial_pci_realize;<br>
-=C2=A0 =C2=A0 pc-&gt;exit =3D multi_serial_pci_exit;<br>
-=C2=A0 =C2=A0 pc-&gt;vendor_id =3D PCI_VENDOR_ID_REDHAT;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0pc-&gt;device_id =3D PCI_DEVICE_ID_REDHAT_SERIAL4;<br>
-=C2=A0 =C2=A0 pc-&gt;revision =3D 1;<br>
-=C2=A0 =C2=A0 pc-&gt;class_id =3D PCI_CLASS_COMMUNICATION_SERIAL;<br>
-=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_pci_multi_serial;<br>
=C2=A0 =C2=A0 =C2=A0device_class_set_props(dc, multi_4x_serial_pci_properti=
es);<br>
-=C2=A0 =C2=A0 set_bit(DEVICE_CATEGORY_INPUT, dc-&gt;categories);<br>
=C2=A0}<br>
<br>
=C2=A0static void multi_serial_init(Object *o)<br>
@@ -202,6 +205,7 @@ static const TypeInfo multi_serial_pci_types[] =3D {<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D TYPE_PCI_DEVICE,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.instance_size=C2=A0 =3D sizeof(PCIMultiS=
erialState),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.instance_init=C2=A0 =3D multi_serial_ini=
t,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =C2=A0=3D multi_seria=
l_class_initfn,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.abstract=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D t=
rue,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.interfaces=C2=A0 =C2=A0 =C2=A0=3D (Inter=
faceInfo[]) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ INTERFACE_CONVENTIONAL_PC=
I_DEVICE },<br>
-- <br>
2.38.1<br>
<br>
<br></blockquote><div><br></div><div>This patch hits an assert for me:</div=
><div><br></div><div>=C2=A0=C2=A0=C2=A0 qemu-system-x86_64: ../src/qom/obje=
ct.c:1279: object_class_property_add: Assertion `!object_class_property_fin=
d(klass, name)&#39; failed.</div><div><br></div><div>with the following bac=
ktrace:</div><div><br></div><div>Thread 1 &quot;qemu-system-x86&quot; recei=
ved signal SIGABRT, Aborted.<br>__pthread_kill_implementation (threadid=3D&=
lt;optimized out&gt;, signo=3Dsigno@entry=3D6, no_tid=3Dno_tid@entry=3D0) a=
t pthread_kill.c:44<br>44 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return I=
NTERNAL_SYSCALL_ERROR_P (ret) ? INTERNAL_SYSCALL_ERRNO (ret) : 0;<br>(gdb) =
bt<br>#0 =C2=A0__pthread_kill_implementation (threadid=3D&lt;optimized out&=
gt;, signo=3Dsigno@entry=3D6, no_tid=3Dno_tid@entry=3D0) at pthread_kill.c:=
44<br>#1 =C2=A00x00007ffff6c91953 in __pthread_kill_internal (signo=3D6, th=
readid=3D&lt;optimized out&gt;) at pthread_kill.c:78<br>#2 =C2=A00x00007fff=
f6c42ea8 in __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/posix/raise.c:26=
<br>#3 =C2=A00x00007ffff6c2c53d in __GI_abort () at abort.c:79<br>#4 =C2=A0=
0x00007ffff6c2c45c in __assert_fail_base<br>=C2=A0 =C2=A0 (fmt=3D0x7ffff6da=
5d68 &quot;%s%s%s:%u: %s%sAssertion `%s&#39; failed.\n%n&quot;, assertion=
=3D0x5555560b9998 &quot;!object_class_property_find(klass, name)&quot;, fil=
e=3D0x5555560b94be &quot;../src/qom/object.c&quot;, line=3D1279, function=
=3D&lt;optimized out&gt;) at assert.c:92<br>#5 =C2=A00x00007ffff6c3b9f6 in =
__assert_fail<br>=C2=A0 =C2=A0 (assertion=3Dassertion@entry=3D0x5555560b999=
8 &quot;!object_class_property_find(klass, name)&quot;, file=3Dfile@entry=
=3D0x5555560b94be &quot;../src/qom/object.c&quot;, line=3Dline@entry=3D1279=
, function=3Dfunction@entry=3D0x5555560b9d00 &lt;__PRETTY_FUNCTION__.21&gt;=
 &quot;object_class_property_add&quot;) at assert.c:101<br>#6 =C2=A00x00005=
55555dbb690 in object_class_property_add<br>=C2=A0 =C2=A0 (klass=3Dklass@en=
try=3D0x5555569af820, name=3Dname@entry=3D0x555555fbe04b &quot;chardev1&quo=
t;, type=3D0x5555561230dd &quot;str&quot;, get=3D0x555555db2ad0 &lt;field_p=
rop_get&gt;, set=3D0x555555db36d0 &lt;field_prop_set&gt;, release=3D0x55555=
59f8f90 &lt;release_chr&gt;, opaque=3D0x5555563cc900 &lt;multi_4x_serial_pc=
i_properties&gt;) at ../src/qom/object.c:1279<br>#7 =C2=A00x0000555555db3e6=
d in qdev_class_add_property (prop=3D0x5555563cc900 &lt;multi_4x_serial_pci=
_properties&gt;, name=3D0x555555fbe04b &quot;chardev1&quot;, klass=3D0x5555=
569af820)<br>=C2=A0 =C2=A0 at ../src/hw/core/qdev-properties.c:889<br>#8 =
=C2=A0device_class_set_props (dc=3D0x5555569af820, props=3D&lt;optimized ou=
t&gt;) at ../src/hw/core/qdev-properties.c:955<br>#9 =C2=A00x0000555555dba5=
90 in type_initialize (ti=3D0x5555567f4840) at ../src/qom/object.c:1094<br>=
#10 object_class_foreach_tramp (key=3D&lt;optimized out&gt;, value=3D0x5555=
567f4840, opaque=3D0x7fffffffe260) at ../src/qom/object.c:1081<br>#11 0x000=
07ffff70bcda8 in g_hash_table_foreach (hash_table=3D0x5555567b92a0 =3D {...=
}, func=3D0x555555dba530 &lt;object_class_foreach_tramp&gt;, user_data=3D0x=
7fffffffe260)<br>=C2=A0 =C2=A0 at ../glib/glib/ghash.c:2098<br>#12 0x000055=
5555dbaac6 in object_class_foreach (opaque=3D0x7fffffffe258, include_abstra=
ct=3Dfalse, implements_type=3D&lt;optimized out&gt;, fn=3D0x555555db8a70 &l=
t;object_class_get_list_tramp&gt;)<br>=C2=A0 =C2=A0 at ../src/qom/object.c:=
87<br>#13 object_class_get_list (implements_type=3Dimplements_type@entry=3D=
0x55555603bb98 &quot;machine&quot;, include_abstract=3Dinclude_abstract@ent=
ry=3Dfalse) at ../src/qom/object.c:1160<br>#14 0x0000555555b68df7 in select=
_machine (errp=3D&lt;optimized out&gt;, qdict=3D0x55555684a4e0) at ../src/s=
oftmmu/vl.c:1580<br>#15 qemu_create_machine (qdict=3D0x55555684a4e0) at ../=
src/softmmu/vl.c:2015<br>#16 qemu_init (argc=3D&lt;optimized out&gt;, argv=
=3D0x7fffffffe548) at ../src/softmmu/vl.c:3542<br>#17 0x000055555596f07e in=
 main (argc=3D&lt;optimized out&gt;, argv=3D&lt;optimized out&gt;) at ../sr=
c/softmmu/main.c:47<br></div><div> <br></div></div></div>

--0000000000005651b505f4ab2b07--

