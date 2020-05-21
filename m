Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 739C81DD770
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 21:41:47 +0200 (CEST)
Received: from localhost ([::1]:39390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbr4c-0006S1-Fh
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 15:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1jbqpj-0007PZ-2f
 for qemu-devel@nongnu.org; Thu, 21 May 2020 15:26:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:46286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1jbqph-0002Vp-3p
 for qemu-devel@nongnu.org; Thu, 21 May 2020 15:26:21 -0400
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF82B207D3;
 Thu, 21 May 2020 19:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590089178;
 bh=ki94ysDPLd0jah7a7GG1kI1agnwvLUey3EkW+g+S+Gc=;
 h=Date:From:To:cc:Subject:From;
 b=asPMJFNlyLCZJ2E/gkSHZd33sAik4bs6qHyGyZnytRz+Cq8pzED5dIpmXAFmoWe1L
 v5GL2a+obyvUg2uowyU+IrgD1P3CjD0zU7Qi4jE+chbnBx+OlPwuKVlxLPafybJUdb
 nmysKgzTn4sm/zpAlo4nKUm3Yi6E4Ko+mo1irOn4=
Date: Thu, 21 May 2020 12:26:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: groug@kaod.org, qemu_oss@crudebyte.com
Subject: [PATCH v2 0/3] revert 9pfs reply truncation, wait for free room to
 reply
Message-ID: <alpine.DEB.2.21.2005211225030.27502@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=198.145.29.99;
 envelope-from=sstabellini@kernel.org; helo=mail.kernel.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 15:26:19
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: anthony.perard@citrix.com, sstabellini@kernel.org, qemu-devel@nongnu.org,
 paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

This short series reverts commit 16724a173049ac29c7b5ade741da93a0f46edff
becauses it is the cause for https://bugs.launchpad.net/bugs/1877688.

The original issue addressed by 16724a173049ac29c7b5ade741da93a0f46edff
is solved differently in this series by using qemu_coroutine_yield() to
wait for the client to free more data from the ring before sending the
reply.

Cheers,

Stefano

Changes in v2:
- add comments on barriers
- add patch to increase ring size to the max allowed

