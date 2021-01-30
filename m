Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C327730956D
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 14:37:34 +0100 (CET)
Received: from localhost ([::1]:59624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5qRR-0007ud-JI
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 08:37:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l5qPe-0006cE-Cu
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 08:35:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l5qPX-00062y-QV
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 08:35:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612013732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hyKukCMWu579tWCrxKqqZgNE7D0a38jLrhh8ud6jyRo=;
 b=Kbb5aaEzdycI0coac/s+51TTrwzmpXK8nkNEfDpovMY+qZkeNVFKC6BqYbtM1g8iGnp5nd
 ZqWRLOibyzwTI0wQNse8NdWDclhyGYrwXr/olydSpjQbZeZnunBscXK4j4huXTvAEYvhfY
 W93p1YRraQqpT/gvoWFmrpgTzmFQZ+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-NY_OQinBMgmRHAJIdMWJfQ-1; Sat, 30 Jan 2021 08:35:27 -0500
X-MC-Unique: NY_OQinBMgmRHAJIdMWJfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46F1B18C89CF;
 Sat, 30 Jan 2021 13:35:26 +0000 (UTC)
Received: from kaapi (unknown [10.33.36.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3D9810023B8;
 Sat, 30 Jan 2021 13:35:22 +0000 (UTC)
Date: Sat, 30 Jan 2021 19:05:08 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH] fdc: check drive block device before usage
 (CVE-2021-20196)
In-Reply-To: <20210123100345.642933-1-ppandit@redhat.com>
Message-ID: <n67p4r84-553r-os50-p98p-4sosq082s276@erqung.pbz>
References: <20210123100345.642933-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gaoning Pan <pgn@zju.edu.cn>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+-- On Sat, 23 Jan 2021, P J P wrote --+
| From: Prasad J Pandit <pjp@fedoraproject.org>
| 
| While processing ioport command in 'fdctrl_write_dor', device
| controller may select a drive which is not initialised with a
| block device. This may result in a NULL pointer dereference.
| Add checks to avoid it.
| 
| Fixes: CVE-2021-20196
| Reported-by: Gaoning Pan <pgn@zju.edu.cn>
| Buglink: https://bugs.launchpad.net/qemu/+bug/1912780
| Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
| ---
|  hw/block/fdc.c | 11 +++++++++--
|  1 file changed, 9 insertions(+), 2 deletions(-)
| 
| diff --git a/hw/block/fdc.c b/hw/block/fdc.c
| index 3636874432..13a9470d19 100644
| --- a/hw/block/fdc.c
| +++ b/hw/block/fdc.c
| @@ -1429,7 +1429,9 @@ static void fdctrl_write_dor(FDCtrl *fdctrl, uint32_t value)
|          }
|      }
|      /* Selected drive */
| -    fdctrl->cur_drv = value & FD_DOR_SELMASK;
| +    if (fdctrl->drives[value & FD_DOR_SELMASK].blk) {
| +        fdctrl->cur_drv = value & FD_DOR_SELMASK;
| +    }
|  
|      fdctrl->dor = value;
|  }
| @@ -1894,6 +1896,10 @@ static uint32_t fdctrl_read_data(FDCtrl *fdctrl)
|      uint32_t pos;
|  
|      cur_drv = get_cur_drv(fdctrl);
| +    if (!cur_drv->blk) {
| +        FLOPPY_DPRINTF("No drive connected\n");
| +        return 0;
| +    }
|      fdctrl->dsr &= ~FD_DSR_PWRDOWN;
|      if (!(fdctrl->msr & FD_MSR_RQM) || !(fdctrl->msr & FD_MSR_DIO)) {
|          FLOPPY_DPRINTF("error: controller not ready for reading\n");
| @@ -2420,7 +2426,8 @@ static void fdctrl_write_data(FDCtrl *fdctrl, uint32_t value)
|          if (pos == FD_SECTOR_LEN - 1 ||
|              fdctrl->data_pos == fdctrl->data_len) {
|              cur_drv = get_cur_drv(fdctrl);
| -            if (blk_pwrite(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo,
| +            if (cur_drv->blk == NULL
| +                || blk_pwrite(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo,
|                             BDRV_SECTOR_SIZE, 0) < 0) {
|                  FLOPPY_DPRINTF("error writing sector %d\n",
|                                 fd_sector(cur_drv));
| 


Ping..!
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


