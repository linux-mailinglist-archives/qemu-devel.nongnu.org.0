Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5799625451F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 14:40:24 +0200 (CEST)
Received: from localhost ([::1]:39184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBHCZ-0001Kt-BA
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 08:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1kBHBR-0007xe-IZ
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 08:39:13 -0400
Received: from mail02.asahi-net.or.jp ([202.224.55.14]:56301)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1kBHBN-0005u5-SJ
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 08:39:13 -0400
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail02.asahi-net.or.jp (Postfix) with ESMTPA id 84A9B25525;
 Thu, 27 Aug 2020 21:39:05 +0900 (JST)
Received: from yo-satoh-debian.localdomain (ZM005235.ppp.dion.ne.jp
 [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id 0BBA51C0792;
 Thu, 27 Aug 2020 21:39:05 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/20] loader.c: Add support Motrola S-record format.
Date: Thu, 27 Aug 2020 21:38:40 +0900
Message-Id: <20200827123859.81793-2-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200827123859.81793-1-ysato@users.sourceforge.jp>
References: <20200827123859.81793-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=202.224.55.14;
 envelope-from=ysato@users.sourceforge.jp; helo=mail02.asahi-net.or.jp
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 08:39:06
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 include/hw/loader.h |  14 +++
 hw/core/loader.c    | 208 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 222 insertions(+)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index a9eeea3952..6f1fb62ded 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -55,6 +55,20 @@ int load_image_targphys_as(const char *filename,
  */
 int load_targphys_hex_as(const char *filename, hwaddr *entry, AddressSpace *as);
 
+/*
+ * load_targphys_srec_as:
+ * @filename: Path to the .hex file
+ * @entry: Store the entry point given by the .hex file
+ * @as: The AddressSpace to load the .hex file to. The value of
+ *      address_space_memory is used if nothing is supplied here.
+ *
+ * Load a fixed .srec file into memory.
+ *
+ * Returns the size of the loaded .hex file on success, -1 otherwise.
+ */
+int load_targphys_srec_as(const char *filename,
+                          hwaddr *entry, AddressSpace *as);
+
 /** load_image_targphys:
  * Same as load_image_targphys_as(), but doesn't allow the caller to specify
  * an AddressSpace.
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 8bbb1797a4..6964b04ec7 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1618,3 +1618,211 @@ int load_targphys_hex_as(const char *filename, hwaddr *entry, AddressSpace *as)
     g_free(hex_blob);
     return total_size;
 }
+
+typedef enum {
+    SREC_SOH,
+    SREC_TYPE,
+    SREC_LEN,
+    SREC_ADDR,
+    SREC_DATA,
+    SREC_SKIP,
+    SREC_SUM,
+} srec_state;
+
+typedef struct {
+    srec_state state;
+    int nibble;
+    int total_size;
+    uint32_t address;
+    uint32_t topaddr;
+    uint32_t bufremain;
+    int length;
+    int addr_len;
+    int record_type;
+    uint8_t byte;
+    uint8_t data[DATA_FIELD_MAX_LEN];
+    uint8_t *datap;
+    uint8_t *bufptr;
+    uint8_t sum;
+} SrecLine;
+
+static bool parse_srec_line(SrecLine *line, char c)
+{
+    if (!g_ascii_isxdigit(c)) {
+        return false;
+    }
+    line->byte <<= 4;
+    line->byte |= g_ascii_xdigit_value(c);
+    line->nibble++;
+    if (line->nibble == 2) {
+        line->nibble = 0;
+        line->length--;
+        line->sum += line->byte;
+        switch (line->state) {
+        case SREC_SOH:
+        case SREC_TYPE:
+            /* first 2chars ignore parse */
+            break;
+        case SREC_LEN:
+            line->sum = line->length = line->byte;
+            if (line->addr_len > 0) {
+                line->state = SREC_ADDR;
+                line->address = 0;
+            } else {
+                line->state = SREC_SKIP;
+            }
+            break;
+        case SREC_ADDR:
+            line->address <<= 8;
+            line->address |= line->byte;
+            if (--line->addr_len == 0) {
+                if (line->length > 1) {
+                    if (line->record_type != 0) {
+                        line->state = SREC_DATA;
+                    } else {
+                        line->state = SREC_SKIP;
+                    }
+                    line->datap = line->data;
+                } else {
+                    line->state = SREC_SUM;
+                }
+            }
+            break;
+        case SREC_DATA:
+            *line->datap++ = line->byte;
+            /* fail through */
+        case SREC_SKIP:
+            if (line->length == 1) {
+                line->state = SREC_SUM;
+            }
+            break;
+        case SREC_SUM:
+            if ((line->sum & 0xff) != 0xff) {
+                return false;
+            }
+        }
+    }
+    return true;
+}
+
+#define SRECBUFSIZE 0x40000
+
+/* return size or -1 if error */
+static int parse_srec_blob(const char *filename, hwaddr *addr,
+                           uint8_t *hex_blob, size_t hex_blob_size,
+                           AddressSpace *as)
+{
+    SrecLine line;
+    size_t len;
+    int total_len = 0;
+    uint8_t *end = hex_blob + hex_blob_size;
+    rom_transaction_begin();
+    line.state = SREC_SOH;
+    line.bufptr = g_malloc(SRECBUFSIZE);
+    line.bufremain = SRECBUFSIZE;
+    line.topaddr = UINT32_MAX;
+    for (; hex_blob < end; ++hex_blob) {
+        switch (*hex_blob) {
+        case '\r':
+        case '\n':
+            if (line.state == SREC_SUM) {
+                switch (line.record_type) {
+                case 1:
+                case 2:
+                case 3:
+                    len = line.datap - line.data;
+                    if (line.topaddr == UINT32_MAX) {
+                        line.topaddr = line.address;
+                    }
+                    if (line.bufremain < len || line.address < line.topaddr) {
+                        rom_add_blob_fixed_as(filename, line.bufptr,
+                                              SRECBUFSIZE - line.bufremain,
+                                              line.topaddr, as);
+                        line.topaddr = line.address;
+                        line.bufremain = SRECBUFSIZE;
+                    }
+                    memcpy(line.bufptr + (line.address  - line.topaddr),
+                           line.data, len);
+                    line.bufremain -= len;
+                    total_len += len;
+                    break;
+                case 7:
+                case 8:
+                case 9:
+                    *addr = line.address;
+                    break;
+                }
+                line.state = SREC_SOH;
+            }
+            break;
+        /* start of a new record. */
+        case 'S':
+            if (line.state != SREC_SOH) {
+                total_len = -1;
+                goto out;
+            }
+            line.state = SREC_TYPE;
+            break;
+        /* decoding lines */
+        default:
+            if (line.state == SREC_TYPE) {
+                if (g_ascii_isdigit(*hex_blob)) {
+                    line.record_type = g_ascii_digit_value(*hex_blob);
+                    switch (line.record_type) {
+                    case 1:
+                    case 2:
+                    case 3:
+                        line.addr_len = 1 + line.record_type;
+                        break;
+                    case 0:
+                    case 5:
+                        line.addr_len = 2;
+                        break;
+                    case 7:
+                    case 8:
+                    case 9:
+                        line.addr_len = 11 - line.record_type;
+                        break;
+                    default:
+                        line.addr_len = 0;
+                    }
+                }
+                line.state = SREC_LEN;
+                line.nibble = 0;
+            } else {
+                if (!parse_srec_line(&line, *hex_blob)) {
+                    total_len = -1;
+                    goto out;
+                }
+            }
+            break;
+        }
+    }
+    if (line.bufremain < SRECBUFSIZE) {
+        rom_add_blob_fixed_as(filename, line.bufptr,
+                              SRECBUFSIZE - line.bufremain,
+                              line.topaddr, as);
+    }
+out:
+    rom_transaction_end(total_len != -1);
+    g_free(line.bufptr);
+    return total_len;
+}
+
+/* return size or -1 if error */
+int load_targphys_srec_as(const char *filename, hwaddr *entry, AddressSpace *as)
+{
+    gsize hex_blob_size;
+    gchar *hex_blob;
+    int total_size = 0;
+
+    if (!g_file_get_contents(filename, &hex_blob, &hex_blob_size, NULL)) {
+        return -1;
+    }
+
+    total_size = parse_srec_blob(filename, entry, (uint8_t *)hex_blob,
+                                 hex_blob_size, as);
+
+    g_free(hex_blob);
+    return total_size;
+}
-- 
2.20.1


