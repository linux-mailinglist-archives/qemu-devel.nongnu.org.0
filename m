Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B21A4CD9E9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:16:34 +0100 (CET)
Received: from localhost ([::1]:40512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBXd-0004Vp-Ey
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:16:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB6P-000648-Ly
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB6L-0007aQ-86
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tgCh0oZYaov+XsmoNfrodbop4GoB5WFzUJiVAL84S/c=;
 b=KrLWUNOrPCQIRVGEdOq43vjI/xGHYus1Me5X6voBnEgC9fu9/4BZ4TTp0GoEj4lMUISfmq
 1LOQ4jzsPMXNEfQq1dJfWC4upZQKdcNlPCk545jy/q5+ryQ+Ldhi3uc1YAaN6OtStMJOKm
 X3S8Os3sJranOPXFEHYh5Oj8or/cZMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-nK1fWNeQNQW98EXopOUU6A-1; Fri, 04 Mar 2022 11:48:15 -0500
X-MC-Unique: nK1fWNeQNQW98EXopOUU6A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D489800423;
 Fri,  4 Mar 2022 16:48:14 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 369958547D;
 Fri,  4 Mar 2022 16:48:13 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 38/50] block_int-common.h: split function pointers in
 BlockDriver
Date: Fri,  4 Mar 2022 17:46:59 +0100
Message-Id: <20220304164711.474713-39-kwolf@redhat.com>
In-Reply-To: <20220304164711.474713-1-kwolf@redhat.com>
References: <20220304164711.474713-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Similar to the header split, also the function pointers in BlockDriver
can be split in I/O and global state.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20220303151616.325444-26-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int-common.h | 445 ++++++++++++++++---------------
 1 file changed, 237 insertions(+), 208 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index b92e3630fd..f05ebb0da3 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -96,6 +96,11 @@ typedef struct BdrvTrackedRequest {
 
 
 struct BlockDriver {
+    /*
+     * These fields are initialized when this object is created,
+     * and are never changed afterwards.
+     */
+
     const char *format_name;
     int instance_size;
 
@@ -122,6 +127,69 @@ struct BlockDriver {
      */
     bool is_format;
 
+    /*
+     * Drivers not implementing bdrv_parse_filename nor bdrv_open should have
+     * this field set to true, except ones that are defined only by their
+     * child's bs.
+     * An example of the last type will be the quorum block driver.
+     */
+    bool bdrv_needs_filename;
+
+    /*
+     * Set if a driver can support backing files. This also implies the
+     * following semantics:
+     *
+     *  - Return status 0 of .bdrv_co_block_status means that corresponding
+     *    blocks are not allocated in this layer of backing-chain
+     *  - For such (unallocated) blocks, read will:
+     *    - fill buffer with zeros if there is no backing file
+     *    - read from the backing file otherwise, where the block layer
+     *      takes care of reading zeros beyond EOF if backing file is short
+     */
+    bool supports_backing;
+
+    bool has_variable_length;
+
+    /*
+     * Drivers setting this field must be able to work with just a plain
+     * filename with '<protocol_name>:' as a prefix, and no other options.
+     * Options may be extracted from the filename by implementing
+     * bdrv_parse_filename.
+     */
+    const char *protocol_name;
+
+    /* List of options for creating images, terminated by name == NULL */
+    QemuOptsList *create_opts;
+
+    /* List of options for image amend */
+    QemuOptsList *amend_opts;
+
+    /*
+     * If this driver supports reopening images this contains a
+     * NULL-terminated list of the runtime options that can be
+     * modified. If an option in this list is unspecified during
+     * reopen then it _must_ be reset to its default value or return
+     * an error.
+     */
+    const char *const *mutable_opts;
+
+    /*
+     * Pointer to a NULL-terminated array of names of strong options
+     * that can be specified for bdrv_open(). A strong option is one
+     * that changes the data of a BDS.
+     * If this pointer is NULL, the array is considered empty.
+     * "filename" and "driver" are always considered strong.
+     */
+    const char *const *strong_runtime_opts;
+
+
+    /*
+     * Global state (GS) API. These functions run under the BQL.
+     *
+     * See include/block/block-global-state.h for more information about
+     * the GS API.
+     */
+
     /*
      * This function is invoked under BQL before .bdrv_co_amend()
      * (which in contrast does not necessarily run under the BQL)
@@ -143,7 +211,6 @@ struct BlockDriver {
     bool (*bdrv_recurse_can_replace)(BlockDriverState *bs,
                                      BlockDriverState *to_replace);
 
-    int (*bdrv_probe)(const uint8_t *buf, int buf_size, const char *filename);
     int (*bdrv_probe_device)(const char *filename);
 
     /*
@@ -152,28 +219,8 @@ struct BlockDriver {
      */
     void (*bdrv_parse_filename)(const char *filename, QDict *options,
                                 Error **errp);
-    /*
-     * Drivers not implementing bdrv_parse_filename nor bdrv_open should have
-     * this field set to true, except ones that are defined only by their
-     * child's bs.
-     * An example of the last type will be the quorum block driver.
-     */
-    bool bdrv_needs_filename;
-
-    /*
-     * Set if a driver can support backing files. This also implies the
-     * following semantics:
-     *
-     *  - Return status 0 of .bdrv_co_block_status means that corresponding
-     *    blocks are not allocated in this layer of backing-chain
-     *  - For such (unallocated) blocks, read will:
-     *    - fill buffer with zeros if there is no backing file
-     *    - read from the backing file otherwise, where the block layer
-     *      takes care of reading zeros beyond EOF if backing file is short
-     */
-    bool supports_backing;
 
-    /* For handling image reopen for split or non-split files */
+    /* For handling image reopen for split or non-split files. */
     int (*bdrv_reopen_prepare)(BDRVReopenState *reopen_state,
                                BlockReopenQueue *queue, Error **errp);
     void (*bdrv_reopen_commit)(BDRVReopenState *reopen_state);
@@ -189,7 +236,6 @@ struct BlockDriver {
                           Error **errp);
     void (*bdrv_close)(BlockDriverState *bs);
 
-
     int coroutine_fn (*bdrv_co_create)(BlockdevCreateOptions *opts,
                                        Error **errp);
     int coroutine_fn (*bdrv_co_create_opts)(BlockDriver *drv,
@@ -197,11 +243,6 @@ struct BlockDriver {
                                             QemuOpts *opts,
                                             Error **errp);
 
-    int coroutine_fn (*bdrv_co_amend)(BlockDriverState *bs,
-                                      BlockdevAmendOptions *opts,
-                                      bool force,
-                                      Error **errp);
-
     int (*bdrv_amend_options)(BlockDriverState *bs,
                               QemuOpts *opts,
                               BlockDriverAmendStatusCB *status_cb,
@@ -248,6 +289,174 @@ struct BlockDriver {
      */
     char *(*bdrv_dirname)(BlockDriverState *bs, Error **errp);
 
+    /*
+     * This informs the driver that we are no longer interested in the result
+     * of in-flight requests, so don't waste the time if possible.
+     *
+     * One example usage is to avoid waiting for an nbd target node reconnect
+     * timeout during job-cancel with force=true.
+     */
+    void (*bdrv_cancel_in_flight)(BlockDriverState *bs);
+
+    int (*bdrv_inactivate)(BlockDriverState *bs);
+
+    int (*bdrv_snapshot_create)(BlockDriverState *bs,
+                                QEMUSnapshotInfo *sn_info);
+    int (*bdrv_snapshot_goto)(BlockDriverState *bs,
+                              const char *snapshot_id);
+    int (*bdrv_snapshot_delete)(BlockDriverState *bs,
+                                const char *snapshot_id,
+                                const char *name,
+                                Error **errp);
+    int (*bdrv_snapshot_list)(BlockDriverState *bs,
+                              QEMUSnapshotInfo **psn_info);
+    int (*bdrv_snapshot_load_tmp)(BlockDriverState *bs,
+                                  const char *snapshot_id,
+                                  const char *name,
+                                  Error **errp);
+
+    int (*bdrv_change_backing_file)(BlockDriverState *bs,
+        const char *backing_file, const char *backing_fmt);
+
+    /* TODO Better pass a option string/QDict/QemuOpts to add any rule? */
+    int (*bdrv_debug_breakpoint)(BlockDriverState *bs, const char *event,
+        const char *tag);
+    int (*bdrv_debug_remove_breakpoint)(BlockDriverState *bs,
+        const char *tag);
+    int (*bdrv_debug_resume)(BlockDriverState *bs, const char *tag);
+    bool (*bdrv_debug_is_suspended)(BlockDriverState *bs, const char *tag);
+
+    void (*bdrv_refresh_limits)(BlockDriverState *bs, Error **errp);
+
+    /*
+     * Returns 1 if newly created images are guaranteed to contain only
+     * zeros, 0 otherwise.
+     */
+    int (*bdrv_has_zero_init)(BlockDriverState *bs);
+
+    /*
+     * Remove fd handlers, timers, and other event loop callbacks so the event
+     * loop is no longer in use.  Called with no in-flight requests and in
+     * depth-first traversal order with parents before child nodes.
+     */
+    void (*bdrv_detach_aio_context)(BlockDriverState *bs);
+
+    /*
+     * Add fd handlers, timers, and other event loop callbacks so I/O requests
+     * can be processed again.  Called with no in-flight requests and in
+     * depth-first traversal order with child nodes before parent nodes.
+     */
+    void (*bdrv_attach_aio_context)(BlockDriverState *bs,
+                                    AioContext *new_context);
+
+    /**
+     * Try to get @bs's logical and physical block size.
+     * On success, store them in @bsz and return zero.
+     * On failure, return negative errno.
+     */
+    int (*bdrv_probe_blocksizes)(BlockDriverState *bs, BlockSizes *bsz);
+    /**
+     * Try to get @bs's geometry (cyls, heads, sectors)
+     * On success, store them in @geo and return 0.
+     * On failure return -errno.
+     * Only drivers that want to override guest geometry implement this
+     * callback; see hd_geometry_guess().
+     */
+    int (*bdrv_probe_geometry)(BlockDriverState *bs, HDGeometry *geo);
+
+    void (*bdrv_add_child)(BlockDriverState *parent, BlockDriverState *child,
+                           Error **errp);
+    void (*bdrv_del_child)(BlockDriverState *parent, BdrvChild *child,
+                           Error **errp);
+
+    /**
+     * Informs the block driver that a permission change is intended. The
+     * driver checks whether the change is permissible and may take other
+     * preparations for the change (e.g. get file system locks). This operation
+     * is always followed either by a call to either .bdrv_set_perm or
+     * .bdrv_abort_perm_update.
+     *
+     * Checks whether the requested set of cumulative permissions in @perm
+     * can be granted for accessing @bs and whether no other users are using
+     * permissions other than those given in @shared (both arguments take
+     * BLK_PERM_* bitmasks).
+     *
+     * If both conditions are met, 0 is returned. Otherwise, -errno is returned
+     * and errp is set to an error describing the conflict.
+     */
+    int (*bdrv_check_perm)(BlockDriverState *bs, uint64_t perm,
+                           uint64_t shared, Error **errp);
+
+    /**
+     * Called to inform the driver that the set of cumulative set of used
+     * permissions for @bs has changed to @perm, and the set of sharable
+     * permission to @shared. The driver can use this to propagate changes to
+     * its children (i.e. request permissions only if a parent actually needs
+     * them).
+     *
+     * This function is only invoked after bdrv_check_perm(), so block drivers
+     * may rely on preparations made in their .bdrv_check_perm implementation.
+     */
+    void (*bdrv_set_perm)(BlockDriverState *bs, uint64_t perm, uint64_t shared);
+
+    /*
+     * Called to inform the driver that after a previous bdrv_check_perm()
+     * call, the permission update is not performed and any preparations made
+     * for it (e.g. taken file locks) need to be undone.
+     *
+     * This function can be called even for nodes that never saw a
+     * bdrv_check_perm() call. It is a no-op then.
+     */
+    void (*bdrv_abort_perm_update)(BlockDriverState *bs);
+
+    /**
+     * Returns in @nperm and @nshared the permissions that the driver for @bs
+     * needs on its child @c, based on the cumulative permissions requested by
+     * the parents in @parent_perm and @parent_shared.
+     *
+     * If @c is NULL, return the permissions for attaching a new child for the
+     * given @child_class and @role.
+     *
+     * If @reopen_queue is non-NULL, don't return the currently needed
+     * permissions, but those that will be needed after applying the
+     * @reopen_queue.
+     */
+     void (*bdrv_child_perm)(BlockDriverState *bs, BdrvChild *c,
+                             BdrvChildRole role,
+                             BlockReopenQueue *reopen_queue,
+                             uint64_t parent_perm, uint64_t parent_shared,
+                             uint64_t *nperm, uint64_t *nshared);
+
+    /**
+     * Register/unregister a buffer for I/O. For example, when the driver is
+     * interested to know the memory areas that will later be used in iovs, so
+     * that it can do IOMMU mapping with VFIO etc., in order to get better
+     * performance. In the case of VFIO drivers, this callback is used to do
+     * DMA mapping for hot buffers.
+     */
+    void (*bdrv_register_buf)(BlockDriverState *bs, void *host, size_t size);
+    void (*bdrv_unregister_buf)(BlockDriverState *bs, void *host);
+
+    /*
+     * This field is modified only under the BQL, and is part of
+     * the global state.
+     */
+    QLIST_ENTRY(BlockDriver) list;
+
+    /*
+     * I/O API functions. These functions are thread-safe.
+     *
+     * See include/block/block-io.h for more information about
+     * the I/O API.
+     */
+
+    int (*bdrv_probe)(const uint8_t *buf, int buf_size, const char *filename);
+
+    int coroutine_fn (*bdrv_co_amend)(BlockDriverState *bs,
+                                      BlockdevAmendOptions *opts,
+                                      bool force,
+                                      Error **errp);
+
     /* aio */
     BlockAIOCB *(*bdrv_aio_preadv)(BlockDriverState *bs,
         int64_t offset, int64_t bytes, QEMUIOVector *qiov,
@@ -388,21 +597,11 @@ struct BlockDriver {
         bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
         int64_t *map, BlockDriverState **file);
 
-    /*
-     * This informs the driver that we are no longer interested in the result
-     * of in-flight requests, so don't waste the time if possible.
-     *
-     * One example usage is to avoid waiting for an nbd target node reconnect
-     * timeout during job-cancel with force=true.
-     */
-    void (*bdrv_cancel_in_flight)(BlockDriverState *bs);
-
     /*
      * Invalidate any cached meta-data.
      */
     void coroutine_fn (*bdrv_co_invalidate_cache)(BlockDriverState *bs,
                                                   Error **errp);
-    int (*bdrv_inactivate)(BlockDriverState *bs);
 
     /*
      * Flushes all data for all layers by calling bdrv_co_flush for underlying
@@ -428,14 +627,6 @@ struct BlockDriver {
      */
     int coroutine_fn (*bdrv_co_flush_to_os)(BlockDriverState *bs);
 
-    /*
-     * Drivers setting this field must be able to work with just a plain
-     * filename with '<protocol_name>:' as a prefix, and no other options.
-     * Options may be extracted from the filename by implementing
-     * bdrv_parse_filename.
-     */
-    const char *protocol_name;
-
     /*
      * Truncate @bs to @offset bytes using the given @prealloc mode
      * when growing.  Modes other than PREALLOC_MODE_OFF should be
@@ -453,7 +644,6 @@ struct BlockDriver {
                                          bool exact, PreallocMode prealloc,
                                          BdrvRequestFlags flags, Error **errp);
     int64_t (*bdrv_getlength)(BlockDriverState *bs);
-    bool has_variable_length;
     int64_t (*bdrv_get_allocated_file_size)(BlockDriverState *bs);
     BlockMeasureInfo *(*bdrv_measure)(QemuOpts *opts, BlockDriverState *in_bs,
                                       Error **errp);
@@ -464,20 +654,6 @@ struct BlockDriver {
         int64_t offset, int64_t bytes, QEMUIOVector *qiov,
         size_t qiov_offset);
 
-    int (*bdrv_snapshot_create)(BlockDriverState *bs,
-                                QEMUSnapshotInfo *sn_info);
-    int (*bdrv_snapshot_goto)(BlockDriverState *bs,
-                              const char *snapshot_id);
-    int (*bdrv_snapshot_delete)(BlockDriverState *bs,
-                                const char *snapshot_id,
-                                const char *name,
-                                Error **errp);
-    int (*bdrv_snapshot_list)(BlockDriverState *bs,
-                              QEMUSnapshotInfo **psn_info);
-    int (*bdrv_snapshot_load_tmp)(BlockDriverState *bs,
-                                  const char *snapshot_id,
-                                  const char *name,
-                                  Error **errp);
     int (*bdrv_get_info)(BlockDriverState *bs, BlockDriverInfo *bdi);
 
     ImageInfoSpecific *(*bdrv_get_specific_info)(BlockDriverState *bs,
@@ -491,9 +667,6 @@ struct BlockDriver {
                                           QEMUIOVector *qiov,
                                           int64_t pos);
 
-    int (*bdrv_change_backing_file)(BlockDriverState *bs,
-        const char *backing_file, const char *backing_fmt);
-
     /* removable device specific */
     bool (*bdrv_is_inserted)(BlockDriverState *bs);
     void (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
@@ -506,21 +679,6 @@ struct BlockDriver {
     int coroutine_fn (*bdrv_co_ioctl)(BlockDriverState *bs,
                                       unsigned long int req, void *buf);
 
-    /* List of options for creating images, terminated by name == NULL */
-    QemuOptsList *create_opts;
-
-    /* List of options for image amend */
-    QemuOptsList *amend_opts;
-
-    /*
-     * If this driver supports reopening images this contains a
-     * NULL-terminated list of the runtime options that can be
-     * modified. If an option in this list is unspecified during
-     * reopen then it _must_ be reset to its default value or return
-     * an error.
-     */
-    const char *const *mutable_opts;
-
     /*
      * Returns 0 for completed check, -errno for internal errors.
      * The check results are stored in result.
@@ -531,56 +689,10 @@ struct BlockDriver {
 
     void (*bdrv_debug_event)(BlockDriverState *bs, BlkdebugEvent event);
 
-    /* TODO Better pass a option string/QDict/QemuOpts to add any rule? */
-    int (*bdrv_debug_breakpoint)(BlockDriverState *bs, const char *event,
-        const char *tag);
-    int (*bdrv_debug_remove_breakpoint)(BlockDriverState *bs,
-        const char *tag);
-    int (*bdrv_debug_resume)(BlockDriverState *bs, const char *tag);
-    bool (*bdrv_debug_is_suspended)(BlockDriverState *bs, const char *tag);
-
-    void (*bdrv_refresh_limits)(BlockDriverState *bs, Error **errp);
-
-    /*
-     * Returns 1 if newly created images are guaranteed to contain only
-     * zeros, 0 otherwise.
-     */
-    int (*bdrv_has_zero_init)(BlockDriverState *bs);
-
-    /*
-     * Remove fd handlers, timers, and other event loop callbacks so the event
-     * loop is no longer in use.  Called with no in-flight requests and in
-     * depth-first traversal order with parents before child nodes.
-     */
-    void (*bdrv_detach_aio_context)(BlockDriverState *bs);
-
-    /*
-     * Add fd handlers, timers, and other event loop callbacks so I/O requests
-     * can be processed again.  Called with no in-flight requests and in
-     * depth-first traversal order with child nodes before parent nodes.
-     */
-    void (*bdrv_attach_aio_context)(BlockDriverState *bs,
-                                    AioContext *new_context);
-
     /* io queue for linux-aio */
     void (*bdrv_io_plug)(BlockDriverState *bs);
     void (*bdrv_io_unplug)(BlockDriverState *bs);
 
-    /**
-     * Try to get @bs's logical and physical block size.
-     * On success, store them in @bsz and return zero.
-     * On failure, return negative errno.
-     */
-    int (*bdrv_probe_blocksizes)(BlockDriverState *bs, BlockSizes *bsz);
-    /**
-     * Try to get @bs's geometry (cyls, heads, sectors)
-     * On success, store them in @geo and return 0.
-     * On failure return -errno.
-     * Only drivers that want to override guest geometry implement this
-     * callback; see hd_geometry_guess().
-     */
-    int (*bdrv_probe_geometry)(BlockDriverState *bs, HDGeometry *geo);
-
     /**
      * bdrv_co_drain_begin is called if implemented in the beginning of a
      * drain operation to drain and stop any internal sources of requests in
@@ -594,69 +706,6 @@ struct BlockDriver {
     void coroutine_fn (*bdrv_co_drain_begin)(BlockDriverState *bs);
     void coroutine_fn (*bdrv_co_drain_end)(BlockDriverState *bs);
 
-    void (*bdrv_add_child)(BlockDriverState *parent, BlockDriverState *child,
-                           Error **errp);
-    void (*bdrv_del_child)(BlockDriverState *parent, BdrvChild *child,
-                           Error **errp);
-
-    /**
-     * Informs the block driver that a permission change is intended. The
-     * driver checks whether the change is permissible and may take other
-     * preparations for the change (e.g. get file system locks). This operation
-     * is always followed either by a call to either .bdrv_set_perm or
-     * .bdrv_abort_perm_update.
-     *
-     * Checks whether the requested set of cumulative permissions in @perm
-     * can be granted for accessing @bs and whether no other users are using
-     * permissions other than those given in @shared (both arguments take
-     * BLK_PERM_* bitmasks).
-     *
-     * If both conditions are met, 0 is returned. Otherwise, -errno is returned
-     * and errp is set to an error describing the conflict.
-     */
-    int (*bdrv_check_perm)(BlockDriverState *bs, uint64_t perm,
-                           uint64_t shared, Error **errp);
-
-    /**
-     * Called to inform the driver that the set of cumulative set of used
-     * permissions for @bs has changed to @perm, and the set of sharable
-     * permission to @shared. The driver can use this to propagate changes to
-     * its children (i.e. request permissions only if a parent actually needs
-     * them).
-     *
-     * This function is only invoked after bdrv_check_perm(), so block drivers
-     * may rely on preparations made in their .bdrv_check_perm implementation.
-     */
-    void (*bdrv_set_perm)(BlockDriverState *bs, uint64_t perm, uint64_t shared);
-
-    /*
-     * Called to inform the driver that after a previous bdrv_check_perm()
-     * call, the permission update is not performed and any preparations made
-     * for it (e.g. taken file locks) need to be undone.
-     *
-     * This function can be called even for nodes that never saw a
-     * bdrv_check_perm() call. It is a no-op then.
-     */
-    void (*bdrv_abort_perm_update)(BlockDriverState *bs);
-
-    /**
-     * Returns in @nperm and @nshared the permissions that the driver for @bs
-     * needs on its child @c, based on the cumulative permissions requested by
-     * the parents in @parent_perm and @parent_shared.
-     *
-     * If @c is NULL, return the permissions for attaching a new child for the
-     * given @child_class and @role.
-     *
-     * If @reopen_queue is non-NULL, don't return the currently needed
-     * permissions, but those that will be needed after applying the
-     * @reopen_queue.
-     */
-     void (*bdrv_child_perm)(BlockDriverState *bs, BdrvChild *c,
-                             BdrvChildRole role,
-                             BlockReopenQueue *reopen_queue,
-                             uint64_t parent_perm, uint64_t parent_shared,
-                             uint64_t *nperm, uint64_t *nshared);
-
     bool (*bdrv_supports_persistent_dirty_bitmap)(BlockDriverState *bs);
     bool (*bdrv_co_can_store_new_dirty_bitmap)(BlockDriverState *bs,
                                                const char *name,
@@ -665,26 +714,6 @@ struct BlockDriver {
     int (*bdrv_co_remove_persistent_dirty_bitmap)(BlockDriverState *bs,
                                                   const char *name,
                                                   Error **errp);
-
-    /**
-     * Register/unregister a buffer for I/O. For example, when the driver is
-     * interested to know the memory areas that will later be used in iovs, so
-     * that it can do IOMMU mapping with VFIO etc., in order to get better
-     * performance. In the case of VFIO drivers, this callback is used to do
-     * DMA mapping for hot buffers.
-     */
-    void (*bdrv_register_buf)(BlockDriverState *bs, void *host, size_t size);
-    void (*bdrv_unregister_buf)(BlockDriverState *bs, void *host);
-    QLIST_ENTRY(BlockDriver) list;
-
-    /*
-     * Pointer to a NULL-terminated array of names of strong options
-     * that can be specified for bdrv_open(). A strong option is one
-     * that changes the data of a BDS.
-     * If this pointer is NULL, the array is considered empty.
-     * "filename" and "driver" are always considered strong.
-     */
-    const char *const *strong_runtime_opts;
 };
 
 static inline bool block_driver_can_compress(BlockDriver *drv)
-- 
2.35.1


