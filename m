Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDBB668F50
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 08:37:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGEcD-0004MN-S2; Fri, 13 Jan 2023 02:36:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+429392e802db0772f8f4+7082+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pGEc3-0004Lp-Ay
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 02:36:31 -0500
Received: from bombadil.infradead.org ([2607:7c80:54:3::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+429392e802db0772f8f4+7082+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pGEc1-0006RK-1z
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 02:36:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:From:Date:Sender:Reply-To:To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=w9ozNFRFzdUTIaFl8WtUMquqdgbfsjcaCYNjsAdoeEs=; b=qlDXsAzYejtIGJeyrENXtwlrgo
 4OBnBb02M7Wy2ib8vIVpZzhFd4BCUzgThmnIYcPu/GWWw5gOhdiH3Os6WZqVXo7pvjTcJ1DYEGh/y
 sGKttY0dXzJ7JP/musADe1CppBDBksZ+YZk96yscdQh6tl0YnBc9/UENiJZyF0YVeS39ZdoFe/6LK
 NGv2FxcTp7rpbVcNuUH67FhQ/0QAgvhnqxAWs9xHIWElxkGYjmUEsgB4vS+z1LUN8zv4EEAfl45st
 9nBDEWIBOjPfd0omyXs0+ANkb8C+GQxcp6ln2LYjiMObfAnDZDv9fEANbCE5nyGNNvFTeRQCLvopr
 x8yrf8Pg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pGEbu-0010qO-8P
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 07:36:22 +0000
Date: Thu, 12 Jan 2023 23:36:22 -0800
From: Christoph Hellwig <hch@infradead.org>
Cc: qemu-devel@nongnu.org
Subject: regression in booting with -kernel in 7.2.0
Message-ID: <Y8EJ9iXhEzmjI67A@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2607:7c80:54:3::133;
 envelope-from=BATV+429392e802db0772f8f4+7082+infradead.org+hch@bombadil.srs.infradead.org;
 helo=bombadil.infradead.org
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MISSING_HEADERS=1.021,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Hi all,

qemu 7.2.0 fails to boot my usual test setup using -kernel (see
the actual script below).  I've bisected this down to:

commit ffe2d2382e5f1aae1abc4081af407905ef380311
Author: Jason A. Donenfeld <Jason@zx2c4.com>
Date:   Wed Sep 21 11:31:34 2022 +0200

    x86: re-enable rng seeding via SetupData

with this commit I don't even get to kernel console output, with it
reverted it boots fine (although with 7.2 configuring the network
takes forever, the actua bisection point before the commit does not
show that issue)

---
#!/bin/sh

hostdev='driver=host_device,cache.direct=on,cache.no-flush=on'
	
/opt/qemu/bin/qemu-system-x86_64 \
	-nographic \
	-enable-kvm \
	-m 4096 \
	-smp 4 \
	-cpu host \
	-kernel arch/x86/boot/bzImage \
	-append "root=/dev/vda console=ttyS0,115200n8 cgroup_no_v1=all" \
	-blockdev driver=file,cache.direct=on,node-name=root,filename=/home/hch/images/bullseye.img \
	-device virtio-blk,drive=root \
	-blockdev ${hostdev},node-name=test,filename=/dev/nvme0n1p4 \
	-device virtio-blk,drive=test \
	-blockdev ${hostdev},node-name=scratch,filename=/dev/nvme0n1p5 \
	-device virtio-blk,drive=scratch \
	-blockdev ${hostdev},node-name=scratch2,filename=/dev/nvme0n1p6 \
	-device virtio-blk,drive=scratch2 \
	-blockdev ${hostdev},node-name=scratch3,filename=/dev/nvme0n1p7 \
	-device virtio-blk,drive=scratch3 \
	-blockdev ${hostdev},node-name=scratch4,filename=/dev/nvme0n1p8 \
	-device virtio-blk,drive=scratch4 \
	-blockdev ${hostdev},node-name=scratch5,filename=/dev/nvme0n1p9 \
	-device virtio-blk,drive=scratch5

