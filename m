Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9492A4859
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 15:37:13 +0100 (CET)
Received: from localhost ([::1]:47968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZxQu-0006Hk-D9
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 09:37:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kZxOP-0004F8-Sa
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 09:34:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kZxOM-0006OY-Fg
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 09:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604414073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g3L/0LWUS5AALGZ/Ad9jPepioK718BBOf2ilNljz6+w=;
 b=WsKy1whjvJWwNPoxucCKTu/tW3r1rPkkNY1WISvR0TjJxsOWgGp08DTJTGNe0x4/BXfmLP
 fCt0BAlNSnQzXQcmnfa0fcoBfw16yrSea1T8lMSsvNQcQVgZJFnyzqhbv93/fA9YaoqV/u
 lBoGvEBjn7kVPyeaiNsMDqS0y5pUvGg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-LMe-c61SNhKAn0CXVvg4aw-1; Tue, 03 Nov 2020 09:34:29 -0500
X-MC-Unique: LMe-c61SNhKAn0CXVvg4aw-1
Received: by mail-wm1-f70.google.com with SMTP id y187so1888582wmy.3
 for <qemu-devel@nongnu.org>; Tue, 03 Nov 2020 06:34:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g3L/0LWUS5AALGZ/Ad9jPepioK718BBOf2ilNljz6+w=;
 b=a3KycwMu7HfIKNnpwweD0jpdefmZLUfkhOxJh4HsBUu5s0WOsWUrTNhtJwFAM5v/VF
 kDjiI4RCQ4SSr/gdoMLEtKd6ISrHTy7rvGbIqKWKHM60QgSivObaLZaf5Ym8r58TBYxZ
 JKhmfEPMCgRpeZv/7Yj3uX+6wwXMg4EMofUNHmhwJWyDfvTU1jzy2cBwlaMjzFPs3Vps
 mOlHAqkWu1VLZspaCClKx4q/gP8ym+3W2PULm+6Tp0SpRJ5CpNmzVJ4pJLJzgFL99Iad
 uOmJi+Z+1uq5ni7ZzShkhp/fgflNoanGnBj5sTgN0gpPoRoYNOHikAQdnO/geBNyOcY/
 wCvQ==
X-Gm-Message-State: AOAM533LjyEKBIT0H9ZQTZH8+XVnKZK7w5Beq/aW3uBYQKDHu3ta4FZO
 d/KojSuXFPB/EcurSQzP5l3W0tZGVAa5w0PGADZjCBgPmXB2iPkWsf+wXtHJC/+bh+Fzu6k5rSD
 5V7oA8kGCBRSooPk=
X-Received: by 2002:a05:6000:108:: with SMTP id
 o8mr26457103wrx.256.1604414067347; 
 Tue, 03 Nov 2020 06:34:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzSX/BUKuCoZCXCSXiOIKmDTuUBN7wgJ59kwHKuKPbfsh6Da4DdlXhsdawlV58XHuyAub7nw==
X-Received: by 2002:a05:6000:108:: with SMTP id
 o8mr26457050wrx.256.1604414066730; 
 Tue, 03 Nov 2020 06:34:26 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id d8sm2956384wmb.11.2020.11.03.06.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 06:34:26 -0800 (PST)
Date: Tue, 3 Nov 2020 09:34:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/38] hw/acpi : add space before the open parenthesis '('
Message-ID: <20201103142306.71782-10-mst@redhat.com>
References: <20201103142306.71782-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201103142306.71782-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 01:02:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Kai Deng <dengkai1@huawei.com>,
 Xinhao Zhang <zhangxinhao1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xinhao Zhang <zhangxinhao1@huawei.com>

Fix code style. Space required before the open parenthesis '('.

Signed-off-by: Xinhao Zhang <zhangxinhao1@huawei.com>
Signed-off-by: Kai Deng <dengkai1@huawei.com>
Message-Id: <20201103102634.273021-2-zhangxinhao1@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index ade9158cbf..2c0c83221f 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -558,7 +558,7 @@ static void acpi_pm1_cnt_write(ACPIREGS *ar, uint16_t val)
     if (val & ACPI_BITMASK_SLEEP_ENABLE) {
         /* change suspend type */
         uint16_t sus_typ = (val >> 10) & 7;
-        switch(sus_typ) {
+        switch (sus_typ) {
         case 0: /* soft power off */
             qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
             break;
-- 
MST


