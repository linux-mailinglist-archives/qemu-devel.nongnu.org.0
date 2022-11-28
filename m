Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F41E663ABE2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 16:03:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozfeS-00072i-SY; Mon, 28 Nov 2022 10:02:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1ozfeB-00070m-FY
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:02:22 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1ozfe8-0005Wr-UL
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:02:14 -0500
Received: by mail-pl1-x642.google.com with SMTP id io19so10391901plb.8
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 07:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lSiDagc7OCOKkLbBACL9tcNTTqBs4oCCRei4cYayvkw=;
 b=bxe7g1HMI2EE3o5gbKfBcq1Zu+ylD7TFNLWqrQXxBiqcurE5/2x/c+wQ0pXkbUZNP+
 I5KXCQlA49AqoOYkpIefi2LL6P/Tm9rNN7z7bq/s6RwvWC7vrgShlb3yHWcj4zHRkFAk
 o0a77cHS146+L849xFSZPq0cmm++VMM7flNwCtSs2iyxoQ8bPx1PMAaZHkuXKd0eHx+w
 w5rSavTvlp/AXlv+UU+K5+TgZcQ6DY3NTE8bA3kln9SPSC2tSuTfjyQoRXdwuNsbgg4r
 cn2b/e61m43WehADZvQ51M9RhBI7DJwYbBrMG/HdPE68IM8jeXt6nu6uukdIb0++pvVA
 5EpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lSiDagc7OCOKkLbBACL9tcNTTqBs4oCCRei4cYayvkw=;
 b=eBIz5RCgB18TP/iQ5NN587uB1weN5/jssB4FRTqKSACSN85c9iqfEWVe3H8NlUvqrP
 cF3btVbLFBUbvqb57CIFhDiZjYd08JITP3vc0T8kq+bSyrbMx3Lb+opA5gQkjMc2gxO9
 swyj6Tb0QNO9aoW6/DEGlj43w3Bbsw8/HC8TlC9i3DnDUaChm9FvYs/ooKMpp8Iaaix8
 LmQvWNTo2oHg+3azFnDEeRgp2LwP0VPDZgRkKM2EeW8Lae5xEuLNR4rksyaK1uvWH4le
 h9M8hjHwQUw832R0FxWIDbkI2spAwiShn5DEqE5rg9mAmkJZHXICTrwYvVNXumHL+/W8
 b2nQ==
X-Gm-Message-State: ANoB5pmMy48X7qd2ggZROMDYNCRdsLmRCYcMVz4V9nUHPadalFXwo2mD
 8IChcaUGUc63OJjgpaWjdrXPaA2AgLCo
X-Google-Smtp-Source: AA0mqf7mR6X2y+/1a55RM670ezMwFDfK4EAwc6sQ2ei/BKWgHagSx8UwAWqAhA98KzQb+1/pOuXL0w==
X-Received: by 2002:a17:902:d58d:b0:188:d6e1:b82b with SMTP id
 k13-20020a170902d58d00b00188d6e1b82bmr32406922plh.146.1669647730422; 
 Mon, 28 Nov 2022 07:02:10 -0800 (PST)
Received: from fedora.mshome.net ([104.184.156.161])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a170902ecc900b001886ff82680sm8997928plh.127.2022.11.28.07.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 07:02:09 -0800 (PST)
From: Gregory Price <gourry.memverge@gmail.com>
X-Google-Original-From: Gregory Price <gregory.price@memverge.com>
To: qemu-devel@nongnu.org
Cc: jonathan.cameron@huawei.com, linux-cxl@vger.kernel.org,
 alison.schofield@intel.com, dave@stgolabs.net, a.manzanares@samsung.com,
 bwidawsk@kernel.org, gregory.price@memverge.com,
 hchkuo@avery-design.com.tw, cbrowy@avery-design.com, ira.weiny@intel.com
Subject: [RFC v4 0/3] CXL Type-3 Volatile Memory Support
Date: Mon, 28 Nov 2022 10:01:54 -0500
Message-Id: <20221128150157.97724-1-gregory.price@memverge.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=gourry.memverge@gmail.com; helo=mail-pl1-x642.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Changes in this version
    * Minor bug fixes spotted by J. Cameron
    * Whitespace changes to docs and tests moved ahead of patch
    * Address Space access to pmem region is now as(dpa-vmem_len)

Note: Submitted as an extention to the CDAT emulation because the CDAT DSMAS
entry concerns memory mapping and is required to successfully map memory
regions correctly in bios/efi.

See https://gitlab.com/jic23/qemu/-/tree/cxl-2022-11-17 for the base of
this patch set.



This patches provides 2 features to the CXL Type-3 Device:
    1) Volatile Memory Region Support
    2) Multi-Region support (1 Volatile, 1 Persistent)

Summary of Changes per-commit:
1) Add CXL_CAPACITY_MULTIPLIER definition to replace magic numbers
2) Whitespace updates to docs and tests
3) Refactor CDAT DSMAS Initialization for multi-region initialization
   Multi-Region and Volatile Memory support for CXL Type-3 Devices
   Test and Documentation updates

The final patch in this series makes 6 major changes to the type-3
device in order to implement multi-region and volatile region support
    1) The HostMemoryBackend [hostmem] has been replaced by two
       [hostvmem] and [hostpmem] to store volatile and persistent memory
       respectively
    2) The single AddressSpace has been replaced by two AddressSpaces
       [hostvmem_as] and [hostpmem_as] to map respective memdevs.
    3) Each memory region size and total region are stored separately
    4) The CDAT and DVSEC memory map entries have been updated:
       a) if vmem is present, vmem is mapped at DPA(0)
       b) if pmem is present
          i)  and vmem is present, pmem is mapped at DPA(vmem->size)
          ii) else, pmem is mapped at DPA(0)
       c) partitioning of pmem is not supported in this patch set but
          has been discussed and this design should suffice.
    5) Read/Write functions have been updated to access AddressSpaces
       according to the mapping described in #4.  Access to the
       persistent address space is calculated by (dpa-vmem_len)
    6) cxl-mailbox has been updated to report the respective size of
       volatile and persistent memory regions

CXL Spec (3.0) Section 8.2.9.8.2.0 - Get Partition Info
  Active Volatile Memory
    The device shall provide this volatile capacity starting at DPA 0
  Active Persistent Memory
    The device shall provide this persistent capacity starting at the
    DPA immediately following the volatile capacity

Partitioning of Persistent Memory regions may be supported on following
patch sets, but is not supported in this version.


Gregory Price (3):
  hw/cxl: Add CXL_CAPACITY_MULTIPLIER definition
  tests/qtest/cxl-test: whitespace, line ending cleanup
  hw/cxl: Multi-Region CXL Type-3 Devices (Volatile and Persistent)

 docs/system/devices/cxl.rst |  49 ++++--
 hw/cxl/cxl-mailbox-utils.c  |  24 +--
 hw/mem/cxl_type3.c          | 292 +++++++++++++++++++++++++++---------
 include/hw/cxl/cxl_device.h |  11 +-
 tests/qtest/cxl-test.c      | 161 ++++++++++++++------
 5 files changed, 395 insertions(+), 142 deletions(-)

-- 
2.37.3


