Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2646C2030
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 19:43:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peKSN-0001pk-J6; Mon, 20 Mar 2023 14:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1peKSL-0001pb-D7
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 14:42:05 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1peKSH-00041Q-If
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 14:42:05 -0400
Received: by mail-ed1-x535.google.com with SMTP id ek18so50630882edb.6
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 11:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679337717;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:to:from:date:from:to:cc:subject:date:message-id
 :reply-to; bh=a5sYjg0jBsL2jJxH4vrRssLuchzA6izTtqncZVVtxao=;
 b=BPcliWQNMk87obcfpHKQn+9EIZdm/nKv7VmGPjqf8NmCPcbqWd64SHe1gdCIn5kE5r
 M7E0jOnV0G/ZUJqHZXiO9rrJg0gU2yex5+L7DUmgrSfGIhSPZTJf/SrUJlCQd7NEzdPt
 tSwrrMLk+6NAtosG+ePj/Fsgh82yi4sNBrDBv+xZBXzvoFyQlLLNkVyzAs15NLpp1LD9
 MapLkrYOrFo+Z05O9C1/O0fM7hyT8DqPcHaJBHv2UbdQwosRSUWNibJEjuoUbEcHyYln
 cLWmYN6sfqxhAQGOluSLMy953Y2oPx5anxrFsBw8fYhemCs7Z46CoV20c4Uc+YWmRjZ6
 CW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679337717;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a5sYjg0jBsL2jJxH4vrRssLuchzA6izTtqncZVVtxao=;
 b=XvYBYBvBiyTnRi/VZwlyHqVHN+A0LTf72RR1EXTS3orngyLygo802nifd/PSB4L9gc
 Qm2XRhpUcKLwQ+Df+6xkNFYmqCISNqzZ9fcTekOQkqucK7syNOrcTKfRka6guAwyPC+a
 gp/eRD9XGjcW3fqBHbiwSchs21jZFJaXU87qKtYJUe8Q+OuEeJAmjUdabsIqMAO9/U+S
 tzSy/K1IH63kMTnsj2IPk9sJljTvuHvhlExPMxfPzNftfXqXPHAqUrWWYJKeu/1+2UJ3
 CFeeZuCZIFJ67rdi9hh/TFx9OIaMrh/s6iNP5EsKKWBPz/y3BXg9q32xcK0Hp/A2VFeV
 tMyA==
X-Gm-Message-State: AO0yUKW4hW4MHMGktNdIMnuF1j6qS/Spf87GYsSpREJwOsygO6Z2NxZI
 XDuvMlHB/NYFLPRBeMwEQoQNKIKhnWo=
X-Google-Smtp-Source: AK7set9VO64wcT0abmsv0BNocsxIcxyAwMbDZanuQ0HX+CoKRj3lv9bbGeRi67LYQZpXQlie0tlxYA==
X-Received: by 2002:a17:906:d146:b0:90b:208:6179 with SMTP id
 br6-20020a170906d14600b0090b02086179mr591925ejb.28.1679337717020; 
 Mon, 20 Mar 2023 11:41:57 -0700 (PDT)
Received: from [127.0.0.1] ([62.214.191.67]) by smtp.gmail.com with ESMTPSA id
 g26-20020a1709064e5a00b00930525d89e2sm4713481ejw.89.2023.03.20.11.41.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 11:41:56 -0700 (PDT)
Date: Mon, 20 Mar 2023 09:13:08 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Jason Andryuk <jandryuk@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Marek_Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] xen: Fix host pci for stubdom
In-Reply-To: <20230320000554.8219-1-jandryuk@gmail.com>
References: <20230320000554.8219-1-jandryuk@gmail.com>
Message-ID: <A6498A22-B701-4B0A-884E-575EEBD77EAB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



