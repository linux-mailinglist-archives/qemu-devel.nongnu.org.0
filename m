Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345F95B2D1A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 05:53:46 +0200 (CEST)
Received: from localhost ([::1]:55556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWV5N-0000Jb-Bb
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 23:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oWV3U-0005wv-B9
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 23:51:48 -0400
Received: from mga04.intel.com ([192.55.52.120]:2107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oWV3S-0007cm-GE
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 23:51:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662695506; x=1694231506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lp5q79t7Y5EbMeOotyYgpUIpWHdm8wO46UP2JjcYawA=;
 b=POvkoav0Kn59V/kDdyuSFarJO+u3Vyu63qtYmXLJQTwgL7pm1tYF3FXE
 lP3ge8Rqpl72cps26fk/UGl+cT2hQ25QaE4qZjYa0kA4c28OTwKn9HOvs
 M+btCLFfKBpQOQ07Ew2rREklaC8MuAommPEW3a92nxOY5OjtkAF+L+90Z
 +UiR4eL6jRtFz9B5Pcitf46vtpf6IOBIMukpnwl2UdxRTukQp9whQ/qg1
 6hs3dEQfAVyKMZMRHTmXUs6S8VY9w/FTwABB7AjcSIUf1qwO+7H1NVIMr
 iC+jK0fjri7f92ebs0TDXpgkXrgx0S41ZgAiFHosWFYhrruJOhYaMXtWH w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="296125966"
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="296125966"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 20:51:23 -0700
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="676991999"
Received: from chenyi-pc.sh.intel.com ([10.239.159.73])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 20:51:21 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Chenyi Qiang <chenyi.qiang@intel.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] configure: Add -Wno-gnu-variable-sized-type-not-at-end
Date: Fri,  9 Sep 2022 11:57:57 +0800
Message-Id: <20220909035758.17434-2-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220909035758.17434-1-chenyi.qiang@intel.com>
References: <20220909035758.17434-1-chenyi.qiang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=chenyi.qiang@intel.com; helo=mga04.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In recent linux headers update to v6.0-rc, it switched GNU
'zero-length-array' extension to the C-standard-defined flexible array
member. e.g.

struct kvm_msrs {
        __u32 nmsrs; /* number of msrs in entries */
        __u32 pad;

-       struct kvm_msr_entry entries[0];
+       struct kvm_msr_entry entries[];
};

Those (unlike the GNU zero-length-array) have some extra restrictions like
'this must be put at the end of a struct', which clang build would complain
about. e.g. the current code

struct {
        struct kvm_msrs info;
        struct kvm_msr_entry entries[1];
} msr_data = { }

generates the warning like:

target/i386/kvm/kvm.c:2868:25: error: field 'info' with variable sized
type 'struct kvm_msrs' not at the end of a struct or class is a GNU
extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
        struct kvm_msrs info;
                        ^
In fact, the variable length 'entries[]' field in 'info' is zero-sized in
GNU defined semantics, which can give predictable offset for 'entries[1]'
in local msr_data. The local defined struct is just there to force a stack
allocation large enough for 1 kvm_msr_entry, a clever trick but requires to
turn off this clang warning.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 575dde1c1f..7e0a1a4187 100755
--- a/configure
+++ b/configure
@@ -1258,6 +1258,7 @@ add_to nowarn_flags -Wno-string-plus-int
 add_to nowarn_flags -Wno-typedef-redefinition
 add_to nowarn_flags -Wno-tautological-type-limit-compare
 add_to nowarn_flags -Wno-psabi
+add_to nowarn_flags -Wno-gnu-variable-sized-type-not-at-end
 
 gcc_flags="$warn_flags $nowarn_flags"
 
-- 
2.17.1


