Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B83403748F3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 21:57:07 +0200 (CEST)
Received: from localhost ([::1]:46224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leNdq-0007OB-SL
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 15:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1leNc9-0006Sq-K9
 for qemu-devel@nongnu.org; Wed, 05 May 2021 15:55:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1leNc5-0008WS-RI
 for qemu-devel@nongnu.org; Wed, 05 May 2021 15:55:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620244516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SMRKZ6atiGdLFg7up4QwzHhKeurpEUVx7j4qVVR/UxA=;
 b=DNKVbKeDsTmCpGTbSPtTxrEDPyZ44N6rBOhh/vJG8zPnzWHxZ5Aa64Kr7NqXj314ZVxihs
 /E+xdYb+qIkcIkDJPEFma5XtgDfjAN/1YMLw3zT6LZ70tmEmYDmAwHVzloZmcpVSWmfGui
 jyQGcXYbdnyg0EdubdoA4mwy+gsX1i4=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517--51Nq0WwNZ-zKZ147SyMBg-1; Wed, 05 May 2021 15:55:14 -0400
X-MC-Unique: -51Nq0WwNZ-zKZ147SyMBg-1
Received: by mail-oi1-f199.google.com with SMTP id
 u2-20020aca60020000b02901e51e89c211so1407009oib.15
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 12:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SMRKZ6atiGdLFg7up4QwzHhKeurpEUVx7j4qVVR/UxA=;
 b=RwDWZ4GfPYidSRTHkmUO/cDsIpLmBE+xUu5sI9Ldibcv1o18mpwPojEJaXqbc2LG32
 viHmVv8b9sUw+ehrkYZg4UEgkehFaZlMr6sS5Og2wgqQyRhpEUZClHt8ZbPr94c2OZVB
 /py2Dzp5YEsMUhgMb0jFhb7yWfA2WE49T2f/+HotR0WGZYPSo5K8v4P3QPmJroFLlUbW
 WleYaVo4FMZwnTQjgRFCtSug+Go7sCHjFe2vosvpBKTpt9BfR3TLMa6qAnJFHQr06xRT
 v9Tt0gcoI0nKgO6+nuo3vQ1Gw+Kp6TCuSxmMFRlfD7i+Nrq2TuLfuP+EsGzhZ5yWAk6Z
 rgkw==
X-Gm-Message-State: AOAM5319SUJ4jBzb20Uquqd4+Bp/rB/0pX89kEJEnUJRvsWKUyHaf8n3
 J39TCJH5pH7TdcdXwuqb7P2pdPCjnjK4YLxpks1tBmkXbhivLTcv8IbIbj6xCl8jH8+5Xc3+4I9
 WjthbK1jmZakZOeI=
X-Received: by 2002:aca:f245:: with SMTP id q66mr422303oih.179.1620244513731; 
 Wed, 05 May 2021 12:55:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgvf1I0asMHGK5Bd/ypOqSKZqWjPTTh35ZIcLH2cy+7iwODaCJDynmqqdTHjHBg2vsgzFDlQ==
X-Received: by 2002:aca:f245:: with SMTP id q66mr422294oih.179.1620244513545; 
 Wed, 05 May 2021 12:55:13 -0700 (PDT)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id o6sm33698oih.44.2021.05.05.12.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 12:55:13 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3] Document qemu-img options data_file and data_file_raw
Date: Wed,  5 May 2021 14:55:12 -0500
Message-Id: <20210505195512.391128-1-ckuehl@redhat.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The contents of this patch were initially developed and posted by Han
Han[1], however, it appears the original patch was not applied. Since
then, the relevant documentation has been moved and adapted to a new
format.

I've taken most of the original wording and tweaked it according to
some of the feedback from the original patch submission. I've also
adapted it to restructured text, which is the format the documentation
currently uses.

[1] https://lists.nongnu.org/archive/html/qemu-block/2019-10/msg01253.html

Fixes: https://bugzilla.redhat.com/1763105
Signed-off-by: Han Han <hhan@redhat.com>
Suggested-by: Max Reitz <mreitz@redhat.com>
[ Max: provided description of data_file_raw behavior ]
Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
---
John, my apologies, I failed to CC you on my last revision (v2) where I
addressed your comments.

Changes since v2:
  * Pulled in Max's explanation of data_file_raw behaviors with some
    minor wording tweaks.

Changes since v1:
  * Clarify different behaviors with these options when using qemu-img
    create vs amend (Max)
  * Touch on the negative case of how the file becomes inconsistent
    (John)

 docs/tools/qemu-img.rst | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index c9efcfaefc..cfe1147879 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -866,6 +866,37 @@ Supported image file formats:
     issue ``lsattr filename`` to check if the NOCOW flag is set or not
     (Capital 'C' is NOCOW flag).
 
+  ``data_file``
+    Filename where all guest data will be stored. If this option is used,
+    the qcow2 file will only contain the image's metadata.
+
+    Note: Data loss will occur if the given filename already exists when
+    using this option with ``qemu-img create`` since ``qemu-img`` will create
+    the data file anew, overwriting the file's original contents. To simply
+    update the reference to point to the given pre-existing file, use
+    ``qemu-img amend``.
+
+  ``data_file_raw``
+    If this option is set to ``on``, QEMU will always keep the external data
+    file consistent as a standalone read-only raw image.
+
+    It does this by forwarding all write accesses to the qcow2 file through to
+    the raw data file, including their offsets. Therefore, data that is visible
+    on the qcow2 node (i.e., to the guest) at some offset is visible at the same
+    offset in the raw data file. This results in a read-only raw image. Writes
+    that bypass the qcow2 metadata may corrupt the qcow2 metadata because the
+    out-of-band writes may result in the metadata falling out of sync with the
+    raw image.
+
+    If this option is ``off``, QEMU will use the data file to store data in an
+    arbitrary manner. The file’s content will not make sense without the
+    accompanying qcow2 metadata. Where data is written will have no relation to
+    its offset as seen by the guest, and some writes (specifically zero writes)
+    may not be forwarded to the data file at all, but will only be handled by
+    modifying qcow2 metadata.
+
+    This option can only be enabled if ``data_file`` is set.
+
 ``Other``
 
   QEMU also supports various other image file formats for
-- 
2.30.2