Am 20=2E M=C3=A4rz 2023 00:05:54 UTC schrieb Jason Andryuk <jandryuk@gmail=
=2Ecom>:
>PCI passthrough for an HVM with a stubdom is PV PCI passthrough from
>dom0 to the stubdom, and then QEMU passthrough of the PCI device inside
>the stubdom=2E  xen-pciback has boolean module param passthrough which
>controls "how to export PCI topology to guest"=2E  If passthrough=3D1, th=
e
>frontend shows a PCI SBDF matching the backend host device=2E  When
>passthough=3D0, the frontend will get a sequentially allocated SBDF=2E
>
>libxl passes the host SBDF over QMP to QEMU=2E  For non-stubdom or stubdo=
m
>with passthrough=3D1, this works fine=2E  However, it fails for
>passthrough=3D0 when QEMU can't find the sysfs node for the host SBDF=2E
>
>Handle all these cases=2E  Look for the xenstore frontend nodes=2E  If th=
ey
>are missing, then default to using the QMP command provided SBDF=2E  This
>is the non-stubdom case=2E  If xenstore nodes are found, then read the
>local SBDF from the xenstore nodes=2E  This will handle either
>passthrough=3D0/1 case=2E
>
>Based on a stubdom-specific patch originally by Marek
>Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=2Ecom>, which is b=
ased
>on earlier work by HW42 <hw42@ipsumj=2Ede>
>
>Signed-off-by: Jason Andryuk <jandryuk@gmail=2Ecom>
>---
> hw/xen/xen-host-pci-device=2Ec | 96 +++++++++++++++++++++++++++++++++++-
> hw/xen/xen-host-pci-device=2Eh |  6 +++
> 2 files changed, 101 insertions(+), 1 deletion(-)
>
>diff --git a/hw/xen/xen-host-pci-device=2Ec b/hw/xen/xen-host-pci-device=
=2Ec
>index 8c6e9a1716=2E=2E51a72b432d 100644
>--- a/hw/xen/xen-host-pci-device=2Ec
>+++ b/hw/xen/xen-host-pci-device=2Ec
>@@ -9,6 +9,7 @@
> #include "qemu/osdep=2Eh"
> #include "qapi/error=2Eh"
> #include "qemu/cutils=2Eh"
>+#include "hw/xen/xen-legacy-backend=2Eh"
> #include "xen-host-pci-device=2Eh"
>=20
> #define XEN_HOST_PCI_MAX_EXT_CAP \
>@@ -33,13 +34,101 @@
> #define IORESOURCE_PREFETCH     0x00001000      /* No side effects */
> #define IORESOURCE_MEM_64       0x00100000
>=20
>+/*
>+ * Non-passthrough (dom0) accesses are local PCI devices and use the giv=
en BDF
>+ * Passthough (stubdom) accesses are through PV frontend PCI device=2E  =
Those

I'm unable to parse this sentence, which may be due to my unfamiliarity wi=
th Xen terminology=2E

There is also an extra space before "Those"=2E

Best regards,
Bernhard

>+ * either have a BDF identical to the backend's BFD (xen-backend=2Epasst=
hrough=3D1)
>+ * or a local virtual BDF (xen-backend=2Epassthrough=3D0)
>+ *
>+ * We are always given the backend's BDF and need to lookup the appropri=
ate
>+ * local BDF for sysfs access=2E
>+ */
>+static void xen_host_pci_fill_local_addr(XenHostPCIDevice *d, Error **er=
rp)
>+{
>+    unsigned int num_devs, len, i;
>+    unsigned int domain, bus, dev, func;
>+    char *be_path;
>+    char path[80];
>+    char *msg;
>+
>+    be_path =3D qemu_xen_xs_read(xenstore, 0, "device/pci/0/backend", &l=
en);
>+    if (!be_path) {
>+        /*
>+         * be_path doesn't exist, so we are dealing with a local
>+         * (non-passthough) device=2E
>+         */
>+        d->local_domain =3D d->domain;
>+        d->local_bus =3D d->bus;
>+        d->local_dev =3D d->dev;
>+        d->local_func =3D d->func;
>+
>+        return;
>+    }
>+
>+    snprintf(path, sizeof(path), "%s/num_devs", be_path);
>+    msg =3D qemu_xen_xs_read(xenstore, 0, path, &len);
>+    if (!msg) {
>+        goto err_out;
>+    }
>+
>+    if (sscanf(msg, "%u", &num_devs) !=3D 1) {
>+        error_setg(errp, "Failed to parse %s (%s)", msg, path);
>+        goto err_out;
>+    }
>+    free(msg);
>+
>+    for (i =3D 0; i < num_devs; i++) {
>+        snprintf(path, sizeof(path), "%s/dev-%u", be_path, i);
>+        msg =3D qemu_xen_xs_read(xenstore, 0, path, &len);
>+        if (!msg) {
>+            error_setg(errp, "Failed to read %s", path);
>+            goto err_out;
>+        }
>+        if (sscanf(msg, "%x:%x:%x=2E%x", &domain, &bus, &dev, &func) !=
=3D 4) {
>+            error_setg(errp, "Failed to parse %s (%s)", msg, path);
>+            goto err_out;
>+        }
>+        free(msg);
>+        if (domain !=3D d->domain ||
>+            bus !=3D d->bus ||
>+            dev !=3D d->dev ||
>+            func !=3D d->func)
>+            continue;
>+        snprintf(path, sizeof(path), "%s/vdev-%u", be_path, i);
>+        msg =3D qemu_xen_xs_read(xenstore, 0, path, &len);
>+        if (!msg) {
>+            error_setg(errp, "Failed to read %s", path);
>+            goto out;
>+        }
>+        if (sscanf(msg, "%x:%x:%x=2E%x", &domain, &bus, &dev, &func) !=
=3D 4) {
>+            error_setg(errp, "Failed to parse %s (%s)", msg, path);
>+            goto err_out;
>+        }
>+        free(msg);
>+        d->local_domain =3D domain;
>+        d->local_bus =3D bus;
>+        d->local_dev =3D dev;
>+        d->local_func =3D func;
>+        goto out;
>+    }
>+
>+    error_setg(errp, "Failed to find local %x:%x:%x=2E%x", d->domain, d-=
>bus,
>+               d->dev, d->func);
>+
>+err_out:
>+    free(msg);
>+out:
>+    free(be_path);
>+}
>+
> static void xen_host_pci_sysfs_path(const XenHostPCIDevice *d,
>                                     const char *name, char *buf, ssize_t=
 size)
