Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B663734AE
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 07:22:14 +0200 (CEST)
Received: from localhost ([::1]:51736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le9zB-00068n-9O
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 01:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1le9rd-000687-0a
 for qemu-devel@nongnu.org; Wed, 05 May 2021 01:14:25 -0400
Received: from m12-16.163.com ([220.181.12.16]:58170)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1le9rb-00017I-0J
 for qemu-devel@nongnu.org; Wed, 05 May 2021 01:14:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=RgTd6
 STBXTpszmDsXFt9TAp+ejdbo3H0pDMEnZ62xRg=; b=gvWiz0bayk6gxBWYlerp6
 gI05GcUkTzKiljLnWGGctZmdNP4CJJZq4BfXHFrlAzKe0ougUQqOmtupp02Y0rmF
 OeRK/bsxY6I9CQsZgVUCob0FoAa80oWDdO3C5bpVgkfvpj5MfnQ04kIrsVvbA68f
 T3pT8PrrixpjuFxVXQJTAM=
Received: from ubuntu.localdomain (unknown [36.22.237.185])
 by smtp12 (Coremail) with SMTP id EMCowACXET7zJZJg8VpupQ--.18216S4;
 Wed, 05 May 2021 12:58:28 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: marcandre.lureau@redhat.com,
	kraxel@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 0/7] vhost-user-gpu: fix several security issues
Date: Tue,  4 May 2021 21:58:17 -0700
Message-Id: <20210505045824.33880-1-liq3ea@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowACXET7zJZJg8VpupQ--.18216S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr1xZF4UJrWUtr1UurW7urg_yoW3urX_ZF
 4rCFWkJw17GFWj9ay5Cw1rurZIyFZ3Gr1fZFyxJayfKw4Yqr1Sqw1rK3s7tryxZw4DWF1D
 Ary8Jw4FvwnIkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjm9aJUUUUU==
X-Originating-IP: [36.22.237.185]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbBZhGJbVaD7t2FnQABss
Received-SPF: pass client-ip=220.181.12.16; envelope-from=liq3ea@163.com;
 helo=m12-16.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Li Qiang <liq3ea@163.com>, liq3ea@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These security issue is low severity and is similar with the
virtio-vga/virtio-gpu device. All of them can be triggered by
the guest user.

Li Qiang (7):
  vhost-user-gpu: fix memory disclosure in virgl_cmd_get_capset_info
  vhost-user-gpu: fix resource leak in 'vg_resource_create_2d'
  vhost-user-gpu: fix memory leak in vg_resource_attach_backing
  vhost-user-gpu: fix memory link while calling 'vg_resource_unref'
  vhost-user-gpu: fix memory leak in 'virgl_cmd_resource_unref'
  vhost-user-gpu: fix memory leak in 'virgl_resource_attach_backing'
  vhost-user-gpu: fix OOB write in 'virgl_cmd_get_capset'

 contrib/vhost-user-gpu/vhost-user-gpu.c |  7 +++++++
 contrib/vhost-user-gpu/virgl.c          | 17 ++++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.25.1



