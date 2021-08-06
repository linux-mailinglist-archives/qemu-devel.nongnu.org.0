Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368E53E2EFA
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 19:48:30 +0200 (CEST)
Received: from localhost ([::1]:60946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC3xM-0002LM-PZ
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 13:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mC3wG-000170-Et
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 13:47:20 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:39802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mC3wE-0003Y5-Tj
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 13:47:20 -0400
Received: by mail-pl1-x635.google.com with SMTP id e5so8039851pld.6
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 10:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LMnMJqlBVAGgXsZpD4D4Kve+zwuhRM+UiP2QD4k26XY=;
 b=LoCJh4Sjj/QuEEcToJKUe+HwGW3qomb374blpvuLWakAoZalflY4Tf26WlVdkUJhhs
 DD6V25TS5iMmo8VceWpGci1LGqfrA95LLjkiqlCnb2bcm5u5Yk2yKLkU9RcAEdPT0kFK
 JMumwcz0ZDUJOOYmlpIm0U7gn6U/nYRZWGxW5Fv40R4Kpt35D6LBULv+kYU6xOiUSEE8
 cADcKMtAh6pUJh/HVSUtsN0cokD/8bxL80t99XQKk4CQ5qBtT30lJXRSGqIhm1+klVh2
 7xcGX9E+fMlLrVXSjeg5DcYD+AgDnGKONU0RGFBkAXPrex74ERMlwfobT35xYY+2n+TV
 8kGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LMnMJqlBVAGgXsZpD4D4Kve+zwuhRM+UiP2QD4k26XY=;
 b=QZ4oxv9pNv4Ujv6f2CSVpx6xfOGN65ygIDhVFRom0hPUTA0YCToca/Fs4Wkd1Uk2nY
 kBgo6Gid2BZPKm8WJGmbFy7K+cb8eVhQE+fJH6PwUtOK5U7KA0FjUpseLHX30mX0pgDr
 +YVxxmC4J3FlRKgecx5hqYGpaGQ1Q5yw1jsf1qAOLyaGfnn+0wi8Ix8PHJM3omxCvNQD
 rLj9d6lU0p86k2Fc07EgohbtV6rCOw+Ijrd7pi6Z6wUYxjbReqPNumOOCpK4HXzOCagq
 1p0nx2eqHRNRdMgTtaDOnonmksjMbgKddIs2wyidsWMkAPNBKB9NCM9JAYJ0S2KUPjWA
 GvtA==
X-Gm-Message-State: AOAM533G7wu2rYQJW151S+9mOlK7jia+8VqvWGIXCfItlQ4T9Vk6lVps
 IvM6MhI+hT9zCfeZ1WfiolKkXzQs5FsWkg==
X-Google-Smtp-Source: ABdhPJzidjlMdAP9f4akY0bp85TzYVqGq9aD9M4ePMM8EvpVXU9D/REBw6o2mfO2zVYdAshmE4Wdkg==
X-Received: by 2002:a63:1247:: with SMTP id 7mr392547pgs.269.1628272036250;
 Fri, 06 Aug 2021 10:47:16 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.106.6])
 by smtp.googlemail.com with ESMTPSA id ms8sm13561980pjb.36.2021.08.06.10.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 10:47:15 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] tests/acpi/pcihp: add unit tests for hotplug on
 multifunction 
Date: Fri,  6 Aug 2021 23:16:41 +0530
Message-Id: <20210806174642.490023-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x635.google.com
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
Cc: Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor :

This is the new unit test which I wanted to add for your change related to adding multifunction hotplug support.
This is not the final patchset. I wanted to run this by you first to make sure things are looking
good before sending out the patch series for this unit test with blobs etc added as per the rules.
Please let me know if we need to make any changes to the test arguments or add/remove anything.

Thanks
Ani


