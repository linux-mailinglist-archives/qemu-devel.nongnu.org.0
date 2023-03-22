Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D996C4D79
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:22:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezM2-0008Dx-Ik; Wed, 22 Mar 2023 10:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pezM0-0008By-8g
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:22:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pezLy-0007QL-DP
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:22:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679494933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ovx8Bzs5alJDuN+08tHto3LmtzPDrLlRmmuw63sCws=;
 b=LbFJfOtFr51SkBpHIRLXNQ/ogxhOrC41sbImK8Ps9F67S+1N2nWcJSkjsOVT+Tg9MwS8kh
 61dexYS57jX2P39qd3Tq1aP8E4c54cWXzhUAF1kItHNn5/MlsoyYv3iLKjoQi6xWPNVPaM
 1qpLGA/KoisxIkTzzsrONn+3bW/rZDc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-7PEo0BQbPIGORP0xyJpnuA-1; Wed, 22 Mar 2023 10:22:12 -0400
X-MC-Unique: 7PEo0BQbPIGORP0xyJpnuA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D053185A7A2;
 Wed, 22 Mar 2023 14:22:12 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.226.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DF8940C6E67;
 Wed, 22 Mar 2023 14:22:09 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, fmartine@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, eballetb@redhat.com,
 Albert Esteve <aesteve@redhat.com>, alex.bennee@linaro.org,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 sgarzare@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 peter.griffin@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 12/12] Add support for v4l2_memory_dmabuf
Date: Wed, 22 Mar 2023 15:21:32 +0100
Message-Id: <20230322142132.22909-13-aesteve@redhat.com>
In-Reply-To: <20230322142132.22909-1-aesteve@redhat.com>
References: <20230322142132.22909-1-aesteve@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=aesteve@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Support VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT feature,
by importing DMA buffers using the v4l2 API.

In this patch, we do not import the buffer from
any other virtio device, but just create a DMA
buffer through udmabuf, and import it.

However, in preparation for the case where we
actually share buffers between different devices, we
store the UUID and keep buffers associated to them
in a hash table.

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 tools/vhost-user-video/v4l2_backend.c     | 118 +++++++++++++++++++---
 tools/vhost-user-video/v4l2_backend.h     |   9 +-
 tools/vhost-user-video/vhost-user-video.c |  34 ++++---
 3 files changed, 131 insertions(+), 30 deletions(-)

diff --git a/tools/vhost-user-video/v4l2_backend.c b/tools/vhost-user-video/v4l2_backend.c
index 2f5825a733..e7c03a1c70 100644
--- a/tools/vhost-user-video/v4l2_backend.c
+++ b/tools/vhost-user-video/v4l2_backend.c
@@ -888,11 +888,55 @@ int video_streamoff(struct stream *s, enum v4l2_buf_type type)
     return ret;
 }
 
