Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBEC2660F8
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 16:11:28 +0200 (CEST)
Received: from localhost ([::1]:53662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGjlu-0005ZB-Pb
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 10:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kGjkZ-0004O4-4M; Fri, 11 Sep 2020 10:10:03 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:50974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kGjkW-0000h8-Rd; Fri, 11 Sep 2020 10:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=U7oxthBo3nlTLR3ZEV3VAMQBrhmaSsldznSslP5O2+A=; 
 b=MHlvG0Q3taxuaVMWgUfktPLaKQPKUUVqEoBBbK+zNz8YIdX1+Dq75zxLwKKwwXFgnzbAJ/GImHKUOVjlviOWBQ/HyhqnmWWtFf5GG6KqfETfqgtnWSqmzL7YdSa2VEAmgOxAQDfthLvSMO+mlu8akX4+Z4eSI3Lt8E4zLhAgv1FKEHzGLcWHfiLvv20hp/pXxa6C3Kg8se/AyU84cgg4a/hTO3PEcppyRmoT0xf5FhT8n2OJtHN8KRjdjLTpw/qC4Um1he7CXJm9vtn8RaJlhgt0rprZjNVZv57+JS1Rv7nbdCl3in4XXaDY9cCwwXPZ75cnZsOkAsePNf4ad27rEQ==;
Received: from [81.0.39.67] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1kGjkR-0004ok-Uu; Fri, 11 Sep 2020 16:09:56 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1kGjkF-0000zs-16; Fri, 11 Sep 2020 16:09:43 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Make preallocate_co() resize the image to the correct size
Date: Fri, 11 Sep 2020 16:09:40 +0200
Message-Id: <cover.1599833007.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 10:09:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

preallocate_co() does not resize the image correctly if the original
size was not cluster-aligned.

This series should be applied on top of Max's block branch (I tested
it with commit 8e66c829eda997dad661d49d73668b1fd3e6043d).

   https://git.xanclic.moe/XanClic/qemu/commits/branch/block

Alberto Garcia (2):
  qcow2: Make preallocate_co() resize the image to the correct size
  qcow2: Convert qcow2_alloc_cluster_offset() into
    qcow2_alloc_host_offset()

 block/qcow2.h              |  6 +++---
 block/qcow2-cluster.c      | 14 +++++++++----
 block/qcow2.c              | 35 +++++++++++++--------------------
 tests/qemu-iotests/125     | 40 +++++++++++++++++++++-----------------
 tests/qemu-iotests/125.out | 28 ++++++++++++++++++++++++--
 5 files changed, 74 insertions(+), 49 deletions(-)

-- 
2.20.1


