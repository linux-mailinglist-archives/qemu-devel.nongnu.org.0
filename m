Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE3152E628
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 09:23:13 +0200 (CEST)
Received: from localhost ([::1]:42588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrwye-0007xC-7f
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 03:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nrwnB-0001Sf-8U
 for qemu-devel@nongnu.org; Fri, 20 May 2022 03:11:21 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:44984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nrwn8-0002kt-Us
 for qemu-devel@nongnu.org; Fri, 20 May 2022 03:11:20 -0400
Received: by mail-pl1-x636.google.com with SMTP id q4so6658334plr.11
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 00:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AcmzJOzPR+Ia8HJiIMGPj5CDWhLF1KgwG7dO785wAu8=;
 b=A0nQCkLpP35fe+2qqNfB61rJWWZH+vuZQpxhrIwhVTH7e5mfj6w+yuEv6I2d4+JXRw
 +6Ek45o5L7qXnq5/pKGjwJNYfVgeY48anAbRZKAQTabT1b5rnXZ7pJezmXsgdFjdbg8p
 fqXn0MteyQaW5mrKNAJe9Rwpc0yPmq0SIGWfpQPPNDLcqtbU3ams2uRTqk07GD8UJaAt
 8oNBIblOasQXNByJCJMxsrOYHOdhJX9tKtwpAyorUwC6M/nfD/ebKDTK+Rnwbl6opRoF
 WTAyYHzGq/HV1hs3JIZu1rO8BoQ9JD/uVOvXOwb0Ib+7JNC9AyUMc7R2pr0UbT71zPI8
 fnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AcmzJOzPR+Ia8HJiIMGPj5CDWhLF1KgwG7dO785wAu8=;
 b=zWVUoDHNZRZQgGN62hR4K5wQcgwjuS/TBHudEEfJNzeCTnKPFijL3zJIQgFmUkQ4Ov
 mnfr26ueiqdX5Km6aWEF1+fkxgL/m1vGavrNfMJdL6GX8Ea25Lzr16MulY4qOyi98YdQ
 aE+VpeeHUdRkZWDhDOK3WB3ANicPddSlD3Xe2jHzucjlEhc73Lu1EUW0ljtVrlNjAbxo
 VMtq83Ry0vDg+Xxtd3JcebIYg8CTOoggTqnea2eSwkp9bfcoSJvuFWJWwTodBvvgz71E
 g30rhxLd8eB5uAsDgMWjRfoGU0oxTd1s23PqFV+Y2VNOmlzFXyAUQxCJhyfj6ee1pslt
 X1lA==
X-Gm-Message-State: AOAM5317UGcP/ETXUs9f6cjYqASVxlD9s2lWF/nrCuACHyRGRSy/k7aJ
 EU9dcVye94+8Gj7i14VKJ6GBTw==
X-Google-Smtp-Source: ABdhPJzKQ9ackIa173Rjwv32aTPTzmgH2+zL8vuf9scjZz/raHWoG0u3Ac7BZ4O6zg0PZhxCEvhFdA==
X-Received: by 2002:a17:902:c951:b0:161:b2dc:b524 with SMTP id
 i17-20020a170902c95100b00161b2dcb524mr8298345pla.42.1653030677549; 
 Fri, 20 May 2022 00:11:17 -0700 (PDT)
Received: from always-x1.www.tendawifi.com ([139.177.225.255])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a170902d21200b00161b3d5e3e4sm4965168ply.304.2022.05.20.00.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 00:11:16 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: akpm@linux-foundation.org, naoya.horiguchi@nec.com, mst@redhat.com,
 david@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 peterx@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH 3/3] virtio_balloon: Introduce memory recover
Date: Fri, 20 May 2022 15:06:48 +0800
Message-Id: <20220520070648.1794132-4-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220520070648.1794132-1-pizhenwei@bytedance.com>
References: <20220520070648.1794132-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Introduce a new queue 'recover VQ', this allows guest to recover
hardware corrupted page:

Guest              5.MF -> 6.RVQ FE    10.Unpoison page
                    /           \            /
-------------------+-------------+----------+-----------
                   |             |          |
                4.MCE        7.RVQ BE   9.RVQ Event
 QEMU             /               \       /
             3.SIGBUS              8.Remap
                /
----------------+------------------------------------
                |
            +--2.MF
 Host       /
       1.HW error

