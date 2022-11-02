Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52579616839
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:17:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGIN-0002ij-CK; Wed, 02 Nov 2022 12:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGIL-0002gb-NF
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:08:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGIJ-00025D-2d
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:08:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VwWAWRnxkBakriXefzVLoQcCxrUiRGZihrZVHldklfk=;
 b=XOZqxBr6RARDGi6CqoHFBJ8Qtr5VGcHTIks7Pj9JEoHhqYps43wiJg2znH+D87ynbDF4Zi
 rZeUW/bzJ+DaKd2Ac4OTFMfBx6DQiTAAhNyUR7J+QEYKF8NxCBatIWCF8yszVGFSUhMPtz
 DhJ1cNQrUaBm0EkezY4HGzegSfyUOE0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-149-D5yEUTGzMQqJ7X2TN1IpbQ-1; Wed, 02 Nov 2022 12:08:44 -0400
X-MC-Unique: D5yEUTGzMQqJ7X2TN1IpbQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 v12-20020adfa1cc000000b00236eaee7197so1261880wrv.0
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VwWAWRnxkBakriXefzVLoQcCxrUiRGZihrZVHldklfk=;
 b=k6NRRIve8bXheeBXUq4Q+apJg+BvTC2EEGDP8i4nPkTRkUc3C6XJZVEAXvPE86Lgty
 EM8g/DFahQQSoPcPI0hjXadAHLaVORePVkUPFcoeW99C19lUSZN3iMVePmIbs91cf7FU
 2qjCoBQ4738QLBSXaowUWiqQHG4IHJoMqmoIrbByewVG9WRK0aVdA7ywNWcP3W9OPrpi
 KfkpfKuohCporZNb51V9U4NyBESuuY77IPaE0Lav3FWfPhHEjbHazHVJl2JwwIClDUm6
 cyebm/aT37O60AGsFpUs9zOhtuRrgpxZnEZtKd5lFbCRptecary9jYPpKEGoouByhixF
 xuRw==
X-Gm-Message-State: ACrzQf3VoTPYZEcWz9uQstseTPnASZ2/oPsps/klyRq485zcwNlg/klu
 N3sOOtEz4x5AYc2boU7FzTaO8h6+GgvX+q/zKwKbk+qRn3f8vfOWs3TTndfn4aFIzae64XYC7+I
 2ey6j8qcUnbRQXv/2Fk0BkIJWUYaRa3mXRTcq4pyTZ9C9xpODEwWvIQy1dZSs
X-Received: by 2002:a5d:4b90:0:b0:236:702f:2093 with SMTP id
 b16-20020a5d4b90000000b00236702f2093mr16545835wrt.577.1667405323250; 
 Wed, 02 Nov 2022 09:08:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4LfndPrMNOfbOIOYS0I6NyjwruWl7IadnpYZNBngy3CmSGHxvB1/6Mo1e5TyHUIn4Ww95fvg==
X-Received: by 2002:a5d:4b90:0:b0:236:702f:2093 with SMTP id
 b16-20020a5d4b90000000b00236702f2093mr16545775wrt.577.1667405322729; 
 Wed, 02 Nov 2022 09:08:42 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 e11-20020adfa44b000000b0023655e51c33sm13263446wra.4.2022.11.02.09.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:08:42 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:08:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lei He <helei.sig11@bytedance.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL v2 10/82] cryptodev: Add a lkcf-backend for cryptodev
Message-ID: <20221102160336.616599-11-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Lei He <helei.sig11@bytedance.com>

cryptodev: Added a new type of backend named lkcf-backend for
cryptodev. This backend upload asymmetric keys to linux kernel,
and let kernel do the accelerations if possible.
The lkcf stands for Linux Kernel Cryptography Framework.

Signed-off-by: lei he <helei.sig11@bytedance.com>
Message-Id: <20221008085030.70212-5-helei.sig11@bytedance.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 qapi/qom.json              |   2 +
 include/sysemu/cryptodev.h |   1 +
 backends/cryptodev-lkcf.c  | 645 +++++++++++++++++++++++++++++++++++++
 backends/meson.build       |   3 +
 4 files changed, 651 insertions(+)
 create mode 100644 backends/cryptodev-lkcf.c

