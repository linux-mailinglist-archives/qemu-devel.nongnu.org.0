Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD2863A1EE
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 08:21:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozYQs-0006dS-JH; Mon, 28 Nov 2022 02:20:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ozYQo-0006bo-23
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 02:19:59 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ozYQl-0000wt-JC
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 02:19:57 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 t11-20020a17090a024b00b0021932afece4so2174530pje.5
 for <qemu-devel@nongnu.org>; Sun, 27 Nov 2022 23:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fJOiF0H8dPx5thaYXjs/2I3nxeN2aLfLpzryRLEo3ro=;
 b=KmsZYr/F/aKdpqVmamsVaWQwoCpD61wY9ck4FHHtZDBsr6DVNFRfXO6QK+TvuilIyN
 RT1EzrARJi/LmCvdWSipyyxv22Deh3Rqv6gTo2gUWU3qb8Q0nH1aE6//MQltfQcQOtXw
 65r40Fl4JVlk/eaGYqTzYWOVapWVaGD4b8syzxgZYe21u0bodO/mT7LMC1RwimEzXM3W
 1RwryFYqJHDPNMAbbgO0iywZ80q+OFIKCI5L2oXONkxmzNxYczzfSbVzvICFmbg7WLNS
 HgK1NvHR6u79xvglljmzFcHbR6Rj05bLrcXBOEjFdD0z9HgB5qVADwyFiAMMXymd6TFK
 lBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fJOiF0H8dPx5thaYXjs/2I3nxeN2aLfLpzryRLEo3ro=;
 b=Iq4ejxhk4Is1Qcy2kdy3sHNiRvl4OHkEdcMHKYuVQRP6o8TmKuVWkKuyhm9VcWbXl1
 7MRjNxSZXXc7QyAunVjFbp+kQJUVjLvG/erDIAtLDJCcgkccoy/I3DGLAIkL7qevgNVy
 0sW8gLLJ5ebLa2v/VSgYbLv4G+osJgK0nomshpfih8RqB1X35ICncVmEpqFbHODhCJtJ
 vKx8VzHUxB1vxTbm1tToFnY9C7wBwz6LSad6kmkficHJn3P4RSzaZKDzcJjrrAHLcwBG
 4jM7G0qpCK2+BKb3KWNVmSgYFjz3l+Sc1En7YR4th4aQusozG49qRxu4TMQCcxVcGfKw
 nTcw==
X-Gm-Message-State: ANoB5pmL8arSeVGfbv6qmSkdpVHpKnzFEMcpmX168ThLkhDKLSn/As+u
 dOr/xLN1dnbrqssCTgws78FlpRAXhAOOpTtckSQ=
X-Google-Smtp-Source: AA0mqf6rV54e7OcGPTrM5o0LOdyLgw9hwF9p6LFt93OOgMosleY6UEu+rTgvBfcd+f6c2cing3tu0Q==
X-Received: by 2002:a17:903:452:b0:189:65c5:4508 with SMTP id
 iw18-20020a170903045200b0018965c54508mr16158031plb.66.1669619993095; 
 Sun, 27 Nov 2022 23:19:53 -0800 (PST)
Received: from fedlinux.. ([183.221.25.73]) by smtp.gmail.com with ESMTPSA id
 y21-20020aa79af5000000b005752201875fsm1902229pfp.87.2022.11.27.23.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 23:19:52 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 damien.lemoal@opensource.wdc.com, hare@suse.de, dmitry.fomichev@wdc.com,
 stefanha@gmail.com, Sam Li <faithilikerun@gmail.com>
Subject: [qemu-web PATCH v2] Add a blog post about zoned storage emulation
Date: Mon, 28 Nov 2022 15:18:22 +0800
Message-Id: <20221128071822.4707-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1035.google.com
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
 _posts/2022-11-17-zoned-emulation.md | 69 ++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 _posts/2022-11-17-zoned-emulation.md

