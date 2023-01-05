Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64FA65E7FF
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:38:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMSB-0001If-F3; Thu, 05 Jan 2023 04:22:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMS8-0001EW-O3
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:22:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMS7-0002zN-BD
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:22:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VoRK0rFzs7S75xU/1rZXD4cpNyYJB5XutA3jtZ6rHPg=;
 b=XaTpD5MIa2hXdkXz7uuIwVsoGYVzmieKi+GKFdzJq2SXocOWXY/+LgJhE670O2y9JpbEAV
 m6howwhNy/a7TjofPt4CwdIyACltGhTDEyJdO3zc26UoURQtAwt8QeX3yX7ecevyq7HaQL
 zPKC6axtFiyN0sJw8ofk7/2muoHeXHI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-455-5qYjwYNhOoCL3drrV7Oemw-1; Thu, 05 Jan 2023 04:22:21 -0500
X-MC-Unique: 5qYjwYNhOoCL3drrV7Oemw-1
Received: by mail-wr1-f69.google.com with SMTP id
 h24-20020adfaa98000000b0028abfe5b8d9so2517210wrc.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:22:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VoRK0rFzs7S75xU/1rZXD4cpNyYJB5XutA3jtZ6rHPg=;
 b=uacZ7EyTVnQ5/eIbHz0wtlIMKnlmOOfhZ/PnMzHMW7zC2s7lRoOtn/b9SsjM7i6sJn
 SyFUpOMVUTjK8TPZn97JOMrzBXMAfXn9z/i+mAM1B3grdCLLS4PECrMEzl2biJJQWWZR
 eZ+Q88I+add+9nehSX+XeE6ea/XQpx5LkVbmVOLSewVnNUrJ9Bk6Okzghhl0MozDTw+u
 XS744dW//TEPy5HejtvpgaUO3E0ks5FgztJOvmY3quWB5AwnfPGkldWf9APgztCdjl57
 Oko0C7D40iM4JNFmKZBxtOtrr7xlA0Bn0DBinrmw7UA0JK7+U/Hxoe1ecfv7/DzYYMcw
 CUKQ==
X-Gm-Message-State: AFqh2kqW4McMKf6xdRK/PKqBGAaxRsCccPog85E8o7xhG8205IqPgLPP
 Dadr4bLkK5vEvGxJonBmYWmMXBTpDxMTFmNq6gSguwrvhZykq/UI9HKjJnWgU/KIqmNaS4r0PTC
 XTVf7nZBPShpOhw9fNEJL10BfVHyaGSAJN4LUKdkkoJwqyTlVjML8HFrBn/pv
X-Received: by 2002:a05:600c:3789:b0:3d1:f234:12cc with SMTP id
 o9-20020a05600c378900b003d1f23412ccmr37184211wmr.33.1672910539685; 
 Thu, 05 Jan 2023 01:22:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuZ56Exg9zLmxXPgKn58AO77LvwulxWCrEb5DZfQVvzo/I/ENXFfTniy/7PW85Sc6iDJDIqig==
X-Received: by 2002:a05:600c:3789:b0:3d1:f234:12cc with SMTP id
 o9-20020a05600c378900b003d1f23412ccmr37184195wmr.33.1672910539473; 
 Thu, 05 Jan 2023 01:22:19 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 z16-20020a1c4c10000000b003c65c9a36dfsm1575721wmf.48.2023.01.05.01.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:22:19 -0800 (PST)
Date: Thu, 5 Jan 2023 04:22:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PULL 33/51] include/hw/cxl: Break inclusion loop cxl_pci.h and
 cxl_cdat_h
Message-ID: <20230105091310.263867-34-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Markus Armbruster <armbru@redhat.com>

hw/cxl/cxl_pci.h and hw/cxl/cxl_cdat.h include each other.  The former
doesn't actually need the latter, so drop that inclusion to break the
loop.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221222100330.380143-8-armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl_pci.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
index aca14845ab..01e15ed5b4 100644
--- a/include/hw/cxl/cxl_pci.h
+++ b/include/hw/cxl/cxl_pci.h
@@ -11,7 +11,6 @@
 #define CXL_PCI_H
 
 #include "qemu/compiler.h"
-#include "hw/cxl/cxl_cdat.h"
 
 #define CXL_VENDOR_ID 0x1e98
 
-- 
MST