diff --git a/qapi/qom.json b/qapi/qom.json
index 87fcad2423..d2e0244e57 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -876,6 +876,7 @@
     'colo-compare',
     'cryptodev-backend',
     'cryptodev-backend-builtin',
+    'cryptodev-backend-lkcf',
     { 'name': 'cryptodev-vhost-user',
       'if': 'CONFIG_VHOST_CRYPTO' },
     'dbus-vmstate',
@@ -944,6 +945,7 @@
       'colo-compare':               'ColoCompareProperties',
       'cryptodev-backend':          'CryptodevBackendProperties',
       'cryptodev-backend-builtin':  'CryptodevBackendProperties',
+      'cryptodev-backend-lkcf':     'CryptodevBackendProperties',
       'cryptodev-vhost-user':       { 'type': 'CryptodevVhostUserProperties',
                                       'if': 'CONFIG_VHOST_CRYPTO' },
       'dbus-vmstate':               'DBusVMStateProperties',
diff --git a/include/sysemu/cryptodev.h b/include/sysemu/cryptodev.h
index 32e9f4cf8a..cf9b3f07fe 100644
--- a/include/sysemu/cryptodev.h
+++ b/include/sysemu/cryptodev.h
@@ -219,6 +219,7 @@ typedef enum CryptoDevBackendOptionsType {
     CRYPTODEV_BACKEND_TYPE_NONE = 0,
     CRYPTODEV_BACKEND_TYPE_BUILTIN = 1,
     CRYPTODEV_BACKEND_TYPE_VHOST_USER = 2,
+    CRYPTODEV_BACKEND_TYPE_LKCF = 3,
     CRYPTODEV_BACKEND_TYPE__MAX,
 } CryptoDevBackendOptionsType;
 
