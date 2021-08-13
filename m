Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4083EBB96
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 19:41:29 +0200 (CEST)
Received: from localhost ([::1]:51466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEbBP-0005mo-A9
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 13:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <johannes.stoelp@googlemail.com>)
 id 1mEb9i-0004ti-I6; Fri, 13 Aug 2021 13:39:44 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <johannes.stoelp@googlemail.com>)
 id 1mEb9g-0008Ne-Iu; Fri, 13 Aug 2021 13:39:42 -0400
Received: by mail-wr1-x433.google.com with SMTP id q11so14279413wrr.9;
 Fri, 13 Aug 2021 10:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TRzehENWVenwx+2eKZxeEkedInooacXD9R1T/qNf11Y=;
 b=nDmCiKTVg2UHEqkJQt9PwzTD8JJCPJhTrhAHqHIFlLbWvzhxOjbb/1wm3VO7hiFPyg
 E+G375pjgCGuEzeegmYU1PnEZxYNP8ICpSiRPh5vFQXEuRn+FymnkqFMt1He/Pc5nu27
 1W/mfE3YtvGmBiiiU8jFTe43ur0H4Q3JeXviGLC5rdjpecBKBVbrenq1cZHA89poICQ9
 woheg+dE19sDu31vevMU234pstMFHUIOAds4EAMznUeeaAs8cCsoCkNKFeLqLPHe3L07
 tbzhvqFlgoxiy/lbrhhw2wPBTTQjDc1yRS/iaTmZsMCABNhdAOyL9gAtls9bdHGGxYLR
 6jrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TRzehENWVenwx+2eKZxeEkedInooacXD9R1T/qNf11Y=;
 b=JNSCgdkp3O8BEkCbP+zbdYLZiXXFmLrj5oLUzPHI3El0gZYkJV87pIQIQWvxqZxq7D
 hT+YU8M8erXcoiWomY59rmy26BfmXe+JfodgP9tyODl8TNWGsYY5tc+t4uf55/iFGjr1
 y06Lnpks3avMlIBSC4w11Rm3LrQ+9F9pvUIyZ0n4bIb1gq041EwgCNAZVtKJ1/fUtDNK
 tQFJ1YMawFlMGr2SNgIsrZfYj0SSvIImmodyKO3RTUYFzMWMCgg5H+XXDJiF0GC3eWPx
 Gvq9tKecFjd0U8BYwbvvPZqcFCccGQi5YyK3a8xyD5OfkYuI9ey3nFbZH+WtZ5FndTN1
 QDHg==
X-Gm-Message-State: AOAM530gAEU2RmlGjFgIEssK4l59Skqxp8VYosHci3ypzNNSbCZySHn/
 A3/aMj7zDJN1gVkPXuhjC97kGNFbtW4=
X-Google-Smtp-Source: ABdhPJwxj+q5e9cgOMD8ZbH/408Aedi/OvDJqaz6bcWQiibNYDAvkd+lxlXjZdCCoPEPEGWF+KNJFA==
X-Received: by 2002:a5d:4583:: with SMTP id p3mr4390894wrq.398.1628876376336; 
 Fri, 13 Aug 2021 10:39:36 -0700 (PDT)
Received: from endor.speedport.ip
 (p200300c217088f1cee4d149593c8e9cd.dip0.t-ipconnect.de.
 [2003:c2:1708:8f1c:ee4d:1495:93c8:e9cd])
 by smtp.gmail.com with ESMTPSA id z15sm2135700wrp.30.2021.08.13.10.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 10:39:36 -0700 (PDT)
From: Johannes Stoelp <johannes.stoelp@googlemail.com>
X-Google-Original-From: Johannes Stoelp <johannes.stoelp@gmail.com>
To: qemu-devel@nongnu.org
Cc: johannes.stoelp@gmail.com,
	qemu-trivial@nongnu.org
Subject: [PATCH v0] kvm: unsigned datatype in ioctl wrapper
Date: Fri, 13 Aug 2021 19:39:23 +0200
Message-Id: <20210813173923.49278-1-johannes.stoelp@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210805193950.514357-1-johannes.stoelp@gmail.com>
References: <20210805193950.514357-1-johannes.stoelp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=johannes.stoelp@googlemail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: johannst <johannes.stoelp@gmail.com>

Ping.

https://patchew.org/QEMU/20210805193950.514357-1-johannes.stoelp@gmail.com/
https://lore.kernel.org/qemu-devel/20210805193950.514357-1-johannes.stoelp@gmail.com/

Thanks and best,
Johannes

