Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AB83963E2
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 17:36:02 +0200 (CEST)
Received: from localhost ([::1]:45772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnjxR-0002m1-8c
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 11:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lnjug-0001SC-LK
 for qemu-devel@nongnu.org; Mon, 31 May 2021 11:33:10 -0400
Received: from relay64.bu.edu ([128.197.228.104]:38125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lnjue-0002WM-S4
 for qemu-devel@nongnu.org; Mon, 31 May 2021 11:33:10 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 14VFWJNs006435
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 31 May 2021 11:32:22 -0400
Date: Mon, 31 May 2021 11:32:19 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PULL 2/3] hw/usb: hcd-xhci-pci: Raise MSI/MSI-X interrupts only
 when told to
Message-ID: <20210531153219.xfuel2wz7i6ko4jm@mozz.bu.edu>
References: <20210528142202.2154592-1-kraxel@redhat.com>
 <20210528142202.2154592-3-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210528142202.2154592-3-kraxel@redhat.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.998,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Ruimei Yan <ruimei.yan@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210528 1622, Gerd Hoffmann wrote:
> From: Ruimei Yan <ruimei.yan@windriver.com>
> 
> At present MSI / MSI-X interrupts are triggered regardless of the
> irq level. We should have checked the level to determine whether
> the interrupt needs to be delivered.
> 
> The level check logic was present in early versions of the xhci
> model, but got dropped later by a rework of interrupt handling
> under commit 4c4abe7cc903 ("xhci: rework interrupt handling").
> 
> Fixes: 4c4abe7cc903 ("xhci: rework interrupt handling")
> Signed-off-by: Ruimei Yan <ruimei.yan@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Message-Id: <20210521024224.2277634-1-bmeng.cn@gmail.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Hi,
FYI, OSS-Fuzz detected that this fixed this stack-overflow:
https://bugs.launchpad.net/bugs/1905444
https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=27796#c5
-Alex

