Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078F83FB961
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 17:56:55 +0200 (CEST)
Received: from localhost ([::1]:38650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKjeX-0006FM-Rj
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 11:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mKjcu-0005U1-1p
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 11:55:12 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:35347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mKjcs-0005Oc-2Y
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 11:55:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:References:In-Reply-To:
 Content-ID:Content-Description;
 bh=oHZSkTddTypHfgTeISiSJvHuBUI+c7EbfuVvf/dCJY4=; b=A+A8SIMbAuKfSMyen8McFWsM+X
 CD4BrvSrHhDaqAyChwMWt9rsoCcRzBkzCzRf8nAybIhMXs2DOWZ9Va2dAF+6qt8hdaHlJFpw1JKR/
 veXidyDUTjE1qKZT9UNuue0SpF8yvHkBvQFjc+4QcZq5TVWX5uNoY1O6ikV0Oc0WOwojkZqXr87GD
 Q7y6hqMiSbxeRXffRD5St1QAWUdF6UfVFHNy0EbebhTggA9IxQRlL6BtBoOOQfv/X2iqugTEniaLo
 24pETp09ob+K/QsKAm17ZtNqwp5ZtBonpPcMyP2LAzg5jVhWwwU5bWm0e19/dez/So/TMCk5J4C8n
 yqZc1j0A/z+UFwWNv2l9oazsTZMHWyjc5RjZc30zELWxLq//dK3RWOiAQdtOnqBB+bYRQGLx6neLz
 Fit0n/8ba/UgGXeKwfn5UR/BTSyIbOm+uDZ4f6A321YgBvgQ5DidJm66g2p+6jheRjSoPevaB91Xb
 vjZEygn+hxMNEd9RL/rvRXNCPuDSUxLQxc9N47Fq1RkVx1WYltVI0G31u50UMpxxNJpcc5tG2BwZX
 bFuuii9RvV6bhOX1JdrOM0dfm/38/LZHXuNPRnhNFh0nhFgBEcN+NY37lrOfsZqH/stY+gIemVqsf
 rtkcpFyxzs9bNaGZ+mSMlBWjjocA2U/9wiKdJzgHU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: 9pfs: Twalk crash
Date: Mon, 30 Aug 2021 17:55:04 +0200
Message-ID: <4325838.qn0ATYcOi1@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Apparently commit 8d6cb100731c4d28535adbf2a3c2d1f29be3fef4 '9pfs: reduce 
latency of Twalk' has introduced occasional crashes.

My first impression after looking at the backtrace: looks like the patch 
itself is probably not causing this, but rather unmasked this issue (i.e. 
increased the chance to be triggered).

The crash is because of 'elem' is NULL in virtio_pdu_vunmarshal() (frame 0).

bt taken with HEAD being 8d6cb100731c4d28535adbf2a3c2d1f29be3fef4:

Program terminated with signal SIGSEGV, Segmentation fault.
#0  virtio_pdu_vunmarshal (pdu=0x55a93717cde8, offset=7, fmt=0x55a9352766d1 
"ddw", ap=0x7f38a9ad9cd0) at ../hw/9pfs/virtio-9p-device.c:146
146         ret = v9fs_iov_vunmarshal(elem->out_sg, elem->out_num, offset, 1, 
fmt, ap);
[Current thread is 1 (Thread 0x7f3bddd2ac40 (LWP 7811))]
(gdb) bt full
#0  0x000055a934dfb9a7 in virtio_pdu_vunmarshal (pdu=0x55a93717cde8, offset=7, 
fmt=0x55a9352766d1 "ddw", ap=0x7f38a9ad9cd0) at ../hw/9pfs/virtio-9p-device.c:
146
        s = 0x55a93717b4b8
        v = 0x55a93717aee0
        elem = 0x0
        ret = <optimized out>
#1  0x000055a934bf35e8 in pdu_unmarshal (pdu=pdu@entry=0x55a93717cde8, 
offset=offset@entry=7, fmt=fmt@entry=0x55a9352766d1 "ddw") at ../hw/9pfs/9p.c:
71
        ret = <optimized out>
        ap = {{gp_offset = 24, fp_offset = 48, overflow_arg_area = 
0x7f38a9ad9db0, reg_save_area = 0x7f38a9ad9cf0}}
#2  0x000055a934bf68db in v9fs_walk (opaque=0x55a93717cde8) at ../hw/9pfs/
9p.c:1720
        name_idx = <optimized out>
        qids = 0x0
        i = <optimized out>
        err = 0
        dpath = {size = 0, data = 0x0}
        path = {size = 0, data = 0x0}
        pathes = 0x0
        nwnames = 1
        stbuf = 
            {st_dev = 2050, st_ino = 1199848, st_nlink = 1, st_mode = 41471, 
st_uid = 0, st_gid = 0, __pad0 = 0, st_rdev = 0, st_size = 13, st_blksize = 
4096, st_blocks = 16, s}
        fidst = 
            {st_dev = 2050, st_ino = 1198183, st_nlink = 3, st_mode = 16877, 
st_uid = 0, st_gid = 0, __pad0 = 0, st_rdev = 0, st_size = 12288, st_blksize = 
4096, st_blocks = 32}
        stbufs = 0x0
        offset = 7
        fid = 299
        newfid = 687
        wnames = 0x0
        fidp = <optimized out>
        newfidp = 0x0
        pdu = 0x55a93717cde8
        s = 0x55a93717b4b8
        qid = {type = 2 '\002', version = 1556732739, path = 2399697}
#3  0x000055a93505760b in coroutine_trampoline (i0=<optimized out>, 
i1=<optimized out>) at ../util/coroutine-ucontext.c:173