The workflow:
1, HardWare page error occurs randomly.
2, host side handles corrupted page by Memory Failure mechanism, sends
   SIGBUS to the user process if early-kill is enabled.
3, QEMU handles SIGBUS, if the address belongs to guest RAM, then:
4, QEMU tries to inject MCE into guest.
5, guest handles memory failure again.

1-5 is already supported for a long time, the next steps are supported
in this patch(also related driver patch):
6, guest balloon driver gets noticed of the corrupted PFN, and sends
   request to host side by Recover VQ FrontEnd.
7, QEMU handles request from Recover VQ BackEnd, then:
8, QEMU remaps the corrupted HVA fo fix the memory failure, then:
9, QEMU acks the guest side the result by Recover VQ.
10, guest unpoisons the page if the corrupted page gets recoverd
    successfully.

Then the guest fixes the HW page error dynamiclly without rebooting.

Emulate MCE by QEMU, the guest works fine:
 mce: [Hardware Error]: Machine check events logged
 Memory failure: 0x61646: recovery action for dirty LRU page: Recovered
 virtio_balloon virtio5: recovered pfn 0x61646
 Unpoison: Unpoisoned page 0x61646 by virtio-balloon
 MCE: Killing stress:24502 due to hardware memory corruption fault at 7f5be2e5a010

The 'HardwareCorrupted' in /proc/meminfo also shows 0 kB.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 drivers/virtio/virtio_balloon.c     | 243 ++++++++++++++++++++++++++++
 include/uapi/linux/virtio_balloon.h |  16 ++
 2 files changed, 259 insertions(+)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index f4c34a2a6b8e..f9d95d1d8a4d 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -52,6 +52,7 @@ enum virtio_balloon_vq {
 	VIRTIO_BALLOON_VQ_STATS,
 	VIRTIO_BALLOON_VQ_FREE_PAGE,
 	VIRTIO_BALLOON_VQ_REPORTING,
+	VIRTIO_BALLOON_VQ_RECOVER,
 	VIRTIO_BALLOON_VQ_MAX
 };
 
@@ -59,6 +60,12 @@ enum virtio_balloon_config_read {
 	VIRTIO_BALLOON_CONFIG_READ_CMD_ID = 0,
 };
 
