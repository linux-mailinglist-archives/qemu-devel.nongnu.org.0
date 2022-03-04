Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43984CD5DD
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:05:38 +0100 (CET)
Received: from localhost ([::1]:55642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8Yr-0008P1-Vu
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:05:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ88A-0007ip-CI
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:38:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ886-0000Lf-9i
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:38:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1o/co5SzJ3afQc19M+6XwM/OcyfK5XPAzn/pSwX2qvQ=;
 b=MN7Dh48eQkAavl4ESWylX7g8B+j+bVQq9xaCl8TIhi6EWg6sEdp6FEe8kf4PZD1ngEDn95
 KUobvuOMFb8R0MM2h5poz699jDGmCPN7JVR/2Hfgl/tYFJWWV2tNtJjczgfhPhYBHZl+98
 HuynYGQ1Er0S4GO0RQF6rFMR64s146Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-yEZRji4pPLmL0SwMW5NigQ-1; Fri, 04 Mar 2022 08:37:55 -0500
X-MC-Unique: yEZRji4pPLmL0SwMW5NigQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 nb1-20020a1709071c8100b006d03c250b6fso4410693ejc.11
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:37:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1o/co5SzJ3afQc19M+6XwM/OcyfK5XPAzn/pSwX2qvQ=;
 b=ksv4K3lXrgNuFgUWabbg5qZ1vrMiRQkB5cGaObVhN/VRq6QqLcvJuiwaB68O9DPByO
 UjLMatohcLYrdbegsw8oY1aiMnwwPML3cSZon10P5OpCdVPqLNYowvnETGrzI/CLIHTI
 zuP2SZ3bAdSewjWhCaDKli/Z8gUYfIBttLBGU6yjpYuhmk90gREkKdlS8ZTmnaY2lEgm
 JzDuH08KLbWMInnqH1m9aS32jZ0lIuG5o63w3DKGONj6VnGwauBmHXI0/glc+fftERkq
 rGaYfejmHdirMt9WIypyY2+xp0RzDCGFZZ3K82fV89nNCNXzp9+duANYESZGgbJs1zc3
 MlHw==
X-Gm-Message-State: AOAM531zOgUm7fKDL3ZbwOgsgylGqn4411fd8GthFmgAgj9tEvmF5wVR
 W5MR/d+d1qa29ulWrqBmlKvvW7+nbvOcvNVyITpbvM75ag3rPs9cGpV/WI96MudOxZ/o2fSwLo8
 eSje2e3XAiAQvC1S8X/Z1ffxYLARUkyX7ZdVDDLoYL9Iy7gvzi7tlyIKd4lfa
X-Received: by 2002:a05:6402:1d52:b0:415:bf04:28b4 with SMTP id
 dz18-20020a0564021d5200b00415bf0428b4mr12077194edb.83.1646401074345; 
 Fri, 04 Mar 2022 05:37:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznaoEZTBpvVpjaXRoOH2F50v8Vst5jjyGCgQ5+HW0gJXZ2T92BfbuuU+qCbwXCl7rm3hydmw==
X-Received: by 2002:a05:6402:1d52:b0:415:bf04:28b4 with SMTP id
 dz18-20020a0564021d5200b00415bf0428b4mr12077166edb.83.1646401074016; 
 Fri, 04 Mar 2022 05:37:54 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 g11-20020a056402424b00b00415c69b46b2sm2090159edb.24.2022.03.04.05.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:37:49 -0800 (PST)
Date: Fri, 4 Mar 2022 08:37:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/45] hw/acpi/erst: clean up unused IS_UEFI_CPER_RECORD macro
Message-ID: <20220304133556.233983-6-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Eric DeVolder <eric.devolder@oracle.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

This change is cosmetic. IS_UEFI_CPER_RECORD macro definition that was added
as a part of the ERST implementation seems to be unused. Remove it.

CC: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20220223143322.927136-5-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/erst.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
index c0a23cf467..de509c2b48 100644
--- a/hw/acpi/erst.c
+++ b/hw/acpi/erst.c
@@ -80,11 +80,6 @@
 #define UEFI_CPER_RECORD_MIN_SIZE 128U
 #define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
 #define UEFI_CPER_RECORD_ID_OFFSET 96U
-#define IS_UEFI_CPER_RECORD(ptr) \
-    (((ptr)[0] == 'C') && \
-     ((ptr)[1] == 'P') && \
-     ((ptr)[2] == 'E') && \
-     ((ptr)[3] == 'R'))
 
 /*
  * NOTE that when accessing CPER fields within a record, memcpy()
-- 
MST


