Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8749D2ECD17
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 10:48:54 +0100 (CET)
Received: from localhost ([::1]:45634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxRuX-0005AT-Kt
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 04:48:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxRsw-0004Jr-7t
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 04:47:14 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:37411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxRss-0006fs-VY
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 04:47:14 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7EC667470FB;
 Thu,  7 Jan 2021 10:47:09 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 538727470F9; Thu,  7 Jan 2021 10:47:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 51DCB7470F8;
 Thu,  7 Jan 2021 10:47:09 +0100 (CET)
Date: Thu, 7 Jan 2021 10:47:09 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 02/12] vt82c686: Reorganise code
In-Reply-To: <77da4dfa-896b-3dbc-a648-6ddc472fc043@amsat.org>
Message-ID: <9ff6f79-4967-ac9c-87cb-25c290174a81@eik.bme.hu>
References: <cover.1609967638.git.balaton@eik.bme.hu>
 <a3d10c3daf6e8746b985c9fe776ae314fd10499b.1609967638.git.balaton@eik.bme.hu>
 <77da4dfa-896b-3dbc-a648-6ddc472fc043@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-312986800-1610012829=:62010"
X-Spam-Probability: 9%
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-312986800-1610012829=:62010
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 7 Jan 2021, Philippe Mathieu-Daudé wrote:
> On 1/6/21 10:13 PM, BALATON Zoltan wrote:
>> Move lines around so that object definitions become consecutive and
>> not scattered around. This brings functions belonging to an object
>> together so it's clearer what is defined and what parts belong to
>> which object.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/isa/vt82c686.c | 279 +++++++++++++++++++++++-----------------------
>>  1 file changed, 140 insertions(+), 139 deletions(-)
> ...
>>  static void vt82c686b_realize(PCIDevice *d, Error **errp)
>>  {
>>      VT82C686BISAState *s = VT82C686B_ISA(d);
>> @@ -354,6 +353,7 @@ static const TypeInfo via_info = {
>>      },
>>  };
>>
>> +
>>  static void vt82c686b_superio_class_init(ObjectClass *klass, void *data)
>>  {
>>      ISASuperIOClass *sc = ISA_SUPERIO_CLASS(klass);
>> @@ -372,11 +372,12 @@ static const TypeInfo via_superio_info = {
>>      .class_init    = vt82c686b_superio_class_init,
>>  };
>>
>> +
>
> Spurious extra-lines?

No, they are intended, I've used two lines to separate parts of the file 
which define different objects. It's subtle but useful organisation of 
code to show what belongs together.

Regards,
BALATON Zoltan

> Reviewed with 'git-diff --color-moved=dimmed-zebra':
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
--3866299591-312986800-1610012829=:62010--