+/* the request body to commucate with host side */
+struct __virtio_balloon_recover {
+	struct virtio_balloon_recover vbr;
+	__virtio32 pfns[VIRTIO_BALLOON_PAGES_PER_PAGE];
+};
+
 struct virtio_balloon {
 	struct virtio_device *vdev;
 	struct virtqueue *inflate_vq, *deflate_vq, *stats_vq, *free_page_vq;
@@ -126,6 +133,16 @@ struct virtio_balloon {
 	/* Free page reporting device */
 	struct virtqueue *reporting_vq;
 	struct page_reporting_dev_info pr_dev_info;
+
+	/* Memory recover VQ - VIRTIO_BALLOON_F_RECOVER */
+	struct virtqueue *recover_vq;
+	spinlock_t recover_vq_lock;
+	struct notifier_block memory_failure_nb;
+	struct list_head corrupted_page_list;
+	struct list_head recovered_page_list;
+	spinlock_t recover_page_list_lock;
+	struct __virtio_balloon_recover in_vbr;
+	struct work_struct unpoison_memory_work;
 };
 
 static const struct virtio_device_id id_table[] = {
@@ -494,6 +511,198 @@ static void update_balloon_size_func(struct work_struct *work)
 		queue_work(system_freezable_wq, work);
 }
 
+/*
+ * virtballoon_memory_failure - notified by memory failure, try to fix the
+ *                              corrupted page.
+ * The memory failure notifier is designed to call back when the kernel handled
+ * successfully only, WARN_ON_ONCE on the unlikely condition to find out any
+ * error(memory error handling is a best effort, not 100% coverd).
+ */
+static int virtballoon_memory_failure(struct notifier_block *notifier,
+				      unsigned long pfn, void *parm)
+{
+	struct virtio_balloon *vb = container_of(notifier, struct virtio_balloon,
+						 memory_failure_nb);
+	struct page *page;
+	struct __virtio_balloon_recover *out_vbr;
+	struct scatterlist sg;
+	unsigned long flags;
+	int err;
+
+	page = pfn_to_online_page(pfn);
+	if (WARN_ON_ONCE(!page))
+		return NOTIFY_DONE;
+
+	if (PageHuge(page))
+		return NOTIFY_DONE;
+
+	if (WARN_ON_ONCE(!PageHWPoison(page)))
+		return NOTIFY_DONE;
+
+	if (WARN_ON_ONCE(page_count(page) != 1))
+		return NOTIFY_DONE;
+
+	get_page(page); /* balloon reference */
+
+	out_vbr = kzalloc(sizeof(*out_vbr), GFP_KERNEL);
+	if (WARN_ON_ONCE(!out_vbr))
+		return NOTIFY_BAD;
+
+	spin_lock(&vb->recover_page_list_lock);
+	balloon_page_push(&vb->corrupted_page_list, page);
+	spin_unlock(&vb->recover_page_list_lock);
+
+	out_vbr->vbr.cmd = VIRTIO_BALLOON_R_CMD_RECOVER;
+	set_page_pfns(vb, out_vbr->pfns, page);
+	sg_init_one(&sg, out_vbr, sizeof(*out_vbr));
+
+	spin_lock_irqsave(&vb->recover_vq_lock, flags);
+	err = virtqueue_add_outbuf(vb->recover_vq, &sg, 1, out_vbr, GFP_KERNEL);
+	if (unlikely(err)) {
+		spin_unlock_irqrestore(&vb->recover_vq_lock, flags);
+		return NOTIFY_DONE;
+	}
+	virtqueue_kick(vb->recover_vq);
+	spin_unlock_irqrestore(&vb->recover_vq_lock, flags);
+
+	return NOTIFY_OK;
+}
+
+static int recover_vq_get_response(struct virtio_balloon *vb)
+{
+	struct __virtio_balloon_recover *in_vbr;
+	struct scatterlist sg;
+	unsigned long flags;
+	int err;
+
+	spin_lock_irqsave(&vb->recover_vq_lock, flags);
+	in_vbr = &vb->in_vbr;
+	memset(in_vbr, 0x00, sizeof(*in_vbr));
+	sg_init_one(&sg, in_vbr, sizeof(*in_vbr));
+	err = virtqueue_add_inbuf(vb->recover_vq, &sg, 1, in_vbr, GFP_KERNEL);
+	if (unlikely(err)) {
+		spin_unlock_irqrestore(&vb->recover_vq_lock, flags);
+		return err;
+	}
+
+	virtqueue_kick(vb->recover_vq);
+	spin_unlock_irqrestore(&vb->recover_vq_lock, flags);
+
+	return 0;
+}
+
+static void recover_vq_handle_response(struct virtio_balloon *vb, unsigned int len)
+{
+	struct __virtio_balloon_recover *in_vbr;
+	struct virtio_balloon_recover *vbr;
+	struct page *page;
+	unsigned int pfns;
+	u32 pfn0, pfn1;
+	__u8 status;
+
+	/* the response is not expected */
+	if (unlikely(len != sizeof(struct __virtio_balloon_recover)))
+		return;
+
+	in_vbr = &vb->in_vbr;
+	vbr = &in_vbr->vbr;
+	if (unlikely(vbr->cmd != VIRTIO_BALLOON_R_CMD_RESPONSE))
+		return;
+
+	/* to make sure the contiguous balloon PFNs */
+	for (pfns = 1; pfns < VIRTIO_BALLOON_PAGES_PER_PAGE; pfns++) {
+		pfn0 = virtio32_to_cpu(vb->vdev, in_vbr->pfns[pfns - 1]);
+		pfn1 = virtio32_to_cpu(vb->vdev, in_vbr->pfns[pfns]);
+		if (pfn1 - pfn0 != 1)
+			return;
+	}
+
+	pfn0 = virtio32_to_cpu(vb->vdev, in_vbr->pfns[0]);
+	if (!pfn_valid(pfn0))
+		return;
+
+	pfn1 = -1;
+	spin_lock(&vb->recover_page_list_lock);
+	list_for_each_entry(page, &vb->corrupted_page_list, lru) {
+		pfn1 = page_to_pfn(page);
+		if (pfn1 == pfn0)
+			break;
+	}
+	spin_unlock(&vb->recover_page_list_lock);
+
+	status = vbr->status;
+	switch (status) {
+	case VIRTIO_BALLOON_R_STATUS_RECOVERED:
+		if (pfn1 == pfn0) {
+			spin_lock(&vb->recover_page_list_lock);
+			list_del(&page->lru);
+			balloon_page_push(&vb->recovered_page_list, page);
+			spin_unlock(&vb->recover_page_list_lock);
+			queue_work(system_freezable_wq, &vb->unpoison_memory_work);
+			dev_info_ratelimited(&vb->vdev->dev, "recovered pfn 0x%x", pfn0);
+		}
+		break;
+	case VIRTIO_BALLOON_R_STATUS_FAILED:
+		/* the hypervisor can't fix this corrupted page, balloon puts page */
+		if (pfn1 == pfn0) {
+			spin_lock(&vb->recover_page_list_lock);
+			list_del(&page->lru);
+			spin_unlock(&vb->recover_page_list_lock);
+			put_page(page);
+			dev_info_ratelimited(&vb->vdev->dev, "failed to recover pfn 0x%x", pfn0);
+		}
+	default:
+		break;
+	};
+
+	/* continue to get response from host side if the response gets handled successfully */
+	recover_vq_get_response(vb);
+}
+
+static void unpoison_memory_func(struct work_struct *work)
+{
+	struct virtio_balloon *vb;
+	struct page *page;
+
+	vb = container_of(work, struct virtio_balloon, unpoison_memory_work);
+
+	do {
+		spin_lock(&vb->recover_page_list_lock);
+		page = list_first_entry_or_null(&vb->recovered_page_list,
+						struct page, lru);
+		if (page)
+			list_del(&page->lru);
+		spin_unlock(&vb->recover_page_list_lock);
+
+		if (page) {
+			put_page(page);
+			unpoison_memory(page_to_pfn(page), true, "virtio-balloon");
+		}
+	} while (page);
+}
+
+static void recover_vq_cb(struct virtqueue *vq)
+{
+	struct virtio_balloon *vb = vq->vdev->priv;
+	struct __virtio_balloon_recover *vbr;
+	unsigned long flags;
+	unsigned int len;
+
+	spin_lock_irqsave(&vb->recover_vq_lock, flags);
+	do {
+		virtqueue_disable_cb(vq);
+		while ((vbr = virtqueue_get_buf(vq, &len)) != NULL) {
+			spin_unlock_irqrestore(&vb->recover_vq_lock, flags);
+			if (vbr == &vb->in_vbr)
+				recover_vq_handle_response(vb, len);
+			else
+				kfree(vbr); /* just free the memory for out vbr request */
+			spin_lock_irqsave(&vb->recover_vq_lock, flags);
+		}
+	} while (!virtqueue_enable_cb(vq));
+	spin_unlock_irqrestore(&vb->recover_vq_lock, flags);
+}
+
 static int init_vqs(struct virtio_balloon *vb)
 {
 	struct virtqueue *vqs[VIRTIO_BALLOON_VQ_MAX];
@@ -515,6 +724,7 @@ static int init_vqs(struct virtio_balloon *vb)
 	callbacks[VIRTIO_BALLOON_VQ_FREE_PAGE] = NULL;
 	names[VIRTIO_BALLOON_VQ_FREE_PAGE] = NULL;
 	names[VIRTIO_BALLOON_VQ_REPORTING] = NULL;
+	names[VIRTIO_BALLOON_VQ_RECOVER] = NULL;
 
 	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_STATS_VQ)) {
 		names[VIRTIO_BALLOON_VQ_STATS] = "stats";
@@ -531,6 +741,11 @@ static int init_vqs(struct virtio_balloon *vb)
 		callbacks[VIRTIO_BALLOON_VQ_REPORTING] = balloon_ack;
 	}
 
