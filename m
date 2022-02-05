Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 678964AAAC7
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 19:04:58 +0100 (CET)
Received: from localhost ([::1]:35914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGPQe-0000kz-W7
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 13:04:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nGPLo-0006yZ-QH
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 12:59:56 -0500
Received: from [2a00:1450:4864:20::52b] (port=35502
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nGPLm-0000yE-Ul
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 12:59:56 -0500
Received: by mail-ed1-x52b.google.com with SMTP id f17so3289505edd.2
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 09:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d/2WmVjCZ3YDUQOIS4cicTP6OWAEyhmdumavXsz0UD4=;
 b=T/7TN4ZRw+zEvn5BHJjLGJNZ+y1jYgQar7WgFJQwASRZXGgUhTaEQpg+vjCQJFIkQy
 t2CB9PpHAJFWjLjvzqujllA5qBuNPQPNf55FOSxRXGN69MyhXCyrDBc6epryqeAE3hV7
 OV/VIzRMv8nC9kVh9EmXB5rJcURZNGfaJM9KSf1Jlj5QtKZGeMWGaEd+pCiarFYO/8WI
 XsZH5xz2hHEOlmctdlx7hxTmlRp8IHvVc48g1QKDJI3szIqA673Of/43fjTphduoQ7EP
 1/LzWTDecwo+UqsvjFadw2S46WLeqZ9fNOdYuoV88Vu9WKwzg8IK8Y97NxHqcoa/FlDn
 A0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d/2WmVjCZ3YDUQOIS4cicTP6OWAEyhmdumavXsz0UD4=;
 b=wx+qFKFt1DusifG5gkeYPRiImjvQo6Bu2EyCUepJ5FFJ6XjscS+/sLtdYqvZpBsWdh
 BWDHIMDERpnSDhpTCD+KGKVvD5IcuHnprP+JqLO8lGAIK8IzGJD7XEReeekf53ld+5Mi
 wThHeiRQ8vBkBQ00ASacbtq3+kWHCOmorsMXcGFjM+gALCSl+4ofMs5YbpuGkw8D7LcJ
 DpseK/ucVuHvR4ADOFFltWx+/mRNK3sbS4TJTeUIFSgxDJJpuxRzYZrAcPQ0r9p3CMzZ
 N5nnERaO/giK9nJ51Bp5yVcKdZ1yagVdQdP/IuYV4Ryck/lumx51bFjQ4+7zft3Oxg0s
 8xmw==
X-Gm-Message-State: AOAM530fLRyLcWw4VBSqDoexFuszIU7cIDcuwtu9GS+H2nGGWfLIvFpx
 uRD0v3xXj6K3x4meuaU07ZbPBDHY0r1ZxQ==
X-Google-Smtp-Source: ABdhPJxmglom42aoStmrxzQX0tFKsngmd5a7N956wElS33EhxwMJ1GSjD8kkkWiPBpAihTsd40vuhg==
X-Received: by 2002:a05:6402:4384:: with SMTP id
 o4mr5591618edc.15.1644083991338; 
 Sat, 05 Feb 2022 09:59:51 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-230-134.89.12.pool.telefonica.de. [89.12.230.134])
 by smtp.gmail.com with ESMTPSA id e2sm1820660ejr.210.2022.02.05.09.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 09:59:50 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Make mc146818rtc more self-contained
Date: Sat,  5 Feb 2022 18:59:11 +0100
Message-Id: <20220205175913.31738-1-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The internal state of mc146818rtc is currently exported as RTCState. This
violates encapsulation. Resolve it by first converting the last external user,
then by unexporting RTCState.

Bernhard Beschow (2):
  isa/piix4: Resolve RTCState attribute
  mc146818rtc: Unexport RTCState

 hw/isa/piix4.c               | 15 +--------------
 hw/rtc/mc146818rtc.c         | 34 ++++++++++++++++++++++++++++++++++
 include/hw/rtc/mc146818rtc.h | 35 +----------------------------------
 3 files changed, 36 insertions(+), 48 deletions(-)

-- 
2.35.1


