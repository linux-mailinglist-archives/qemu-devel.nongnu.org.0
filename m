Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362EE2FD443
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:39:44 +0100 (CET)
Received: from localhost ([::1]:42732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Fa9-0000Ap-BY
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:39:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2FGb-0001hv-86
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:19:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2FGZ-000834-Hy
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:19:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611155966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gLS+yQfpTntD1627YhQpb6aYd+CIa/ZGPzYtpS5MTw4=;
 b=Apr7+1OAhC6HznlFC7mL7XHJmoxbqNv4ScoUcuxa9D8qEsKECUAm7wLlCMOmWkYZsSEmGS
 IWkvXXpXnSPcJ2qPfjKfx0rhgADCmPedrNO5r5ciDHq1G2tZYnUUKvrvuQe5wibyNeWWql
 66ej4Py5iod/4a9SUVpcvElVvVfYem8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-7yw0fOZiMlep6OtGdJAZwA-1; Wed, 20 Jan 2021 10:19:25 -0500
X-MC-Unique: 7yw0fOZiMlep6OtGdJAZwA-1
Received: by mail-ej1-f71.google.com with SMTP id m4so7592964ejc.14
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 07:19:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gLS+yQfpTntD1627YhQpb6aYd+CIa/ZGPzYtpS5MTw4=;
 b=QUJdXMkG57MKtCdc9hiJxbHxQy2+oUor2HfIJnLPcj4ddHrAVxx/KPnJMmB0/tI1ki
 J/gI6tvObQZNs+tqSsNF0hk30guRhOqtRA1y/6TAKj+/dvJKFyEzJ35x5Kw5SJj47xe0
 sDkT0jwusmrMu0rCE5QRmxiG4CIp1XYVwD0v24cm6hFChmDBhLoU6PTHIAX/0dorKiCS
 tbGjOQm6Kcaxf7MMF7odGujIo4HxN3IUnTHHFlIT0bi6FcfNVFKuA9t87gCumM/5kXu7
 qHgqcUfhEf8rkvQldbXC6vr/mWFYxlvSAegpWUvWNsLMMGWm+YdI8BDY2QeOsgO/jKBk
 hJ5Q==
X-Gm-Message-State: AOAM531B1VgaI3YVEcGi+fRv+ljvox3s4esvGS5vNbCQQTrPXyNF9zPY
 PtZ/mwASMUvoTSOFjcVcTACvJ9FZPnnLLRAOqnnYyN0HIX0bC3QsE+by3EJte2WG8tlpPWKIB7z
 fUzIgUp/TAp7e4H5DAOK48SBwGXTJcqXI9eTJ08a9hZT2PC1nLYFEK82u1UFiWike
X-Received: by 2002:a05:6402:4391:: with SMTP id
 o17mr7802578edc.196.1611155963935; 
 Wed, 20 Jan 2021 07:19:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7w7js2JeC+26mcDu5Nm7K38vcklJvi9jlmvw7IS1whCdfOKCuiDAS+INhaMZmcyKUkf98Qg==
X-Received: by 2002:a05:6402:4391:: with SMTP id
 o17mr7802566edc.196.1611155963816; 
 Wed, 20 Jan 2021 07:19:23 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s22sm1013292ejd.106.2021.01.20.07.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 07:19:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] configure: Do not build TCG if not necessary
Date: Wed, 20 Jan 2021 16:19:14 +0100
Message-Id: <20210120151916.1167448-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210120151916.1167448-1-philmd@redhat.com>
References: <20210120151916.1167448-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't want to check/build TCG when no system/user emulation
is requested. This is useful in particular when building only:
 - tools
 - documentation

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 9f016b06b54..012c527e3cd 100755
--- a/configure
+++ b/configure
@@ -337,7 +337,7 @@ linux_io_uring="$default_feature"
 cap_ng="auto"
 attr="auto"
 xfs="$default_feature"
-tcg="enabled"
+tcg="auto"
 membarrier="$default_feature"
 vhost_net="$default_feature"
 vhost_crypto="$default_feature"
@@ -2282,6 +2282,15 @@ case " $target_list " in
   ;;
 esac
 
+if [ "$tcg" = "auto" ]; then
+    # if neither system nor user emulation requested, no need to build TCG
+    if [ "$softmmu" = "no" ] && [ "$linux_user" = "no" ] && [ "$bsd_user" = "no" ]; then
+        tcg="disabled"
+    else
+        tcg="enabled"
+    fi
+fi
+
 feature_not_found() {
   feature=$1
   remedy=$2
-- 
2.26.2