> {
>     int rc;
>=20
>     rc =3D snprintf(buf, size, "/sys/bus/pci/devices/%04x:%02x:%02x=2E%d=
/%s",
>-                  d->domain, d->bus, d->dev, d->func, name);
>+                  d->local_domain, d->local_bus, d->local_dev, d->local_=
func,
>+                  name);
>     assert(rc >=3D 0 && rc < size);
> }
>=20
>@@ -342,6 +431,11 @@ void xen_host_pci_device_get(XenHostPCIDevice *d, ui=
nt16_t domain,
>     d->dev =3D dev;
>     d->func =3D func;
>=20
>+    xen_host_pci_fill_local_addr(d, errp);
>+    if (*errp) {
>+        goto error;
>+    }
>+
>     xen_host_pci_config_open(d, errp);
>     if (*errp) {
>         goto error;
>diff --git a/hw/xen/xen-host-pci-device=2Eh b/hw/xen/xen-host-pci-device=
=2Eh
>index 4d8d34ecb0=2E=2E270dcb27f7 100644
>--- a/hw/xen/xen-host-pci-device=2Eh
>+++ b/hw/xen/xen-host-pci-device=2Eh
>@@ -23,6 +23,12 @@ typedef struct XenHostPCIDevice {
>     uint8_t dev;
>     uint8_t func;
>=20
>+    /* different from the above in case of stubdomain */
>+    uint16_t local_domain;
>+    uint8_t local_bus;
>+    uint8_t local_dev;
>+    uint8_t local_func;
>+
>     uint16_t vendor_id;
>     uint16_t device_id;
>     uint32_t class_code;

