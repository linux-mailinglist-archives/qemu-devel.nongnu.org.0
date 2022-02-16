Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2214B879E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 13:29:02 +0100 (CET)
Received: from localhost ([::1]:57948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKJQb-0008LM-Sq
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 07:29:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nKJOw-0007e1-9s
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 07:27:18 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:23685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nKJOt-0007fM-A0
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 07:27:17 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BF9AB745712;
 Wed, 16 Feb 2022 13:27:12 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9E2FF7456FE; Wed, 16 Feb 2022 13:27:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9D1F17456E3;
 Wed, 16 Feb 2022 13:27:12 +0100 (CET)
Date: Wed, 16 Feb 2022 13:27:12 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/5] Misc OHCI clean ups
In-Reply-To: <1b24997-8dba-d640-1ce6-896fc346ae9@eik.bme.hu>
Message-ID: <228c70c7-11bf-8d94-607b-4eacdcaddd93@eik.bme.hu>
References: <cover.1643117600.git.balaton@eik.bme.hu>
 <1b24997-8dba-d640-1ce6-896fc346ae9@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022, BALATON Zoltan wrote:
> On Tue, 25 Jan 2022, BALATON Zoltan wrote:
>> v2 - Fixed checkpatch errors
>> 
>> Hello,
>
> Ping?

Ping^2

https://patchew.org/QEMU/cover.1643117600.git.balaton@eik.bme.hu/

Regards,
BALATON Zoltan

>> I have these patches from last October when we've looked at what
>> causes problems with mac99 and USB. We've found the main problem is
>> likely not allowing pending packets per endpoint which we did not fix
>> but these patches came out of debugging that and trying to improve the
>> device model so eventually the real problem could be fixed more
>> easily. So these are just clean ups and fixing one potential issue
>> with isochronous transfers breaking pending async packet but it does
>> not solve all problems OHCI currently has. I'm sending it anyway as I
>> don't plan to work further on this so this series could be taken as is
>> for now.
>> 
>> Regards,
>> 
>> BALATON Zoltan (5):
>>  usb/ohci: Move trace point and log ep number to help debugging
>>  usb/ohci: Move cancelling async packet to ohci_stop_endpoints()
>>  usb/ohci: Move USBPortOps related functions together
>>  usb/ohci: Merge ohci_async_cancel_device() into ohci_child_detach()
>>  usb/ohci: Don't use packet from OHCIState for isochronous transfers
>> 
>> hw/usb/hcd-ohci.c   | 297 +++++++++++++++++++++-----------------------
>> hw/usb/trace-events |   2 +-
>> 2 files changed, 146 insertions(+), 153 deletions(-)
>> 
>> 
>

