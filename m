Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D04040DB4F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 15:33:44 +0200 (CEST)
Received: from localhost ([::1]:38964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQrWJ-00014N-JA
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 09:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mQrRt-0004uu-MR
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 09:29:09 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:38617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mQrRs-0007bG-0S
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 09:29:09 -0400
Received: by mail-pf1-x434.google.com with SMTP id y4so4370551pfe.5
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 06:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=09X4j67B6BoXtSvHgBoyrpdnmJ2b/i61QVvV/c1CsqA=;
 b=l1/cURuFlA00qFke+1m+xw5ihV8GdaMd9rNgivlye2De4hiA68ixVh5+DI5LT5g8jN
 cexc47zUA6i2J+HOpXoscTOnb//uv0fxKYjK9HvG+1Lt5xBxUP2scKrHccJh1zEeAfdb
 qOurPWAkMEOHG/GGjIN0/aEeQlqK2l/XLmNFTDoQYpTuoQISA7eLfFe124MSnRHG3GHS
 vQnn5ymesvIZt8WF3NAxA2ZwAjVcHOKZiEYQ/pRinoxFvLi1s0nXUYmXH3djpFzC+knF
 cPBH+QbVYYcGpQL44p/SxJu2v8xv9olmkfo4UrY6kL+l/c5SYvHnhvXciyBJ2RYhh2Fn
 yhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=09X4j67B6BoXtSvHgBoyrpdnmJ2b/i61QVvV/c1CsqA=;
 b=j+BckfrOJx2OKQN0ZQmOCm516nPYuk0AwGdg0+Ek72yrhYvJm0wFMaI88H9a6vd6ws
 QbmMOvVEwOpj2CSbx5tDlBCyh0pBFffMbJq6K0CtkEmjE1GI3qdbv5gbJR8qnKg7GmtY
 Uq+05k5jg593uCfzHQWDGGIe5YRFJovrJatNC1j3qcwE/da2QcQRU3E/mfWkNNWOcNX+
 FMMicUfCyBaJ8M1Nl0tHWpJrAgltskuAQJozKC+hS30hsWx00vt+k/ku5bQ93tye+Xjp
 nqUDpfcCg77k7qzk3Pzs5lYKuugrHHmZKTB1ZmzbR25MqE6NDfsyZPpG4+cG6HNBGCdA
 wH0w==
X-Gm-Message-State: AOAM531Y+Esa6QF+/A1rXLesstASt8LW05L9S+sDxI1rx8RA9u1JFREK
 dJMQAaAeDuuEubdXgWCcFO3gsVah7M1ggg==
X-Google-Smtp-Source: ABdhPJz893N0SNm6O05S48BpVZ50QcJbt6IpckhGjaal064tOtxEaluZn8vcrNUHOEJZq99RjiwLrg==
X-Received: by 2002:a63:4607:: with SMTP id t7mr5007331pga.332.1631798946346; 
 Thu, 16 Sep 2021 06:29:06 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.233.134])
 by smtp.googlemail.com with ESMTPSA id w67sm3458272pfb.99.2021.09.16.06.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 06:29:05 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org,
	qemu-stable@nongnu.org
Subject: hw/i386/acpi: fix conflicting IO address range for acpi pci hotplug
 in q35 
Date: Thu, 16 Sep 2021 18:58:35 +0530
Message-Id: <20210916132838.3469580-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::434;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x434.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: philmd@redhat.com, Igor Mammedov <imammedo@redhat.com>, jusual@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here's sending v2.

changelog :
v1: original patch.
v2: typo fixed. reviewed-by tags added.

This issue has been reported here:
https://gitlab.com/qemu-project/qemu/-/issues/561

We have disucssed this issue at length here:
https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg02146.html

This issue affects Qemu version 6.1.

Patch 1 : allows q35 DSDT table changes.
Patch 2 : actual fix.
Patch 3: updates DSDT table blobs.