+int v4l2_dmabuf_lookup_mplane(struct vuvbm_device *dev,
+                              struct resource *res,
+                              unsigned int iov_cnt)
+{
+    struct VuVideoDMABuf *buf = vuvbm_lookup(dev, res->uuid);
+    if (!buf) {
+        g_debug("Buffer not found. Creating.");
+        res->buf = g_malloc0(sizeof(struct VuVideoDMABuf) * iov_cnt);
+        for (int i = 0; i < iov_cnt; i++) {
+            if (!vuvbm_buffer_create(dev, &res->buf[i], res->iov[i].iov_len)) {
+                return -1;
+            }
+        }
+        g_debug("Inserting buffer into the table.");
+        g_hash_table_insert(dev->resource_uuids, res->buf, &res->uuid);
+    } else {
+        res->buf = buf;
+        g_debug("Buffer found.");
+    }
+
+    return 0;
+}
+
+int v4l2_dmabuf_lookup(struct vuvbm_device *dev,
+                       struct resource *res,
+                       unsigned int iov_len)
+{
+    struct VuVideoDMABuf *buf = vuvbm_lookup(dev, res->uuid);
+    if (!buf) {
+        g_debug("Buffer not found. Creating.");
+        res->buf = g_new0(struct VuVideoDMABuf, 1);
+        if (!vuvbm_buffer_create(dev, res->buf, iov_len)) {
+            return -1;
+        }
+        g_debug("Inserting buffer into the table.");
+        g_hash_table_insert(dev->resource_uuids, res->buf, &res->uuid);
+    } else {
+        res->buf = buf;
+        g_debug("Buffer found.");
+    }
+
+    return 0;
+}
+
 int v4l2_queue_buffer(enum v4l2_buf_type type,
                       enum v4l2_memory memory,
                       struct virtio_video_resource_queue *qcmd,
                       struct resource *res, struct stream *s,
-                      struct v4l2_device *dev)
+                      struct v4l2_device *dev, struct vuvbm_device *bm_dev)
 {
     struct v4l2_buffer vbuf;
     int ret = 0;
@@ -911,22 +955,64 @@ int v4l2_queue_buffer(enum v4l2_buf_type type,
 
     convert_to_timeval(le64toh(qcmd->timestamp), &vbuf.timestamp);
 
-    if (V4L2_TYPE_IS_MULTIPLANAR(type)) {
-        /* for mplane length field is number of elements in planes array */
-        vbuf.length = res->vio_resource.num_planes;
-        vbuf.m.planes = g_malloc0(sizeof(struct v4l2_plane)
-                                  * res->vio_resource.num_planes);
+    if (memory == V4L2_MEMORY_USERPTR) {
+        if (V4L2_TYPE_IS_MULTIPLANAR(type)) {
+            /* for mplane length field is number of elements in planes array */
+            vbuf.length = res->vio_resource.num_planes;
+            vbuf.m.planes = g_malloc0(sizeof(struct v4l2_plane)
+                                    * res->vio_resource.num_planes);
 
-        for (int i = 0; i < vbuf.length; i++) {
-            vbuf.m.planes[i].m.userptr = (unsigned long)res->iov[i].iov_base;
-            vbuf.m.planes[i].length = (unsigned long)res->iov[i].iov_len;
+            for (int i = 0; i < vbuf.length; i++) {
+                vbuf.m.planes[i].m.userptr =
+                    (unsigned long)res->iov[i].iov_base;
+                vbuf.m.planes[i].length = (unsigned long)res->iov[i].iov_len;
+            }
+        } else {
+            assert(res->iov != NULL);
+            vbuf.m.userptr = (unsigned long)res->iov[0].iov_base;
+            vbuf.length = res->iov[0].iov_len;
+            g_debug("%s: iov_base = 0x%p", __func__, res->iov[0].iov_base);
+            g_debug("%s: iov_len = 0x%lx", __func__, res->iov[0].iov_len);
+        }
+    } else {
+        assert(memory == V4L2_MEMORY_DMABUF);
+        if (V4L2_TYPE_IS_MULTIPLANAR(type)) {
+            vbuf.length = res->vio_resource.num_planes;
+            vbuf.m.planes = g_malloc0(sizeof(struct v4l2_plane) * vbuf.length);
+            if (!res->buf) {
+                ret = v4l2_dmabuf_lookup_mplane(bm_dev, res, vbuf.length);
+                if (ret < 0) {
+                    g_warning("Buffer create failed.");
+                    return ret;
+                }
+            }
+
+            for (int i = 0; i < vbuf.length; i++) {
+                vbuf.m.planes[i].m.fd = res->buf->dev->get_fd(&res->buf[i]);
+                vbuf.m.planes[i].length = (unsigned long)res->iov[i].iov_len;
+                /* Copy virtio shared memory contents to DMA buffer */
+                memcpy(res->buf[i].start,
+                       res->iov[i].iov_base, res->iov[i].iov_len);
+            }
+        } else {
+            if (!res->buf) {
+                ret = ioctl(fd, VIDIOC_QUERYBUF, &vbuf);
+                if (ret == -EINVAL) {
+                    g_printerr("VIDIOC_QUERYBUF failed: %s (%d)\n",
+                               g_strerror(errno), errno);
+                    return ret;
+                }
+
+                ret = v4l2_dmabuf_lookup(bm_dev, res, vbuf.length);
+                if (ret < 0) {
+                    g_warning("Buffer create failed.");
+                    return ret;
+                }
+            }
+            vbuf.m.fd = res->buf->dev->get_fd(res->buf);
+            /* Copy virtio shared memory contents to DMA buffer */
+            memcpy(res->buf->start, res->iov[0].iov_base, res->iov[0].iov_len);
         }
-    } else if (res->iov != NULL) {
-        /* m is a union of userptr, *planes and fd */
-        vbuf.m.userptr = (unsigned long)res->iov[0].iov_base;
-        vbuf.length = res->iov[0].iov_len;
-        g_debug("%s: iov_base = 0x%p", __func__, res->iov[0].iov_base);
-        g_debug("%s: iov_len = 0x%lx", __func__, res->iov[0].iov_len);
     }
 
     if (V4L2_TYPE_IS_OUTPUT(type)) {
@@ -979,7 +1065,7 @@ int v4l2_dequeue_buffer(int fd, enum v4l2_buf_type type,
     memset(&vbuf, 0, sizeof(vbuf));
 
     vbuf.type = type;
-    vbuf.memory =  memory;
+    vbuf.memory = memory;
 
     vbuf.field = V4L2_FIELD_NONE;
     vbuf.flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
diff --git a/tools/vhost-user-video/v4l2_backend.h b/tools/vhost-user-video/v4l2_backend.h
index ef9a5f0337..05409e03d4 100644
--- a/tools/vhost-user-video/v4l2_backend.h
+++ b/tools/vhost-user-video/v4l2_backend.h
@@ -69,11 +69,18 @@ int v4l2_video_set_format(int fd, enum v4l2_buf_type type,
 int v4l2_set_pixel_format(int fd, enum v4l2_buf_type buf_type,
                           uint32_t pixelformat);
 
+int v4l2_dmabuf_lookup_mplane(struct vuvbm_device *dev,
+                              struct resource *res,
+                              unsigned int iov_cnt);
+int v4l2_dmabuf_lookup(struct vuvbm_device *dev,
+                       struct resource *res,
+                       unsigned int iov_len);
 int v4l2_queue_buffer(enum v4l2_buf_type type,
                       enum v4l2_memory memory,
                       struct virtio_video_resource_queue *qcmd,
                       struct resource *res, struct stream *s,
-                      struct v4l2_device *dev);
+                      struct v4l2_device *dev,
+                      struct vuvbm_device *bm_dev);
 int v4l2_dequeue_buffer(int fd, enum v4l2_buf_type type,
                         enum v4l2_memory memory,
                         struct stream *s);
diff --git a/tools/vhost-user-video/vhost-user-video.c b/tools/vhost-user-video/vhost-user-video.c
index cee81c69c3..14c8f42c52 100644
--- a/tools/vhost-user-video/vhost-user-video.c
+++ b/tools/vhost-user-video/vhost-user-video.c
@@ -391,6 +391,9 @@ void remove_all_resources(struct stream *s, uint32_t queue_type)
 
             /* free resource memory allocated in resource_create() */
             g_free(r->iov);
+            if (r->buf != NULL) {
+                vuvbm_buffer_destroy(r->buf);
+            }
             g_free(r);
             *resource_list = g_list_delete_link(*resource_list, l);
         }
@@ -880,10 +883,16 @@ handle_resource_create_cmd(struct VuVideo *v,
         res->iov_count = total_entries;
     } break;
     case VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT:
-        g_critical("%s: VIRTIO_OBJECT not implemented!", __func__);
-        /* TODO implement VIRTIO_OBJECT support */
-        cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
-        goto out_unlock;
+    {
+        struct virtio_video_object_entry *ent;
+        ent = (void *)cmd + sizeof(struct virtio_video_resource_create);
+
+        memcpy(&res->uuid, ent->uuid, sizeof(ent->uuid));
+        g_debug("%s: create resource uuid(%s)",
+                __func__, qemu_uuid_unparse_strdup(&res->uuid));
+
+        vuvbm_init_device(v->bm_dev);
+    } break;
     }
 
     cmd->hdr.type = VIRTIO_VIDEO_RESP_OK_NODATA;
@@ -974,7 +983,7 @@ handle_resource_queue_cmd(struct VuVideo *v,
         get_queue_mem_type(s, cmd->queue_type);
     enum v4l2_memory memory = get_v4l2_memory(mem_type);
 
-    ret = v4l2_queue_buffer(buf_type, memory, cmd, res, s, v->v4l2_dev);
+    ret = v4l2_queue_buffer(buf_type, memory, cmd, res, s, v->v4l2_dev, v->bm_dev);
     if (ret < 0) {
         g_critical("%s: v4l2_queue_buffer failed", __func__);
         /* virtio error set by v4l2_queue_buffer */
@@ -1064,12 +1073,7 @@ handle_stream_create_cmd(struct VuVideo *v,
     req_stream_id = cmd->hdr.stream_id;
     coded_format = le32toh(cmd->coded_format);
 
-    if ((le32toh(cmd->in_mem_type) == VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT) ||
-        (le32toh(cmd->out_mem_type) == VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT)) {
-        /* TODO implement VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT */
-        g_printerr("%s: MEM_TYPE_VIRTIO_OBJECT not supported yet", __func__);
-        cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
-    } else if (find_stream(v, req_stream_id)) {
+    if (find_stream(v, req_stream_id)) {
         g_debug("%s: Stream ID in use - ", __func__);
         cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_STREAM_ID;
     } else {
@@ -1212,7 +1216,6 @@ handle_stream_destroy_cmd(struct VuVideo *v,
 
         buftype = s->has_mplane ? V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE :
             V4L2_BUF_TYPE_VIDEO_CAPTURE;
-
         mem_type = get_queue_mem_type(s, VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT);
         video_free_buffers(s->fd, buftype, get_v4l2_memory(mem_type));
         remove_all_resources(s, VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT);
@@ -1644,7 +1647,7 @@ static void video_destroy(VuVideo *v)
     if (socket_path) {
         unlink(socket_path);
     }
-
+    vuvbm_device_destroy(v->bm_dev);
     v4l2_backend_free(v->v4l2_dev);
 }
 
@@ -1717,6 +1720,11 @@ int main(int argc, char *argv[])
         }
     }
 
+    /*
+     * Create a new Buffer Memory device to handle DMA buffers.
+     */
+    video.bm_dev = g_new0(struct vuvbm_device, 1);
+
     /*
      * Now create a vhost-user socket that we will receive messages
      * on. Once we have our handler set up we can enter the glib main
-- 
2.39.2


