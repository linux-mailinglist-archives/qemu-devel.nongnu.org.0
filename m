Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E334835FC87
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 22:22:30 +0200 (CEST)
Received: from localhost ([::1]:59202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWm1u-0007pZ-29
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 16:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jose.carlos.venegas.munoz@intel.com>)
 id 1lWlyu-0005Vs-Jj
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 16:19:24 -0400
Received: from mga17.intel.com ([192.55.52.151]:11169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jose.carlos.venegas.munoz@intel.com>)
 id 1lWlys-0005Km-Rd
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 16:19:24 -0400
IronPort-SDR: Kzcwzel5S9urEHX12VolzNHKf4qQTu1rt903n2Pjrn5UxXJAjng6bhxRESvYpU2yupvymw9scB
 GzDMxmyuy+8A==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="174833158"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="174833158"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 13:19:19 -0700
IronPort-SDR: I6agCIizbFcxYHgCdoobGH3i0vj9lU1xnH1roRprE2+2O3Ugv3Q2XB4w5p0o4ZXUqbACBU1sSc
 6M+R+w5mzt8g==
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="424890272"
Received: from kata-01.gv.intel.com (HELO jcvenega-mobl.gv.intel.com)
 ([10.219.105.42])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 13:19:18 -0700
From: Carlos Venegas <jose.carlos.venegas.munoz@intel.com>
To: virtio-fs@redhat.com
Subject: [PATCH 1/2] virtiofsd: Allow use "-o xattrmap" without "-o xattr"
Date: Wed, 14 Apr 2021 20:12:06 +0000
Message-Id: <20210414201207.3612432-2-jose.carlos.venegas.munoz@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210414201207.3612432-1-jose.carlos.venegas.munoz@intel.com>
References: <20210414201207.3612432-1-jose.carlos.venegas.munoz@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=jose.carlos.venegas.munoz@intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: qemu-devel@nongnu.org, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When -o xattrmap is used, it will not work unless xattr is enabled.

This patch enables xattr when -o xattrmap is used.

Signed-off-by: Carlos Venegas <jose.carlos.venegas.munoz@intel.com>
---
 tools/virtiofsd/passthrough_ll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index ddaf57305c..2337ea5a58 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3939,6 +3939,7 @@ int main(int argc, char *argv[])
     }
 
     if (lo.xattrmap) {
+        lo.xattr = 1;
         parse_xattrmap(&lo);
     }
 
-- 
2.25.1


