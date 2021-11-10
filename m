Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023C044C186
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 13:48:04 +0100 (CET)
Received: from localhost ([::1]:44458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkn1H-0002U8-48
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 07:48:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkmt6-0005T2-NP; Wed, 10 Nov 2021 07:39:37 -0500
Received: from [2607:f8b0:4864:20::42c] (port=45817
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkmt4-0001TH-KT; Wed, 10 Nov 2021 07:39:36 -0500
Received: by mail-pf1-x42c.google.com with SMTP id x131so2516224pfc.12;
 Wed, 10 Nov 2021 04:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EHZ8+urRTStwCY0x86eV4hkxLqXoZN58wC2fNg6UqiY=;
 b=GgZ3GoJCzS9cpUgi5OEqP3+DrfR7D+OE2B179sLMCmQBhL0qwimiobJKTJrmcR/SJQ
 KGMpR3+rMMwzHSVnBj5RBOyDnMLBAVZtlbE1xWs6k6SZlMhOzmGVjOhsRpdjdQ/Byo7a
 tLAoN9m3G7iuc2Fgmlvn3QdwIgzzU2o1hyzlneiGYNlEKoczf+mukxCxyi00/bdkdy4E
 axleZOLMmdlgS1KoDNVONfjzJY5YIlTlaJiBN1gagPLcu5OB3n20kijZNRYodNre8LIQ
 v83QA3MPw2/5LdogM4QDM4BczEBVPJbrrIcwmCziBJG5S3mF+r+0ZaE4Afw+ewZPOlOu
 8BxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EHZ8+urRTStwCY0x86eV4hkxLqXoZN58wC2fNg6UqiY=;
 b=8GiQaFYUHxHjhFM3OsRmntMjDW8VCa2ICnL9JQGrbHlNxjXJxeLxeuWDBwAq+3H9Te
 035y/J+MtPuekvYC/fhB1XF/AGs4yb2FTnhRuVPBDBBnvO0dtzKYYdhpVpOPmG0U/vDh
 gwr8XZnGZ+26ji9/h9GjBzoUxKx09OWMhJZOsonyXRuUDQvXczBWUB19Q1/UaGUVD8iK
 jB3U2QH8I2xxIGTQIVGk/pg8HsuVf1+h824s+CE2OP31OC3yiZcCMqRA6LQBQaTG0JOX
 j7EyzRC7+jYEY0SlTDLVcvUtRI/Nf2y7sZPtUK5Wz0fPx5jPf9v9SwPiUU30NxBl3um0
 4HKg==
X-Gm-Message-State: AOAM532APWhYX8VNmzD7yzS7GO0D49R+VvDeSp4LKIg9xEGoVyfTn1Hm
 DO60qvPouJpbmnNPKUzfZwyvPOEKJzk=
X-Google-Smtp-Source: ABdhPJxK7JLcNlmB3rWjo3Aim0Akqaz9UGgzhP1M2Dej9LoqY9D3ci9SI1U+dfb8ys1a0llciyfEaQ==
X-Received: by 2002:aa7:88d3:0:b0:49f:baac:9b51 with SMTP id
 k19-20020aa788d3000000b0049fbaac9b51mr31088472pff.44.1636547972498; 
 Wed, 10 Nov 2021 04:39:32 -0800 (PST)
Received: from rekt.ibmuc.com ([189.79.219.109])
 by smtp.gmail.com with ESMTPSA id e14sm14101456pfv.18.2021.11.10.04.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 04:39:32 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] spapr_numa.c: fix FORM1 distance-less nodes
Date: Wed, 10 Nov 2021 09:39:20 -0300
Message-Id: <20211110123921.1927528-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=danielhb413@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Simple re-post because I forgot to add the "Fixes" tag. 'Reviewed-by'
tag from Richard was also added.

v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg02222.html


Daniel Henrique Barboza (1):
  spapr_numa.c: fix FORM1 distance-less nodes

 hw/ppc/spapr_numa.c | 62 ++++++++++++++++++++++-----------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

-- 
2.31.1


