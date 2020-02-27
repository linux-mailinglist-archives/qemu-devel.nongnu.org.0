Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 773A71727B8
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 19:36:16 +0100 (CET)
Received: from localhost ([::1]:36482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7O18-0004Ny-Vn
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 13:36:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36234)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1j7Nzo-0003DH-8z
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 13:34:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1j7Nzm-0000gn-6z
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 13:34:51 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:33974)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1j7Nzl-0000MM-Oq; Thu, 27 Feb 2020 13:34:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=aLV4Gc+Hy8ZDXp+dVGut38PRbNYaDayZT3HzNdMMlxU=; 
 b=Fmwd+WzeslbG0gBAtUTH2dCyefcWjSNVVAzVi3+a27qlHWyT+T5iYaUA9U1ZOXOZcZ6COSHRTxF4kQPx9w0FlIpWIsZagCi4jCR72hLLnX/bg05zSrOHNlhtERMUXEyIOqAxYG9OveaIcERC2qZs5c05ypHey2Le11YiMHj0aW05BNYXVgpI7G8zfLlLQmbuD/tulYr0LjlGIqhzbiHBmTc4DotCPJz1+H2rB7qVg6Ht8B5eIEn/5Vu0ofwh4hr2FJk0oW5iDzqIZeIeLM3AOehJn6e8iwLyxt2WCstb/davTsxv35xXSuJWvDwLAm9alryRtuCjzm1DQ3gOPkh4mQ==;
Received: from [192.168.12.213] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1j7NzT-0000H0-Ap; Thu, 27 Feb 2020 19:34:31 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1j7NzS-0000VS-Na; Thu, 27 Feb 2020 19:34:30 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Convert qcow2_get_cluster_offset() into
 qcow2_get_host_offset()
Date: Thu, 27 Feb 2020 19:34:24 +0100
Message-Id: <cover.1582828123.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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

Hi,

this is something I did while working on the subcluster series but
it's independent from it so I thought to send it already.

In short: qcow2_get_cluster_offset() returns a host cluster offset but
none of the callers actually wants the offset of the cluster, they
want the host offset into the cluster.

There's a pre-existing exception with compressed clusters. In this
case the returned value was overloaded to contain a cluster offset or
a compressed cluster descriptor, depending on the cluster type. This
is kind of ugly, and we could make it more explicit using a union or
something like that but I don't think it's worth the effort here, so I
just documented it.

Berto

Alberto Garcia (2):
  qcow2: Make Qcow2AioTask store the full host offset
  qcow2: Convert qcow2_get_cluster_offset() into qcow2_get_host_offset()

 block/qcow2.h         |  4 +--
 block/qcow2-cluster.c | 38 ++++++++++++----------
 block/qcow2.c         | 74 ++++++++++++++++++-------------------------
 3 files changed, 55 insertions(+), 61 deletions(-)

-- 
2.20.1


