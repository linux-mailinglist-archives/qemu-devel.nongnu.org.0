Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6849D30FA58
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 18:55:25 +0100 (CET)
Received: from localhost ([::1]:50260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7iqi-0003Ep-DW
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 12:55:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phillip.ennen@gmail.com>)
 id 1l7hSB-000268-6R
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:25:59 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phillip.ennen@gmail.com>)
 id 1l7hS4-0006FT-7G
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:25:58 -0500
Received: by mail-wm1-x32a.google.com with SMTP id l12so3669799wmq.2
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 08:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CypGQ8HlsZ8CvauMC3vGIxQ2ou2nSAZu1FwML3+yF+A=;
 b=sK3lRiwQYGJiXJP8BvBnJWK4ekDtVPJmmqotoYAmhsfM3qQbiiuYdt1KK2O1lDLgTy
 8qCoOvnbOVPfm5iwWIy8sgMpfMn/TNmW8i/TeB65nLm3C9yk3WRVPAFmmMHW0ShuaS7z
 oT5Y/+2Cr9+7Ox+OF3lekZfXHO3x/OTbZXMA6DwQa84BgIcN6lbeoLzz60fP2CodqQOg
 n84ppFVB0Sw/qd/dM+9kvi1kn83llXbwP+AZbCRanW+Tres2GooepJptBEX5jXUtVRua
 vEfETnC/+82vNqKW4b2U/HDWFJKTI58BR57AYsIHHYzsqWvHzeyikyQBkBR2OMZ7D7xI
 XreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CypGQ8HlsZ8CvauMC3vGIxQ2ou2nSAZu1FwML3+yF+A=;
 b=Yr2ovJZhz9xnKMt28W+YpyeMLlTXuD1FGtyrajryC0q+swwBhHFj+Sz0v9lASE/ycB
 zTg0HesKSAY6F0SExHwxjfyvonLLWSJmZNI4zJjMEkNUNEK7kqMKSohq+Df4eYLY7p+v
 butVXD7mKq2bGb9v/9Yndb9HC7vOAIjk+Gi7nr2gvE2yMXFdCVLAaZZuz08yzvearPdz
 CqEH5f8qYb26+RGI1l5ZPpl750qp9u8fPN85tRvzmVhOUt24+9AyBzCktjdW60g+iWki
 kAUKy7zILFceOs/l/VcTRKFG+rgkrZUwk45qAl5NKIs1KgomPil8K80fPLe0/CeOwci1
 VMZg==
X-Gm-Message-State: AOAM531FbRu7HwFs1EzzdJSBljsixi2JUm1onD6tCg0/8ERIHvH64D2Y
 BRiBzHTYMYAiNVH7TIXJNJEQw04nqQF5mA==
X-Google-Smtp-Source: ABdhPJw/rV5+WHMayl5NCDL/B2Io67rvDrvD75RxKseI8u7z/FdI7iJ02rxDqBayZ88kryFzf9sQ7Q==
X-Received: by 2002:a1c:483:: with SMTP id 125mr10764wme.80.1612455949628;
 Thu, 04 Feb 2021 08:25:49 -0800 (PST)
Received: from localhost.localdomain ([2a01:e34:ec19:cd20:9163:769f:ccfe:9091])
 by smtp.gmail.com with ESMTPSA id l11sm8312273wrt.23.2021.02.04.08.25.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Feb 2021 08:25:48 -0800 (PST)
From: phillip.ennen@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] net: implement vmnet-based netdev
Date: Thu,  4 Feb 2021 17:25:44 +0100
Message-Id: <20210204162544.65439-3-phillip.ennen@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210204162544.65439-1-phillip.ennen@gmail.com>
References: <20210204162544.65439-1-phillip.ennen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=phillip.ennen@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 04 Feb 2021 12:43:24 -0500
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
Cc: stefanha@gmail.com, jasowang@redhat.com, phillip@axleos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Phillip Tennen <phillip@axleos.com>

