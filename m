Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F9E3EDDAD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 21:13:53 +0200 (CEST)
Received: from localhost ([::1]:56754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFi3S-00050p-Nb
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 15:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFi0F-0000pJ-8U
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 15:10:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFi0D-0000qQ-Rb
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 15:10:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629141029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RQxB1TlNf5YMQyS6h9MbUxuuEcuyJDS/VJ1Qzxwd2Yo=;
 b=VJNPktUjCha851DZ2gD3xeiXv9UEwB7i4/Ni9FDDC8k/aQ9kXIlJBSa0QWcQieE+LtBrz0
 rwOeUkFEPrJ1KURlJxBXAZisg4IvZlwkFy9O2YaxEB1TeQD2qtBPoW1omYmwfOIPAoDrdO
 W+cEoPn4mJ3/xivzPPrFrMa50lUe++4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-lE9CDyJ4OkOmhMheD8zQjg-1; Mon, 16 Aug 2021 15:10:27 -0400
X-MC-Unique: lE9CDyJ4OkOmhMheD8zQjg-1
Received: by mail-wm1-f69.google.com with SMTP id
 o3-20020a05600c510300b002e6dd64e896so220024wms.1
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 12:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RQxB1TlNf5YMQyS6h9MbUxuuEcuyJDS/VJ1Qzxwd2Yo=;
 b=UV9obpJZcqRfVY/q3QCgwbMdo60NEu0WeMMMvdFxU4Hbgc9lUycdrf2a5Z8QzXpQSS
 8ZGWt1p23WYcwnyZ4VPIRGhStqPSRUb755wF7aJNp+IQed1FWMBe0ES+g6ZPZHbWGm95
 4U0J9geTnjQ2dHzqn/LszZ+JVz+0axINIHe/rFxt9FUOR+iXKp2ocT29vq4XxYYk+1NH
 jkaMrWZjTSrOU1gdp4hNNGm67D9/89ceYm/0ZTa9TprmhvoHXbWTWIQQoshVGGF28Yw2
 Vz75i0r9y39sKHwM3LqZlu8C/PUqwZ9oWzplpm9ejqSD1z2MxCK0MUfZ87NkcL66eFih
 /dpQ==
X-Gm-Message-State: AOAM533qPKjaD65fXcwN49gbFU8eZri5EOg0DY1NQnkCAPx0XDG/Ut5s
 Yl+UI4T95T6XUojJQ0938UrvXsUKfuf+I2QUH8DNU7Razl1UosFGuRGQneD09jT1PRcgoQwmCGp
 VM54gzgSRKZkTiEfDcDNwbhQ6JXxysvJ1yeEgDqT9rCMsnFSjbPJPhGxv43Y0Kz5R
X-Received: by 2002:a05:6000:12c1:: with SMTP id
 l1mr466528wrx.293.1629141026474; 
 Mon, 16 Aug 2021 12:10:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwd0AgSPCSaoAc4/Cj6vLORH1fFaaFuve5bhcNaFIXqLZZxfZZBzaFj3UHapUfONSSbDYC3+g==
X-Received: by 2002:a05:6000:12c1:: with SMTP id
 l1mr466508wrx.293.1629141026290; 
 Mon, 16 Aug 2021 12:10:26 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 l38sm32351wmp.15.2021.08.16.12.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 12:10:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] MAINTAINERS: Remove SPICE from Audio backends section
Date: Mon, 16 Aug 2021 21:10:13 +0200
Message-Id: <20210816191014.2020783-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210816191014.2020783-1-philmd@redhat.com>
References: <20210816191014.2020783-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, clamky@hotmail.com,
 Yonggang Luo <luoyonggang@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=20Zolt=C3=A1n?= <dirty.ice.hu@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SPICE audio is already covered in the SPICE section,
so remove it from the Audio backends one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ec6baa7e4c..f18fcd76450 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2270,6 +2270,7 @@ Overall Audio backends
 M: Gerd Hoffmann <kraxel@redhat.com>
 S: Odd Fixes
 F: audio/
+X: audio/spiceaudio.c
 F: qapi/audio.json
 
 Block layer core
-- 
2.31.1


