Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2565F2CA675
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 16:02:18 +0100 (CET)
Received: from localhost ([::1]:53686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk7AW-0008Hk-Je
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 10:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kk78b-0007is-RZ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:00:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kk78Z-0004qr-Nh
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:00:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606834814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bWBUUmUwch56OXTpT562OSWJZWADNO6f09ll9F3MCVU=;
 b=c9e648okZ1XwdZqL1ymNhb7TRIDt3WZDacmydgfzhpEZeKRkOBuAS/kGS62iDAaCSbmOTV
 DS381slroCufcCXS6qBdaKAGq2wmwlVM0rOsP5RgU82E3Sd0uPlgUX2qVDE4wSvuoJaOQ/
 Hcz2yODyTBBvrAxLdUPQd54/WQ5vHtk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-J-HEIIEHMZiscCEHgLgORA-1; Tue, 01 Dec 2020 10:00:09 -0500
X-MC-Unique: J-HEIIEHMZiscCEHgLgORA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0008F8144E1;
 Tue,  1 Dec 2020 15:00:07 +0000 (UTC)
Received: from kaapi (unknown [10.74.9.205])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F22505D9C2;
 Tue,  1 Dec 2020 15:00:05 +0000 (UTC)
Date: Tue, 1 Dec 2020 20:30:02 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] ide:atapi: check io_buffer_index in
 ide_atapi_cmd_reply_end
In-Reply-To: <492170b8-8056-bd65-5150-62c6e89cb3f0@redhat.com>
Message-ID: <933np1s-8p4p-o74p-rp94-517r98nop2o6@erqung.pbz>
References: <20201118142745.112579-1-ppandit@redhat.com>
 <204751s9-11np-413q-q3pr-3o6os86078@erqung.pbz>
 <492170b8-8056-bd65-5150-62c6e89cb3f0@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Wenxiang Qian <leonwxqian@gmail.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hello Paolo,

+-- On Tue, 1 Dec 2020, Paolo Bonzini wrote --+
| 1) Obviously this condition was not in the mind of whoever wrote the code. 
| For this reason the first thing to understand if how the bug came to happen, 
| which precondition was not respected.  Your backtraces shows that you came 
| from ide_atapi_cmd_read_pio, so:
| 
| - ide_atapi_cmd_reply_end is first entered with s->io_buffer_index ==
| s->cd_sector_size
| 
| - s->lba is assumed to be != -1.  from there you go to cd_read_sector ->
| cd_read_sector_cb and then reenter ide_atapi_cmd_reply_end with
| s->io_buffer_index == 0.  Or to cd_read_sector_sync and then continue down
| ide_atapi_cmd_reply_end, again with s->io_buffer_index == 0
| 
| - if s->elementary_transfer_size > 0, the number of bytes that are read is
| bounded to s->cd_sector_size - s->io_buffer_index
| 
| - if s->elementary_transfer_size == 0, the size is again bounded to
| s->cd_sector_size - s->io_buffer_index in this code:
| 
|             /* we cannot transmit more than one sector at a time */
|             if (s->lba != -1) {
|                 if (size > (s->cd_sector_size - s->io_buffer_index))
|                     size = (s->cd_sector_size - s->io_buffer_index);
|             }
| 
| So my understanding is that, for the bug to happen, you need to enter
| ide_atapi_cmd_reply_end with s->lba == -1 despite being in the read CD path.
| This might be possible by passing 0xFFFFFFFF as the LBA in cmd_read.
| The correct fix would be to check lba against the media size in cmd_read.

  Oh, okay.

| This is reasoning that you should understand even before starting to write a
| patch.  Did you do this step?
...
| 2)... So if you did do step 1, you need to explain it to me, because at this 
|  point you know this part of the code better than I do.  This is a step that 
|  you did not do, because your commit message has no such explanation.

  -> https://tc.gts3.org/cs3210/2016/spring/r/hardware/ATA8-ACS.pdf
     Section #7.22 Packet command

* Yes, I tried to follow the code with the above comand description as 
  reference.

* Because io_index was running past io_buffer, I was thikning around right 
  lengths and sizes. Above specification mentions about 'Byte Count Limit' and 
  that data transfer can not exceed that limit.

* I was thinking about checking 'elementary_transfer_size' against 
  'byte_count_limit', but that did not work out. The loop is confusing there,
  it first sets elementary_size = size and subtracts the same   

* 's->lba == -1' did not strike me as wrong, because code explicitly checks it 
  and gets past it. It does not flag an error when 's->lba == -1'.

| If so, no problem---I still believe the patch is incorrect, but please 
| explain how my reasoning is wrong and we'll take it from there.  If not, how 
| do you know your patch is not papering over a bigger issue somewhere?

* I tested the patch with a reproducer and it helped to fix the crash.

* My doubt about the patch was that it prematurely ends the while loop ie.  
  before s->packet_transfer_size reaches zero(0), there may be possible data 
  loss.

| 3) We also need to ensure that the bug will not happen again.  Did you get a
| reproducer from the reporter?  If not, how did you trust the report to be
| correct?  If so, did you try to include it in the QEMU qtest testsuite?

* I did test it against a reproducer, but did not get to the qtest part for 
  the time constraints.

| If my understanding of the bug is correct, the patch is not the correct fix.
| The correct fix is to add an assertion here *and* to fix the incorrect
| assumption up in the call chain.  For example:
| 
| - add an assertion in ide_atapi_cmd_read_{dma,pio} that s->lba <=
| s->nb_sectors && s->lba != -1
| 
| - add a range check in cmd_read and cmd_read_cd similar to what is already
| done in cmd_seek (but checking the full range from lba to lba+nb_sectors-1.

  Okay, will do.

 
| Even if the patch were correct, however, bullets (2) and (3) are two reasons
| why this patch is not acceptable for QEMU's standards---not even for a
| security fix.
| 
| This is nothing new.  Even though I have sometimes applied (or redone_ your
| fixes, I have told you a variation of the above every time I saw a a patch of
| yours.  The output of "git log --author pjp tests" tells me you didn't heed
| the advice though; I'm calling you out this time because it's especially clear
| that you didn't do these steps and because the result is especially wrong.

* While I understand and agree that having qtests is greatly helpful, I could 
  not get to it due to time/cycles constraints.

* It's certainly not that I purposely did not heed the advice/suggestions.


Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


