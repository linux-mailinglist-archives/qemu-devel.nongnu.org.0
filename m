Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE3A6A5B2B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 15:57:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX1Ob-00064q-9l; Tue, 28 Feb 2023 09:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pX1OY-00064a-F6
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:55:58 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pX1OW-0002N0-Ed
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:55:58 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 11D40746335;
 Tue, 28 Feb 2023 15:55:49 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C8F7E7462DB; Tue, 28 Feb 2023 15:55:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C78597457E7;
 Tue, 28 Feb 2023 15:55:48 +0100 (CET)
Date: Tue, 28 Feb 2023 15:55:48 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 6/7] usb/ohci: Implement resume on connection status
 change
In-Reply-To: <9d4b7238-23f4-1ea8-10d9-6b73f4c026ec@linaro.org>
Message-ID: <5281d606-7348-4537-01db-68714969c0e8@eik.bme.hu>
References: <cover.1676916639.git.balaton@eik.bme.hu>
 <35c4d4ccf2f73e6a87cdbd28fb6a1b33de72ed74.1676916640.git.balaton@eik.bme.hu>
 <9d4b7238-23f4-1ea8-10d9-6b73f4c026ec@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-657128405-1677596148=:71268"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-657128405-1677596148=:71268
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 28 Feb 2023, Philippe Mathieu-Daudé wrote:
> On 20/2/23 19:19, BALATON Zoltan wrote:
>> If certain bit is set remote wake up should change state from
>> suspended to resume and generate interrupt. There was a todo comment
>> for this, implement that by moving existing resume logic to a function
>> and call that.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/usb/hcd-ohci.c | 23 +++++++++++++++++------
>>   1 file changed, 17 insertions(+), 6 deletions(-)
>> 
>> diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
>> index bad8db7b1d..88bd42b14a 100644
>> --- a/hw/usb/hcd-ohci.c
>> +++ b/hw/usb/hcd-ohci.c
>> @@ -1410,6 +1410,18 @@ static void ohci_set_hub_status(OHCIState *ohci, 
>> uint32_t val)
>>       }
>>   }
>>   +/* This is the one state transition the controller can do by itself */
>> +static int ohci_resume(OHCIState *s)
>
> Preferably returning bool.

I can change that on rebase. I just followed other exising 
functions in this file for consistency which return int (although some 
use 1 and others use -1 besides 0).

>> +{
>> +    if ((s->ctl & OHCI_CTL_HCFS) == OHCI_USB_SUSPEND) {
>> +        trace_usb_ohci_remote_wakeup(s->name);
>> +        s->ctl &= ~OHCI_CTL_HCFS;
>> +        s->ctl |= OHCI_USB_RESUME;
>> +        return 1;
>> +    }
>> +    return 0;
>> +}
>> +
>>   /*
>>    * Sets a flag in a port status reg but only set it if the port is 
>> connected.
>>    * If not set ConnectStatusChange flag. If flag is enabled return 1.
>> @@ -1426,7 +1438,10 @@ static int ohci_port_set_if_connected(OHCIState 
>> *ohci, int i, uint32_t val)
>>       if (!(ohci->rhport[i].ctrl & OHCI_PORT_CCS)) {
>>           ohci->rhport[i].ctrl |= OHCI_PORT_CSC;
>
> // ConnectStatusChange
>
>>           if (ohci->rhstatus & OHCI_RHS_DRWE) {
>
> // DeviceRemoteWakeupEnable: ConnectStatusChange is a remote wakeup event.

Not clear if you want any change here or the comments are just explanation 
in this email.

>> -            /* TODO: CSC is a wakeup event */
>> +            /* CSC is a wakeup event */
>> +            if (ohci_resume(ohci)) {
>> +                ohci_set_interrupt(ohci, OHCI_INTR_RD);
>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks for the review. You put a lot of work in QEMU and we appreciate 
very much that you're also doing the job of other maintainers.

Regards,
BALATON Zoltan

> Gerd, if you Ack I can queue this.
>
>> +            }
>>           }
>>           return 0;
>>       }
>> @@ -1828,11 +1843,7 @@ static void ohci_wakeup(USBPort *port1)
>>           intr = OHCI_INTR_RHSC;
>>       }
>>       /* Note that the controller can be suspended even if this port is not 
>> */
>> -    if ((s->ctl & OHCI_CTL_HCFS) == OHCI_USB_SUSPEND) {
>> -        trace_usb_ohci_remote_wakeup(s->name);
>> -        /* This is the one state transition the controller can do by 
>> itself */
>> -        s->ctl &= ~OHCI_CTL_HCFS;
>> -        s->ctl |= OHCI_USB_RESUME;
>> +    if (ohci_resume(s)) {
>>           /*
>>            * In suspend mode only ResumeDetected is possible, not RHSC:
>>            * see the OHCI spec 5.1.2.3.
>
>
--3866299591-657128405-1677596148=:71268--

