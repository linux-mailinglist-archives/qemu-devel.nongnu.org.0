Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08D860251C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 09:10:31 +0200 (CEST)
Received: from localhost ([::1]:50930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okgk9-0003Ro-Hq
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 03:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg6W-0005s2-FG
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg66-0001Fv-QM
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666074536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cflL3Jcso4wfikplpU7m+Bsd6DC//2lgjHG1Ib5z4/A=;
 b=Xdfu9eMKG6mFe3ajkDBfAArBjYXixw7FkK9RCttFOR+1S3zWJWFTdr7uhDwBNnabiVzfse
 djay+WEOY/uEXaGUKq998vKkmtt4qff9BVk6ZTU86I4BwSj9VJI61iIrE2Rwqp0tpDg/hA
 cnBw2QnXLmEOWRWQ0p3w5p0ViA9Y2mY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-rYyzvAicO0WVOD9jZY7LIA-1; Tue, 18 Oct 2022 02:28:53 -0400
X-MC-Unique: rYyzvAicO0WVOD9jZY7LIA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4292A803D4A;
 Tue, 18 Oct 2022 06:28:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D774FC19145;
 Tue, 18 Oct 2022 06:28:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 67AF621E6632; Tue, 18 Oct 2022 08:28:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Konstantin Kostiuk <kkostiuk@redhat.com>
Subject: [PATCH v2 27/28] qapi qga: Elide redundant has_FOO in generated C
Date: Tue, 18 Oct 2022 08:28:48 +0200
Message-Id: <20221018062849.3420573-28-armbru@redhat.com>
In-Reply-To: <20221018062849.3420573-1-armbru@redhat.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_FILL_THIS_FORM_SHORT=0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qga/qapi-schema.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Michael Roth <michael.roth@amd.com>
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qga/commands-posix.c   | 33 ++++++++-------------------------
 qga/commands-win32.c   | 40 +++++++---------------------------------
 qga/commands.c         | 11 ++++-------
 scripts/qapi/schema.py |  3 +--
 4 files changed, 20 insertions(+), 67 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index eea819cff0..095e91e18f 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -81,7 +81,7 @@ static void ga_wait_child(pid_t pid, int *status, Error **errp)
     g_assert(rpid == pid);
 }
 
