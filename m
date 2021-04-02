Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 818093525C3
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 05:53:39 +0200 (CEST)
Received: from localhost ([::1]:45232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSAsM-00048K-L7
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 23:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhenyu2@huawei.com>)
 id 1lSAre-0003eB-Fo; Thu, 01 Apr 2021 23:52:54 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhenyu2@huawei.com>)
 id 1lSArb-0004p3-UP; Thu, 01 Apr 2021 23:52:54 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FBR0S4py0zrbqv;
 Fri,  2 Apr 2021 11:50:32 +0800 (CST)
Received: from [10.174.184.175] (10.174.184.175) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Fri, 2 Apr 2021 11:52:37 +0800
To: Kevin Wolf <kwolf@redhat.com>, <mreitz@redhat.com>,
 <qemu-block@nongnu.org>, <qemu-devel@nongnu.org>, <pl@kamp.de>
From: Zhenyu Ye <yezhenyu2@huawei.com>
Subject: [Question] qemu-img convert block alignment
Message-ID: <ed4ae175-1c67-b7fb-669d-c8c08ca1a7f7@huawei.com>
Date: Fri, 2 Apr 2021 11:52:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=yezhenyu2@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Hi all,

commit 8dcd3c9b91 ("qemu-img: align result of is_allocated_sectors")
introduces block alignment when doing qemu-img convert. However, the
alignment is:

	s.alignment = MAX(pow2floor(s.min_sparse),
                      DIV_ROUND_UP(out_bs->bl.request_alignment,
                                   BDRV_SECTOR_SIZE));

(where the default s.min_sparse is 8)
When the target device's bl.request_alignment is smaller than 4K, this
will cause additional write-zero overhead and makes the size of target
file larger.

Is this as expected?  Should we change the MAX() to MIN()?


Thanks,
zhenyu

