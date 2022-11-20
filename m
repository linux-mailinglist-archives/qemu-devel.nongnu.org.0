Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD12631498
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Nov 2022 15:09:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owkzd-0003mq-7D; Sun, 20 Nov 2022 09:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kfir@daynix.com>) id 1owkzZ-0003md-Vx
 for qemu-devel@nongnu.org; Sun, 20 Nov 2022 09:08:18 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kfir@daynix.com>) id 1owkzW-0005Ey-Rc
 for qemu-devel@nongnu.org; Sun, 20 Nov 2022 09:08:17 -0500
Received: by mail-wr1-x42c.google.com with SMTP id z4so1716067wrr.3
 for <qemu-devel@nongnu.org>; Sun, 20 Nov 2022 06:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y5Ex0Bl3KBJYtCBz6av1J8S5vyqnNv8zXT+XvHyx9qQ=;
 b=lXG73zhcw4P+8acckDyxdW9OT5CP6Oe4alNlahpuc33kZwk/xev0U0t1IawVlCGNQ8
 q1D34d/ru9jCFj1K8ROJIpBUifQW2dLvqeWIQROZTqb+1bpOjiKSvjxcpMn39cEK6ZEB
 tq1naSxBBBTiyIyd4hFvupOV5DT9TZCwlvLO4qFi9B/7tYyigAOXxtD7Fm8N8jcrbv2l
 B52qBLNz0ShJKOigY167PiMytbrhaFb7y0wL1wrJAH7oENCiAabTKYiIGxr95GEGxtmg
 VXDIapB7MhKn6iWBnfnpbScyeXCB/rzeFGiGsnUJ5JYbYuE4dRuGZr2qv5izDPWY1lh+
 P30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y5Ex0Bl3KBJYtCBz6av1J8S5vyqnNv8zXT+XvHyx9qQ=;
 b=Rejww8dEiO8hse1KS6QJKZ51RbbN6dOgBzUCPfw8tHfs776PmyYJr/mUjlYMwgxaT8
 qKn+4xrVd8W9wRqyESAB1V8kR3kd92S9E+BqDIwxT22+J+BXWh/TBYF2PeKRKKBlxgWw
 xwLnqzD5Bzyb7PQLMvoKr87SbgmpmL68mDfuVVhL7H5kwZOwfQyXANh/X01iXsCO319g
 gKfzLHClEbxYv7qWGbAAXwLj1Ca1l/0zMTt+2g+ZnLZswn+0wdmtYtLa+MTHHXGWzhAT
 4JX5VKVHfoFyatVIrpXUAjfiQ80aD2WBGiZ70GT9vpQuk44wLQ1TmKY8nFENP3cQm0WE
 ugXA==
X-Gm-Message-State: ANoB5pkHhUX5nGiPpvYqVBMXFR2iPjxnOtVHcgoj6/dYyuqWjxH3I5Lw
 o4YmmnzDo5Fi7ucsj5vKjf7v52nDkd3Cxw==
X-Google-Smtp-Source: AA0mqf4Pf9/cyb2Q329iIo14ZLCHffc9ottEh8iXbbYI5tOxf1bogKsA23JPYtLeGNyR4hr1GfWybw==
X-Received: by 2002:a5d:5968:0:b0:236:7005:7e4f with SMTP id
 e40-20020a5d5968000000b0023670057e4fmr9278493wri.337.1668952852079; 
 Sun, 20 Nov 2022 06:00:52 -0800 (PST)
Received: from bark.. (bzq-84-110-34-91.static-ip.bezeqint.net. [84.110.34.91])
 by smtp.gmail.com with ESMTPSA id
 d5-20020adffbc5000000b002417e7f0685sm10432310wrs.9.2022.11.20.06.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 06:00:50 -0800 (PST)
From: Kfir Manor <kfir@daynix.com>
To: qemu-devel@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Cc: Yan Vugenfirer <yan@daynix.com>
Subject: [PATCH 0/2] qemu-ga-win: 'guest-get-fsinfo' command wont query
 storage devices of bus type USB
Date: Sun, 20 Nov 2022 16:00:42 +0200
Message-Id: <20221120140044.752503-1-kfir@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::42c;
 envelope-from=kfir@daynix.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

guest-get-fsinfo won't query storage devices of bus-type USB (https://bugzilla.redhat.com/show_bug.cgi?id=2090333).

Bug, get_pci_info function returns an error after not finding any storage port device info on the USB disk parent device (because of USB abstraction).

Fix, skip getting PCI info (get_pci_info function) for USB disks (as USB disk doesn't have PCI info), and return an empty PCI address instead to keep with schema.


Kfir Manor (2):
  adding a empty PCI address creation function
  skip getting pci info for USB disks

 qga/commands-win32.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

-- 
2.38.1


