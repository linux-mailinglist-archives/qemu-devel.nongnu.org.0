Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CB8681B51
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:23:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMadC-0002Ou-TZ; Mon, 30 Jan 2023 15:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacp-0002NM-0L
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacn-0006sM-GB
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675109972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nDSIlJyBLrtXOgfJXXEQveCbeBC55haTRswoh2r9x2Q=;
 b=JtyORxMFNiV+1cvnoAwJfjoT4FBmMpu6RlZ7YSTevLXWFCDkqiC/M8fibtLlStUzD7OGHu
 d12Wt/mIQtoao2caOFaR5zkBdZth7M+ndTykBk0g5i+ia7ewShLmlyVtIAg0/2IcXzlxO3
 grvW4STvKnEdJkDbKcE8SIz/iJ/2+3E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-47-jChwPK7xNJ-ZYPhnFRtceg-1; Mon, 30 Jan 2023 15:19:30 -0500
X-MC-Unique: jChwPK7xNJ-ZYPhnFRtceg-1
Received: by mail-ej1-f72.google.com with SMTP id
 du14-20020a17090772ce00b0087108bbcfa6so8115277ejc.7
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:19:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nDSIlJyBLrtXOgfJXXEQveCbeBC55haTRswoh2r9x2Q=;
 b=fEu/x2Zuo7WzH6fNM/KLtWgB3qndRGqPiO/qLVD3zNGtFSEKk41DSgWCdmifPZdOpq
 WUnpv1vUGL5zU5t25F7nPhZVn0hoKXhOXpf+FcyTuWhxTS4C0ENi5iJnEWe7toxtKJ7b
 JvcFMlVXxtt37ruEUS8qoky5G84pgnBt4/7vgv5AvDhmD6kXox+EP7mC+nItDXlkmrO5
 h62RWS7jMHVEfPZ3/v5W8A1Of9eDS8kzviLPfGgqHyPwAOJh7nPfVi3cYy0YG0K33FZR
 BqO5SHU7m7HOPgQuVRxSId7yg3wzESQkKJYeMwhIfXmGJlVKfb9Y45zD2H8MvrP7IN7R
 4GIw==
X-Gm-Message-State: AFqh2kqESyIxgGRZifqO9qGQDAEfXp2repJoR3cIiSahnbi6qD0s9ZN6
 RWetp7lD3q0B8loxF2gjgXHjztGFYd5U+dzeZcYY/wZVGiOGmu3UOC+jXKcjWBWMorvNIhXGExQ
 HAXIRN+z1F5PfHYX5Q9/Gfu7jB2H6QuWVgPolIKkPjgX09h7IDNjPuiXOgBTe
X-Received: by 2002:a17:907:7e9c:b0:86e:2c11:9bca with SMTP id
 qb28-20020a1709077e9c00b0086e2c119bcamr72074463ejc.30.1675109968674; 
 Mon, 30 Jan 2023 12:19:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvvsHjBGbVs7m6K56RiUBjQHoUKWs5ETdot71Q5pvdHOL5Oy9o+ZWFLk5D4AAkgFTyQlzWN5A==
X-Received: by 2002:a17:907:7e9c:b0:86e:2c11:9bca with SMTP id
 qb28-20020a1709077e9c00b0086e2c119bcamr72074439ejc.30.1675109968339; 
 Mon, 30 Jan 2023 12:19:28 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 hq15-20020a1709073f0f00b00770812e2394sm7341169ejc.160.2023.01.30.12.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:19:27 -0800 (PST)
Date: Mon, 30 Jan 2023 15:19:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 13/56] tests: acpi: whitelist DSDT blobs for tests that use
 pci-bridges
Message-ID: <20230130201810.11518-14-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
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

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-4-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..2602a57c9b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.multi-bridge",
+"tests/data/acpi/pc/DSDT.bridge",
+"tests/data/acpi/pc/DSDT.roothp",
+"tests/data/acpi/pc/DSDT.hpbridge",
-- 
MST


