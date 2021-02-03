Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49A230DAF6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 14:21:39 +0100 (CET)
Received: from localhost ([::1]:42866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7I6E-00061v-CT
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 08:21:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l7I3G-0004B0-Lm
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:18:34 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:40798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l7I3F-000483-3i
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:18:34 -0500
Received: by mail-ed1-x531.google.com with SMTP id s3so13096960edi.7
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 05:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vC1DFNQkf/dFut7oaTGYm20dYDeQvJrAgy0bbpYNWS4=;
 b=keT1gk8Ikmqpt9Qt1ny5gRZUyPmxDyQnUOVrCP+GLWOp4zLJmcDqQQBcBBHnvyktKG
 IQ7wJDOcxL3WVrze2BF3+Nd5DilQHD/iwMV3OtpFHbxFnlIB5Agia+W2Njar0gfs4Xzv
 u2ttQ78+eAn3TR7n9OG0qH+oekmVPDYZ9nyNQZd/3btUG5KDI7LvnToLBMRRhYztNlly
 GvyOr+IwthRv4dXzAV/x+WW1M798VF5ucqDPSCqAeKb+0Wwqcp5zo5McLOVxJEmRH5KL
 eMg+8DHLXnobwZuYQKaenBI84p0tBfw1Xm7fmhkwcC47PEwBMfPS1TlS1GEQ+ZeetEVW
 jSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=vC1DFNQkf/dFut7oaTGYm20dYDeQvJrAgy0bbpYNWS4=;
 b=Zhs55eudnwdFzoPwO7XugXITgChHDyZ2xtLDybg0tZqaQoH/DrENzkiS/5cX8qUXhr
 XizPXw6MoRMhUOYQEYgbhU536ROqjPODQG239AwyZ6P3mUcvbA4kIj/QVbPq6UkTbilF
 kwG5AMRzKRb5kpRTSaVQBiqlzYOfXSjY+N/NuXahWjPhsUgnm2nOaGDkrFnXYToPPo2f
 5NUBdpWvkugUhNK1RzY2EE4sQLJICIh1g+t4THAxGyM1t/a0Uwfy7Apqat2N/W7zNses
 PpuicLuN+mT/vZeV0mVZ+gR5jl9q3QY6t1jh9R/ndJz0lCVJY9n+bH0xNle/+PZaFy+U
 kvrA==
X-Gm-Message-State: AOAM5331vju3RD/ZbH0VOubaeXKGHQY77kUyq7h5qbu7/cspkwh1WRQa
 TSU+NHiYIad9yv/JKAb/QGfxRMdd3AvF9Q==
X-Google-Smtp-Source: ABdhPJx3hWJbNk3Lcd3BVim0PKMPmRaduhTu24JYOs+soXxmrKOB6tbBLhe+LYRQNEFwyzhD7sQHoA==
X-Received: by 2002:a05:6402:306c:: with SMTP id
 bs12mr2861459edb.348.1612358310809; 
 Wed, 03 Feb 2021 05:18:30 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g14sm866892edm.31.2021.02.03.05.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 05:18:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] pci: add romsize property
Date: Wed,  3 Feb 2021 14:18:26 +0100
Message-Id: <20210203131828.156467-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: mst@redhat.com, lersek@redhat.com, peterx@redhat.com, dme@dme.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This property can be useful for distros to set up known-good ROM sizes for
migration purposes.  The VM will fail to start if the ROM is too large,
and migration compatibility will not be broken if the ROM is too small.

v1->v2: fix overflow issues in nearby code [Laszlo]

v2->v3: consistently use %u in error messages [David]

Paolo


