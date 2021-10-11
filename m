Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CE9428E5D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 15:42:14 +0200 (CEST)
Received: from localhost ([::1]:53948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZvZF-0004LU-B3
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 09:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mZvXM-0002qO-HY
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:40:19 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:35478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mZvXG-0006X4-C9
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:40:13 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 27A64748F53;
 Mon, 11 Oct 2021 15:40:08 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 07537748F4B; Mon, 11 Oct 2021 15:40:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 05BC7748F52;
 Mon, 11 Oct 2021 15:40:08 +0200 (CEST)
Date: Mon, 11 Oct 2021 15:40:07 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: "Gabriel L. Somlo" <gsomlo@gmail.com>
Subject: Re: [PATCH] hw/misc: applesmc: use host osk as default on macs
In-Reply-To: <YWQ5zmFtL9yrJA81@errol.ini.cmu.edu>
Message-ID: <d5ab8786-bec9-b551-bf22-ef1bdace3f2b@eik.bme.hu>
References: <CABgObfZvicuKLqkDqK3a4zn92LRiC_g--_oT-7sPgTO3O1PrAQ@mail.gmail.com>
 <001C97D2-2710-415C-9ECD-F8C20AB52196@gmail.com>
 <YWQ5zmFtL9yrJA81@errol.ini.cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
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
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 =?ISO-8859-15?Q?Pedro_T=F4rres?= <t0rr3sp3dr0@gmail.com>, rene@exactcode.de,
 "Kiszka, Jan" <jan.kiszka@siemens.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Graf, Alexander" <agraf@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 suse@csgraf.de, afaerber <afaerber@suse.de>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Oct 2021, Gabriel L. Somlo wrote:
> FWIW, there's an applesmc driver in the Linux kernel, and it exposes
> many of the keys and values stored on the chip under
> /sys/devices/platform/applesmc.768 (or at least it *used* to back when
> I last checked).
>
> My idea at the time was to get this driver to also expose the value of
> OSK0,1, so that userspace programs (like e.g. qemu) could read and use
> the values hardcoded in hardware without needing to hardcode them
> themselves in software.

I guess a frequent use case for running macOS guests with keys from host 
would be on hosts running macOS too so a solution that works both on macOS 
and Linux might be better than a Linux specific one which then needs 
another way to do the same on macOS. Looks like there's free code for that 
too and you don't have to convince a maintainer either.

Regards,
BALATON Zoltan

