Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9643D3549
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 09:32:54 +0200 (CEST)
Received: from localhost ([::1]:32782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6pfx-0003bI-8k
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 03:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6peg-0002Et-4H
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 03:31:34 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6ped-0002ZQ-Jy
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 03:31:33 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GWLWg5mTkzcgsg;
 Fri, 23 Jul 2021 15:27:59 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 23 Jul 2021 15:31:24 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 23 Jul 2021 15:31:23 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH for-6.1 v4 0/1] machine: Disallow specifying topology
 parameters as zero
Date: Fri, 23 Jul 2021 15:31:21 +0800
Message-ID: <20210723073122.7720-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, wanghaibin.wang@huawei.com,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 yuzenghui@huawei.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the SMP configuration, we should either specify a topology                       
parameter with a reasonable value (equal to or greater than 1)                      
or just leave it omitted and QEMU will calculate its value.                         
Configurations which explicitly specify the topology parameters                     
as zero like "sockets=0" are meaningless, so disallow them.                         
                                                                                    
However; the commit 1e63fe685804d                                                   
(machine: pass QAPI struct to mc->smp_parse) has documented that                    
'0' has the same semantics as omitting a parameter in the qapi                      
comment for SMPConfiguration. So this patch fixes the doc and                       
also adds the corresponding sanity check in the smp parsers.                        
                                                                                    
This patch originly comes form [1], and it was suggested that                       
this patch fixing the doc should be sent for 6.1 to avoid a                         
deprecation process in the future.                                                  
                                                                                    
[1] https://lore.kernel.org/qemu-devel/YPWsThPiZa3mF+zp@redhat.com/                 

v3->v4:
- fix the typos
- v3: https://lore.kernel.org/qemu-devel/20210723020002.18456-1-wangyanan55@huawei.com/
                                                                                    
v2->v3:                                                                             
- improve the error message                                                         
- v2: https://lore.kernel.org/qemu-devel/20210722154326.1464-1-wangyanan55@huawei.com/
                                                                                    
v1->v2:                                                                             
- move the check to machine_set_smp                                                 
- update qemu-option.hx                                                             
- v1: https://lore.kernel.org/qemu-devel/20210722021512.2600-1-wangyanan55@huawei.com/

Yanan Wang (1):
  machine: Disallow specifying topology parameters as zero

 hw/core/machine.c | 15 +++++++++++++++
 qapi/machine.json |  6 +++---
 qemu-options.hx   | 12 +++++++-----
 3 files changed, 25 insertions(+), 8 deletions(-)

-- 
2.19.1


