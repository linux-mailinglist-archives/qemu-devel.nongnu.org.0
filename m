Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31030696B52
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 18:21:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyzR-0006Re-I9; Tue, 14 Feb 2023 12:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pRyzO-00069I-3s
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:21:10 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pRyzL-0005e3-OV
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:21:09 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so12162842wms.1
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 09:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xo1s3tezkxPZTGckGZcvwnxUiQDZL/tT+JHyzRXDrJE=;
 b=V616EZlAXUlWe05axTV/iIkJ3cTzwJr6e4Hy3sfBpCDOVm01+TsbwfsdS5wBphYHJP
 8Yd7yf46TDCVDZ3vMXhfQL4iXAkuta0KAMiu9p8e7YCf6EWnjp8H2BPL3y/q7m7dAKfR
 2AB7Y9u+WFeowfsHPLLywY5dYPNJ01A2SDIvkkeeeZpkZFyb+Y42EzEeZsGvovI2P8+t
 1j28+iWjIqPBRfGkAsswCvKR41/T1tAv4HXSkYNwYJzfq2mSpbJJVQZgG+s9rpVz9TiB
 yafyx8yE/9k5Pn8kviSZ9HaxZEY1XmrIJreAuPF6ITer+OeZuhb56lrtGI56rmr3N6gZ
 odFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xo1s3tezkxPZTGckGZcvwnxUiQDZL/tT+JHyzRXDrJE=;
 b=WAinA51TaPlWDcwjHK+I0SPcp0KN/iUDnf5B7Sl5cS12MsrJRsl0Pm6g60AYU2lMFd
 4Td5omK4cGFIikMtoh0dz5BpWCiBD4ND7GR9kRB0RAfFOQuykRsIFABhYOLiCPOOlIWR
 nWJm2dbIqI10jtPMu4mZeW+eiYvBGfgb1OsNHmDg5QAfLO4XVY5WMCi55KeZvrjWAHw/
 QDpYmCdr33LMHSbcBHzTPnyU7Ex9QJBRTPX+3lYVJAg2rta9LXz40VOIEDkicuZVzjk8
 HRXK4o9QxhDxbX1+xNjiClXDjh4fC4m/nF0+rYjInLHPhO5qDW2DpegPipGyNbLjFek+
 /KvQ==
X-Gm-Message-State: AO0yUKVBNeW6aP1UrxdgbAZMoiqqb/YdxyOVlSRU7MheACvHHMHECpZy
 3+n46d3uf5z7BFz9sRJKbuMh0A==
X-Google-Smtp-Source: AK7set+9dU/nk0cn31biqr/ALN0rj7u2I9ktL1nDxIUmmaKSSeOj19Pp2aSMZBlTPPixUZoFSNLBDQ==
X-Received: by 2002:a05:600c:45d2:b0:3df:9858:c02c with SMTP id
 s18-20020a05600c45d200b003df9858c02cmr432707wmo.1.1676395266173; 
 Tue, 14 Feb 2023 09:21:06 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 p24-20020a05600c1d9800b003dd1bd0b915sm20636570wms.22.2023.02.14.09.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 09:21:05 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, ola.hugosson@arm.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 0/2] hw/arm/smmu: Fixes for TTB1
Date: Tue, 14 Feb 2023 17:19:20 +0000
Message-Id: <20230214171921.1917916-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32e.google.com
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

Two small changes to support TTB1. Since [v1] I removed the unused
SMMU_MAX_VA_BITS and added tags, thanks!

[v1] https://lore.kernel.org/qemu-devel/20230210163731.970130-1-jean-philippe@linaro.org/

Jean-Philippe Brucker (2):
  hw/arm/smmu-common: Support 64-bit addresses
  hw/arm/smmu-common: Fix TTB1 handling

 include/hw/arm/smmu-common.h | 2 --
 hw/arm/smmu-common.c         | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

-- 
2.39.0


