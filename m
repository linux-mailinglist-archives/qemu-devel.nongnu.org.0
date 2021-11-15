Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 393224505F7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 14:51:14 +0100 (CET)
Received: from localhost ([::1]:33178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmcO5-0001Uh-Id
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 08:51:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmcLJ-00005L-GK
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 08:48:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmcLG-0005ti-8Y
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 08:48:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636984093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=39X9PHyLgG5tKgwq8KHgl7E9/h1ZlQME+TsbaEXLlrw=;
 b=NRisip7WYt8TWUi+SMzoQUhDNGiOhKXhJ6bnJGnoR19SLaUL7Kv5gfrCUpsCnc7/YFJIqs
 fmyn82WklT3YpchB3/EqmaE9R8Wu0C6z932wih9slw7GgjNqMXtSwOr+xq9RexaAIjXW4x
 H0omCA1Lpth74/1AFN5gkeaky4xsgmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-Xv4NxenOOdGGoggfrfxtoA-1; Mon, 15 Nov 2021 08:48:08 -0500
X-MC-Unique: Xv4NxenOOdGGoggfrfxtoA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC53719251A2;
 Mon, 15 Nov 2021 13:48:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC61F5F4EF;
 Mon, 15 Nov 2021 13:48:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4854011380A7; Mon, 15 Nov 2021 14:48:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH RFC 2/2] hw: Replace drive_get_next() by drive_get()
References: <20211115125536.3341681-1-armbru@redhat.com>
 <20211115125536.3341681-3-armbru@redhat.com>
 <CAFEAcA-dxXdsaKP5G7nhSROqwsRS9=r44G7rvNpEKbjgX8BbGQ@mail.gmail.com>
Date: Mon, 15 Nov 2021 14:48:02 +0100
In-Reply-To: <CAFEAcA-dxXdsaKP5G7nhSROqwsRS9=r44G7rvNpEKbjgX8BbGQ@mail.gmail.com>
 (Peter Maydell's message of "Mon, 15 Nov 2021 13:38:43 +0000")
Message-ID: <875ystjzsd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, edgar.iglesias@gmail.com, sundeep.lkml@gmail.com,
 qemu-block@nongnu.org, andrew.smirnov@gmail.com, hskinnemoen@google.com,
 joel@jms.id.au, atar4qemu@gmail.com, alistair@alistair23.me,
 b.galvani@gmail.com, nieklinnenbank@gmail.com, qemu-arm@nongnu.org,
 clg@kaod.org, kwolf@redhat.com, qemu-riscv@nongnu.org, andrew@aj.id.au,
 f4bug@amsat.org, Andrew.Baumann@microsoft.com, jcd@tribudubois.net,
 kfting@nuvoton.com, hreitz@redhat.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 15 Nov 2021 at 12:55, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> drive_get_next() is basically a bad idea.  It returns the "next" block
>> backend of a certain interface type.  "Next" means bus=0,unit=N, where
>> subsequent calls count N up from zero, per interface type.
>>
>> This lets you define unit numbers implicitly by execution order.  If the
>> order changes, or new calls appear "in the middle", unit numbers change.
>> ABI break.  Hard to spot in review.
>>
>> Explicit is better than implicit: use drive_get() directly.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  include/sysemu/blockdev.h           |  1 -
>>  blockdev.c                          | 10 ----------
>>  hw/arm/aspeed.c                     | 21 +++++++++++++--------
>>  hw/arm/cubieboard.c                 |  2 +-
>>  hw/arm/imx25_pdk.c                  |  2 +-
>>  hw/arm/integratorcp.c               |  2 +-
>>  hw/arm/mcimx6ul-evk.c               |  2 +-
>>  hw/arm/mcimx7d-sabre.c              |  2 +-
>>  hw/arm/msf2-som.c                   |  2 +-
>>  hw/arm/npcm7xx_boards.c             |  6 +++---
>>  hw/arm/orangepi.c                   |  2 +-
>>  hw/arm/raspi.c                      |  2 +-
>>  hw/arm/realview.c                   |  2 +-
>>  hw/arm/sabrelite.c                  |  2 +-
>>  hw/arm/versatilepb.c                |  4 ++--
>>  hw/arm/vexpress.c                   |  6 +++---
>>  hw/arm/xilinx_zynq.c                | 16 +++++++++-------
>>  hw/arm/xlnx-versal-virt.c           |  3 ++-
>>  hw/arm/xlnx-zcu102.c                |  6 +++---
>>  hw/microblaze/petalogix_ml605_mmu.c |  2 +-
>>  hw/misc/sifive_u_otp.c              |  2 +-
>>  hw/riscv/microchip_pfsoc.c          |  2 +-
>>  hw/sparc64/niagara.c                |  2 +-
>>  23 files changed, 49 insertions(+), 52 deletions(-)
>
> This would be easier to review if it didn't try to change all of
> these board/SoC models at once. Each one of them is entirely
> separate review work.

Happy to split, but first I'd like to get some advice on the part I'm
unsure about; see my cover letter.


