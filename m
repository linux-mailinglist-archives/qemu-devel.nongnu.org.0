Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2075FBD8F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 00:01:24 +0200 (CEST)
Received: from localhost ([::1]:51406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiNJT-0002T4-AL
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 18:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1oiMfM-00045t-32
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:19:58 -0400
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42]:44742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1oiMfK-00069G-19
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:19:55 -0400
Received: by mail-qv1-xf42.google.com with SMTP id y10so2217387qvo.11
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 14:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sINKuKOEiCIa2vTfT03+2MwDHadp410OQVmZv4nahEQ=;
 b=JS6ro4eUzOk5m8PvhdpkI8lEQazk4kTsWazJK/19fHWcvoFvPqEQ9g/MsEbN3GSO1t
 7LleBBuov8J0It2JsFh/80VOc7dmAhTQ/x5CfZjBwOQcrJe9AazjwsRNO5eAr/7jNc4B
 y/RvNxKv5G1wtCQS9XwYLwWO+oPI6wkrv2/kNCzdLIo3MtCSgoqTQDCs6Kv6ZjYCmsnO
 rNXO/8qtY52Ip2pdfRgUYw72K6TB3Rroayp5nCXAHjPze9rMuimyGUhGYDB0KvzIS6P2
 aQcNZClR7d7Mp3bX9hWXj7wg5AifIrd4d7/yLtbKWp0yJcrqs8skoQ0f0N0SWmHD8F+b
 CivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sINKuKOEiCIa2vTfT03+2MwDHadp410OQVmZv4nahEQ=;
 b=tFk9TAcvVSQ9B0Cp8+fWZP7rp7mEgRLfAOpLZp/5DMgoDMVqYIjvbCZlD+X8RxvLQn
 u0sp5+K2s8R/gcyvlpJU0M1Ree53Rxyx0H9iQKzN3Lnd4riGzpoDerfTMwR1n2WpdCIq
 KxCIeZaEL/4HcoVAlFog1Z70pQ1VPXnaTKNnMscS9isvGzRjeN5Siroi0tCTEZ3aBvKH
 KZroBj8p4m8H8CPvfTYYE8MaifPQGSXNReGssAl5v3hENCOR2pNSKumbCMrnRY0GB4gH
 q72+TUEhLZUZzP5M3Dn/rlVrDXlugDR3CqlXOt3y7QCbqmVBZIo2ykEfQzprVA4T4gSH
 7Mvw==
X-Gm-Message-State: ACrzQf3vDG355x3yGRt8mAE0yUUpYsNiN0evo4zLl3toSRq2D4pPRQGU
 fmBGsu7oDq35dyO7bD/rdw==
X-Google-Smtp-Source: AMsMyM6xWK8SW1sM8jvBB7Dboe/AwAeyLQA71qPNTgf5hzfxjiqGycnQBoUoYzVPLczCY0lLZdqK1g==
X-Received: by 2002:ad4:5e85:0:b0:4b1:ab8f:41d6 with SMTP id
 jl5-20020ad45e85000000b004b1ab8f41d6mr20799887qvb.73.1665523192821; 
 Tue, 11 Oct 2022 14:19:52 -0700 (PDT)
Received: from fedora.mshome.net (pool-173-79-56-208.washdc.fios.verizon.net.
 [173.79.56.208]) by smtp.gmail.com with ESMTPSA id
 y21-20020a05620a44d500b006b8f4ade2c9sm14493164qkp.19.2022.10.11.14.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 14:19:52 -0700 (PDT)
From: Gregory Price <gourry.memverge@gmail.com>
X-Google-Original-From: Gregory Price <gregory.price@memverge.com>
To: jonathan.cameron@huawei.com
Cc: qemu-devel@nongnu.org, linux-cxl@vger.kernel.org,
 alison.schofield@intel.com, dave@stgolabs.net, a.manzanares@samsung.com,
 bwidawsk@kernel.org, gregory.price@memverge.com, mst@redhat.com,
 hchkuo@avery-design.com.tw, cbrowy@avery-design.com, ira.weiny@intel.com
Subject: [PATCH 0/5] Multi-Region and Volatile Memory support for CXL Type-3
 Devices
Date: Tue, 11 Oct 2022 17:19:11 -0400
Message-Id: <20221011211916.117552-1-gregory.price@memverge.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221007152156.24883-1-Jonathan.Cameron@huawei.com>
References: <20221007152156.24883-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f42;
 envelope-from=gourry.memverge@gmail.com; helo=mail-qv1-xf42.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Summary of Changes:
1) Correction of PCI_CLASS from STORAGE_EXPRESS to MEMORY_CXL on init
2) Add CXL_CAPACITY_MULTIPLIER definition to replace magic numbers
3) Refactor CDAT DSMAS Initialization for multi-region initialization
4) Multi-Region and Volatile Memory support for CXL Type-3 Devices
5) Test and Documentation updates

Developed with input from Jonathan Cameron and Davidloh Bueso.

This series brings 2 features to CXL Type-3 Devices:
    1) Volatile Memory Region support
    2) Multi-Region support (1 Volatile, 1 Persistent)

In this series we implement multi-region and volatile region support
through 6 major changes to CXL devices
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
       according to the mapping described in #4
    6) cxl-mailbox has been updated to report the respective size of
       volatile and persistent memory regions

CXL Spec (3.0) Section 8.2.9.8.2.0 - Get Partition Info
  Active Volatile Memory
    The device shall provide this volatile capacity starting at DPA 0
  Active Persistent Memory
    The device shall provide this persistent capacity starting at the
    DPA immediately following the volatile capacity

Partitioning of Persistent Memory regions may be supported on following
patch sets.

Submitted as an extention to the CDAT emulation because the CDAT DSMAS
entry concerns memory mapping and is required to successfully map memory
regions correctly in bios/efi.

Gregory Price (5):
  hw/cxl: set cxl-type3 device type to PCI_CLASS_MEMORY_CXL
  hw/cxl: Add CXL_CAPACITY_MULTIPLIER definition
  hw/mem/cxl_type: Generalize CDATDsmas initialization for Memory
    Regions
  hw/cxl: Multi-Region CXL Type-3 Devices (Volatile and Persistent)
  cxl: update tests and documentation for new cxl properties

 docs/system/devices/cxl.rst |  53 ++++-
 hw/cxl/cxl-mailbox-utils.c  |  23 +-
 hw/mem/cxl_type3.c          | 449 +++++++++++++++++++++++-------------
 include/hw/cxl/cxl_device.h |  11 +-
 tests/qtest/cxl-test.c      |  81 ++++++-
 5 files changed, 416 insertions(+), 201 deletions(-)

-- 
2.37.3


