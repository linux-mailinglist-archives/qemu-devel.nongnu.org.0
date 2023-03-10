Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D25C6B4FB8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 19:04:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pah5i-0001tp-Er; Fri, 10 Mar 2023 13:03:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pah5d-0001sy-7d
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:03:37 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pah5b-0004bP-7y
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:03:36 -0500
Received: by mail-wr1-x431.google.com with SMTP id v16so5897993wrn.0
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 10:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678471413;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UQLzGwnL72KVb1PDPcwwlCxJejvM49ekj66trMuRuFk=;
 b=RtyCqNu3eC+kf6MFvBKW9/P0b4i76seEa227eoaRLJQSbnMC9AO8XTLGiURoh2CE2M
 UO+qGUg5tTwgSR20eCPcPRUbyFhFkdkgvflnPXR7NrXl6OJVa/fMukxWzXAFDULXfNXg
 mdvzIvb5eU2dR1Iql9FawQ3iTe17UEb80DQ0+SzZIUmaABvsJ4HgDwn8drwcngSA/6HN
 +OVWaKt3X1HrKHnaLS+U6oiyCethUJ558CYzkd3YbR0lC1Wt1QeLDPTjm9yonZhthGB5
 HUuWtjvQkypOoVkdc/oUsgY+4yQV+RrDfXemYElPEthYwOykIR3JDR6jnC8HNdr1w9LK
 ku9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678471413;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UQLzGwnL72KVb1PDPcwwlCxJejvM49ekj66trMuRuFk=;
 b=xJ9nGJGJQydTNAdsAxgrfH2+g2WMipduD3HgGL6BVMDVxE6XS6RGpwbpy1gYZ6EMDC
 ifsAaB2gXjEZdfPBDbCZbtTEW+XmxrcGv6ojz8jUwd72tK+HsW7odkvgfej/89DjRbYd
 2Lz/iFWYtOhvxmUcccw6otynB+ASBk26ONEEyuYb3thj37N8Gn2ElWH39n+YDCqkd+b2
 VW+7VFhcDkJ9vXZiGu2y3HqJmTDHT3MtjbB48jpO6zRl7scwFtuqYQnTZrUdyw6iMqcw
 /qmB1l8lkW/eqmd/xOVXmpBiqPUZsQfjWsF5Nh1Oi7Z4BoqaE16vH3lsl37ei/CJtCJB
 3ccA==
X-Gm-Message-State: AO0yUKUZx3UvIR3nKvNwWLriQq+EK1hreqgsFD6jT6bxhKYhxEDccIwv
 XTYty0A0CqJV0NxrOzNcXgieFw==
X-Google-Smtp-Source: AK7set/0vluPsQGTwYGrpfFMndEDcPd5VCc18CwcSoaBjhlOHYinfqu6GTSsqI6QZUCnUURu92dBwg==
X-Received: by 2002:a05:6000:1041:b0:2c6:e91d:1359 with SMTP id
 c1-20020a056000104100b002c6e91d1359mr16814996wrx.61.1678471413549; 
 Fri, 10 Mar 2023 10:03:33 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a0560001a4f00b002c573cff730sm361818wry.68.2023.03.10.10.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 10:03:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D873B1FFB7;
 Fri, 10 Mar 2023 18:03:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 00/10] gitdm metadata updates
Date: Fri, 10 Mar 2023 18:03:22 +0000
Message-Id: <20230310180332.2274827-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi,

I've sent a PR with the acked names so this series contains those that
didn't respond as well as some updates from the new year. The c-sky
situation is a little confused but I saw t-head was part of Alibaba so
have wrapped them all up there.

Do let me know if you want different mappings.

Thanks,

Alex.

Alex Bennée (10):
  contrib/gitdm: Add Rivos Inc to the domain map
  contrib/gitdm: add a group map for SiFive
  contrib/gitdm: Add ASPEED Technology to the domain map
  contrib/gitdm: add a group map for Google
  contrib/gitdm: Add SYRMIA to the domain map
  contrib/gitdm: add Amazon to the domain map
  contrib/gitdm: add Alibaba to the domain-map
  contrib/gitdm: add revng to domain map
  contrib/gitdm: add more individual contributors
  contrib/gitdm: add group map for AMD

 contrib/gitdm/domain-map            | 8 +++++++-
 contrib/gitdm/group-map-alibaba     | 7 +++++++
 contrib/gitdm/group-map-amd         | 8 ++++++++
 contrib/gitdm/group-map-google      | 5 +++++
 contrib/gitdm/group-map-individuals | 5 +++++
 contrib/gitdm/group-map-sifive      | 5 +++++
 gitdm.config                        | 4 ++++
 7 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 contrib/gitdm/group-map-alibaba
 create mode 100644 contrib/gitdm/group-map-amd
 create mode 100644 contrib/gitdm/group-map-google
 create mode 100644 contrib/gitdm/group-map-sifive

-- 
2.39.2


