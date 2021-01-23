Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B2B301765
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 18:54:41 +0100 (CET)
Received: from localhost ([::1]:37690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3N7Q-0000Y4-SW
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 12:54:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l3N6U-00007Q-D4
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 12:53:42 -0500
Received: from relay64.bu.edu ([128.197.228.104]:42963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l3N6S-0000cW-Qu
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 12:53:42 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 10NHqjnQ032009
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 23 Jan 2021 12:52:48 -0500
Date: Sat, 23 Jan 2021 12:52:45 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: P J P <ppandit@redhat.com>
Subject: Re: [PATCH] fdc: check drive block device before usage
 (CVE-2021-20196)
Message-ID: <20210123175245.rpckqnoihjtsv6lp@mozz.bu.edu>
References: <20210123100345.642933-1-ppandit@redhat.com>
 <20210123174725.slddy75u7egga43n@mozz.bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210123174725.slddy75u7egga43n@mozz.bu.edu>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Gaoning Pan <pgn@zju.edu.cn>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210123 1247, Alexander Bulekov wrote:
> Hello,
> Here is a reproducer for this bug found by the OSS-Fuzz fuzzer:
> 
> cat << EOF | qemu-system-i386 -display none -machine accel=qtest \
> -m 512M -machine pc -device floppy,unit=1,id=floppy0,drive=disk0 \
> -drive id=disk0,file=null-co://,file.read-zeroes=on,if=none,format=raw \
> -qtest stdio
> outw 0x3f4 0x2500
> outb 0x3f5 0x81
> outb 0x3f5 0x0
> outb 0x3f5 0x0
> outb 0x3f5 0x0
> outw 0x3f4 0x0
> outw 0x3f4 0x4000
> outw 0x3f4 0x13
> outb 0x3f5 0x1
> outw 0x3f2 0x1405
> outw 0x3f4 0x0
> EOF
> 
Oops there's a mistake there. Fixed:

cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest \
-m 512M -machine pc -device floppy,unit=1,id=floppy0,drive=disk0 \
-drive id=disk0,file=null-co://,file.read-zeroes=on,if=none,format=raw \
-qtest stdio
outw 0x3f4 0x2500
outb 0x3f5 0x81
outb 0x3f5 0x0
outb 0x3f5 0x0
outb 0x3f5 0x0
outw 0x3f2 0x14
outw 0x3f4 0x0
outw 0x3f4 0x4000
outw 0x3f4 0x13
outb 0x3f5 0x1
outw 0x3f2 0x1405
outw 0x3f4 0x0
EOF

> -Alex
> 
> On 210123 1533, P J P wrote:
> > From: Prasad J Pandit <pjp@fedoraproject.org>
> > 
> > While processing ioport command in 'fdctrl_write_dor', device
> > controller may select a drive which is not initialised with a
> > block device. This may result in a NULL pointer dereference.
> > Add checks to avoid it.
> > 
> > Fixes: CVE-2021-20196
> > Reported-by: Gaoning Pan <pgn@zju.edu.cn>
> > Buglink: https://bugs.launchpad.net/qemu/+bug/1912780
> > Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> > ---
> >  hw/block/fdc.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> > index 3636874432..13a9470d19 100644
> > --- a/hw/block/fdc.c
> > +++ b/hw/block/fdc.c
> > @@ -1429,7 +1429,9 @@ static void fdctrl_write_dor(FDCtrl *fdctrl, uint32_t value)
> >          }
> >      }
> >      /* Selected drive */
> > -    fdctrl->cur_drv = value & FD_DOR_SELMASK;
> > +    if (fdctrl->drives[value & FD_DOR_SELMASK].blk) {
> > +        fdctrl->cur_drv = value & FD_DOR_SELMASK;
> > +    }
> >  
> >      fdctrl->dor = value;
> >  }
> > @@ -1894,6 +1896,10 @@ static uint32_t fdctrl_read_data(FDCtrl *fdctrl)
> >      uint32_t pos;
> >  
> >      cur_drv = get_cur_drv(fdctrl);
> > +    if (!cur_drv->blk) {
> > +        FLOPPY_DPRINTF("No drive connected\n");
> > +        return 0;
> > +    }
> >      fdctrl->dsr &= ~FD_DSR_PWRDOWN;
> >      if (!(fdctrl->msr & FD_MSR_RQM) || !(fdctrl->msr & FD_MSR_DIO)) {
> >          FLOPPY_DPRINTF("error: controller not ready for reading\n");
> > @@ -2420,7 +2426,8 @@ static void fdctrl_write_data(FDCtrl *fdctrl, uint32_t value)
> >          if (pos == FD_SECTOR_LEN - 1 ||
> >              fdctrl->data_pos == fdctrl->data_len) {
> >              cur_drv = get_cur_drv(fdctrl);
> > -            if (blk_pwrite(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo,
> > +            if (cur_drv->blk == NULL
> > +                || blk_pwrite(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo,
> >                             BDRV_SECTOR_SIZE, 0) < 0) {
> >                  FLOPPY_DPRINTF("error writing sector %d\n",
> >                                 fd_sector(cur_drv));
> > -- 
> > 2.29.2
> > 
> > 

