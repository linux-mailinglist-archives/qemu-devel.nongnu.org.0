Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8E5387492
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:03:48 +0200 (CEST)
Received: from localhost ([::1]:59156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livdj-0006k4-SF
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1livbo-00060O-U0
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:01:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1livbj-0001mH-Hg
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:01:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621328503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YxAdWCYw1xPjSSTqcPIqmLAzKppF5hpqRwnu1rbB4zc=;
 b=G+vMQROxbaFjHB0QG4eHMkMct0bLqB8l5zzjKz/xJFTrzxYi9RkVvuKsEY3Nrx+atnJagn
 yCI9v+Ci6Ft+jIEJKWLjtSkWAaV9XnkFGm50/H393RCkmnO02PY+XAUAPdqdzh8nUNhenE
 J03LJMuJBMP70UOaYryOF6cyqYmFkJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-JBjKhtnPPYO1rRfBV8RKXQ-1; Tue, 18 May 2021 05:01:41 -0400
X-MC-Unique: JBjKhtnPPYO1rRfBV8RKXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61DD9107ACCA;
 Tue, 18 May 2021 09:01:40 +0000 (UTC)
Received: from kaapi (unknown [10.74.9.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51FA15D9C0;
 Tue, 18 May 2021 09:01:37 +0000 (UTC)
Date: Tue, 18 May 2021 14:31:34 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH] fdc: check drive block device before usage
 (CVE-2021-20196)
In-Reply-To: <48257773-c423-a7e3-afb7-5909606b0688@redhat.com>
Message-ID: <84950qo-8613-oo49-o876-p1op4r3ss60@erqung.pbz>
References: <20210123100345.642933-1-ppandit@redhat.com>
 <48257773-c423-a7e3-afb7-5909606b0688@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kevin Wolf <kwolf@redhat.com>, hannes Reinecke <hare@suse.com>,
 Gaoning Pan <pgn@zju.edu.cn>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hello John,

+-- On Mon, 17 May 2021, John Snow wrote --+
| >       /* Selected drive */
| > -    fdctrl->cur_drv = value & FD_DOR_SELMASK;
| > +    if (fdctrl->drives[value & FD_DOR_SELMASK].blk) {
| > +        fdctrl->cur_drv = value & FD_DOR_SELMASK;
| > +    }
| 
| I don't think this is correct. If you look at get_cur_drv(), it uses the
| TDR_BOOTSEL bit to change the logical mappings of "drive 0" or "drive 1" to be
| reversed. You don't check that bit here, so you might be checking the wrong
| drive.
| 
| Plus, the TDR bit can change later, so I think you shouldn't actually protect
| the register write like this. Just delete this bit of code. We ought to
| protect the drives when we go to use them instead of preventing the registers
| from getting "the wrong values".

* I see.

| >       cur_drv = get_cur_drv(fdctrl);
| > +    if (!cur_drv->blk) {
| > +        FLOPPY_DPRINTF("No drive connected\n");
| > +        return 0;
| > +    }
| 
| This seems fine ... or at least not worse than the other error handling we
| already have here. (Which seems to be ... basically, none. We just ignore the
| write and do nothing, which seems wrong. I guess it's better than a crash...
| but I don't have the time to do a proper audit of what this is SUPPOSED to do
| in this case.)
| 
| > -            if (blk_pwrite(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo,
| > +            if (cur_drv->blk == NULL
| > +                || blk_pwrite(cur_drv->blk, fd_offset(cur_drv),
| > fdctrl->fifo,
| 
| Seems fine, but if we had a drive for the earlier check, will we really be in
| a situation where we don't have one now?
| 
| Ignore the bit I sent earlier about the qtest reproducer not correlating to
| this patch -- it does, I was experiencing an unrelated crash.

* Okay.


| On 5/17/21 7:12 AM, P J P wrote:
| > Do we need a revised patch[-series] including a qtest? OR it can be done at
| > merge time?
| 
| If you have the time to write a qtest reproducer, you can send it separately
| and I'll pick it up if everything looks correct.

* Yes, that seems better, I'll try to create a qtest, but it may take time.

* I'll check and revise the patch with above details asap.


Thank you.
--
 - P J P
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


