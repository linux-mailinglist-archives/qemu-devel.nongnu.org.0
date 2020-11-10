Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3524A2AE294
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 23:09:10 +0100 (CET)
Received: from localhost ([::1]:42156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcbp7-0005Pc-6P
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 17:09:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1kcbk2-0003tb-0i
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 17:03:54 -0500
Received: from relay.felk.cvut.cz ([2001:718:2:1611:0:1:0:70]:57139)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pisa@cmp.felk.cvut.cz>) id 1kcbjy-0003bG-QN
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 17:03:53 -0500
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by relay.felk.cvut.cz (8.15.2/8.15.2) with ESMTP id 0AAM2okT095636;
 Tue, 10 Nov 2020 23:02:50 +0100 (CET)
 (envelope-from pisa@cmp.felk.cvut.cz)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 0AAM2ofa028991; Tue, 10 Nov 2020 23:02:50 +0100
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 0AAM2onB028990;
 Tue, 10 Nov 2020 23:02:50 +0100
X-Authentication-Warning: haar.felk.cvut.cz: pisa set sender to
 pisa@cmp.felk.cvut.cz using -f
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-5.2 v2 1/4] hw/net/can/ctucan: Don't allow guest to
 write off end of tx_buffer
Date: Tue, 10 Nov 2020 23:02:50 +0100
User-Agent: KMail/1.9.10
References: <20201110170604.5897-1-peter.maydell@linaro.org>
 <202011102030.58186.pisa@cmp.felk.cvut.cz>
 <CAFEAcA_LHQvYtgMMeZVn9XW=Tdrd=nXAWYFXB=WeECa1utpnbg@mail.gmail.com>
In-Reply-To: <CAFEAcA_LHQvYtgMMeZVn9XW=Tdrd=nXAWYFXB=WeECa1utpnbg@mail.gmail.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202011102302.50311.pisa@cmp.felk.cvut.cz>
X-FELK-MailScanner-Information: 
X-MailScanner-ID: 0AAM2okT095636
X-FELK-MailScanner: Found to be clean
X-FELK-MailScanner-SpamCheck: not spam, SpamAssassin (not cached, score=-0.1, 
 required 6, BAYES_00 -0.50, KHOP_HELO_FCRDNS 0.40,
 NICE_REPLY_A -0.00, SPF_HELO_NONE 0.00, SPF_NONE 0.00)
X-FELK-MailScanner-From: pisa@cmp.felk.cvut.cz
X-FELK-MailScanner-Watermark: 1605650571.46998@4ePyHNbQaFYWRwtzDUzDIg
Received-SPF: none client-ip=2001:718:2:1611:0:1:0:70;
 envelope-from=pisa@cmp.felk.cvut.cz; helo=relay.felk.cvut.cz
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 16:54:16
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 Ondrej Ille <ondrej.ille@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Jan =?utf-8?q?Charv=C3=A1t?= <charvj10@fel.cvut.cz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter,

On Tuesday 10 of November 2020 22:18:45 Peter Maydell wrote:
> If you've got a modified patch set that you've tested, would
> you mind sending it out to the list? That would avoid my
> possibly making mistakes in updating patches on my end and
> then requiring you to repeat the testing.

OK, I have tried to send it with your authorship and my
Signed-of-by at these patches which I have slightly
modified and with Acked-by of these which should stay
exactly same. If you prefer another style, send me a hint.

Thanks much to help us to make our code better,

         Pavel Pisa

