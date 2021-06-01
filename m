Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C913979EE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 20:19:39 +0200 (CEST)
Received: from localhost ([::1]:41018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo8zK-00082a-Mn
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 14:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qk-0002fI-HS
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qf-0005oR-Mb
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622571039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OiznvOiw988Q6wohYwG7BaAaFXlSoFR15pAhGpAEt6w=;
 b=akUfc5k7BQtobmQkrQ+6g0Xu1yotkNefDcxJMv23WUz4sE4GCJZ9LVf9n0jrWCiaZkxUbl
 u+L/bq/sl5+TNIVKV4w28jwe4K3h5eAz1PRLDWsJzf3ecBrmUTR5bWz7Horc5vXPdp/Z1u
 mxHETKSOkx7YDCS0hNgZA7cVVyyfnrw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-qCi5fKTeP6K0j0O814c44Q-1; Tue, 01 Jun 2021 14:10:38 -0400
X-MC-Unique: qCi5fKTeP6K0j0O814c44Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C512E801107;
 Tue,  1 Jun 2021 18:10:36 +0000 (UTC)
Received: from localhost (ovpn-112-239.rdu2.redhat.com [10.10.112.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 883DA60D52;
 Tue,  1 Jun 2021 18:10:36 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 22/24] target/i386/sev: add support to query the attestation
 report
Date: Tue,  1 Jun 2021 14:10:12 -0400
Message-Id: <20210601181014.2568861-23-ehabkost@redhat.com>
In-Reply-To: <20210601181014.2568861-1-ehabkost@redhat.com>
References: <20210601181014.2568861-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <Thomas.Lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, Connor Kuehl <ckuehl@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brijesh Singh <brijesh.singh@amd.com>

The SEV FW >= 0.23 added a new command that can be used to query the
attestation report containing the SHA-256 digest of the guest memory
and VMSA encrypted with the LAUNCH_UPDATE and sign it with the PEK.

Note, we already have a command (LAUNCH_MEASURE) that can be used to
query the SHA-256 digest of the guest memory encrypted through the
LAUNCH_UPDATE. The main difference between previous and this command
is that the report is signed with the PEK and unlike the LAUNCH_MEASURE
command the ATTESATION_REPORT command can be called while the guest
is running.

Add a QMP interface "query-sev-attestation-report" that can be used
to get the report encoded in base64.

Cc: James Bottomley <jejb@linux.ibm.com>
Cc: Tom Lendacky <Thomas.Lendacky@amd.com>
Cc: Eric Blake <eblake@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org
Reviewed-by: James Bottomley <jejb@linux.ibm.com>
Tested-by: James Bottomley <jejb@linux.ibm.com>
Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Message-Id: <20210429170728.24322-1-brijesh.singh@amd.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 linux-headers/linux/kvm.h |  8 +++++
 target/i386/sev_i386.h    |  2 ++
 qapi/misc-target.json     | 38 ++++++++++++++++++++++
 target/i386/monitor.c     |  6 ++++
 target/i386/sev-stub.c    |  7 ++++
 target/i386/sev.c         | 67 +++++++++++++++++++++++++++++++++++++++
 target/i386/trace-events  |  1 +
 7 files changed, 129 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 020b62a619a..897f8313749 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1591,6 +1591,8 @@ enum sev_cmd_id {
 	KVM_SEV_DBG_ENCRYPT,
 	/* Guest certificates commands */
 	KVM_SEV_CERT_EXPORT,
+	/* Attestation report */
+	KVM_SEV_GET_ATTESTATION_REPORT,
 
 	KVM_SEV_NR_MAX,
 };
@@ -1643,6 +1645,12 @@ struct kvm_sev_dbg {
 	__u32 len;
 };
 
+struct kvm_sev_attestation_report {
+	__u8 mnonce[16];
+	__u64 uaddr;
+	__u32 len;
+};
+
 #define KVM_DEV_ASSIGN_ENABLE_IOMMU	(1 << 0)
 #define KVM_DEV_ASSIGN_PCI_2_3		(1 << 1)
 #define KVM_DEV_ASSIGN_MASK_INTX	(1 << 2)
diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index ae221d4c724..ae6d8404787 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -35,5 +35,7 @@ extern uint32_t sev_get_cbit_position(void);
 extern uint32_t sev_get_reduced_phys_bits(void);
 extern char *sev_get_launch_measurement(void);
 extern SevCapability *sev_get_capabilities(Error **errp);
+extern SevAttestationReport *
+sev_get_attestation_report(const char *mnonce, Error **errp);
 
 #endif
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 6200c671bef..5573dcf8f08 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -285,3 +285,41 @@
 ##
 { 'command': 'query-gic-capabilities', 'returns': ['GICCapability'],
   'if': 'defined(TARGET_ARM)' }
+
+
+##
+# @SevAttestationReport:
+#
+# The struct describes attestation report for a Secure Encrypted Virtualization
+# feature.
+#
+# @data:  guest attestation report (base64 encoded)
+#
+#
+# Since: 6.1
+##
+{ 'struct': 'SevAttestationReport',
+  'data': { 'data': 'str'},
+  'if': 'defined(TARGET_I386)' }
+
+##
+# @query-sev-attestation-report:
+#
+# This command is used to get the SEV attestation report, and is supported on AMD
+# X86 platforms only.
+#
+# @mnonce: a random 16 bytes value encoded in base64 (it will be included in report)
+#
+# Returns: SevAttestationReport objects.
+#
+# Since: 6.1
+#
+# Example:
+#
+# -> { "execute" : "query-sev-attestation-report", "arguments": { "mnonce": "aaaaaaa" } }
+# <- { "return" : { "data": "aaaaaaaabbbddddd"} }
+#
+##
+{ 'command': 'query-sev-attestation-report', 'data': { 'mnonce': 'str' },
+  'returns': 'SevAttestationReport',
+  'if': 'defined(TARGET_I386)' }
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 5994408bee1..119211f0b06 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -757,3 +757,9 @@ void qmp_sev_inject_launch_secret(const char *packet_hdr,
 
     sev_inject_launch_secret(packet_hdr, secret, gpa, errp);
 }
+
+SevAttestationReport *
+qmp_query_sev_attestation_report(const char *mnonce, Error **errp)
+{
+    return sev_get_attestation_report(mnonce, errp);
+}
diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index 0207f1c5aae..0227cb51778 100644
--- a/target/i386/sev-stub.c
+++ b/target/i386/sev-stub.c
@@ -74,3 +74,10 @@ int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
 {
     abort();
 }
+
+SevAttestationReport *
+sev_get_attestation_report(const char *mnonce, Error **errp)
+{
+    error_setg(errp, "SEV is not available in this QEMU");
+    return NULL;
+}
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 41f7800b5f7..1a88f127035 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -492,6 +492,73 @@ out:
     return cap;
 }
 
+SevAttestationReport *
+sev_get_attestation_report(const char *mnonce, Error **errp)
+{
+    struct kvm_sev_attestation_report input = {};
+    SevAttestationReport *report = NULL;
+    SevGuestState *sev = sev_guest;
+    guchar *data;
+    guchar *buf;
+    gsize len;
+    int err = 0, ret;
+
+    if (!sev_enabled()) {
+        error_setg(errp, "SEV is not enabled");
+        return NULL;
+    }
+
+    /* lets decode the mnonce string */
+    buf = g_base64_decode(mnonce, &len);
+    if (!buf) {
+        error_setg(errp, "SEV: failed to decode mnonce input");
+        return NULL;
+    }
+
+    /* verify the input mnonce length */
+    if (len != sizeof(input.mnonce)) {
+        error_setg(errp, "SEV: mnonce must be %zu bytes (got %" G_GSIZE_FORMAT ")",
+                sizeof(input.mnonce), len);
+        g_free(buf);
+        return NULL;
+    }
+
+    /* Query the report length */
+    ret = sev_ioctl(sev->sev_fd, KVM_SEV_GET_ATTESTATION_REPORT,
+            &input, &err);
+    if (ret < 0) {
+        if (err != SEV_RET_INVALID_LEN) {
+            error_setg(errp, "failed to query the attestation report length "
+                    "ret=%d fw_err=%d (%s)", ret, err, fw_error_to_str(err));
+            g_free(buf);
+            return NULL;
+        }
+    }
+
+    data = g_malloc(input.len);
+    input.uaddr = (unsigned long)data;
+    memcpy(input.mnonce, buf, sizeof(input.mnonce));
+
+    /* Query the report */
+    ret = sev_ioctl(sev->sev_fd, KVM_SEV_GET_ATTESTATION_REPORT,
+            &input, &err);
+    if (ret) {
+        error_setg_errno(errp, errno, "Failed to get attestation report"
+                " ret=%d fw_err=%d (%s)", ret, err, fw_error_to_str(err));
+        goto e_free_data;
+    }
+
+    report = g_new0(SevAttestationReport, 1);
+    report->data = g_base64_encode(data, input.len);
+
+    trace_kvm_sev_attestation_report(mnonce, report->data);
+
+e_free_data:
+    g_free(data);
+    g_free(buf);
+    return report;
+}
+
 static int
 sev_read_file_base64(const char *filename, guchar **data, gsize *len)
 {
diff --git a/target/i386/trace-events b/target/i386/trace-events
index a22ab24e214..8d6437404d5 100644
--- a/target/i386/trace-events
+++ b/target/i386/trace-events
@@ -10,3 +10,4 @@ kvm_sev_launch_update_data(void *addr, uint64_t len) "addr %p len 0x%" PRIx64
 kvm_sev_launch_measurement(const char *value) "data %s"
 kvm_sev_launch_finish(void) ""
 kvm_sev_launch_secret(uint64_t hpa, uint64_t hva, uint64_t secret, int len) "hpa 0x%" PRIx64 " hva 0x%" PRIx64 " data 0x%" PRIx64 " len %d"
+kvm_sev_attestation_report(const char *mnonce, const char *data) "mnonce %s data %s"
-- 
2.30.2