This patch implements a new netdev device, reachable via -netdev
vmnet-macos, that’s backed by macOS’s vmnet framework.

The vmnet framework provides native bridging support, and its usage in
this patch is intended as a replacement for attempts to use a tap device
via the tuntaposx kernel extension. Notably, the tap/tuntaposx approach
never would have worked in the first place, as QEMU interacts with the
tap device via poll(), and macOS does not support polling device files.

vmnet requires either a special entitlement, granted via a provisioning
profile, or root access. Otherwise attempts to create the virtual
interface will fail with a “generic error” status code. QEMU may not
currently be signed with an entitlement granted in a provisioning
profile, as this would necessitate pre-signed binary build distribution,
rather than source-code distribution. As such, using this netdev
currently requires that qemu be run with root access. I’ve opened a
feedback report with Apple to allow the use of the relevant entitlement
with this use case:
https://openradar.appspot.com/radar?id=5007417364447232

vmnet offers three operating modes, all of which are supported by this
patch via the “mode=host|shared|bridge” option:

* "Host" mode: Allows the vmnet interface to communicate with other vmnet
interfaces that are in host mode and also with the native host.
* "Shared" mode: Allows traffic originating from the vmnet interface to
reach the Internet through a NAT. The vmnet interface can also
communicate with the native host.
* "Bridged" mode: Bridges the vmnet interface with a physical network
interface.

Each of these modes also provide some extra configuration that’s
supported by this patch:

* "Bridged" mode: The user may specify the physical interface to bridge
with. Defaults to en0.
* "Host" mode / "Shared" mode: The user may specify the DHCP range and
subnet. Allocated by vmnet if not provided.

vmnet also offers some extra configuration options that are not
supported by this patch:

* Enable isolation from other VMs using vmnet
* Port forwarding rules
* Enabling TCP segmentation offload
* Only applicable in "shared" mode: specifying the NAT IPv6 prefix
* Only available in "host" mode: specifying the IP address for the VM
within an isolated network

Note that this patch requires macOS 10.15 as a minimum, as this is when
bridging support was implemented in vmnet.framework.

This is my first QEMU contribution, so please feel free to let me know
what I’ve missed or what needs improving. Thanks very much for taking a
look =)

Signed-off-by: Phillip Tennen <phillip@axleos.com>
---
 configure         |   2 +-
 net/clients.h     |   6 +
 net/meson.build   |   1 +
 net/net.c         |   3 +
 net/vmnet-macos.c | 444 ++++++++++++++++++++++++++++++++++++++++++++++
 qapi/net.json     |  64 ++++++-
 qemu-options.hx   |   9 +
 7 files changed, 526 insertions(+), 3 deletions(-)
 create mode 100644 net/vmnet-macos.c

diff --git a/configure b/configure
index 4afd22bdf5..f449198db1 100755
--- a/configure
+++ b/configure
@@ -778,7 +778,7 @@ Darwin)
   fi
   audio_drv_list="coreaudio try-sdl"
   audio_possible_drivers="coreaudio sdl"
-  QEMU_LDFLAGS="-framework CoreFoundation -framework IOKit $QEMU_LDFLAGS"
+  QEMU_LDFLAGS="-framework CoreFoundation -framework IOKit -framework vmnet $QEMU_LDFLAGS"
   # Disable attempts to use ObjectiveC features in os/object.h since they
   # won't work when we're compiling with gcc as a C compiler.
   QEMU_CFLAGS="-DOS_OBJECT_USE_OBJC=0 $QEMU_CFLAGS"
diff --git a/net/clients.h b/net/clients.h
index 92f9b59aed..463a9b2f67 100644
--- a/net/clients.h
+++ b/net/clients.h
@@ -63,4 +63,10 @@ int net_init_vhost_user(const Netdev *netdev, const char *name,
 
 int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp);
+
+#ifdef CONFIG_DARWIN
+int net_init_vmnet_macos(const Netdev *netdev, const char *name,
+                        NetClientState *peer, Error **errp);
+#endif
+
 #endif /* QEMU_NET_CLIENTS_H */
