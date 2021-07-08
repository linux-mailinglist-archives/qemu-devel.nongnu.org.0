Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C463C1B70
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 00:26:49 +0200 (CEST)
Received: from localhost ([::1]:58210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1cTo-0006Su-36
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 18:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m1cSE-0005SR-8D; Thu, 08 Jul 2021 18:25:11 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:49243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m1cSB-0006PN-QF; Thu, 08 Jul 2021 18:25:09 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5055D745708;
 Fri,  9 Jul 2021 00:25:06 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2DF7474570E; Fri,  9 Jul 2021 00:25:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2CB7B74570D;
 Fri,  9 Jul 2021 00:25:06 +0200 (CEST)
Date: Fri, 9 Jul 2021 00:25:06 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 4/4] ppc/pegasos2: Implement some RTAS functions with VOF
In-Reply-To: <YOaBCA4nZ0Lyz2SM@yekko>
Message-ID: <c694b726-3c65-60cd-c9b1-f3dba90297@eik.bme.hu>
References: <cover.1624811233.git.balaton@eik.bme.hu>
 <b4bf314d4edca0dd31f2859543601f815ed56187.1624811233.git.balaton@eik.bme.hu>
 <YOaBCA4nZ0Lyz2SM@yekko>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Jul 2021, David Gibson wrote:
> On Sun, Jun 27, 2021 at 06:27:13PM +0200, BALATON Zoltan wrote:
>> Linux uses RTAS functions to access PCI devices so we need to provide
>> these with VOF. Implement some of the most important functions to
>> allow booting Linux with VOF. With this the board is now usable
>> without a binary ROM image and we can enable it by default as other
>> boards.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>
> Applied, but...
>
>> @@ -687,6 +795,29 @@ static void *build_fdt(MachineState *machine, int *fdt_size)
>>      qemu_fdt_setprop_string(fdt, "/failsafe", "device_type", "serial");
>>      qemu_fdt_setprop_string(fdt, "/failsafe", "name", "failsafe");
>>
>> +    qemu_fdt_add_subnode(fdt, "/rtas");
>> +    qemu_fdt_setprop_cell(fdt, "/rtas", "system-reboot", 20);
>> +    qemu_fdt_setprop_cell(fdt, "/rtas", "hibernate", 19);
>> +    qemu_fdt_setprop_cell(fdt, "/rtas", "suspend", 18);
>> +    qemu_fdt_setprop_cell(fdt, "/rtas", "power-off", 17);
>> +    qemu_fdt_setprop_cell(fdt, "/rtas", "set-indicator", 11);
>> +    qemu_fdt_setprop_cell(fdt, "/rtas", "display-character", 10);
>> +    qemu_fdt_setprop_cell(fdt, "/rtas", "write-pci-config", 9);
>> +    qemu_fdt_setprop_cell(fdt, "/rtas", "read-pci-config", 8);
>> +    /* Pegasos2 firmware misspells check-exception and guests use that */
>> +    qemu_fdt_setprop_cell(fdt, "/rtas", "check-execption", 7);
>> +    qemu_fdt_setprop_cell(fdt, "/rtas", "event-scan", 6);
>> +    qemu_fdt_setprop_cell(fdt, "/rtas", "set-time-of-day", 4);
>> +    qemu_fdt_setprop_cell(fdt, "/rtas", "get-time-of-day", 3);
>> +    qemu_fdt_setprop_cell(fdt, "/rtas", "nvram-store", 2);
>> +    qemu_fdt_setprop_cell(fdt, "/rtas", "nvram-fetch", 1);
>> +    qemu_fdt_setprop_cell(fdt, "/rtas", "restart-rtas", 0);
>> +    qemu_fdt_setprop_cell(fdt, "/rtas", "rtas-error-log-max", 0);
>> +    qemu_fdt_setprop_cell(fdt, "/rtas", "rtas-event-scan-rate", 0);
>> +    qemu_fdt_setprop_cell(fdt, "/rtas", "rtas-display-device", 0);
>> +    qemu_fdt_setprop_cell(fdt, "/rtas", "rtas-size", 20);
>> +    qemu_fdt_setprop_cell(fdt, "/rtas", "rtas-version", 1);
>
> ..you really want to be using your symbolic names here as well.

Sent a v2 for this patch that you can replace this with.

Regards,
BALATON Zoltan

