Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D843D2706
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:49:08 +0200 (CEST)
Received: from localhost ([::1]:60116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6awT-0002y9-Ie
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akT-0000lP-Ql
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:34 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:40805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akL-0002oI-NZ
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:31 -0400
Received: by mail-ed1-x531.google.com with SMTP id t3so7317353edc.7
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w20at22fJRmOLaH2w4vov7p+ss5meuUwIflTMQ0+qWo=;
 b=chNXNIkZZ25SGVsg8+q2yC8N7gPsACc7zu0Skp1cjovgPWTexWGD+sGpHTz9d3qtt7
 aVw9uXUWuDT3kH89bV6cVI9kol3UR3ojKGjSPoXe9u3+5U+vtRNlAwMIu5Ag/qHFWaFm
 COGBHApgkcF0cq8fOHh76iIG9EKlajSMbH6eQFSsqlHzbqeF/YH4yXu3aabgdKVMFb9r
 eNRyvZSx/76l3XgVIe9FNO3/M0vKdGvhJUKnULVqndaVGa5h+cu/xy/5L+iiSbb9ujTB
 irfCZWmdh+uz9ih+msRqNSh7H/r42i0v4P99pBNXQWkGci1Q+osch7nO5b4e9HvPkeTs
 UNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=w20at22fJRmOLaH2w4vov7p+ss5meuUwIflTMQ0+qWo=;
 b=cW4KxYj4ZWizI5XRY+3sZcRA/qijUmxYYarMOkiHaXAKayTAgnIbci06ymHIvXZCpY
 AG7WFSwK3W9tENtteyAKWL3uZ0Y2xjeQ6oTil+6O1jAzLPoEkWmGnoXdyj+ugx642Jh/
 seW+4z21wa0li1n+FNsxBAj177XyJDM85rwo08Hq9p1Tr/nSwrQXMbahLv38CTys8xyb
 gRysf56J1r6zf2JuW4EzAedWgWCTDm/H7vgHz+PuWszT27DOWSbgNn+42HyCFF65gF6Y
 Gbkah4M/SvKjExlBTgrZre5naP4ifwJ//R9QTnUqx+Ue3IAn9FyCVce8KOVR6Tq/6hU2
 l8iA==
X-Gm-Message-State: AOAM5314bsj4s+PUZsqYtVyCDgNPsvTcPISBreu1bNagPNqsWgfX4Xpj
 uyb0OoXOxx3YxabiW5WxhYU5juoCgBB8Bw==
X-Google-Smtp-Source: ABdhPJzdf/LdVMvtHrv5bTDBnqZSVuuMVG5QG3o7utp1ClrZ5jhCr3xy0tE5yuHfDkvX6B4LLtRLqw==
X-Received: by 2002:aa7:c1cc:: with SMTP id d12mr267275edp.282.1626968184370; 
 Thu, 22 Jul 2021 08:36:24 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id qo6sm9638628ejb.122.2021.07.22.08.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 08:36:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/15] configure: Let --without-default-features disable
 vhost-kernel and vhost-vdpa
Date: Thu, 22 Jul 2021 17:36:12 +0200
Message-Id: <20210722153612.955537-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722153612.955537-1-pbonzini@redhat.com>
References: <20210722153612.955537-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The vhost_kernel and vhost_vdpa variables should be pre-initialized with
the $default_feature setting so that these features get disabled when
the user runs the configure scripts with --without-default-features.

Reported-by: Cole Robinson <crobinso@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210713093155.677589-5-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configure b/configure
index 40fa8cc26e..2a6d23a844 100755
--- a/configure
+++ b/configure
@@ -321,6 +321,7 @@ attr="auto"
 xfs="$default_feature"
 tcg="enabled"
 membarrier="$default_feature"
+vhost_kernel="$default_feature"
 vhost_net="$default_feature"
 vhost_crypto="$default_feature"
 vhost_scsi="$default_feature"
@@ -328,6 +329,7 @@ vhost_vsock="$default_feature"
 vhost_user="no"
 vhost_user_blk_server="auto"
 vhost_user_fs="$default_feature"
+vhost_vdpa="$default_feature"
 bpf="auto"
 kvm="auto"
 hax="auto"
-- 
2.31.1