diff --git a/net/meson.build b/net/meson.build
index 1076b0a7ab..8c7c32f775 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -37,5 +37,6 @@ endif
 softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files(tap_posix))
 softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('tap-win32.c'))
 softmmu_ss.add(when: 'CONFIG_VHOST_NET_VDPA', if_true: files('vhost-vdpa.c'))
+softmmu_ss.add(when: 'CONFIG_DARWIN', if_true: files('vmnet-macos.c'))
 
 subdir('can')
diff --git a/net/net.c b/net/net.c
index c1cd9c75f6..e68a410a89 100644
--- a/net/net.c
+++ b/net/net.c
@@ -977,6 +977,9 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
 #ifdef CONFIG_L2TPV3
         [NET_CLIENT_DRIVER_L2TPV3]    = net_init_l2tpv3,
 #endif
+#ifdef CONFIG_DARWIN
+        [NET_CLIENT_DRIVER_VMNET_MACOS] = net_init_vmnet_macos,
+#endif
 };
 
 
diff --git a/net/vmnet-macos.c b/net/vmnet-macos.c
new file mode 100644
index 0000000000..3001b98c80
--- /dev/null
+++ b/net/vmnet-macos.c
@@ -0,0 +1,444 @@
+/*
+ * vmnet.framework backed netdev for macOS 10.15+ hosts
+ *
+ * Copyright (c) 2021 Phillip Tennen <phillip@axleos.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+#include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+#include "qemu/error-report.h"
+#include "qapi/qapi-types-net.h"
+#include "net/net.h"
+/* macOS vmnet framework header */
+#include <vmnet/vmnet.h>
+
+typedef struct vmnet_state {
+    NetClientState nc;
+    interface_ref vmnet_iface_ref;
+    /* Switched on after vmnet informs us that the interface has started */
+    bool link_up;
+    /*
+     * If qemu_send_packet_async returns 0, this is switched off until our
+     * delivery callback is invoked
+     */
+    bool qemu_ready_to_receive;
+} vmnet_state_t;
+
+int net_init_vmnet_macos(const Netdev *netdev, const char *name,
+                         NetClientState *peer, Error **errp);
+
+static const char *_vmnet_status_repr(vmnet_return_t status)
+{
+    switch (status) {
+    case VMNET_SUCCESS:
+        return "success";
+    case VMNET_FAILURE:
+        return "generic failure";
+    case VMNET_MEM_FAILURE:
+        return "out of memory";
+    case VMNET_INVALID_ARGUMENT:
+        return "invalid argument";
+    case VMNET_SETUP_INCOMPLETE:
+        return "setup is incomplete";
+    case VMNET_INVALID_ACCESS:
+        return "insufficient permissions";
+    case VMNET_PACKET_TOO_BIG:
+        return "packet size exceeds MTU";
+    case VMNET_BUFFER_EXHAUSTED:
+        return "kernel buffers temporarily exhausted";
+    case VMNET_TOO_MANY_PACKETS:
+        return "number of packets exceeds system limit";
+    case VMNET_SHARING_SERVICE_BUSY:
+        return "sharing service busy";
+    default:
+        return "unknown status code";
+    }
+}
+
+static operating_modes_t _vmnet_operating_mode_enum_compat(
+    VmnetOperatingMode mode)
+{
+    switch (mode) {
+    case VMNET_OPERATING_MODE_HOST:
+        return VMNET_HOST_MODE;
+    case VMNET_OPERATING_MODE_SHARED:
+        return VMNET_SHARED_MODE;
+    case VMNET_OPERATING_MODE_BRIDGED:
+        return VMNET_BRIDGED_MODE;
+    default:
+        /* Should never happen as the modes are parsed before we get here */
+        assert(false);
+    }
+}
+
+static bool vmnet_can_receive(NetClientState *nc)
+{
+    vmnet_state_t *s = DO_UPCAST(vmnet_state_t, nc, nc);
+    return s->link_up;
+}
+
+static ssize_t vmnet_receive_iov(NetClientState *nc,
+                                 const struct iovec *iovs,
+                                 int iovcnt)
+{
+    vmnet_state_t *s = DO_UPCAST(vmnet_state_t, nc, nc);
+
+    /* Combine the provided iovs into a single vmnet packet */
+    struct vmpktdesc *packet = g_new0(struct vmpktdesc, 1);
+    packet->vm_pkt_iov = g_new0(struct iovec, iovcnt);
+    memcpy(packet->vm_pkt_iov, iovs, sizeof(struct iovec) * iovcnt);
+    packet->vm_pkt_iovcnt = iovcnt;
+    packet->vm_flags = 0;
+
+    /* Figure out the packet size by iterating the iov's */
+    for (int i = 0; i < iovcnt; i++) {
+        const struct iovec *iov = iovs + i;
+        packet->vm_pkt_size += iov->iov_len;
+    }
+
+    /* Finally, write the packet to the vmnet interface */
+    int packet_count = 1;
+    vmnet_return_t result = vmnet_write(s->vmnet_iface_ref, packet,
+                                        &packet_count);
+    if (result != VMNET_SUCCESS || packet_count != 1) {
+        error_printf("Failed to send packet to host: %s\n",
+            _vmnet_status_repr(result));
+    }
+    ssize_t wrote_bytes = packet->vm_pkt_size;
+    g_free(packet->vm_pkt_iov);
+    g_free(packet);
+    return wrote_bytes;
+}
+
+static void vmnet_send_completed(NetClientState *nc, ssize_t len)
+{
+    vmnet_state_t *vmnet_client_state = DO_UPCAST(vmnet_state_t, nc, nc);
+    /* Ready to receive more packets! */
+    vmnet_client_state->qemu_ready_to_receive = true;
+}
+
+static NetClientInfo net_vmnet_macos_info = {
+    .type = NET_CLIENT_DRIVER_VMNET_MACOS,
+    .size = sizeof(vmnet_state_t),
+    .receive_iov = vmnet_receive_iov,
+    .can_receive = vmnet_can_receive,
+};
+
+static bool _validate_ifname_is_valid_bridge_target(const char *ifname)
+{
+    /* Iterate available bridge interfaces, ensure the provided one is valid */
+    xpc_object_t bridge_interfaces = vmnet_copy_shared_interface_list();
+    bool failed_to_match_iface_name = xpc_array_apply(
+        bridge_interfaces,
+        ^bool(size_t index, xpc_object_t  _Nonnull value) {
+        if (!strcmp(xpc_string_get_string_ptr(value), ifname)) {
+            /* The interface name is valid! Stop iterating */
+            return false;
+        }
+        return true;
+    });
+
+    if (failed_to_match_iface_name) {
+        error_printf("Invalid bridge interface name provided: %s\n", ifname);
+        error_printf("Valid bridge interfaces:\n");
+        xpc_array_apply(
+            vmnet_copy_shared_interface_list(),
+            ^bool(size_t index, xpc_object_t  _Nonnull value) {
+            error_printf("\t%s\n", xpc_string_get_string_ptr(value));
+            /* Keep iterating */
+            return true;
+        });
+        exit(1);
+        return false;
+    }
+
+    return true;
+}
+
+static xpc_object_t _construct_vmnet_interface_description(
+    const NetdevVmnetOptions *vmnet_opts)
+{
+    operating_modes_t mode = _vmnet_operating_mode_enum_compat(
+        vmnet_opts->mode);
+
+    /* Validate options */
+    if (mode == VMNET_BRIDGED_MODE) {
+        if (vmnet_opts->has_dhcp_start_address ||
+            vmnet_opts->has_dhcp_end_address ||
+            vmnet_opts->has_dhcp_subnet_mask) {
+                error_printf("DHCP configuration may only be specified in "
+                             "shared mode or host mode\n");
+                exit(1);
+        }
+    } else if (mode == VMNET_HOST_MODE || mode == VMNET_SHARED_MODE) {
+        if (vmnet_opts->has_ifname) {
+            error_printf("ifname may only be specified in bridged mode\n");
+            exit(1);
+        }
+        /* If one DHCP parameter is configured, all 3 are required */
+        if (vmnet_opts->has_dhcp_start_address ||
+            vmnet_opts->has_dhcp_end_address ||
+            vmnet_opts->has_dhcp_subnet_mask) {
+            if (!(vmnet_opts->has_dhcp_start_address &&
+                  vmnet_opts->has_dhcp_end_address &&
+                  vmnet_opts->has_dhcp_subnet_mask)) {
+                error_printf("Incomplete DHCP configuration provided\n");
+                exit(1);
+            }
+        }
+    } else {
+        error_printf("Unknown vmnet mode %d\n", mode);
+        exit(1);
+    }
+
+    xpc_object_t interface_desc = xpc_dictionary_create(NULL, NULL, 0);
+    xpc_dictionary_set_uint64(
+        interface_desc,
+        vmnet_operation_mode_key,
+        mode
+    );
+
+    if (mode == VMNET_BRIDGED_MODE) {
+        /*
+         * Configure the provided physical interface to act
+         * as a bridge with QEMU
+         */
+
+        /* Bridge with en0 by default */
+        const char *physical_ifname = vmnet_opts->ifname ?: "en0";
+        _validate_ifname_is_valid_bridge_target(physical_ifname);
+        xpc_dictionary_set_string(interface_desc,
+                                  vmnet_shared_interface_name_key,
+                                  physical_ifname);
+    } else if (mode == VMNET_HOST_MODE || mode == VMNET_SHARED_MODE) {
+        /* Pass the DHCP configuration to vmnet, if the user provided one */
+        if (vmnet_opts->has_dhcp_start_address) {
+            /* All DHCP arguments are available, as per the checks above */
+            xpc_dictionary_set_string(interface_desc,
+                                      vmnet_start_address_key,
+                                      vmnet_opts->dhcp_start_address);
+            xpc_dictionary_set_string(interface_desc,
+                                      vmnet_end_address_key,
+                                      vmnet_opts->dhcp_end_address);
+            xpc_dictionary_set_string(interface_desc,
+                                      vmnet_subnet_mask_key,
+                                      vmnet_opts->dhcp_subnet_mask);
+        }
+    }
+
+    return interface_desc;
+}
+
+int net_init_vmnet_macos(const Netdev *netdev, const char *name,
+                        NetClientState *peer, Error **errp)
+{
+    assert(netdev->type == NET_CLIENT_DRIVER_VMNET_MACOS);
+
+    const NetdevVmnetOptions *vmnet_opts = &netdev->u.vmnet_macos;
+    xpc_object_t iface_desc = _construct_vmnet_interface_description(vmnet_opts);
+
+    NetClientState *nc = qemu_new_net_client(&net_vmnet_macos_info, peer,
+                                             "vmnet", name);
+    vmnet_state_t *vmnet_client_state = DO_UPCAST(vmnet_state_t, nc, nc);
+
+    dispatch_queue_t vmnet_dispatch_queue = dispatch_queue_create(
+        "org.qemu.vmnet.iface_queue",
+        DISPATCH_QUEUE_SERIAL
+    );
+
+    __block vmnet_return_t vmnet_start_status = 0;
+    __block uint64_t vmnet_iface_mtu = 0;
+    __block uint64_t vmnet_max_packet_size = 0;
+    __block const char *vmnet_mac_address = NULL;
+    /*
+     * We can't refer to an array type directly within a block,
+     * so hold a pointer instead.
+     */
+    uuid_string_t vmnet_iface_uuid = {0};
+    __block uuid_string_t *vmnet_iface_uuid_ptr = &vmnet_iface_uuid;
+    /* These are only provided in VMNET_HOST_MODE and VMNET_SHARED_MODE */
+    bool vmnet_provides_dhcp_info = (
+        vmnet_opts->mode == VMNET_OPERATING_MODE_HOST ||
+        vmnet_opts->mode == VMNET_OPERATING_MODE_SHARED);
+    __block const char *vmnet_subnet_mask = NULL;
+    __block const char *vmnet_dhcp_range_start = NULL;
+    __block const char *vmnet_dhcp_range_end = NULL;
+
+    /* Create the vmnet interface */
+    dispatch_semaphore_t vmnet_iface_sem = dispatch_semaphore_create(0);
+    interface_ref vmnet_iface_ref = vmnet_start_interface(
+        iface_desc,
+        vmnet_dispatch_queue,
+        ^(vmnet_return_t status, xpc_object_t  _Nullable interface_param) {
+        vmnet_start_status = status;
+        if (vmnet_start_status != VMNET_SUCCESS || !interface_param) {
+            /* Early return if the interface couldn't be started */
+            dispatch_semaphore_signal(vmnet_iface_sem);
+            return;
+        }
+
+        /*
+         * Read the configuration that vmnet provided us.
+         * The provided dictionary is owned by XPC and may be freed
+         * shortly after this block's execution.
+         * So, copy data buffers now.
+         */
+        vmnet_iface_mtu = xpc_dictionary_get_uint64(
+            interface_param,
+            vmnet_mtu_key
+        );
+        vmnet_max_packet_size = xpc_dictionary_get_uint64(
+            interface_param,
+            vmnet_max_packet_size_key
+        );
+        vmnet_mac_address = strdup(xpc_dictionary_get_string(
+            interface_param,
+            vmnet_mac_address_key
+        ));
+
+        const uint8_t *iface_uuid = xpc_dictionary_get_uuid(
+            interface_param,
+            vmnet_interface_id_key
+        );
+        uuid_unparse_upper(iface_uuid, *vmnet_iface_uuid_ptr);
+
+        /* If we're in a mode that provides DHCP info, read it out now */
+        if (vmnet_provides_dhcp_info) {
+            vmnet_dhcp_range_start = strdup(xpc_dictionary_get_string(
+                interface_param,
+                vmnet_start_address_key
+            ));
+            vmnet_dhcp_range_end = strdup(xpc_dictionary_get_string(
+                interface_param,
+                vmnet_end_address_key
+            ));
+            vmnet_subnet_mask = strdup(xpc_dictionary_get_string(
+                interface_param,
+                vmnet_subnet_mask_key
+            ));
+        }
+        dispatch_semaphore_signal(vmnet_iface_sem);
+    });
+
+    /* And block until we receive a response from vmnet */
+    dispatch_semaphore_wait(vmnet_iface_sem, DISPATCH_TIME_FOREVER);
+
+    /* Did we manage to start the interface? */
+    if (vmnet_start_status != VMNET_SUCCESS || !vmnet_iface_ref) {
+        error_printf("Failed to start interface: %s\n",
+            _vmnet_status_repr(vmnet_start_status));
+        if (vmnet_start_status == VMNET_FAILURE) {
+            error_printf("Hint: vmnet requires running with root access\n");
+        }
+        return -1;
+    }
+
+    info_report("Started vmnet interface with configuration:");
+    info_report("MTU:              %llu", vmnet_iface_mtu);
+    info_report("Max packet size:  %llu", vmnet_max_packet_size);
+    info_report("MAC:              %s", vmnet_mac_address);
+    if (vmnet_provides_dhcp_info) {
+        info_report("DHCP IPv4 start:  %s", vmnet_dhcp_range_start);
+        info_report("DHCP IPv4 end:    %s", vmnet_dhcp_range_end);
+        info_report("IPv4 subnet mask: %s", vmnet_subnet_mask);
+    }
+    info_report("UUID:             %s", vmnet_iface_uuid);
+
+    /* The interface is up! Set a block to run when packets are received */
+    vmnet_client_state->vmnet_iface_ref = vmnet_iface_ref;
+    vmnet_return_t event_cb_stat = vmnet_interface_set_event_callback(
+        vmnet_iface_ref,
+        VMNET_INTERFACE_PACKETS_AVAILABLE,
+        vmnet_dispatch_queue,
+        ^(interface_event_t event_mask, xpc_object_t  _Nonnull event) {
+        if (event_mask != VMNET_INTERFACE_PACKETS_AVAILABLE) {
+            error_printf("Unknown vmnet interface event 0x%08x\n", event_mask);
+            return;
+        }
+
+        /* If we're unable to handle more packets now, drop this packet */
+        if (!vmnet_client_state->qemu_ready_to_receive) {
+            return;
+        }
+
+        /*
+         * TODO(Phillip Tennen <phillip@axleos.com>): There may be more than
+         * one packet available.
+         * As an optimization, we could read
+         * vmnet_estimated_packets_available_key packets now.
+         */
+        char *packet_buf = g_malloc0(vmnet_max_packet_size);
+        struct iovec *iov = g_new0(struct iovec, 1);
+        iov->iov_base = packet_buf;
+        iov->iov_len = vmnet_max_packet_size;
+
+        int pktcnt = 1;
+        struct vmpktdesc *v = g_new0(struct vmpktdesc, pktcnt);
+        v->vm_pkt_size = vmnet_max_packet_size;
+        v->vm_pkt_iov = iov;
+        v->vm_pkt_iovcnt = 1;
+        v->vm_flags = 0;
+
+        vmnet_return_t result = vmnet_read(vmnet_iface_ref, v, &pktcnt);
+        if (result != VMNET_SUCCESS) {
+            error_printf("Failed to read packet from host: %s\n",
+                _vmnet_status_repr(result));
+        }
+
+        /* Ensure we read exactly one packet */
+        assert(pktcnt == 1);
+
+        dispatch_async(dispatch_get_main_queue(), ^{
+            qemu_mutex_lock_iothread();
+
+            /*
+             * Deliver the packet to the guest
+             * If the delivery succeeded synchronously, this returns the length
+             * of the sent packet.
+             */
+            if (qemu_send_packet_async(nc, iov->iov_base,
+                                       v->vm_pkt_size,
+                                       vmnet_send_completed) == 0) {
+                vmnet_client_state->qemu_ready_to_receive = false;
+            }
+
+            /*
+             * It's safe to free the packet buffers.
+             * Even if delivery needs to wait, qemu_net_queue_append copies
+             * the packet buffer.
+             */
+            g_free(v);
+            g_free(iov);
+            g_free(packet_buf);
+
+            qemu_mutex_unlock_iothread();
+        });
+    });
+
+    /* Did we manage to set an event callback? */
+    if (event_cb_stat != VMNET_SUCCESS) {
+        error_printf("Failed to set up a callback to receive packets: %s\n",
+            _vmnet_status_repr(vmnet_start_status));
+        exit(1);
+    }
+
+    /* We're now ready to receive packets */
+    vmnet_client_state->qemu_ready_to_receive = true;
+    vmnet_client_state->link_up = true;
+
+    /* Include DHCP info if we're in a relevant mode */
+    if (vmnet_provides_dhcp_info) {
+        snprintf(nc->info_str, sizeof(nc->info_str),
+                 "dhcp_start=%s,dhcp_end=%s,mask=%s",
+                 vmnet_dhcp_range_start, vmnet_dhcp_range_end,
+                 vmnet_subnet_mask);
+    } else {
+        snprintf(nc->info_str, sizeof(nc->info_str),
+                 "mac=%s", vmnet_mac_address);
+    }
+
+    return 0;
+}
diff --git a/qapi/net.json b/qapi/net.json
index c31748c87f..da2cd1267e 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -450,6 +450,65 @@
     '*vhostdev':     'str',
     '*queues':       'int' } }
 
