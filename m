Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEED76B3C4F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:33:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paa2E-0007fV-4X; Fri, 10 Mar 2023 05:31:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1paa2A-0007cV-OC; Fri, 10 Mar 2023 05:31:34 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1paa27-0004Io-JC; Fri, 10 Mar 2023 05:31:34 -0500
Received: by mail-pl1-x635.google.com with SMTP id ky4so5102518plb.3;
 Fri, 10 Mar 2023 02:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678444289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Egne3Xn+oSeQ2rsp/8Pj9qHVB+Me/dYC0IpKLswZwnw=;
 b=VlVJQwvRO1blO7ij9D6jLCPzfPO1QFCDuYlDo58FhS8iA2vzyfznlNg6POaEo31SyU
 EYPORg/sqz1vvypZPErVpJ3pQBqVPk+VHm5HLTEQQpswDwKT0QHAxc8VHoxvDg0jbxqm
 U3qJRqVqWNIxYUCNj9FFIdI/xl9OeD6+357SuDw/SYzvmwIe3N3J2WvD3jn/CuvUXPyQ
 EfCCliH2rYouweKmvf2KAZ+ZIHaNvy2vxb7+FoQ17dxgR3xSnSECKG5FqY4m1g4Rbqxn
 6IULp1G0TxWf72IRb6Qtn5QU5gSzdiSbH5uO6Y0v/y6/hoTHwjhAxmp/YA81Au2/jWaD
 zBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678444289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Egne3Xn+oSeQ2rsp/8Pj9qHVB+Me/dYC0IpKLswZwnw=;
 b=ggtyW2pH9NzrGyGVWUF5H+aOrbMU8lJFwoDm2ibCsRtH/poiAA19P92nJIPXaW4a3w
 GubjkaSKdUzjEnRdMc7TRPFgabV7arkAXEK7sJAGW2wAayBOSgM4tD3a/nxJmS6J+LZw
 PisXyDGuYpLSZhACr4041QolR14iQqr+hIBOjiAyvtBe8JVUk1eBvWGkMcOewU/Sr4i4
 fEHBcJEEV3byHe55ZuntbxuDTJ1exyUOdDhr+nXvgLVbVCRSfrmXgKrSouLFD5lFASAz
 SYvfq0xU/5H9Relizx0Y1ReyLbYX06937DvGZq3JNdGLRrHW8AjNoAPxfJNn1FrvO212
 7Ktg==
X-Gm-Message-State: AO0yUKV35FP+QCR0NJAXKrCoEnOIS7ckF8cx8AcKXuATak1WMDbXqKDM
 t2dWACbk/EtbYdkWWdZ6kK/euWHj+0jh648CSiI=
X-Google-Smtp-Source: AK7set9Mb6LUSdQDnYXt04q6r0gEjFf4U1DtgV4AiECbsrMGDdZiUG4PKfgmTa/uf2vY8n5WJPMO7A==
X-Received: by 2002:a17:902:ce92:b0:19e:27a1:dd94 with SMTP id
 f18-20020a170902ce9200b0019e27a1dd94mr30742102plg.35.1678444288838; 
 Fri, 10 Mar 2023 02:31:28 -0800 (PST)
Received: from fedlinux.. ([106.84.129.9]) by smtp.gmail.com with ESMTPSA id
 ke15-20020a170903340f00b0019a96d3b456sm1146930plb.44.2023.03.10.02.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 02:31:28 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 dmitry.fomichev@wdc.com, qemu-block@nongnu.org, stefanha@redhat.com,
 hare@suse.de, Julia Suvorova <jusual@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 damien.lemoal@opensource.wdc.com, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v6 4/4] block: add some trace events for zone append
Date: Fri, 10 Mar 2023 18:31:06 +0800
Message-Id: <20230310103106.62124-5-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310103106.62124-1-faithilikerun@gmail.com>
References: <20230310103106.62124-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/file-posix.c | 3 +++
 block/trace-events | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index 2ba9174778..5187f810e5 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2489,6 +2489,8 @@ out:
             if (!BDRV_ZT_IS_CONV(wps->wp[index])) {
                 if (type & QEMU_AIO_ZONE_APPEND) {
                     *s->offset = wps->wp[index];
+                    trace_zbd_zone_append_complete(bs, *s->offset
+                        >> BDRV_SECTOR_BITS);
                 }
                 /* Advance the wp if needed */
                 if (offset + bytes > wps->wp[index]) {
@@ -3537,6 +3539,7 @@ static int coroutine_fn raw_co_zone_append(BlockDriverState *bs,
         len += iov_len;
     }
 
+    trace_zbd_zone_append(bs, *offset >> BDRV_SECTOR_BITS);
     return raw_co_prw(bs, *offset, len, qiov, QEMU_AIO_ZONE_APPEND);
 }
 #endif
diff --git a/block/trace-events b/block/trace-events
index 3f4e1d088a..32665158d6 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -211,6 +211,8 @@ file_hdev_is_sg(int type, int version) "SG device found: type=%d, version=%d"
 file_flush_fdatasync_failed(int err) "errno %d"
 zbd_zone_report(void *bs, unsigned int nr_zones, int64_t sector) "bs %p report %d zones starting at sector offset 0x%" PRIx64 ""
 zbd_zone_mgmt(void *bs, const char *op_name, int64_t sector, int64_t len) "bs %p %s starts at sector offset 0x%" PRIx64 " over a range of 0x%" PRIx64 " sectors"
+zbd_zone_append(void *bs, int64_t sector) "bs %p append at sector offset 0x%" PRIx64 ""
+zbd_zone_append_complete(void *bs, int64_t sector) "bs %p returns append sector 0x%" PRIx64 ""
 
 # ssh.c
 sftp_error(const char *op, const char *ssh_err, int ssh_err_code, int sftp_err_code) "%s failed: %s (libssh error code: %d, sftp error code: %d)"
-- 
2.39.2


