Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A9834091B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 16:44:18 +0100 (CET)
Received: from localhost ([::1]:57014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMuor-0008IH-IF
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 11:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lMuml-0006qm-I6
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:42:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lMumi-0006b4-FQ
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:42:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616082121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6bw/oksnvPCOG8oCqFDgfpFZQ1idTb0xwLL9PpqNnok=;
 b=DUIYuvjgHAaHUXmeGgbfl/dqMFU4/VkD2oM96Nz2PfzP5xlRcs2XsWM4QCu9p4bXKlAczk
 r6Y0OdWFu+YeZaQzNIA/VHRVvn2LxmQvp/+gbWgDTsyewWnelRZYeULVS3a30zorQdpDmb
 dO/sz1FRYdCynxXYMywtCmwUUW48H1E=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-uPzRPjxfP-yYCouHlf927w-1; Thu, 18 Mar 2021 11:41:59 -0400
X-MC-Unique: uPzRPjxfP-yYCouHlf927w-1
Received: by mail-oo1-f69.google.com with SMTP id t23so21242823oou.5
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 08:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6bw/oksnvPCOG8oCqFDgfpFZQ1idTb0xwLL9PpqNnok=;
 b=pLwyoFk0V3T3xjxvw7qY0SXXxaInSoi9a/2t6y3ho/57FepZexh5sNNpNIkjtKuDyn
 mrbBKUaWL1ir6hCNoXXu5nS1RPrOyocu9tv7HjPBYAzjZZVKb7msepVoRtV5fJB5481K
 K60Ajbdzid5Xn6aWN8mhhS+jtEA9TitvUWjWp5GjiWgVg7uLWh0ftOmT/b4oZqE/KEXu
 7C1O+fXICHkusnJsdVM6aZKQhgJOb9eKsIHbAbxcaZnOm8ru14cmR/nYgp9QQpogId1+
 ewuXWJQfsxSVEoceaAm63XO0Tlat/q6GZLLeRdsFxY3QcZu8+0JudtOm742kvHo6WtkI
 o6kQ==
X-Gm-Message-State: AOAM530F8HglWQzYYaA4TtA7g8rM+srKZtx7aQetGqEirDd77+x0CcC3
 Z5P7VOLHHXn2PX8HT3G68bbI7B1h+Kf5OX4NFOTFYQUg+agT3koTkYuJJtil32XiaBp9ifB6zl3
 PcYf345qoPoY4RvP05KeMcdKtNmwd9XzSrTYUjqdB6Ft77L3AGO9tmJCLuOwoNz+/
X-Received: by 2002:a4a:4958:: with SMTP id z85mr7993706ooa.3.1616082118596;
 Thu, 18 Mar 2021 08:41:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkcOgC9cdXeGII/YxSkoKFY26CakelyTrPj7sgsWstWCmhlBK6kbzcyxuVwwqXRRN/ri6aug==
X-Received: by 2002:a4a:4958:: with SMTP id z85mr7993681ooa.3.1616082118398;
 Thu, 18 Mar 2021 08:41:58 -0700 (PDT)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id w16sm555622otq.15.2021.03.18.08.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 08:41:58 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: add virtio-fs mailing list
Date: Thu, 18 Mar 2021 10:41:57 -0500
Message-Id: <20210318154157.1357224-1-ckuehl@redhat.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, dgilbert@redhat.com, stefanha@redhat.com,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

General discussion and patch reviews take place on this list for both
virtiofsd (tools/virtiofsd/*) and the guest kernel module.

Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 25fc49d1dc..8921bc2119 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1917,6 +1917,7 @@ F: tools/virtiofsd/*
 F: hw/virtio/vhost-user-fs*
 F: include/hw/virtio/vhost-user-fs.h
 F: docs/tools/virtiofsd.rst
+L: virtio-fs@redhat.com
 
 virtio-input
 M: Gerd Hoffmann <kraxel@redhat.com>
-- 
2.30.2


