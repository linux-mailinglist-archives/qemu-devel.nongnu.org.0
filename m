Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1240C29E7C0
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 10:48:19 +0100 (CET)
Received: from localhost ([::1]:43990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kY4Xa-0000zh-2a
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 05:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kY4Kb-0007I6-QF
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 05:34:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kY4KZ-0006oA-PH
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 05:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603964089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cY+deayBxNQZ5fZVujrukclTBWuP/LZ1eYsnj5g50jE=;
 b=XYHuVfNT/CgbwUL85wStzzbjChTIPeKTWdORHCdpzzDnbvAzxI8SGc5An52Tr6Liov/iyt
 Egr6T1uIOwYpKPjF+RN4uTCyToUOtqpt+YcwU+9HpydmAsoOubAqoL8lQtTq/6aiQaKg1E
 WrpTB4mMB9EKQEN/ClndU/1s2PRWShQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-AX4KvXYpPhWLICyoLadJgQ-1; Thu, 29 Oct 2020 05:34:47 -0400
X-MC-Unique: AX4KvXYpPhWLICyoLadJgQ-1
Received: by mail-ej1-f72.google.com with SMTP id p18so939449ejl.14
 for <qemu-devel@nongnu.org>; Thu, 29 Oct 2020 02:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cY+deayBxNQZ5fZVujrukclTBWuP/LZ1eYsnj5g50jE=;
 b=mQchrGwNQohoUGFykHTjADfvmwiNP3yc9edUJxrbDcPaVG5gw13dCTWeAMb9xUODTL
 Q8jnyTMgPq4Ay5RxPPxpa0JKtygQN/NrT+o5NFcbTAFW9b235NH8jTnHzOnnvesxx+H7
 LkqZ9JkKYgktDv/0SbKrVwYaB9ziM5lNM/kT/zFjJXqzjQuYD/KOclr/RtoxyIIqbhb0
 w8/ENaZ604HTlovOTNbh8ZYOYAWtl5zzH25ae5rMIB3XYLBM7pDF/AQ5+N/oYomQg/X0
 V96kQ6co0A/JnCYiQOB1C0wkWEPiEDNll3whq8aCkWN4i7IM53thlTzucubO87P0Sxcq
 qO/Q==
X-Gm-Message-State: AOAM531qgHinbu2idOZM43g4n/+UghBBHmCZVwFgIl0zSB4Rvx/yHSxu
 NoOLkcBvMZMKozH30T8JQ8CdWemIXVJoAnyZLuowsPK+G+l99FkV4fdS+uK20QfUHITTf0ePn5i
 u+IFRopcQY/ZtegA=
X-Received: by 2002:a17:906:b216:: with SMTP id
 p22mr3200837ejz.228.1603964086029; 
 Thu, 29 Oct 2020 02:34:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPLTTLbOHI19ZgEFF+IVkmv117xie8yC+hrbe79Wkp3q3/8uNxXAwNzCsAZpTAzqdAUa2Bow==
X-Received: by 2002:a17:906:b216:: with SMTP id
 p22mr3200816ejz.228.1603964085862; 
 Thu, 29 Oct 2020 02:34:45 -0700 (PDT)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id h4sm1160619edj.1.2020.10.29.02.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 02:34:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 v2 18/25] block/nvme: Correct minimum device page size
Date: Thu, 29 Oct 2020 10:32:59 +0100
Message-Id: <20201029093306.1063879-19-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029093306.1063879-1-philmd@redhat.com>
References: <20201029093306.1063879-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 00:47:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Eric Auger <eric.auger@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While trying to simplify the code using a macro, we forgot
the 12-bit shift... Correct that.

Fixes: fad1eb68862 ("block/nvme: Use register definitions from 'block/nvme.h'")
Reported-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/nvme.c b/block/nvme.c
index bb75448a09f..bd3860ac4ef 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -755,7 +755,7 @@ static int nvme_init(BlockDriverState *bs, const char *device, int namespace,
         goto out;
     }
 
-    s->page_size = MAX(4096, 1 << NVME_CAP_MPSMIN(cap));
+    s->page_size = 1u << (12 + NVME_CAP_MPSMIN(cap));
     s->doorbell_scale = (4 << NVME_CAP_DSTRD(cap)) / sizeof(uint32_t);
     bs->bl.opt_mem_alignment = s->page_size;
     bs->bl.request_alignment = s->page_size;
-- 
2.26.2


