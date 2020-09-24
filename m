Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7B3277078
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 13:58:50 +0200 (CEST)
Received: from localhost ([::1]:41064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLPth-0003h5-4p
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 07:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kLPsh-00035C-Qm
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 07:57:47 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:57653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kLPsf-0000Pk-Oa
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 07:57:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:References:In-Reply-To:
 Content-ID:Content-Description;
 bh=L9nt56S3nkYwbd86NN7QtAnheg9UvozPZIsKRiYCOb8=; b=Djtddp+zHBkhBmlPUBbGFW752P
 40Q2ZW5pHJHcGj5+EL99RBFHKXmueZPGPeWRrCm1d1vei4alwp5oYAzCSbz/am/+54g58Jl4A6DpT
 oyBsUKBMprlLjG3CftrXMe3MOZY6+C5DT7uFDG3aBBGr1veTcrbI6OQJAuLYalqVl2QxpzhE0mByM
 GocgD2TsRDPViMLkVRauJxDqPY33YLuuWqrM6GNFNElBGosUEFcxJii+9UN46udze3qZouMrNiGnu
 u152zkUfsYwotIj9AH75A1KqnhGUNnMjLTPeRSr1cYqZMuFLvBar3ubZNc3o5S2xRPKr2FdWUBKMs
 c8Vs697g==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Greg Kurz <groug@kaod.org>
Subject: qtest with multiple driver instances
Date: Thu, 24 Sep 2020 13:57:40 +0200
Message-ID: <4696583.mNQJtTt8NE@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 07:57:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I'm currently puzzled with what looks like a limitation of the qtest 
infrastructure: am I right that it's not possible to use multiple instances of 
the same driver with qtests?

Purpose: I need to add test cases for the 9p 'local' fs driver. So far we only 
have 9p qtests using the 'synth' fs driver. The problem is, both driver 
instances would pop up with the same QEMU driver name ("virtio-9p-pci"), and 
AFAICS qtests in general reference their driver instance by driver name only, 
which must be a) a unique driver name and b) must match the official QEMU 
driver name and c) all qtest driver instances are in a global space for all 
qtests.

Is there any workaround or something that I didn't see? Like letting qtests 
reference a driver instance by PCI address or something?

Right now the only option that I see is a hack: forcing one driver instance to 
use a different bus system like e.g. -> "virtio-9p-ccw" vs. "virtio-9p-pci".

Any hint appreciated!

Best regards,
Christian Schoenebeck



