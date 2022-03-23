Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3A64E522C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 13:29:49 +0100 (CET)
Received: from localhost ([::1]:37710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX07Y-0000q8-BC
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 08:29:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWzSp-0002Qp-Qh; Wed, 23 Mar 2022 07:47:44 -0400
Received: from [2607:f8b0:4864:20::f2d] (port=40475
 helo=mail-qv1-xf2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWzSn-00028w-DQ; Wed, 23 Mar 2022 07:47:43 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id hu11so965948qvb.7;
 Wed, 23 Mar 2022 04:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sgi1Bo1dLp+K4wakxAquZ3KWEWKycg8aRWxt3F+MqdU=;
 b=ktRwK86aVUp0h1LWOKOPmUiSLSc1ZN0DURizD2y5/GjbSjgSyWuU7CyP3o3ncWHmC8
 J9VX5pfBKzUlK6opikLXatlj0HvY7dQ/pU9toBhVpgoRoJOftLMI7lwPHagVuUcXQczG
 OalqfDNib39vrUBgCPj9nhsU/D7fOQ/wQ++Eu1kOva1sH2svaikEUqYTfOfKDaO8qaGo
 C7k5GXs7swfUbBAkEPaCCc3BQID6HyZIkG1cFHdF1HuhXAty1KjJ02m5Qi2y++ncXAga
 w4uZI3L7Hs8wnrEybgFr9BJXDPFy7MkO6TIo93px4aqcAJqpAd4MhbZNsIc7YCwA/ZjV
 ORzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sgi1Bo1dLp+K4wakxAquZ3KWEWKycg8aRWxt3F+MqdU=;
 b=HGX+pnVCvZ0WuCOfFbhEY9FcwCReEzxS18B9FGuLHUKA/W0ZCdIldK0/AtVFlMys07
 1sfbzGY/j6rleyzKifktsSRC0C2lu4seOv/vpduSh33CiDTYBRJbOFJfA345TiKOOPpN
 Gfn6LiTc1LYYRddZQ2oBxz+9FClsccmb/ns94MalUJay1ffxZyUU1IOltcV1CSp0Zllj
 GyjwaeZrzUh2AlrcLJs4C7QARZXx1OXdH1bv+58tX8a5VLQ1YSEpnU8qb5LKfrQ7zI7e
 6ZAoqfCH+Y/N0VJcp0bubQKI+jn3xpyJznmkiBVdBEPAFNeqLmHn5cvO7kGmNncbXf/e
 Gy8A==
X-Gm-Message-State: AOAM532mPN+bRprKcZkPOOMpRGSiK2CyQVOw2kY28XAz5ZQIiBSXjbtK
 JvyMz7SB3PqjZE+oCKYbwb8D2G7qTcw=
X-Google-Smtp-Source: ABdhPJzQvPbyrnRVdLesVZWQ1dQty5TZ/Eb44UroRqO+v9A9w/HuLcr5SMc680aYKDNJpTQSBi7ZOA==
X-Received: by 2002:a05:6214:e82:b0:441:3231:4bce with SMTP id
 hf2-20020a0562140e8200b0044132314bcemr8714991qvb.89.1648036044983; 
 Wed, 23 Mar 2022 04:47:24 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 w1-20020ac857c1000000b002e1e899badesm15953534qta.72.2022.03.23.04.47.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 04:47:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0 0/2] misc: Fix misleading hexadecimal format
Date: Wed, 23 Mar 2022 12:47:16 +0100
Message-Id: <20220323114718.58714-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Fix 0x%d misleading format reported here:
https://lore.kernel.org/qemu-devel/dab530d9-53d2-3d7d-c9ac-44906ba9b386@linaro.org/

Philippe Mathieu-Daudé (2):
  block: Fix misleading hexadecimal format
  hw: Fix misleading hexadecimal format

 block/parallels-ext.c | 2 +-
 hw/i386/sgx.c         | 2 +-
 hw/i386/trace-events  | 6 +++---
 hw/misc/trace-events  | 4 ++--
 hw/scsi/trace-events  | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.35.1