+	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_RECOVER)) {
+		names[VIRTIO_BALLOON_VQ_RECOVER] = "recover_vq";
+		callbacks[VIRTIO_BALLOON_VQ_RECOVER] = recover_vq_cb;
+	}
+
 	err = virtio_find_vqs(vb->vdev, VIRTIO_BALLOON_VQ_MAX, vqs,
 			      callbacks, names, NULL);
 	if (err)
@@ -566,6 +781,9 @@ static int init_vqs(struct virtio_balloon *vb)
 	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_REPORTING))
 		vb->reporting_vq = vqs[VIRTIO_BALLOON_VQ_REPORTING];
 
+	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_RECOVER))
+		vb->recover_vq = vqs[VIRTIO_BALLOON_VQ_RECOVER];
+
 	return 0;
 }
 
@@ -1015,12 +1233,31 @@ static int virtballoon_probe(struct virtio_device *vdev)
 			goto out_unregister_oom;
 	}
 
+	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_RECOVER)) {
+		err = recover_vq_get_response(vb);
+		if (err)
+			goto out_unregister_reporting;
+
+		vb->memory_failure_nb.notifier_call = virtballoon_memory_failure;
+		spin_lock_init(&vb->recover_page_list_lock);
+		spin_lock_init(&vb->recover_vq_lock);
+		INIT_LIST_HEAD(&vb->corrupted_page_list);
+		INIT_LIST_HEAD(&vb->recovered_page_list);
+		INIT_WORK(&vb->unpoison_memory_work, unpoison_memory_func);
+		err = register_memory_failure_notifier(&vb->memory_failure_nb);
+		if (err)
+			goto out_unregister_reporting;
+	}
+
 	virtio_device_ready(vdev);
 
 	if (towards_target(vb))
 		virtballoon_changed(vdev);
 	return 0;
 
