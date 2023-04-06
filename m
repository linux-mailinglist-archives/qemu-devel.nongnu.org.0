Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B696D9839
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 15:29:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkPfe-0002wq-VT; Thu, 06 Apr 2023 09:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raghuhack78@gmail.com>)
 id 1pkPfc-0002wE-Tc
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 09:28:56 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raghuhack78@gmail.com>)
 id 1pkPfb-0004cT-2M
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 09:28:56 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 h12-20020a17090aea8c00b0023d1311fab3so40636978pjz.1
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 06:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680787734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1GbwkVL4dWB7PttvxkStaPImqbp/cFdbD1DV4GoX7/o=;
 b=eSXWj+6pvEVDxQHXlbSA6Au4VjRGmDTrK9noR161GftVXui2OemZVPtvC2vNEX3ZDv
 7wfrQck6VlKXBwutSQujQhDU+RzjR+3tf6PZbfb1oeJt2Qe77YXRIUZwcvGUaonqxL1s
 8Up7ElirEEptWQvEYWQH1yDGIOmlsAtkrQ7Gsd/BbRfs59KqmxBusoB2XaFvxpSrEacq
 k2y6NiPtMDCIHpwgJz0UmnODwu4H9JK6tZMVxhUOeJEjc1N/evKPK1eHRCHAC3liARX6
 zvtCJtA2Hv2ZwPUHWdv4spK0odNel8bxC8QATeQImwxx+P0KM0kmOHj4noGRFIRj6IbO
 othw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680787734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1GbwkVL4dWB7PttvxkStaPImqbp/cFdbD1DV4GoX7/o=;
 b=WqrdZyH3hSRJu4ui1MDMdLNJz/jRfHwtzwFLxmBkha3j1nCb3HEG7awu6M70VGJQJJ
 TLrKM8H6/W3iHjRF7ax6/a6lV3AwGTSJu07flxz3XyQ9qmrpGkNJUy187y7nrP1CX4oG
 w69ubA7aJjcETMvzRSVPGzCu77aykfIK8l/z95TGtxUy6IRYjvQbKpbl1K2GaPHnLrto
 haL7gwC+DtQXgyabHixUbgOMRCY0tOA2nLrKmaRsjXkMfWfPYOn6Mswjl/HJO/9I756W
 ZLNIF51xJWcl45TqO83bSmFANShKfGsXJCD5P/pR5+IowL0dmALAHLirvzEIsX7gA4oU
 c9bQ==
X-Gm-Message-State: AAQBX9fmqkYPRBLa27ZyQm2vvFO+xCb/rcGVxjie+L8bGG5jpKvw7JEx
 fg5ZSb4c/z3YUE6kH82ieec=
X-Google-Smtp-Source: AKy350Y4BXX9DS62XX4U8loswYggJl/3m8MzKGxRQaMvDO5fGWJW6QJM0SUSokCvqMLOwQrc3VM6Ag==
X-Received: by 2002:a05:6a20:c746:b0:d9:6c8b:e9aa with SMTP id
 hj6-20020a056a20c74600b000d96c8be9aamr2845473pzb.0.1680787733714; 
 Thu, 06 Apr 2023 06:28:53 -0700 (PDT)
Received: from raghuh-elastics.. ([2406:7400:56:45c3:5697:bbf2:968:7051])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a62e814000000b005cdbd9c8825sm1349883pfi.195.2023.04.06.06.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 06:28:53 -0700 (PDT)
From: Raghu H <raghuhack78@gmail.com>
To: maverickk1778@gmail.com, Jonathan.Cameron@huawei.com, qemu-devel@nongnu.org
Cc: Raghu H <raghuhack78@gmail.com>
Subject: [PATCH v1 0/2] Update CXL documentation
Date: Thu,  6 Apr 2023 18:58:37 +0530
Message-Id: <20230406132839.3357195-1-raghuhack78@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230406113640.0000277c@Huawei.com>
References: <20230406113640.0000277c@Huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=raghuhack78@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Thanks Jonathan for quick review/comments on earlier patch, as suggested
splitting into two separate patches
https://www.mail-archive.com/qemu-devel@nongnu.org/msg952999.html

Removed the unsupported size option for cxl-type3 device, Qemu reads
the device size directly from the backend memory device config.

Currently the Qemu CXL emulation for AARCH64 is not available and its
only supported on x86_64 platform emulations. Removing the incorrect
information and populating with supported x86_64 sample command to
emulate cxl devices.

The document will be updated when the AARCH64 support is mainlined.


Raghu H (2):
  docs/cxl: Remove incorrect CXL type 3 size parameter
  docs/cxl: Replace unsupported AARCH64 with x86_64

 docs/system/devices/cxl.rst | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)


base-commit: 7d0334e49111787ae19fbc8d29ff6e7347f0605e
-- 
2.34.1


