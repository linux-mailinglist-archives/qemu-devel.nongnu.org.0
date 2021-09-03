Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610434004C3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:20:10 +0200 (CEST)
Received: from localhost ([::1]:57302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDnN-0003ft-CQ
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:20:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDI2-0001oa-UL
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:47:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDI0-0002dD-4q
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:47:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dThNb9up0Udv82pZnAoy1KC7krZ7htoDQTtIaOGdW3Q=;
 b=GVlCAYzkWNRyAbFZ979ENUOuq4jsd7HhLHmG2OmZZ0lXtZ1qt1l+2H0MoSiZSs8SxHmKIG
 mt6NgnAeMcJppq0bPB0+0Nk8YpjLNSfRuqfiQJexCk2ZQXrbLzV+UPmpHYasSZRgx9cQw/
 p/1YlT4FVz34pzpLIOb8sKgxQGR7QKg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-dxFtDy2_Ox6b27Y0iTWMhA-1; Fri, 03 Sep 2021 13:47:42 -0400
X-MC-Unique: dxFtDy2_Ox6b27Y0iTWMhA-1
Received: by mail-wr1-f69.google.com with SMTP id
 r11-20020a5d4e4b000000b001575c5ed4b4so1819441wrt.4
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dThNb9up0Udv82pZnAoy1KC7krZ7htoDQTtIaOGdW3Q=;
 b=ak/ykR5NObbpbGkKBnsKKNHssgI0wkijBPHTRR+LllX9yvI3iT2SI6KL05mmfBXdfO
 xWFgKkLfWj91b/5QYaA0grrIX8pbe/5SZVNj2Wcn5yhgcmRTNPnASn7R8/+m/lUZZ3Qq
 orNGr60uxMySZnY6lJHpoFuJ2VwWn7sJgzW+rFP57EWT2NhPT1zYcxKisa5LCcXnzlIf
 U4b9Iome3+u3815F0C5ad4UI0dnX/pUPbori9G+CNMbLNNCv7K9mixf/DkhBZncI5N6I
 qzkjSUOLhw2HlDYb5qSRROXmdDbzWOL3KHlrFMb++CuSv1cSsg880Jv5jhI08LL12Ix6
 uUZw==
X-Gm-Message-State: AOAM532Nv2sRPHbBSoftbbqDTT+SRag9BS9OcpWRDnrDSCuZPd0bb+Xx
 77ZF/8hdwwMvSMSIrzvgn/EtD9aDAZnXoQ1Wfp6lKAZV4TOpK1a9kRsWu+iqk3IFqXi3jrAjvR3
 Zrycl0XgkXbEjJKJ+mPLmnW1RZwgAW+2SRKRoAs+98XoBLJ1yXol0Dmyik0HnxFvQ
X-Received: by 2002:a7b:c3d0:: with SMTP id t16mr12139wmj.169.1630691261326;
 Fri, 03 Sep 2021 10:47:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2SysOKuoZRdoE1pkwTtmdJbw35VhU7Ev3gABzeU23tq/9p3cRCC2MEatHy61N2yQkO6oWlA==
X-Received: by 2002:a7b:c3d0:: with SMTP id t16mr12089wmj.169.1630691260951;
 Fri, 03 Sep 2021 10:47:40 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id t11sm38889wmi.23.2021.09.03.10.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:47:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 28/28] checkpatch: Do not allow deprecated g_memdup()
Date: Fri,  3 Sep 2021 19:45:10 +0200
Message-Id: <20210903174510.751630-29-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

g_memdup() is insecure and as been deprecated in GLib 2.68.
QEMU provides the safely equivalent g_memdup2() wrapper.

Do not allow more g_memdup() calls in the repository, provide
a hint to use g_memdup2().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 scripts/checkpatch.pl | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index cb8eff233e0..5caa739db48 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2850,6 +2850,11 @@ sub process {
 			WARN("consider using g_path_get_$1() in preference to g_strdup($1())\n" . $herecurr);
 		}
 
+# enforce g_memdup2() over g_memdup()
+		if ($line =~ /\bg_memdup\s*\(/) {
+			ERROR("use g_memdup2() instead of unsafe g_memdup()\n" . $herecurr);
+		}
+
 # recommend qemu_strto* over strto* for numeric conversions
 		if ($line =~ /\b(strto[^kd].*?)\s*\(/) {
 			ERROR("consider using qemu_$1 in preference to $1\n" . $herecurr);
-- 
2.31.1