+##
+# @VmnetOperatingMode:
+#
+# An enumeration of the I/O operation types
+#
+# @host: the guest may communicate with the host 
+#        and other guest network interfaces
+#
+# @shared: the guest may reach the Internet through a NAT, 
+#          and may communicate with the host and other guest 
+#          network interfaces
+#
+# @bridged: the guest's traffic is bridged with a 
+#           physical network interface of the host
+#
+# Since: 5.3
+##
+{ 'enum': 'VmnetOperatingMode',
+  'data': [ 'host', 'shared', 'bridged' ] }
+
+##
+# @NetdevVmnetOptions:
+#
+# vmnet network backend (only available on macOS)
+#
+# @mode: the operating mode vmnet should run in
+#
+# @ifname: the physical network interface to bridge with 
+#          (only valid with mode=bridged)
+#
+# @dhcp_start_address: the gateway address to use for the interface. 
+#                      The range to dhcp_end_address is placed in the DHCP pool.
+#                      (only valid with mode=host|shared)
+#                      (must be specified with dhcp_end_address and 
+#                       dhcp_subnet_mask)
+#                      (allocated automatically if unset)
+#
+# @dhcp_end_address: the DHCP IPv4 range end address to use for the interface. 
+#                      (only valid with mode=host|shared)
+#                      (must be specified with dhcp_start_address and 
+#                       dhcp_subnet_mask)
+#                      (allocated automatically if unset)
+#
+# @dhcp_subnet_mask: the IPv4 subnet mask (string) to use on the interface.
+#                    (only valid with mode=host|shared)
+#                    (must be specified with dhcp_start_address and 
+#                     dhcp_end_address)
+#                    (allocated automatically if unset)
+#
+# Since: 5.3
+##
+{ 'struct': 'NetdevVmnetOptions',
+  'data': {
+    'mode':        'VmnetOperatingMode',
+    '*ifname':        'str',
+    '*dhcp_start_address':      'str',
+    '*dhcp_end_address':        'str',
+    '*dhcp_subnet_mask':        'str' } }
+
 ##
 # @NetClientDriver:
 #