diff --git a/_posts/2022-11-17-zoned-emulation.md b/_posts/2022-11-17-zoned-emulation.md
new file mode 100644
index 0000000..1e16e99
--- /dev/null
+++ b/_posts/2022-11-17-zoned-emulation.md
@@ -0,0 +1,69 @@
+---
+layout: post
+title:  "Introduction to Zoned Storage Emulation"
+date:   2022-11-17
+author: Sam Li
+categories: [storage, gsoc, outreachy, internships]
+---
+
+This summer I worked on adding Zoned Block Device (ZBD) support to virtio-blk as part of the [Outreachy](https://www.outreachy.org/) internship program. QEMU hasn't directly supported ZBDs before so this article explains how they work and why QEMU needed to be extended.
+
+## Zoned block devices
+
+Zoned block devices (ZBDs) are divided into regions called zones that can only be written sequentially. By only allowing sequential writes, SSD write amplification can be reduced by eliminating the need for a [Flash Translation Layer](https://en.wikipedia.org/wiki/Flash_translation_layer), and potentially lead to higher throughput and increased capacity. Providing a new storage software stack, zoned storage concepts are standardized as [ZBC (SCSI standard), ZAC (ATA standard)](https://zonedstorage.io/docs/introduction/smr#governing-standards), and [ZNS (NVMe)](https://zonedstorage.io/docs/introduction/zns). Meanwhile, the virtio protocol for block devices(virtio-blk) should also be aware of ZBDs instead of taking them as regular block devices. It should be able to pass such devices through to the guest. An overview of necessary work is as follows:
+
+1. Virtio protocol: [extend virtio-blk protocol with main zoned storage concept](https://lwn.net/Articles/914377/), Dmitry Fomichev
+2. Linux: [implement the virtio specification extensions](https://www.spinics.net/lists/linux-block/msg91944.html), Dmitry Fomichev
+3. QEMU: [add zoned storage APIs to the block layer](https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg05195.html), Sam Li
+4. QEMU: implement zoned storage support in virtio-blk emulation, Sam Li
+
+Once the QEMU and Linux patches have been merged it will be possible to expose a virtio-blk ZBD to the guest like this:
+
+```sh
+-blockdev node-name=drive0,driver=zoned_host_device,filename=/path/to/zbd,cache.direct=on \
+-device virtio-blk-pci,drive=drive0 \
+```
+
+And then we can perform zoned block commands on that device in the guest os.
+
+```sh
+# blkzone report /dev/vda
+  start: 0x000000000, len 0x020000, cap 0x020000, wptr 0x000000 reset:0 non-seq:0, zcond: 0(nw) [type: 1(CONVENTIONAL)]
+  start: 0x000020000, len 0x020000, cap 0x020000, wptr 0x000000 reset:0 non-seq:0, zcond: 0(nw) [type: 1(CONVENTIONAL)]
+  start: 0x000040000, len 0x020000, cap 0x020000, wptr 0x000000 reset:0 non-seq:0, zcond: 0(nw) [type: 1(CONVENTIONAL)]
+  start: 0x000060000, len 0x020000, cap 0x020000, wptr 0x000000 reset:0 non-seq:0, zcond: 0(nw) [type: 1(CONVENTIONAL)]
+  start: 0x000080000, len 0x020000, cap 0x020000, wptr 0x000000 reset:0 non-seq:0, zcond: 0(nw) [type: 1(CONVENTIONAL)]
+  start: 0x0000a0000, len 0x020000, cap 0x020000, wptr 0x000000 reset:0 non-seq:0, zcond: 0(nw) [type: 1(CONVENTIONAL)]
+  start: 0x0000c0000, len 0x020000, cap 0x020000, wptr 0x000000 reset:0 non-seq:0, zcond: 0(nw) [type: 1(CONVENTIONAL)]
+  start: 0x0000e0000, len 0x020000, cap 0x020000, wptr 0x000000 reset:0 non-seq:0, zcond: 0(nw) [type: 1(CONVENTIONAL)]
+  start: 0x000100000, len 0x020000, cap 0x020000, wptr 0x000000 reset:0 non-seq:0, zcond: 1(em) [type: 2(SEQ_WRITE_REQUIRED)]
+  start: 0x000120000, len 0x020000, cap 0x020000, wptr 0x000000 reset:0 non-seq:0, zcond: 1(em) [type: 2(SEQ_WRITE_REQUIRED)]
+  start: 0x000140000, len 0x020000, cap 0x020000, wptr 0x000000 reset:0 non-seq:0, zcond: 1(em) [type: 2(SEQ_WRITE_REQUIRED)]
+  start: 0x000160000, len 0x020000, cap 0x020000, wptr 0x000000 reset:0 non-seq:0, zcond: 1(em) [type: 2(SEQ_WRITE_REQUIRED)]
+```
+
+## Zoned emulation
+
+Currently, QEMU can support zoned devices by virtio-scsi or PCI device passthrough. It needs to specify the device type it is talking to. Whereas storage controller emulation uses block layer APIs instead of directly accessing disk images. Extending virtio-blk emulation avoids code duplication and simplify the support by hiding the device types under a unified zoned storage interface, simplifying VM deployment for different types of zoned devices. Virtio-blk can also be implemented in hardware. If those devices wish to follow the zoned storage model then the virtio-blk specification needs to natively support zoned storage. With such support, individual NVMe namespaces or anything that is a zoned Linux block device can be exposed to the guest without passing through a full device.
+
+For zoned storage emulation, zoned storage APIs support three zoned models (conventional, host-managed, host-aware) , four zone management commands (Report Zone, Open Zone, Close Zone, Finish Zone), and Append Zone.  The QEMU block layer has a BlockDriverState graph that propagates device information inside block layer. File-posix driver is the lowest level within the graph where zoned storage APIs reside.
+
+After receiving the block driver states, Virtio-blk emulation recognizes zoned devices and sends the zoned feature bit to guest. Then the guest can see the zoned device in the host. When the guest executes zoned operations, virtio-blk driver issues corresponding requests that will be captured by viritio-blk device inside QEMU. Afterwards, virtio-blk device sends the requests to file-posix driver which will perform zoned operations using Linux ioctls.
+
+Unlike zone management operations, Linux doesn't have a user API to issue zone append requests to zoned devices from user space. With the help of write pointer emulation tracking locations of write pointer of each zone, QEMU block layer can perform append writes by modifying regular writes. Write pointer locks guarantee the execution of requests. Upon failure it must not update the write pointer location which is only got updated when the request is successfully finished.
+
+Problems can always be solved with right mind and right tools. A good approach to avoid pitfalls of programs is test-driven. In the beginning, users like qemu-io commands utility can invoke new block layer APIs. Moving towards to guest, existing tools like blktests, zonefs-tools, and fio are introduced for broader testing. Depending on the size of the zoned device, some tests may take long enough time to finish. Besides, tracing is also a good tool for spotting bugs. QEMU tracking tools and blktrace monitors block layer IO, providing detailed information to analysis.
+
+## Starting the journey with open source
+
+As a student interested in computer science, I am enthusiastic about making real applications and fortunate to find the opportunity in this summer. I have a wonderful experience with QEMU where I get chance to work with experienced engineers and meet peers sharing same interests. It is a good starting point for me to continue my search on storage systems and open source projects. 
+
+Public communication, reaching out to people and admitting to failures used to be hard for me. Those feelings had faded away as I put more effort to this project over time. For people may having the same trouble as me, it might be useful to focus on the tasks ahead of you instead of worrying about the consequences of rejections from others. 
+
+Finally, I would like to thank Stefan Hajnoczi, Damien Le Moal, Dmitry Fomichev, and Hannes Reinecke for mentoring me - they have guided me through this project with patience and expertise, when I hit  obstacles on design or implementations, and introduced a fun and vibrant open source world for me. Also thank QEMU community and Outreachy for organizing this program.
+
+## Conclusion
+
+The current status for this project is waiting for virtio specifications extension and Linux driver support patches got accepted. And the up-to-date patch series of zoned device support welcome any new comments.
+
+The next step for zoned storage emulation in QEMU is to enable full zoned emulation through virtio-blk. Adding support on top of a regular file, it allows developers accessing a zoned device environment without real zoned storage hardwares. Furthermore, virtio-scsi may need to add full emulation support to complete the zoned storage picture in QEMU. QEMU NVMe ZNS emulation can also use new block layer APIs to attach real zoned storage if the emulation is used in production in future.
-- 
2.38.1