-void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
+void qmp_guest_shutdown(const char *mode, Error **errp)
 {
     const char *shutdown_flag;
     Error *local_err = NULL;
@@ -99,7 +99,7 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
 #endif
 
     slog("guest-shutdown called, mode: %s", mode);
-    if (!has_mode || strcmp(mode, "powerdown") == 0) {
+    if (!mode || strcmp(mode, "powerdown") == 0) {
         shutdown_flag = powerdown_flag;
     } else if (strcmp(mode, "halt") == 0) {
         shutdown_flag = halt_flag;
@@ -407,14 +407,14 @@ end:
     return f;
 }
 
-int64_t qmp_guest_file_open(const char *path, bool has_mode, const char *mode,
+int64_t qmp_guest_file_open(const char *path, const char *mode,
                             Error **errp)
 {
     FILE *fh;
     Error *local_err = NULL;
     int64_t handle;
 
-    if (!has_mode) {
+    if (!mode) {
         mode = "r";
     }
     slog("guest-file-open called, filepath: %s, mode: %s", path, mode);
@@ -1053,7 +1053,6 @@ static bool build_guest_fsinfo_for_ccw_dev(char const *syspath,
         return false;
     }
 
-    disk->has_ccw_address = true;
     disk->ccw_address = g_new0(GuestCCWAddress, 1);
     disk->ccw_address->cssid = cssid;
     disk->ccw_address->ssid = ssid;
@@ -1100,12 +1099,10 @@ static void build_guest_fsinfo_for_real_device(char const *syspath,
         devnode = udev_device_get_devnode(udevice);
         if (devnode != NULL) {
             disk->dev = g_strdup(devnode);
-            disk->has_dev = true;
         }
         serial = udev_device_get_property_value(udevice, "ID_SERIAL");
         if (serial != NULL && *serial != 0) {
             disk->serial = g_strdup(serial);
-            disk->has_serial = true;
         }
     }
 
@@ -1124,7 +1121,7 @@ static void build_guest_fsinfo_for_real_device(char const *syspath,
         has_hwinf = false;
     }
 
-    if (has_hwinf || disk->has_dev || disk->has_serial) {
+    if (has_hwinf || disk->dev || disk->serial) {
         QAPI_LIST_PREPEND(fs->disk, disk);
     } else {
         qapi_free_GuestDiskAddress(disk);
@@ -1427,7 +1424,6 @@ static void get_nvme_smart(GuestDiskInfo *disk)
         return;
     }
 
-    disk->has_smart = true;
     disk->smart = g_new0(GuestDiskSmart, 1);
     disk->smart->type = GUEST_DISK_BUS_TYPE_NVME;
 
@@ -1465,7 +1461,7 @@ static void get_nvme_smart(GuestDiskInfo *disk)
 
 static void get_disk_smart(GuestDiskInfo *disk)
 {
-    if (disk->has_address
+    if (disk->address
         && (disk->address->bus_type == GUEST_DISK_BUS_TYPE_NVME)) {
         get_nvme_smart(disk);
     }
@@ -1518,7 +1514,6 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
         disk->name = dev_name;
         disk->partition = false;
         disk->alias = get_alias_for_syspath(disk_dir);
-        disk->has_alias = (disk->alias != NULL);
         QAPI_LIST_PREPEND(ret, disk);
 
         /* Get address for non-virtual devices */
@@ -1538,8 +1533,6 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
                     error_get_pretty(local_err));
                 error_free(local_err);
                 local_err = NULL;
-            } else if (disk->address != NULL) {
-                disk->has_address = true;
             }
         }
 
@@ -1899,7 +1892,6 @@ qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
         if (fd == -1) {
             result->error = g_strdup_printf("failed to open: %s",
                                             strerror(errno));
-            result->has_error = true;
             continue;
         }
 
@@ -1914,7 +1906,6 @@ qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
         r.minlen = has_minimum ? minimum : 0;
         ret = ioctl(fd, FITRIM, &r);
         if (ret == -1) {
-            result->has_error = true;
             if (errno == ENOTTY || errno == EOPNOTSUPP) {
                 result->error = g_strdup("trim not supported");
             } else {
@@ -3160,7 +3151,7 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
             QAPI_LIST_APPEND(tail, info);
         }
 
-        if (!info->has_hardware_address) {
+        if (!info->hardware_address) {
             /* we haven't obtained HW address yet */
             sock = socket(PF_INET, SOCK_STREAM, 0);
             if (sock == -1) {
@@ -3196,8 +3187,6 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
                                     (int) mac_addr[0], (int) mac_addr[1],
                                     (int) mac_addr[2], (int) mac_addr[3],
                                     (int) mac_addr[4], (int) mac_addr[5]);
-
-                info->has_hardware_address = true;
             }
             close(sock);
         }
@@ -3258,14 +3247,12 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
 
         info->has_ip_addresses = true;
 
-        if (!info->has_statistics) {
+        if (!info->statistics) {
             interface_stat = g_malloc0(sizeof(*interface_stat));
             if (guest_get_network_stats(info->name, interface_stat) == -1) {
-                info->has_statistics = false;
                 g_free(interface_stat);
             } else {
                 info->statistics = interface_stat;
-                info->has_statistics = true;
             }
         }
     }
@@ -3572,11 +3559,8 @@ GuestOSInfo *qmp_guest_get_osinfo(Error **errp)
     if (uname(&kinfo) != 0) {
         error_setg_errno(errp, errno, "uname failed");
     } else {
-        info->has_kernel_version = true;
         info->kernel_version = g_strdup(kinfo.version);
-        info->has_kernel_release = true;
         info->kernel_release = g_strdup(kinfo.release);
-        info->has_machine = true;
         info->machine = g_strdup(kinfo.machine);
     }
 
@@ -3596,7 +3580,6 @@ GuestOSInfo *qmp_guest_get_osinfo(Error **errp)
     value = g_key_file_get_value(osrelease, "os-release", osfield, NULL); \
     if (value != NULL) { \
         ga_osrelease_replace_special(value); \
-        info->has_ ## field = true; \
         info->field = value; \
     } \
 } while (0)
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index ec9f55b453..7d8d34d87d 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -193,8 +193,7 @@ static void handle_set_nonblocking(HANDLE fh)
     SetNamedPipeHandleState(fh, &pipe_state, NULL, NULL);
 }
 
-int64_t qmp_guest_file_open(const char *path, bool has_mode,
-                            const char *mode, Error **errp)
+int64_t qmp_guest_file_open(const char *path, const char *mode, Error **errp)
 {
     int64_t fd = -1;
     HANDLE fh;
@@ -206,7 +205,7 @@ int64_t qmp_guest_file_open(const char *path, bool has_mode,
     GError *gerr = NULL;
     wchar_t *w_path = NULL;
 
-    if (!has_mode) {
+    if (!mode) {
         mode = "r";
     }
     slog("guest-file-open called, filepath: %s, mode: %s", path, mode);
@@ -317,14 +316,14 @@ static void execute_async(DWORD WINAPI (*func)(LPVOID), LPVOID opaque,
     }
 }
 
-void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
+void qmp_guest_shutdown(const char *mode, Error **errp)
 {
     Error *local_err = NULL;
     UINT shutdown_flag = EWX_FORCE;
 
     slog("guest-shutdown called, mode: %s", mode);
 
-    if (!has_mode || strcmp(mode, "powerdown") == 0) {
+    if (!mode || strcmp(mode, "powerdown") == 0) {
         shutdown_flag |= EWX_POWEROFF;
     } else if (strcmp(mode, "halt") == 0) {
         shutdown_flag |= EWX_SHUTDOWN;
@@ -833,7 +832,6 @@ static void get_disk_properties(HANDLE vol_h, GuestDiskAddress *disk,
         g_debug("serial number \"%s\"", serial);
         if (*serial != 0) {
             disk->serial = g_strndup(serial, len);
-            disk->has_serial = true;
         }
     }
 out_free:
@@ -951,7 +949,6 @@ static GuestDiskAddressList *build_guest_disk_info(char *guid, Error **errp)
             /* Possibly CD-ROM or a shared drive. Try to pass the volume */
             g_debug("volume not on disk");
             disk = g_new0(GuestDiskAddress, 1);
-            disk->has_dev = true;
             disk->dev = g_strdup(name);
             get_single_disk_info(0xffffffff, disk, &local_err);
             if (local_err) {
@@ -983,7 +980,6 @@ static GuestDiskAddressList *build_guest_disk_info(char *guid, Error **errp)
          * See also Naming Files, Paths and Namespaces:
          * https://docs.microsoft.com/en-us/windows/desktop/FileIO/naming-a-file#win32-device-namespaces
          */
-        disk->has_dev = true;
         disk->dev = g_strdup_printf("\\\\.\\PhysicalDrive%lu",
                                     extents->Extents[i].DiskNumber);
 
@@ -1078,7 +1074,6 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
 
         g_debug("  number: %lu", sdn.DeviceNumber);
         address = g_new0(GuestDiskAddress, 1);
-        address->has_dev = true;
         address->dev = g_strdup(disk->name);
         get_single_disk_info(sdn.DeviceNumber, address, &local_err);
         if (local_err) {
@@ -1089,7 +1084,6 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
             address = NULL;
         } else {
             disk->address = address;
-            disk->has_address = true;
         }
 
         QAPI_LIST_PREPEND(ret, disk);
@@ -1369,7 +1363,6 @@ qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
         g_free(uc_path);
 
         if (!path) {
-            res->has_error = true;
             res->error = g_strdup(gerr->message);
             g_error_free(gerr);
             break;
@@ -1387,7 +1380,6 @@ qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
         if (!g_spawn_sync(NULL, argv, NULL, G_SPAWN_SEARCH_PATH, NULL, NULL,
                           &out /* stdout */, NULL /* stdin */,
                           NULL, &gerr)) {
-            res->has_error = true;
             res->error = g_strdup(gerr->message);
             g_error_free(gerr);
         } else {
@@ -1403,7 +1395,6 @@ qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
                 if (g_strstr_len(lines[i], -1, "(0x") == NULL) {
                     continue;
                 }
-                res->has_error = true;
                 res->error = g_strdup(lines[i]);
                 break;
             }
@@ -1683,8 +1674,6 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
                                 (int) mac_addr[0], (int) mac_addr[1],
                                 (int) mac_addr[2], (int) mac_addr[3],
                                 (int) mac_addr[4], (int) mac_addr[5]);
-
-            info->has_hardware_address = true;
         }
 
         head_addr = NULL;
@@ -1713,15 +1702,13 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
             info->has_ip_addresses = true;
             info->ip_addresses = head_addr;
         }
-        if (!info->has_statistics) {
+        if (!info->statistics) {
             interface_stat = g_malloc0(sizeof(*interface_stat));
-            if (guest_get_network_stats(addr->AdapterName,
-                interface_stat) == -1) {
-                info->has_statistics = false;
+            if (guest_get_network_stats(addr->AdapterName, interface_stat)
+                == -1) {
                 g_free(interface_stat);
             } else {
                 info->statistics = interface_stat;
-                info->has_statistics = true;
             }
         }
     }
@@ -2113,7 +2100,6 @@ GuestUserList *qmp_guest_get_users(Error **errp)
 
                     user->user = g_strdup(info->UserName);
                     user->domain = g_strdup(info->Domain);
-                    user->has_domain = true;
 
                     user->login_time = login_time;
 
@@ -2332,29 +2318,19 @@ GuestOSInfo *qmp_guest_get_osinfo(Error **errp)
 
     info = g_new0(GuestOSInfo, 1);
 
-    info->has_kernel_version = true;
     info->kernel_version = g_strdup_printf("%lu.%lu",
         os_version.dwMajorVersion,
         os_version.dwMinorVersion);
-    info->has_kernel_release = true;
     info->kernel_release = g_strdup_printf("%lu",
         os_version.dwBuildNumber);
-    info->has_machine = true;
     info->machine = ga_get_current_arch();
 
-    info->has_id = true;
     info->id = g_strdup("mswindows");
-    info->has_name = true;
     info->name = g_strdup("Microsoft Windows");
-    info->has_pretty_name = true;
     info->pretty_name = product_name;
-    info->has_version = true;
     info->version = ga_get_win_name(&os_version, false);
-    info->has_version_id = true;
     info->version_id = ga_get_win_name(&os_version, true);
-    info->has_variant = true;
     info->variant = g_strdup(server ? "server" : "client");
-    info->has_variant_id = true;
     info->variant_id = g_strdup(server ? "server" : "client");
 
     return info;
@@ -2478,7 +2454,6 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error **errp)
             device_id = g_match_info_fetch(match_info, 2);
 
             device->id = g_new0(GuestDeviceId, 1);
-            device->has_id = true;
             device->id->type = GUEST_DEVICE_TYPE_PCI;
             id = &device->id->u.pci;
             id->vendor_id = g_ascii_strtoull(vendor_id, NULL, 16);
@@ -2502,7 +2477,6 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error **errp)
             error_setg(errp, "conversion to utf8 failed (driver version)");
             return NULL;
         }
-        device->has_driver_version = true;
 
         date = (LPFILETIME)cm_get_property(dev_info_data.DevInst,
             &qga_DEVPKEY_Device_DriverDate, &cm_type);
diff --git a/qga/commands.c b/qga/commands.c
index 7ff551d092..360077364e 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -206,14 +206,12 @@ GuestExecStatus *qmp_guest_exec_status(int64_t pid, Error **errp)
         }
 #endif
         if (gei->out.length > 0) {
-            ges->has_out_data = true;
             ges->out_data = g_base64_encode(gei->out.data, gei->out.length);
             g_free(gei->out.data);
             ges->has_out_truncated = gei->out.truncated;
         }
 
         if (gei->err.length > 0) {
-            ges->has_err_data = true;
             ges->err_data = g_base64_encode(gei->err.data, gei->err.length);
             g_free(gei->err.data);
             ges->has_err_truncated = gei->err.truncated;
@@ -385,7 +383,7 @@ close:
 GuestExec *qmp_guest_exec(const char *path,
                        bool has_arg, strList *arg,
                        bool has_env, strList *env,
-                       bool has_input_data, const char *input_data,
+                       const char *input_data,
                        bool has_capture_output, bool capture_output,
                        Error **errp)
 {
@@ -406,7 +404,7 @@ GuestExec *qmp_guest_exec(const char *path,
     arglist.value = (char *)path;
     arglist.next = has_arg ? arg : NULL;
 
-    if (has_input_data) {
+    if (input_data) {
         input = qbase64_decode(input_data, -1, &ninput, errp);
         if (!input) {
             return NULL;
@@ -423,7 +421,7 @@ GuestExec *qmp_guest_exec(const char *path,
     }
 
     ret = g_spawn_async_with_pipes(NULL, argv, envp, flags,
-            guest_exec_task_setup, NULL, &pid, has_input_data ? &in_fd : NULL,
+            guest_exec_task_setup, NULL, &pid, input_data ? &in_fd : NULL,
             has_output ? &out_fd : NULL, has_output ? &err_fd : NULL, &gerr);
     if (!ret) {
         error_setg(errp, QERR_QGA_COMMAND_FAILED, gerr->message);
@@ -438,7 +436,7 @@ GuestExec *qmp_guest_exec(const char *path,
     gei->has_output = has_output;
     g_child_watch_add(pid, guest_exec_child_watch, gei);
 
-    if (has_input_data) {
+    if (input_data) {
         gei->in.data = g_steal_pointer(&input);
         gei->in.size = ninput;
 #ifdef G_OS_WIN32
@@ -547,7 +545,6 @@ GuestTimezone *qmp_guest_get_timezone(Error **errp)
     info->offset = g_time_zone_get_offset(tz, intv);
     name = g_time_zone_get_abbreviation(tz, intv);
     if (name != NULL) {
-        info->has_zone = true;
         info->zone = g_strdup(name);
     }
     g_time_zone_unref(tz);
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index b2df148e01..4594c69d0b 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -758,8 +758,7 @@ def __init__(self, name, info, typ, optional, ifcond=None, features=None):
     def need_has(self):
         assert self.type
         # Temporary hack to support dropping the has_FOO in reviewable chunks
-        opt_out = [
-            'qga/qapi-schema.json']
+        opt_out = []
         if self.info and any(self.info.fname.endswith(mod)
                              for mod in opt_out):
             return self.optional
-- 
2.37.2