diff --git a/backends/cryptodev-lkcf.c b/backends/cryptodev-lkcf.c
new file mode 100644
index 0000000000..133bd706a4
--- /dev/null
+++ b/backends/cryptodev-lkcf.c
@@ -0,0 +1,645 @@
+/*
+ * QEMU Cryptodev backend for QEMU cipher APIs
+ *
+ * Copyright (c) 2022 Bytedance.Inc
+ *
+ * Authors:
+ *    lei he <helei.sig11@bytedance.com>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "crypto/cipher.h"
+#include "crypto/akcipher.h"
+#include "qapi/error.h"
+#include "qemu/main-loop.h"
+#include "qemu/thread.h"
+#include "qemu/error-report.h"
+#include "qemu/queue.h"
+#include "qom/object.h"
+#include "sysemu/cryptodev.h"
+#include "standard-headers/linux/virtio_crypto.h"
+
+#include <keyutils.h>
+#include <sys/eventfd.h>
+
+/**
+ * @TYPE_CRYPTODEV_BACKEND_LKCF:
+ * name of backend that uses linux kernel crypto framework
+ */
+#define TYPE_CRYPTODEV_BACKEND_LKCF "cryptodev-backend-lkcf"
+
+OBJECT_DECLARE_SIMPLE_TYPE(CryptoDevBackendLKCF, CRYPTODEV_BACKEND_LKCF)
+
+#define INVALID_KEY_ID -1
+#define MAX_SESSIONS 256
+#define NR_WORKER_THREAD 64
+
+#define KCTL_KEY_TYPE_PKEY "asymmetric"
+/**
+ * Here the key is uploaded to the thread-keyring of worker thread, at least
+ * util linux-6.0:
+ * 1. process keyring seems to behave unexpectedly if main-thread does not
+ * create the keyring before creating any other thread.
+ * 2. at present, the guest kernel never perform multiple operations on a
+ * session.
+ * 3. it can reduce the load of the main-loop because the key passed by the
+ * guest kernel has been already checked.
+ */
+#define KCTL_KEY_RING KEY_SPEC_THREAD_KEYRING
+
+typedef struct CryptoDevBackendLKCFSession {
+    uint8_t *key;
+    size_t keylen;
+    QCryptoAkCipherKeyType keytype;
+    QCryptoAkCipherOptions akcipher_opts;
+} CryptoDevBackendLKCFSession;
+
+typedef struct CryptoDevBackendLKCF CryptoDevBackendLKCF;
+typedef struct CryptoDevLKCFTask CryptoDevLKCFTask;
+struct CryptoDevLKCFTask {
+    CryptoDevBackendLKCFSession *sess;
+    CryptoDevBackendOpInfo *op_info;
+    CryptoDevCompletionFunc cb;
+    void *opaque;
+    int status;
+    CryptoDevBackendLKCF *lkcf;
+    QSIMPLEQ_ENTRY(CryptoDevLKCFTask) queue;
+};
+
+typedef struct CryptoDevBackendLKCF {
+    CryptoDevBackend parent_obj;
+    CryptoDevBackendLKCFSession *sess[MAX_SESSIONS];
+    QSIMPLEQ_HEAD(, CryptoDevLKCFTask) requests;
+    QSIMPLEQ_HEAD(, CryptoDevLKCFTask) responses;
+    QemuMutex mutex;
+    QemuCond cond;
+    QemuMutex rsp_mutex;
+
+    /**
+     * There is no async interface for asymmetric keys like AF_ALG sockets,
+     * we don't seem to have better way than create a lots of thread.
+     */
+    QemuThread worker_threads[NR_WORKER_THREAD];
+    bool running;
+    int eventfd;
+} CryptoDevBackendLKCF;
+
+static void *cryptodev_lkcf_worker(void *arg);
+static int cryptodev_lkcf_close_session(CryptoDevBackend *backend,
+                                        uint64_t session_id,
+                                        uint32_t queue_index,
+                                        CryptoDevCompletionFunc cb,
+                                        void *opaque);
+
+static void cryptodev_lkcf_handle_response(void *opaque)
+{
+    CryptoDevBackendLKCF *lkcf = (CryptoDevBackendLKCF *)opaque;
+    QSIMPLEQ_HEAD(, CryptoDevLKCFTask) responses;
+    CryptoDevLKCFTask *task, *next;
+    eventfd_t nevent;
+
+    QSIMPLEQ_INIT(&responses);
+    eventfd_read(lkcf->eventfd, &nevent);
+
+    qemu_mutex_lock(&lkcf->rsp_mutex);
+    QSIMPLEQ_PREPEND(&responses, &lkcf->responses);
+    qemu_mutex_unlock(&lkcf->rsp_mutex);
+
+    QSIMPLEQ_FOREACH_SAFE(task, &responses, queue, next) {
+        if (task->cb) {
+            task->cb(task->opaque, task->status);
+        }
+        g_free(task);
+    }
+}
+
+static int cryptodev_lkcf_set_op_desc(QCryptoAkCipherOptions *opts,
+                                      char *key_desc,
+                                      size_t desc_len,
+                                      Error **errp)
+{
+    QCryptoAkCipherOptionsRSA *rsa_opt;
+    if (opts->alg != QCRYPTO_AKCIPHER_ALG_RSA) {
+        error_setg(errp, "Unsupported alg: %u", opts->alg);
+        return -1;
+    }
+
+    rsa_opt = &opts->u.rsa;
+    if (rsa_opt->padding_alg == QCRYPTO_RSA_PADDING_ALG_PKCS1) {
+        snprintf(key_desc, desc_len, "enc=%s hash=%s",
+                 QCryptoRSAPaddingAlgorithm_str(rsa_opt->padding_alg),
+                 QCryptoHashAlgorithm_str(rsa_opt->hash_alg));
+
+    } else {
+        snprintf(key_desc, desc_len, "enc=%s",
+                 QCryptoRSAPaddingAlgorithm_str(rsa_opt->padding_alg));
+    }
+    return 0;
+}
+
+static int cryptodev_lkcf_set_rsa_opt(int virtio_padding_alg,
+                                      int virtio_hash_alg,
+                                      QCryptoAkCipherOptionsRSA *opt,
+                                      Error **errp)
+{
+    if (virtio_padding_alg == VIRTIO_CRYPTO_RSA_PKCS1_PADDING) {
+        opt->padding_alg = QCRYPTO_RSA_PADDING_ALG_PKCS1;
+
+        switch (virtio_hash_alg) {
+        case VIRTIO_CRYPTO_RSA_MD5:
+            opt->hash_alg = QCRYPTO_HASH_ALG_MD5;
+            break;
+
+        case VIRTIO_CRYPTO_RSA_SHA1:
+            opt->hash_alg = QCRYPTO_HASH_ALG_SHA1;
+            break;
+
+        case VIRTIO_CRYPTO_RSA_SHA256:
+            opt->hash_alg = QCRYPTO_HASH_ALG_SHA256;
+            break;
+
+        case VIRTIO_CRYPTO_RSA_SHA512:
+            opt->hash_alg = QCRYPTO_HASH_ALG_SHA512;
+            break;
+
+        default:
+            error_setg(errp, "Unsupported rsa hash algo: %d", virtio_hash_alg);
+            return -1;
+        }
+        return 0;
+    }
+
+    if (virtio_padding_alg == VIRTIO_CRYPTO_RSA_RAW_PADDING) {
+        opt->padding_alg = QCRYPTO_RSA_PADDING_ALG_RAW;
+        return 0;
+    }
+
+    error_setg(errp, "Unsupported rsa padding algo: %u", virtio_padding_alg);
+    return -1;
+}
+
+static int cryptodev_lkcf_get_unused_session_index(CryptoDevBackendLKCF *lkcf)
+{
+    size_t i;
+
+    for (i = 0; i < MAX_SESSIONS; i++) {
+        if (lkcf->sess[i] == NULL) {
+            return i;
+        }
+    }
+    return -1;
+}
+
+static void cryptodev_lkcf_init(CryptoDevBackend *backend, Error **errp)
+{
+    /* Only support one queue */
+    int queues = backend->conf.peers.queues, i;
+    CryptoDevBackendClient *cc;
+    CryptoDevBackendLKCF *lkcf =
+        CRYPTODEV_BACKEND_LKCF(backend);
+
+    if (queues != 1) {
+        error_setg(errp,
+                   "Only support one queue in cryptodev-builtin backend");
+        return;
+    }
+    lkcf->eventfd = eventfd(0, 0);
+    if (lkcf->eventfd < 0) {
+        error_setg(errp, "Failed to create eventfd: %d", errno);
+        return;
+    }
+
+    cc = cryptodev_backend_new_client("cryptodev-lkcf", NULL);
+    cc->info_str = g_strdup_printf("cryptodev-lkcf0");
+    cc->queue_index = 0;
+    cc->type = CRYPTODEV_BACKEND_TYPE_LKCF;
+    backend->conf.peers.ccs[0] = cc;
+
+    backend->conf.crypto_services =
+        1u << VIRTIO_CRYPTO_SERVICE_AKCIPHER;
+    backend->conf.akcipher_algo = 1u << VIRTIO_CRYPTO_AKCIPHER_RSA;
+    lkcf->running = true;
+
+    QSIMPLEQ_INIT(&lkcf->requests);
+    QSIMPLEQ_INIT(&lkcf->responses);
+    qemu_mutex_init(&lkcf->mutex);
+    qemu_mutex_init(&lkcf->rsp_mutex);
+    qemu_cond_init(&lkcf->cond);
+    for (i = 0; i < NR_WORKER_THREAD; i++) {
+        qemu_thread_create(&lkcf->worker_threads[i], "lkcf-worker",
+                           cryptodev_lkcf_worker, lkcf, 0);
+    }
+    qemu_set_fd_handler(
+        lkcf->eventfd, cryptodev_lkcf_handle_response, NULL, lkcf);
+    cryptodev_backend_set_ready(backend, true);
+}
+
+static void cryptodev_lkcf_cleanup(CryptoDevBackend *backend, Error **errp)
+{
+    CryptoDevBackendLKCF *lkcf = CRYPTODEV_BACKEND_LKCF(backend);
+    size_t i;
+    int queues = backend->conf.peers.queues;
+    CryptoDevBackendClient *cc;
+    CryptoDevLKCFTask *task, *next;
+
+    qemu_mutex_lock(&lkcf->mutex);
+    lkcf->running = false;
+    qemu_mutex_unlock(&lkcf->mutex);
+    qemu_cond_broadcast(&lkcf->cond);
+
+    close(lkcf->eventfd);
+    for (i = 0; i < NR_WORKER_THREAD; i++) {
+        qemu_thread_join(&lkcf->worker_threads[i]);
+    }
+
+    QSIMPLEQ_FOREACH_SAFE(task, &lkcf->requests, queue, next) {
+        if (task->cb) {
+            task->cb(task->opaque, task->status);
+        }
+        g_free(task);
+    }
+
+    QSIMPLEQ_FOREACH_SAFE(task, &lkcf->responses, queue, next) {
+        if (task->cb) {
+            task->cb(task->opaque, task->status);
+        }
+        g_free(task);
+    }
+
+    qemu_mutex_destroy(&lkcf->mutex);
+    qemu_cond_destroy(&lkcf->cond);
+    qemu_mutex_destroy(&lkcf->rsp_mutex);
+
+    for (i = 0; i < MAX_SESSIONS; i++) {
+        if (lkcf->sess[i] != NULL) {
+            cryptodev_lkcf_close_session(backend, i, 0, NULL, NULL);
+        }
+    }
+
+    for (i = 0; i < queues; i++) {
+        cc = backend->conf.peers.ccs[i];
+        if (cc) {
+            cryptodev_backend_free_client(cc);
+            backend->conf.peers.ccs[i] = NULL;
+        }
+    }
+
+    cryptodev_backend_set_ready(backend, false);
+}
+
+static void cryptodev_lkcf_execute_task(CryptoDevLKCFTask *task)
+{
+    CryptoDevBackendLKCFSession *session = task->sess;
+    CryptoDevBackendAsymOpInfo *asym_op_info;
+    bool kick = false;
+    int ret, status, op_code = task->op_info->op_code;
+    size_t p8info_len;
+    g_autofree uint8_t *p8info = NULL;
+    Error *local_error = NULL;
+    key_serial_t key_id = INVALID_KEY_ID;
+    char op_desc[64];
+    g_autoptr(QCryptoAkCipher) akcipher = NULL;
+
+    /**
+     * We only offload private key session:
+     * 1. currently, the Linux kernel can only accept public key wrapped
+     * with X.509 certificates, but unfortunately the cost of making a
+     * ceritificate with public key is too expensive.
+     * 2. generally, public key related compution is fast, just compute it with
+     * thread-pool.
+     */
+    if (session->keytype == QCRYPTO_AKCIPHER_KEY_TYPE_PRIVATE) {
+        if (qcrypto_akcipher_export_p8info(&session->akcipher_opts,
+                                           session->key, session->keylen,
+                                           &p8info, &p8info_len,
+                                           &local_error) != 0 ||
+            cryptodev_lkcf_set_op_desc(&session->akcipher_opts, op_desc,
+                                       sizeof(op_desc), &local_error) != 0) {
+            error_report_err(local_error);
+        } else {
+            key_id = add_key(KCTL_KEY_TYPE_PKEY, "lkcf-backend-priv-key",
+                             p8info, p8info_len, KCTL_KEY_RING);
+        }
+    }
+
+    if (key_id < 0) {
+        if (!qcrypto_akcipher_supports(&session->akcipher_opts)) {
+            status = -VIRTIO_CRYPTO_NOTSUPP;
+            goto out;
+        }
+        akcipher = qcrypto_akcipher_new(&session->akcipher_opts,
+                                        session->keytype,
+                                        session->key, session->keylen,
+                                        &local_error);
+        if (!akcipher) {
+            status = -VIRTIO_CRYPTO_ERR;
+            goto out;
+        }
+    }
+
+    asym_op_info = task->op_info->u.asym_op_info;
+    switch (op_code) {
+    case VIRTIO_CRYPTO_AKCIPHER_ENCRYPT:
+        if (key_id >= 0) {
+            ret = keyctl_pkey_encrypt(key_id, op_desc,
+                asym_op_info->src, asym_op_info->src_len,
+                asym_op_info->dst, asym_op_info->dst_len);
+        } else {
+            ret = qcrypto_akcipher_encrypt(akcipher,
+                asym_op_info->src, asym_op_info->src_len,
+                asym_op_info->dst, asym_op_info->dst_len, &local_error);
+        }
+        break;
+
+    case VIRTIO_CRYPTO_AKCIPHER_DECRYPT:
+        if (key_id >= 0) {
+            ret = keyctl_pkey_decrypt(key_id, op_desc,
+                asym_op_info->src, asym_op_info->src_len,
+                asym_op_info->dst, asym_op_info->dst_len);
+        } else {
+            ret = qcrypto_akcipher_decrypt(akcipher,
+                asym_op_info->src, asym_op_info->src_len,
+                asym_op_info->dst, asym_op_info->dst_len, &local_error);
+        }
+        break;
+
+    case VIRTIO_CRYPTO_AKCIPHER_SIGN:
+        if (key_id >= 0) {
+            ret = keyctl_pkey_sign(key_id, op_desc,
+                asym_op_info->src, asym_op_info->src_len,
+                asym_op_info->dst, asym_op_info->dst_len);
+        } else {
+            ret = qcrypto_akcipher_sign(akcipher,
+                asym_op_info->src, asym_op_info->src_len,
+                asym_op_info->dst, asym_op_info->dst_len, &local_error);
+        }
+        break;
+
+    case VIRTIO_CRYPTO_AKCIPHER_VERIFY:
+        if (key_id >= 0) {
+            ret = keyctl_pkey_verify(key_id, op_desc,
+                asym_op_info->src, asym_op_info->src_len,
+                asym_op_info->dst, asym_op_info->dst_len);
+        } else {
+            ret = qcrypto_akcipher_verify(akcipher,
+                asym_op_info->src, asym_op_info->src_len,
+                asym_op_info->dst, asym_op_info->dst_len, &local_error);
+        }
+        break;
+
+    default:
+        error_setg(&local_error, "Unknown opcode: %u", op_code);
+        status = -VIRTIO_CRYPTO_ERR;
+        goto out;
+    }
+
+    if (ret < 0) {
+        if (!local_error) {
+            if (errno != EKEYREJECTED) {
+                error_report("Failed do operation with keyctl: %d", errno);
+            }
+        } else {
+            error_report_err(local_error);
+        }
+        status = op_code == VIRTIO_CRYPTO_AKCIPHER_VERIFY ?
+            -VIRTIO_CRYPTO_KEY_REJECTED : -VIRTIO_CRYPTO_ERR;
+    } else {
+        status = VIRTIO_CRYPTO_OK;
+        asym_op_info->dst_len = ret;
+    }
+
+out:
+    if (key_id >= 0) {
+        keyctl_unlink(key_id, KCTL_KEY_RING);
+    }
+    task->status = status;
+
+    qemu_mutex_lock(&task->lkcf->rsp_mutex);
+    if (QSIMPLEQ_EMPTY(&task->lkcf->responses)) {
+        kick = true;
+    }
+    QSIMPLEQ_INSERT_TAIL(&task->lkcf->responses, task, queue);
+    qemu_mutex_unlock(&task->lkcf->rsp_mutex);
+
+    if (kick) {
+        eventfd_write(task->lkcf->eventfd, 1);
+    }
+}
+
+static void *cryptodev_lkcf_worker(void *arg)
+{
+    CryptoDevBackendLKCF *backend = (CryptoDevBackendLKCF *)arg;
+    CryptoDevLKCFTask *task;
+
+    for (;;) {
+        task = NULL;
+        qemu_mutex_lock(&backend->mutex);
+        while (backend->running && QSIMPLEQ_EMPTY(&backend->requests)) {
+            qemu_cond_wait(&backend->cond, &backend->mutex);
+        }
+        if (backend->running) {
+            task = QSIMPLEQ_FIRST(&backend->requests);
+            QSIMPLEQ_REMOVE_HEAD(&backend->requests, queue);
+        }
+        qemu_mutex_unlock(&backend->mutex);
+
+        /* stopped */
+        if (!task) {
+            break;
+        }
+        cryptodev_lkcf_execute_task(task);
+   }
+
+   return NULL;
+}
+
+static int cryptodev_lkcf_operation(
+    CryptoDevBackend *backend,
+    CryptoDevBackendOpInfo *op_info,
+    uint32_t queue_index,
+    CryptoDevCompletionFunc cb,
+    void *opaque)
+{
+    CryptoDevBackendLKCF *lkcf =
+        CRYPTODEV_BACKEND_LKCF(backend);
+    CryptoDevBackendLKCFSession *sess;
+    enum CryptoDevBackendAlgType algtype = op_info->algtype;
+    CryptoDevLKCFTask *task;
+
+    if (op_info->session_id >= MAX_SESSIONS ||
+        lkcf->sess[op_info->session_id] == NULL) {
+        error_report("Cannot find a valid session id: %" PRIu64 "",
+                     op_info->session_id);
+        return -VIRTIO_CRYPTO_INVSESS;
+    }
+
+    sess = lkcf->sess[op_info->session_id];
+    if (algtype != CRYPTODEV_BACKEND_ALG_ASYM) {
+        error_report("algtype not supported: %u", algtype);
+        return -VIRTIO_CRYPTO_NOTSUPP;
+    }
+
+    task = g_new0(CryptoDevLKCFTask, 1);
+    task->op_info = op_info;
+    task->cb = cb;
+    task->opaque = opaque;
+    task->sess = sess;
+    task->lkcf = lkcf;
+    task->status = -VIRTIO_CRYPTO_ERR;
+
+    qemu_mutex_lock(&lkcf->mutex);
+    QSIMPLEQ_INSERT_TAIL(&lkcf->requests, task, queue);
+    qemu_mutex_unlock(&lkcf->mutex);
+    qemu_cond_signal(&lkcf->cond);
+
+    return VIRTIO_CRYPTO_OK;
+}
+
+static int cryptodev_lkcf_create_asym_session(
+    CryptoDevBackendLKCF *lkcf,
+    CryptoDevBackendAsymSessionInfo *sess_info,
+    uint64_t *session_id)
+{
+    Error *local_error = NULL;
+    int index;
+    g_autofree CryptoDevBackendLKCFSession *sess =
+        g_new0(CryptoDevBackendLKCFSession, 1);
+
+    switch (sess_info->algo) {
+    case VIRTIO_CRYPTO_AKCIPHER_RSA:
+        sess->akcipher_opts.alg = QCRYPTO_AKCIPHER_ALG_RSA;
+        if (cryptodev_lkcf_set_rsa_opt(
+            sess_info->u.rsa.padding_algo, sess_info->u.rsa.hash_algo,
+            &sess->akcipher_opts.u.rsa, &local_error) != 0) {
+            error_report_err(local_error);
+            return -VIRTIO_CRYPTO_ERR;
+        }
+        break;
+
+    default:
+        error_report("Unsupported asym alg %u", sess_info->algo);
+        return -VIRTIO_CRYPTO_NOTSUPP;
+    }
+
+    switch (sess_info->keytype) {
+    case VIRTIO_CRYPTO_AKCIPHER_KEY_TYPE_PUBLIC:
+        sess->keytype = QCRYPTO_AKCIPHER_KEY_TYPE_PUBLIC;
+        break;
+
+    case VIRTIO_CRYPTO_AKCIPHER_KEY_TYPE_PRIVATE:
+        sess->keytype = QCRYPTO_AKCIPHER_KEY_TYPE_PRIVATE;
+        break;
+
+    default:
+        error_report("Unknown akcipher keytype: %u", sess_info->keytype);
+        return -VIRTIO_CRYPTO_ERR;
+    }
+
+    index = cryptodev_lkcf_get_unused_session_index(lkcf);
+    if (index < 0) {
+        error_report("Total number of sessions created exceeds %u",
+                     MAX_SESSIONS);
+        return -VIRTIO_CRYPTO_ERR;
+    }
+
+    sess->keylen = sess_info->keylen;
+    sess->key = g_malloc(sess_info->keylen);
+    memcpy(sess->key, sess_info->key, sess_info->keylen);
+
+    lkcf->sess[index] = g_steal_pointer(&sess);
+    *session_id = index;
+
+    return VIRTIO_CRYPTO_OK;
+}
+
+static int cryptodev_lkcf_create_session(
+    CryptoDevBackend *backend,
+    CryptoDevBackendSessionInfo *sess_info,
+    uint32_t queue_index,
+    CryptoDevCompletionFunc cb,
+    void *opaque)
+{
+    CryptoDevBackendAsymSessionInfo *asym_sess_info;
+    CryptoDevBackendLKCF *lkcf =
+        CRYPTODEV_BACKEND_LKCF(backend);
+    int ret;
+
+    switch (sess_info->op_code) {
+    case VIRTIO_CRYPTO_AKCIPHER_CREATE_SESSION:
+        asym_sess_info = &sess_info->u.asym_sess_info;
+        ret = cryptodev_lkcf_create_asym_session(
+            lkcf, asym_sess_info, &sess_info->session_id);
+        break;
+
+    default:
+        ret = -VIRTIO_CRYPTO_NOTSUPP;
+        error_report("Unsupported opcode: %" PRIu32 "",
+                     sess_info->op_code);
+        break;
+    }
+    if (cb) {
+        cb(opaque, ret);
+    }
+    return 0;
+}
+
+static int cryptodev_lkcf_close_session(CryptoDevBackend *backend,
+                                        uint64_t session_id,
+                                        uint32_t queue_index,
+                                        CryptoDevCompletionFunc cb,
+                                        void *opaque)
+{
+    CryptoDevBackendLKCF *lkcf = CRYPTODEV_BACKEND_LKCF(backend);
+    CryptoDevBackendLKCFSession *session;
+
+    assert(session_id < MAX_SESSIONS && lkcf->sess[session_id]);
+    session = lkcf->sess[session_id];
+    lkcf->sess[session_id] = NULL;
+
+    g_free(session->key);
+    g_free(session);
+
+    if (cb) {
+        cb(opaque, VIRTIO_CRYPTO_OK);
+    }
+    return 0;
+}
+
+static void cryptodev_lkcf_class_init(ObjectClass *oc, void *data)
+{
+    CryptoDevBackendClass *bc = CRYPTODEV_BACKEND_CLASS(oc);
+
+    bc->init = cryptodev_lkcf_init;
+    bc->cleanup = cryptodev_lkcf_cleanup;
+    bc->create_session = cryptodev_lkcf_create_session;
+    bc->close_session = cryptodev_lkcf_close_session;
+    bc->do_op = cryptodev_lkcf_operation;
+}
+
+static const TypeInfo cryptodev_builtin_info = {
+    .name = TYPE_CRYPTODEV_BACKEND_LKCF,
+    .parent = TYPE_CRYPTODEV_BACKEND,
+    .class_init = cryptodev_lkcf_class_init,
+    .instance_size = sizeof(CryptoDevBackendLKCF),
+};
+
+static void cryptodev_lkcf_register_types(void)
+{
+    type_register_static(&cryptodev_builtin_info);
+}
+
+type_init(cryptodev_lkcf_register_types);
diff --git a/backends/meson.build b/backends/meson.build
index b1884a88ec..954e658b25 100644
--- a/backends/meson.build
+++ b/backends/meson.build
@@ -12,6 +12,9 @@ softmmu_ss.add([files(
 softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files('rng-random.c'))
 softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files('hostmem-file.c'))
 softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files('hostmem-memfd.c'))
+if keyutils.found()
+    softmmu_ss.add(keyutils, files('cryptodev-lkcf.c'))
+endif
 if have_vhost_user
   softmmu_ss.add(when: 'CONFIG_VIRTIO', if_true: files('vhost-user.c'))
 endif
-- 
MST


