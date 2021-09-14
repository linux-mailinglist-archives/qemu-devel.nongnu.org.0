Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FF840A5A6
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 06:56:37 +0200 (CEST)
Received: from localhost ([::1]:49234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ0Um-0001rZ-5D
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 00:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mQ0Sl-0000Xr-C0
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 00:54:31 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:44977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mQ0Sj-0006Y7-IK
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 00:54:31 -0400
Received: by mail-pg1-x52e.google.com with SMTP id s11so11561509pgr.11
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 21:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lu7KEyZ0MKWw6pIip9dQogJnp+6amWln0gN0/mPiqyU=;
 b=tTZnEODMsnpMyoZftOHT8mY4dusAeSB+g+BhFLQR2w1m+Zvz30k2DjTwknmpsSb9AK
 fbbtqgHX68N1fbmQxNq8v4E4FQfxs9l4eaVY4Ycu+525xWZpDOOIzGmLNceND+LJGTxC
 NliqHmR9MH7/HIBPyjw5PI2/2kUCTfohH7k7YGBMrUSYZyqThgqHx0MDxv+yMRU2Obel
 ZGyDuveXlN1ybDKLpf0b59WJyJMX/TWLs14suHqrSN7M+CB08qfC9S1eLTEev6cfv+aj
 MOSgn0hiFiQB8ci7YI1rVZzX6MeiOyLYM57nizTy7NTNGWOAYoRx/Fd6mJ89+c/aHRJo
 eDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lu7KEyZ0MKWw6pIip9dQogJnp+6amWln0gN0/mPiqyU=;
 b=G0KFVkvmxhlLwSIMUGLf8TilliT+PR3aP8B2Z3C7wSaJFLJaJrcidPq706GLfrGHOb
 e2F8x6eVNHeFKaH+oe+JdyuCDZDRzdCJItWTspb7uBtkxItn8SEa8AgMxMFukPohtGXb
 c3EpKNtLdcu/9s+rNpTlowe8X2L+X9XCUSwzffyWinG6LPRlO7x30ItIYQGBtyxK2xDB
 TH/Jc1jTNGU9SzA6lj4j4X5w1sCyITb36PcVp2pcz6aLpCjb6BkPc7BcvRDXfKf3XsG+
 pQFpVgqwrXr7LqkyfHABpBqGIXKFrK5ABHVepokeTi8Z7BTq/bLWG+PYkxKyYllLSlXZ
 /3Ng==
X-Gm-Message-State: AOAM533P805mIr5o7wCmee4PX+NAo1NfhE7PIeH5u0bxwPu0InG23Zeh
 ZvLyRls02Jc4Rc1V/c85hvM+TF36uNoTHA==
X-Google-Smtp-Source: ABdhPJz+jgvUN/5C3RydXfwKDgubNLhU8CiVdUFNTFeXUZi9TNyP63Ze36O4wCX6BS8haMCaztzlQw==
X-Received: by 2002:a63:a517:: with SMTP id n23mr13992400pgf.412.1631595267676; 
 Mon, 13 Sep 2021 21:54:27 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.239.215])
 by smtp.googlemail.com with ESMTPSA id u24sm9262522pfm.27.2021.09.13.21.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 21:54:27 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: hw/i386/acpi: fix conflicting IO address range for acpi pci hotplug
 in q35 
Date: Tue, 14 Sep 2021 10:24:07 +0530
Message-Id: <20210914045410.3380946-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52e;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: jusual@redhat.com, Igor Mammedov <imammedo@redhat.com>, philmd@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor/Michael :

This patchset fixes the acpi pci hotplug IO address range conflict issue with cpu hotplug.
This issue has been reported here:
https://gitlab.com/qemu-project/qemu/-/issues/561

We have disucssed this issue at length here:
https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg02146.html

This issue affects Qemu version 6.1.

Patch 1 : allows q35 DSDT table changes.
Patch 2 : actual fix.
Patch 3: updates DSDT table blobs.

Thanks
ani



