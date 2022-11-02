Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D94EE616874
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:22:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGL0-0002TB-BR; Wed, 02 Nov 2022 12:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKx-0002Jp-SR
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:11:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKu-0003Q0-TB
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:11:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VhqK01gpDvzkT5GTeXlE5BJ7AbDBJOHBjeecaXlv+RM=;
 b=JYK5MkFwoI2RouYxLhI9tz19+H8mQRKWcQsIyWKfpOwao+o8k9G6JxXlKWRfZHpkLN2YE1
 mgkKParDvQNi3gzq3iwS4pXHMt8lI8DBJchrjCH1Pvmx5qHkIKLZ2QobrL3nltETjiLcb9
 hAP7iCZ/eK3LDBx9QMwShRSBZAWYoSM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-EEQOsGxrMkKEHfyB7JGAyw-1; Wed, 02 Nov 2022 12:11:26 -0400
X-MC-Unique: EEQOsGxrMkKEHfyB7JGAyw-1
Received: by mail-wr1-f70.google.com with SMTP id
 h26-20020adfaa9a000000b002364ad63bbcso5046404wrc.10
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VhqK01gpDvzkT5GTeXlE5BJ7AbDBJOHBjeecaXlv+RM=;
 b=wYVJ2kfOjJQEK17B5fa5IaVtK317GoKGcplaAdI8tVH9pBNjzXW+i8KzCTKdTx/KXe
 au9vIw2ep3PrjdRyHvSWCdlHGPlI3Zo+qtwQ1ncWEH+JdgGMvw6vYlx1sEvQyCCkCoex
 tpAYMYEPNkOefRC/kS6Pt40ZOP6PzqyrDg6Xf2y6S+qiSy9CNj8L/mFRihQKD+8VGK6a
 cIutHw1Yo3aJ1B+6qOLlOLoBALGwXVJWkW+nbNDv0v5Z/L1SCxdKJQp/n4Ild6GCm1Wt
 eLzYHUyiYyPmFXs4ILa7Af3rubbaexcDHG/RGnz2wzooZM3Hpd4rr6QRGRNzir7ZBzud
 Bhpw==
X-Gm-Message-State: ACrzQf2YfRtUOIpMf85Lss29OW86vMfVpDejBO7QaCaBco6K1OihEsY6
 cE7cCx4kLvEu3dNIJaAmV2UrBGEu9ra2PWQCDCkJqcdtDBv2f45hiVXk+T8Jvn6DJHRzvaNwGgE
 nRXSuY4Pag08S3LblcyKmvyZx/ZvupcZf0ERUBHBx8ltyO59Q7BiDszRBpomr
X-Received: by 2002:adf:fc12:0:b0:236:9b2e:4843 with SMTP id
 i18-20020adffc12000000b002369b2e4843mr15522976wrr.620.1667405485316; 
 Wed, 02 Nov 2022 09:11:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7BkLZzsmL6rlRJ87OggbNmqN7eZHboUHCJEKaTaGYW+97oCxnb1VkeH1mJ0WIq2Vi+ML5D9Q==
X-Received: by 2002:adf:fc12:0:b0:236:9b2e:4843 with SMTP id
 i18-20020adffc12000000b002369b2e4843mr15522949wrr.620.1667405485025; 
 Wed, 02 Nov 2022 09:11:25 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 r2-20020adfe682000000b002365b759b65sm13352759wrm.86.2022.11.02.09.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:24 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:11:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 64/82] MAINTAINERS: Add qapi/virtio.json to section "virtio"
Message-ID: <20221102160336.616599-65-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Markus Armbruster <armbru@redhat.com>

Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221020120458.80709-1-armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8b7d49b089..28cc70c25f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2017,6 +2017,7 @@ S: Supported
 F: hw/*/virtio*
 F: hw/virtio/Makefile.objs
 F: hw/virtio/trace-events
+F: qapi/virtio.json
 F: net/vhost-user.c
 F: include/hw/virtio/
 
-- 
MST


