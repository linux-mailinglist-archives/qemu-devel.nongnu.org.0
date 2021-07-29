Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 770DA3DA2D1
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:06:21 +0200 (CEST)
Received: from localhost ([::1]:52450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94ns-0000KB-Ef
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1m94bY-0003PL-QB
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:53:36 -0400
Received: from relay.felk.cvut.cz ([2001:718:2:1611:0:1:0:70]:22753)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pisa@cmp.felk.cvut.cz>) id 1m94bW-0002XN-5l
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:53:36 -0400
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by relay.felk.cvut.cz (8.15.2/8.15.2) with ESMTP id 16TBqaKM087639;
 Thu, 29 Jul 2021 13:52:36 +0200 (CEST)
 (envelope-from pisa@cmp.felk.cvut.cz)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 16TBqakZ004250; Thu, 29 Jul 2021 13:52:36 +0200
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 16TBqZhY004249;
 Thu, 29 Jul 2021 13:52:35 +0200
X-Authentication-Warning: haar.felk.cvut.cz: pisa set sender to
 pisa@cmp.felk.cvut.cz using -f
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: "Philippe =?utf-8?q?Mathieu-Daud=C3=A9?=" <philmd@redhat.com>
Subject: Re: [PATCH-for-6.1] hw/net/can: sja1000 fix buff2frame_bas for dlc
 out of std CAN 8 bytes
Date: Thu, 29 Jul 2021 13:52:35 +0200
User-Agent: KMail/1.9.10
References: <20210726162458.26197-1-pisa@cmp.felk.cvut.cz>
 <202107291119.33951.pisa@cmp.felk.cvut.cz>
 <2a962eb1-8cd2-dcec-7b23-46f0fa93903f@redhat.com>
In-Reply-To: <2a962eb1-8cd2-dcec-7b23-46f0fa93903f@redhat.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <202107291352.35604.pisa@cmp.felk.cvut.cz>
X-FELK-MailScanner-Information: 
X-MailScanner-ID: 16TBqaKM087639
X-FELK-MailScanner: Found to be clean
X-FELK-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
 score=-0.536, required 6, autolearn=not spam, BAYES_00 -0.50,
 KHOP_HELO_FCRDNS 0.40, NICE_REPLY_A -0.44, SPF_HELO_NONE 0.00,
 SPF_NONE 0.00)
X-FELK-MailScanner-From: pisa@cmp.felk.cvut.cz
X-FELK-MailScanner-Watermark: 1628164360.36631@CzBQ2v30IFnUbK3IjwnFCg
Received-SPF: none client-ip=2001:718:2:1611:0:1:0:70;
 envelope-from=pisa@cmp.felk.cvut.cz; helo=relay.felk.cvut.cz
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.125,
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
Cc: Francisco Iglesias <francisco.iglesias@xilinx.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, Qiang Ning <ningqiang1@huawei.com>,
 Darren Kenny <darren.kenny@oracle.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Philippe,

thanks for the reply.

On Thursday 29 of July 2021 12:03:00 Philippe Mathieu-Daud=C3=A9 wrote:
> I suppose the patch fell through the cracks.
>
> Apparently Paolo doesn't like to queue fuzzer fixes without
> reproducer. For examples see tests/qtest/fuzz-*.c in the tree.

I can try to find how to build required fuzz test or fuzz
team has some code availabe, may it be in the required form.
But the fix is from SJA1000 CAN frame/chip definition.

> > On Monday 26 of July 2021 18:24:58 Pavel Pisa wrote:
> >> Problem reported by openEuler fuzz-sig group.
> >>
> >> The buff2frame_bas function (hw\net\can\can_sja1000.c)
> >> infoleak(qemu5.x~qemu6.x) or stack-overflow(qemu 4.x).
>
> If you want the patch backported in stable releases, please
> include:
>
> Cc: qemu-stable@nongnu.org

OK, I will send updated version there.

> >> Reported-by: Qiang Ning <ningqiang1@huawei.com>
> >> Signed-off-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
> >> ---
> >>  hw/net/can/can_sja1000.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
> >> index 42d2f99dfb..64e81bff58 100644
> >> --- a/hw/net/can/can_sja1000.c
> >> +++ b/hw/net/can/can_sja1000.c
> >> @@ -311,6 +311,10 @@ static void buff2frame_bas(const uint8_t *buff,
> >> qemu_can_frame *frame) }
> >>      frame->can_dlc =3D buff[1] & 0x0f;
> >>
> >> +    if (frame->can_dlc > 8) {
> >> +        frame->can_dlc =3D 8;
> >> +    }
> >> +
>
> This doesn't seem a complete fix (see buff2frame_pel).

Thanks I have overlooked that. I will send updated
version.

> Here can_dlc shouldn't be more than 8.
>
> What you can do here (and in buff2frame_pel) is:
>
>         assert(frame->can_dlc <=3D 8);
>
> and find where the field is abused, probably discarding
> invalid frames earlier?

I do not think that it is right to put assert there
and kill whole virtual machine.

The value source is write to the register by guest OS
kernel, driver. It can be intentional or unintentional
case, but problem local to the guest. I can add report/
logging of the problem.

I have not checked what happens on the real SJA1000
chip if DLC is written out of range. I can try to test
that. But generally that falls under undefined behavior
of the chip. But even in this case the chip should prevent
disruption of whole CAN bus/link so I expect that it
silently limits length to 8 bytes.

Best wishes,

                Pavel
=2D-
                Pavel Pisa
    e-mail:     pisa@cmp.felk.cvut.cz
    Department of Control Engineering FEE CVUT
    Karlovo namesti 13, 121 35, Prague 2
    university: http://dce.fel.cvut.cz/
    personal:   http://cmp.felk.cvut.cz/~pisa
    projects:   https://www.openhub.net/accounts/ppisa
    CAN related:http://canbus.pages.fel.cvut.cz/