@@ -461,7 +520,7 @@
 ##
 { 'enum': 'NetClientDriver',
   'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
-            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' ] }
+            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa', 'vmnet-macos' ] }
 
 ##
 # @Netdev:
@@ -490,7 +549,8 @@
     'hubport':  'NetdevHubPortOptions',
     'netmap':   'NetdevNetmapOptions',
     'vhost-user': 'NetdevVhostUserOptions',
-    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
+    'vhost-vdpa': 'NetdevVhostVDPAOptions',
+    'vmnet-macos': 'NetdevVmnetOptions' } }
 
 ##
 # @NetFilterDirection:
diff --git a/qemu-options.hx b/qemu-options.hx
index 9172d51659..ec6b40b079 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2483,6 +2483,15 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
 #ifdef __linux__
     "-netdev vhost-vdpa,id=str,vhostdev=/path/to/dev\n"
     "                configure a vhost-vdpa network,Establish a vhost-vdpa netdev\n"
+#endif
+#ifdef CONFIG_DARWIN
+    "-netdev vmnet-macos,id=str,mode=bridged[,ifname=ifname]\n"
+    "         configure a macOS-provided vmnet network in \"physical interface bridge\" mode\n"
+    "         the physical interface to bridge with defaults to en0 if unspecified\n"
+    "-netdev vmnet-macos,id=str,mode=host|shared\n"
+    "                     [,dhcp_start_address=addr,dhcp_end_address=addr,dhcp_subnet_mask=mask]\n"
+    "         configure a macOS-provided vmnet network in \"host\" or \"shared\" mode\n"
+    "         the DHCP configuration will be set automatically if unspecified\n"
 #endif
     "-netdev hubport,id=str,hubid=n[,netdev=nd]\n"
     "                configure a hub port on the hub with ID 'n'\n", QEMU_ARCH_ALL)
-- 
2.24.3 (Apple Git-128)


