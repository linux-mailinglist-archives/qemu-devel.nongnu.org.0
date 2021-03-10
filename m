Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10454333335
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 03:37:39 +0100 (CET)
Received: from localhost ([::1]:48208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJojB-0007fI-OL
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 21:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJoi9-00078t-QW; Tue, 09 Mar 2021 21:36:33 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:56439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJoi8-0007mr-5h; Tue, 09 Mar 2021 21:36:33 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0B71E7456B8;
 Wed, 10 Mar 2021 03:36:30 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C6AF37456B7; Wed, 10 Mar 2021 03:36:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C1C047456B4;
 Wed, 10 Mar 2021 03:36:29 +0100 (CET)
Date: Wed, 10 Mar 2021 03:36:29 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v6 4/8] vt82c686: Introduce abstract TYPE_VIA_ISA and
 base vt82c686b_isa on it
In-Reply-To: <18602f6c-a1d1-bf02-26cf-c3f1cba52294@amsat.org>
Message-ID: <74b2b68c-dd5e-914a-597c-4121c91cdeda@eik.bme.hu>
References: <cover.1615321729.git.balaton@eik.bme.hu>
 <ffd30415332be2d23f72072dc256cc6eee170f3d.1615321729.git.balaton@eik.bme.hu>
 <18602f6c-a1d1-bf02-26cf-c3f1cba52294@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1257872536-1615343789=:20835"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1257872536-1615343789=:20835
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 10 Mar 2021, Philippe Mathieu-Daudé wrote:
> On 3/9/21 9:28 PM, BALATON Zoltan wrote:
>> To allow reusing ISA bridge emulation for vt8231_isa move the device
>> state of vt82c686b_isa emulation in an abstract via_isa class. This
>> change breaks migration back compatibility but this is not an issue
>> for Fuloong2E machine which is not versioned or migration supported.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/isa/vt82c686.c        | 70 ++++++++++++++++++++++------------------
>>  include/hw/pci/pci_ids.h |  2 +-
>>  2 files changed, 40 insertions(+), 32 deletions(-)
>
> This should be OK if this other series is accepted:
> "hw/usb: Extract Extract VT82C686 UHCI PCI function into new unit"
> https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg03083.html

How is this patch related to that series? This one changes the isa bridge 
part and that makes the usb part compiled only if configured. These seem 
unrelated and independent to me.

Regards,
BALATON Zoltan

> I'll come back to this patch after the former series is reviewed.
>
>
--3866299591-1257872536-1615343789=:20835--

