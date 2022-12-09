Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2756481D0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:36:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bW6-0004SO-46; Fri, 09 Dec 2022 06:26:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUW-0003w5-7y
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:24:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUI-0000wo-6H
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:24:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IqCOMmh9H5Cl8rermYH1x21MQE2J0zZoMmtEy60MyuI=;
 b=i/xi5xv91rWw0LHUPV7vtqrcvfmClDsbNeVEkM+N3htmKTeiUcuxSs/DPH9Myue1YD1qNP
 jRnDlvteaB0rIYaBFcaRX3EQhoCJrqDe/EHfLj/iiFhUuDenw5HBbNfVauwWnxzpR0HsrH
 hVBStvCgv08i5mZnGa2gAUsmWtWjmj4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-610-U7UsAfmFMmS5ehqznLIRFA-1; Fri, 09 Dec 2022 06:24:15 -0500
X-MC-Unique: U7UsAfmFMmS5ehqznLIRFA-1
Received: by mail-ed1-f69.google.com with SMTP id
 j6-20020a05640211c600b0046d6960b266so1197765edw.6
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:24:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IqCOMmh9H5Cl8rermYH1x21MQE2J0zZoMmtEy60MyuI=;
 b=oR6zIhcrsZER+Mb9XqOaCKHuxeOz2Zy0bq22bm4+AoeFbKCcgEydfKH1KJrjCgEb9R
 qod61op+SOQwwD0+cVkQ6+Th1hl3iQmh+w+OU1hBXezxhjgpwcn96Q0OMOhdbDsS3MUw
 WZdRFj3dWPPEc/Ui7wnbLcwzSfDyarIQUI1si84ytT+AtuPfsrboNn2mQi4iOhCJj97Q
 Oej2113x9P/RAL+ItE0UnGhkEC4p8m5zY+m161LmiiGB7jqJGwAfnZik0WSh+jScYuAb
 FweJjg2y/hC0VGDEOQjxdRCZThR08PZ+JTkiwC2AKePt8ntU9oBFTGsZU2NK7n8wpjp0
 PyzA==
X-Gm-Message-State: ANoB5plJJx/SC0vAb7q1RFXrRDuzLWiM7QQAODmK2VhW1L2rlOg9qCIU
 yukBXbY2T3mER24A3dmI3WPF79RK6RSkl7FXRnCYMQ1Uho0IzXsoceUnvbaSZYBk7RYmBMd/6e4
 DPU/xsAh38byn1mI+ny9kNBMJI8KwbAiOdGZVMYXD5RAVl7+d7QOwtP4nnZaR5/83a9A=
X-Received: by 2002:a17:906:86d9:b0:7c1:2a0f:55b1 with SMTP id
 j25-20020a17090686d900b007c12a0f55b1mr3925044ejy.14.1670585054359; 
 Fri, 09 Dec 2022 03:24:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6lhl+JTRF47wBaaNcm55ei5ovRtxty6uvvnTLnIvlZgJLliC/xW7SYTV4I3K8jJCl0Kc78RA==
X-Received: by 2002:a17:906:86d9:b0:7c1:2a0f:55b1 with SMTP id
 j25-20020a17090686d900b007c12a0f55b1mr3925024ejy.14.1670585054021; 
 Fri, 09 Dec 2022 03:24:14 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a170906455300b0073022b796a7sm450864ejq.93.2022.12.09.03.24.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:24:13 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/30] configure: remove useless write_c_skeleton
Date: Fri,  9 Dec 2022 12:23:40 +0100
Message-Id: <20221209112409.184703-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

This is not needed ever since QEMU stopped detecting -liberty; this
happened with the Meson switch but it is quite likely that the
library was not really necessary years before.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index 26c7bc515468..e31d4522ea63 100755
--- a/configure
+++ b/configure
@@ -638,7 +638,6 @@ if test "$mingw32" = "yes" ; then
   EXESUF=".exe"
   # MinGW needs -mthreads for TLS and macro _MT.
   CONFIGURE_CFLAGS="-mthreads $CONFIGURE_CFLAGS"
-  write_c_skeleton;
   prefix="/qemu"
   bindir=""
   qemu_suffix=""
-- 
2.38.1


