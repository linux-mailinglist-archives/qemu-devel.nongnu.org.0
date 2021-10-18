Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE124313CB
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:48:34 +0200 (CEST)
Received: from localhost ([::1]:52804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcPFx-0005Mm-W3
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mcPEJ-0003wd-96
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:46:51 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:51098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mcPE8-0004xH-UK
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:46:46 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1939B746399;
 Mon, 18 Oct 2021 11:46:38 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id ECE3A746353; Mon, 18 Oct 2021 11:46:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EAE7B7462D3;
 Mon, 18 Oct 2021 11:46:37 +0200 (CEST)
Date: Mon, 18 Oct 2021 11:46:37 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 4/4] via-ide: Avoid using isa_get_irq()
In-Reply-To: <20211018061931.46m4rakdhwyfmc64@sirius.home.kraxel.org>
Message-ID: <34bfefdf-73cc-a7f0-d113-1b7bab15a5aa@eik.bme.hu>
References: <cover.1634259980.git.balaton@eik.bme.hu>
 <26cb1848c9fc0360df7a57c2c9ba5e03c4a692b5.1634259980.git.balaton@eik.bme.hu>
 <84ff4daf-e04c-9238-ae31-9ddaed9a37dc@amsat.org>
 <2f3756a-a968-2d16-f238-1dd16647cc9@eik.bme.hu>
 <b15cb6c9-7166-02c4-29f4-d1bbd3976f69@amsat.org>
 <20211018061931.46m4rakdhwyfmc64@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, John Snow <jsnow@redhat.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On Mon, 18 Oct 2021, Gerd Hoffmann wrote:
>  Hi,
>
>>> I can do that but waiting for a decision on how to proceed. Will Gerd
>>> take my first series this is based on as is then this should be a
>>> separate series doing the clean up using pci_get_function_0 or should
>>> these two series be merged? I'd also squash setting user_creatable =
>>> false into this patch (and do similar for the usb one) unless you guys
>>> think it should be a separate patch?
>>
>> I don't know what Gerd will do with the USB patches.
>
> Latest revision of usb patches is fine.  I'll go stick them into the
> next usb pull request ...
>
>> Your VIA patches are orthogonal, so I'm queuing them (1, 2, 4
>> and extra user_creatable) via mips-next.
>
> .. unless someone else is faster with merging ;)
>
> Feel free to add my "Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>"
> to the usb patches and merge the complete pack via mips-next.

Wait, the usb patch needs adding user_creatable = false too to prevent 
crashing when user adds the device without having function 0. I'll resend 
with that.

Regards,
BALATON Zoltan