+out_unregister_reporting:
+	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_REPORTING))
+		page_reporting_unregister(&vb->pr_dev_info);
 out_unregister_oom:
 	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
 		unregister_oom_notifier(&vb->oom_nb);
@@ -1082,6 +1319,11 @@ static void virtballoon_remove(struct virtio_device *vdev)
 		destroy_workqueue(vb->balloon_wq);
 	}
 
+	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_RECOVER)) {
+		unregister_memory_failure_notifier(&vb->memory_failure_nb);
+		cancel_work_sync(&vb->unpoison_memory_work);
+	}
+
 	remove_common(vb);
 #ifdef CONFIG_BALLOON_COMPACTION
 	if (vb->vb_dev_info.inode)
@@ -1147,6 +1389,7 @@ static unsigned int features[] = {
 	VIRTIO_BALLOON_F_FREE_PAGE_HINT,
 	VIRTIO_BALLOON_F_PAGE_POISON,
 	VIRTIO_BALLOON_F_REPORTING,
+	VIRTIO_BALLOON_F_RECOVER,
 };
 
 static struct virtio_driver virtio_balloon_driver = {
diff --git a/include/uapi/linux/virtio_balloon.h b/include/uapi/linux/virtio_balloon.h
index ddaa45e723c4..41d0ffa2fb54 100644
--- a/include/uapi/linux/virtio_balloon.h
+++ b/include/uapi/linux/virtio_balloon.h
@@ -37,6 +37,7 @@
 #define VIRTIO_BALLOON_F_FREE_PAGE_HINT	3 /* VQ to report free pages */
 #define VIRTIO_BALLOON_F_PAGE_POISON	4 /* Guest is using page poisoning */
 #define VIRTIO_BALLOON_F_REPORTING	5 /* Page reporting virtqueue */
+#define VIRTIO_BALLOON_F_RECOVER	6 /* Memory recover virtqueue */
 
 /* Size of a PFN in the balloon interface. */
 #define VIRTIO_BALLOON_PFN_SHIFT 12
@@ -59,6 +60,8 @@ struct virtio_balloon_config {
 	};
 	/* Stores PAGE_POISON if page poisoning is in use */
 	__le32 poison_val;
+	/* Number of hardware corrupted pages, guest read only */
+	__le32 corrupted_pages;
 };
 
 #define VIRTIO_BALLOON_S_SWAP_IN  0   /* Amount of memory swapped in */
@@ -116,4 +119,17 @@ struct virtio_balloon_stat {
 	__virtio64 val;
 } __attribute__((packed));
 
+#define VIRTIO_BALLOON_R_CMD_RECOVER      0
+#define VIRTIO_BALLOON_R_CMD_RESPONSE     0x80
+
+#define VIRTIO_BALLOON_R_STATUS_CORRUPTED 0
+#define VIRTIO_BALLOON_R_STATUS_RECOVERED 1
+#define VIRTIO_BALLOON_R_STATUS_FAILED    2
+
+struct virtio_balloon_recover {
+	__u8 cmd;
+	__u8 status;
+	__u8 padding[6];
+};
+
 #endif /* _LINUX_VIRTIO_BALLOON_H */
-- 
2.20.1


