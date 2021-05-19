Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EB2388836
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 09:33:30 +0200 (CEST)
Received: from localhost ([::1]:44824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljGht-0003YY-CC
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 03:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1ljGgs-0002lv-Rd
 for qemu-devel@nongnu.org; Wed, 19 May 2021 03:32:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1ljGgq-00065U-L5
 for qemu-devel@nongnu.org; Wed, 19 May 2021 03:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621409543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nGpaIvn/0T1B58GrAiPIVsXa2IST85fQxzS4ryJZBPI=;
 b=aMSwHDd2lrKdajU4U2zCAfp0KTNm7tvl8w4qBMbn80SyK4PtyNef6hfcIp41AYu0ukWycE
 /KLOn+5TQKSbWfBUwFZ+dUWwWCz1HRQhwbJIDRMXKLnS5FQeCOzNNwows4aPLRGPFFm73H
 G/DdiRC47JW4DknPrFKXgfQNx275ve8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-Do5_amVXP8msDeItiEYDyg-1; Wed, 19 May 2021 03:32:20 -0400
X-MC-Unique: Do5_amVXP8msDeItiEYDyg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 762B3800D62;
 Wed, 19 May 2021 07:32:19 +0000 (UTC)
Received: from kaapi (unknown [10.74.9.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8814E5C1CF;
 Wed, 19 May 2021 07:32:16 +0000 (UTC)
Date: Wed, 19 May 2021 13:02:13 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH] fdc: check drive block device before usage
 (CVE-2021-20196)
In-Reply-To: <11abadd6-abbd-3937-b5a3-203f3593a19a@redhat.com>
Message-ID: <2sn3718o-q4p7-4ps1-9prr-rq16o77o04@erqung.pbz>
References: <20210123100345.642933-1-ppandit@redhat.com>
 <48257773-c423-a7e3-afb7-5909606b0688@redhat.com>
 <84950qo-8613-oo49-o876-p1op4r3ss60@erqung.pbz>
 <11abadd6-abbd-3937-b5a3-203f3593a19a@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
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

+-- On Tue, 18 May 2021, John Snow wrote --+
| Annotated:
| 
| # fdctrl->cur_drv starts at 0x00
| # fdctrl->dor starts at 0x0c (DMA, RESET#)
| # fdctrl->dsr starts at 0x00
| 
| > outb 0x3f2 0x04
| fdc_ioport_write write reg 0x02 [DOR] Digital Output Register val 0x04
|   DOR changed from default after SeaBIOS init from 0x0c to 0x04
|   DMA GATE# (0x08) set from 1 --> 0
|   DMA GATE# appears needed to coerce fdc into a "non-dma transfer".
|   +RESET# remains on. Needed to avoid engaging RESET routine.
| 
| > outb 0x3f4 0x03
| fdc_ioport_write write reg 0x04 [DSR] Date Rate Select Register val 0x03
|   DSR: +DRATE SEL1
|   DSR: +DRATE SEL0
|   Needed to prevent "data rate mismatch" error handling by write cmd.
| 
| The next 9 bytes (all to 0x3f5) set up the write command.
| 
| 0x25 selects the "Write (BeOS)" command.
| 0x01 selects drive1.
| ...
| 0x01 appears to say that a sector is "1 byte", but oddly enough no other value
| seems to trigger this crash. Not sure why. Recommend investigating if you have
| time. Could be transfer length calculation bug.
| 
| > outb 0x3f3 0x04
| fdc_ioport_write write reg 0x03 [TDR] Tape Drive Register val 0x04
|     TDR: +BOOTSEL
|     This changes the meaning of cur_drv and flips selection (as far as 
| I can tell) back to drive0 instead of the command's programmed drive1.
| 
| > outb 0x3f5 0x00
| fdc_ioport_write write reg 0x05 [FIFO] Data val 0x00
|     write is attempted on "drv1" which due to BOOTSEL maps back to "drv0",
| which is undefined.
| 
| This should (I hope) help guide to write a more targeted patch and a good
| qtest case.

* Cool, thank you so much for these details John, I appreciate it.

* I'll go through the 3 fdc issues we've found open and try to fix them 
  together as one series.


Thank you.
--
 - P J P
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


