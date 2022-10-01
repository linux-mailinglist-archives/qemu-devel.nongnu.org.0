Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F1D5F1C11
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 14:14:30 +0200 (CEST)
Received: from localhost ([::1]:37824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oebO1-0006UZ-Im
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 08:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oebMZ-00056P-2E
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 08:12:59 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:48091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oebMX-0002Yi-I4
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 08:12:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=8f40Zb788bfDUq1r1pesVUH5AYz5MqrIcraO4LBAvas=; b=BQ8SlT0LQnuYwsH/r9AyFJnEUZ
 ybs6unFTWtOUmrKSBB23Zs3PpuUuqiTkoIPzB+31POHflf1R1cCzuu2eEiCH5zS68fIvxXlr9r9pL
 3i8YvLg0p4TMxxY5qSjk+xIAlHweJd4dNdVsHBFPhDHIH1q7sO9ZzzrNPkcA7nxxXBFHrO/TkylqV
 NR2CYjhgKA79kfX6aOZm9QW5cXbeJZ8Q90r2NRKV/AWS65sQLUkeFxEreE8LsE5I/6kpC9+vN1WeJ
 QN6bwSbhulZfcmYme36fP39TKliL9f6v2QY6mEwBt2eadiiqGyOw2y2Lh8DnydFMYgIFpiB3qMqse
 q8NRvtKq75kiPocmeFykItmGJhFOt8WhzxsytyzFAXly4FeyISn/RjZ4vSYaYNRSi74P8Z6phmP4O
 6k/QsbzRxqik0lz65Xb1R2HepN6JJkGcZShS7I3KEFgYU4ciJgr/E/XCsL/iQvH9k/spAXJj4NhOU
 ZJf9y2IhYf2mc9N/FTSCmOQpS1x8n8KdoeBmetk55BTeK9MctnHOgp00DHPNhLOadMQkmGtHfltSY
 Q+U2pC+bOGdTXbKTScGO4ClLEw4KDZdsaNbVktL1qYiRXkWRCKdmcomZOxa57dWBa/CIJ12nOeh4u
 E8WR+l95TiRYKIOTNiF28xCXPsdWVfxjGMLIBGp2A=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v4 26/54] fsdev/virtfs-proxy-helper: Use g_mkdir()
Date: Sat, 01 Oct 2022 14:12:49 +0200
Message-ID: <1776150.AVl4R6B0cj@silver>
In-Reply-To: <CAEUhbmVGiifLE-ZAe0bxX8JDOcBX41Qg3=5g6Yr36uW=Ws=Srw@mail.gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-27-bmeng.cn@gmail.com>
 <CAEUhbmVGiifLE-ZAe0bxX8JDOcBX41Qg3=5g6Yr36uW=Ws=Srw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On Samstag, 1. Oktober 2022 05:48:18 CEST Bin Meng wrote:
> Hi Christian,
> 
> On Tue, Sep 27, 2022 at 7:07 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> > 
> > Use g_mkdir() to create a directory on all platforms.
> > 
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> > 
> > (no changes since v2)
> > 
> > Changes in v2:
> > - Change to use g_mkdir()
> > 
> >  fsdev/virtfs-proxy-helper.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Would you pick up this patch in your queue?
> 
> Regards,
> Bin

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

Note that I currently don't have much in my queue yet, so it will probably 
take at least one week or two before I send the next PR.

Also note that I plan more refactoring on the 9p tests in the upcoming days. 
So if you have plans for 9p test changes, better wait for my next PR to avoid 
conflicts.

Best regards,
Christian Schoenebeck



