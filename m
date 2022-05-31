Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04271539132
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 14:59:44 +0200 (CEST)
Received: from localhost ([::1]:32926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw1TK-00069c-Kk
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 08:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1nw1FF-0004WS-3j; Tue, 31 May 2022 08:45:11 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:44746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1nw1FD-0000y8-6V; Tue, 31 May 2022 08:45:08 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5EBE321AE9;
 Tue, 31 May 2022 12:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654001105; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fgQcc600rmS+/G5htzQKfJtm2L+PpHZJcVeZoA6jq20=;
 b=kke+vZ+5zhzdcyRfRaE8ASGU60rYcfkewsmk2KhoNKdLaCcoQ/XhNmNKb6Tp8bMYHCY4Q0
 QepMhaLlRiCeqL4O3c6QK1U9eCa1JKgSua8yVXRNkzTGHhx5kAe+1YjUcYociPQWeqTbmd
 ST5JYKZvkjHTV06xDb+mzHFjFKGMOCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654001105;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fgQcc600rmS+/G5htzQKfJtm2L+PpHZJcVeZoA6jq20=;
 b=CssLDikfIE/P9uHGuRgfbeBmwJ2lGkqfW6RSUO/xs0xgcTujqNjCEBHl7D+ZOJuFobKpGr
 Rq5lh+MDUrfgXpBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 108D713AA2;
 Tue, 31 May 2022 12:45:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 31GMAtENlmKHdwAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 31 May 2022 12:45:05 +0000
Message-ID: <4e51ce73-b1e9-8c64-d25f-71e363880681@suse.de>
Date: Tue, 31 May 2022 14:45:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] pci: fix overflow in snprintf string formatting
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org,
 Dario Faggioli <dfaggioli@suse.com>, =?UTF-8?Q?Martin_Li=c5=a1ka?=
 <martin.liska@suse.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Dario Faggioli <DarioFaggiolidfaggioli@suse.com>, qemu-stable@nongnu.org
References: <20220531114707.18830-1-cfontana@suse.de>
 <CAARzgwx4BjPt7MxctMK9VJ6u+yPsyoFDZ1bQo+F-qE1LVJ4epw@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <CAARzgwx4BjPt7MxctMK9VJ6u+yPsyoFDZ1bQo+F-qE1LVJ4epw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/31/22 14:26, Ani Sinha wrote:
> On Tue, May 31, 2022 at 5:20 PM Claudio Fontana <cfontana@suse.de> wrote:
>>
>> the code in pcibus_get_fw_dev_path contained the potential for a
>> stack buffer overflow of 1 byte, potentially writing to the stack an
>> extra NUL byte.
>>
>> This overflow could happen if the PCI slot is >= 0x10000000,
>> and the PCI function is >= 0x10000000, due to the size parameter
>> of snprintf being incorrectly calculated in the call:
>>
>>     if (PCI_FUNC(d->devfn))
>>         snprintf(path + off, sizeof(path) + off, ",%x", PCI_FUNC(d->devfn));
>>
>> since the off obtained from a previous call to snprintf is added
>> instead of subtracted from the total available size of the buffer.
>>
>> Without the accurate size guard from snprintf, we end up writing in the
>> worst case:
>>
>> name (32) + "@" (1) + SLOT (8) + "," (1) + FUNC (8) + term NUL (1) = 51 bytes
>>
>> In order to provide something more robust, replace all of the code in
>> pcibus_get_fw_dev_path with a single call to g_strdup_printf,
>> so there is no need to rely on manual calculations.
>>
>> Found by compiling QEMU with FORTIFY_SOURCE=3 as the error:
>>
>> *** buffer overflow detected ***: terminated
>>
>> Thread 1 "qemu-system-x86" received signal SIGABRT, Aborted.
>> [Switching to Thread 0x7ffff642c380 (LWP 121307)]
>> 0x00007ffff71ff55c in __pthread_kill_implementation () from /lib64/libc.so.6
>> (gdb) bt
>>  #0  0x00007ffff71ff55c in __pthread_kill_implementation () at /lib64/libc.so.6
>>  #1  0x00007ffff71ac6f6 in raise () at /lib64/libc.so.6
>>  #2  0x00007ffff7195814 in abort () at /lib64/libc.so.6
>>  #3  0x00007ffff71f279e in __libc_message () at /lib64/libc.so.6
>>  #4  0x00007ffff729767a in __fortify_fail () at /lib64/libc.so.6
>>  #5  0x00007ffff7295c36 in  () at /lib64/libc.so.6
>>  #6  0x00007ffff72957f5 in __snprintf_chk () at /lib64/libc.so.6
>>  #7  0x0000555555b1c1fd in pcibus_get_fw_dev_path ()
>>  #8  0x0000555555f2bde4 in qdev_get_fw_dev_path_helper.constprop ()
>>  #9  0x0000555555f2bd86 in qdev_get_fw_dev_path_helper.constprop ()
>>  #10 0x00005555559a6e5d in get_boot_device_path ()
>>  #11 0x00005555559a712c in get_boot_devices_list ()
>>  #12 0x0000555555b1a3d0 in fw_cfg_machine_reset ()
>>  #13 0x0000555555bf4c2d in pc_machine_reset ()
>>  #14 0x0000555555c66988 in qemu_system_reset ()
>>  #15 0x0000555555a6dff6 in qdev_machine_creation_done ()
>>  #16 0x0000555555c79186 in qmp_x_exit_preconfig.part ()
>>  #17 0x0000555555c7b459 in qemu_init ()
>>  #18 0x0000555555960a29 in main ()
>>
>> Found-by: Dario Faggioli <Dario Faggioli <dfaggioli@suse.com>
>> Found-by: Martin Liška <martin.liska@suse.com>
> 
> I think Reported-by: is preferred.
> 
>> Cc: qemu-stable@nongnu.org
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  hw/pci/pci.c | 18 +++++++++---------
>>  1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index a9b37f8000..6e7015329c 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -2640,15 +2640,15 @@ static char *pci_dev_fw_name(DeviceState *dev, char *buf, int len)
>>  static char *pcibus_get_fw_dev_path(DeviceState *dev)
>>  {
>>      PCIDevice *d = (PCIDevice *)dev;
>> -    char path[50], name[33];
>> -    int off;
>> -
>> -    off = snprintf(path, sizeof(path), "%s@%x",
>> -                   pci_dev_fw_name(dev, name, sizeof name),
>> -                   PCI_SLOT(d->devfn));
>> -    if (PCI_FUNC(d->devfn))
>> -        snprintf(path + off, sizeof(path) + off, ",%x", PCI_FUNC(d->devfn));
>> -    return g_strdup(path);
>> +    char name[33];
>> +    int has_func = !!PCI_FUNC(d->devfn);
>> +
>> +    return g_strdup_printf("%s@%x%s%.*x",
> 
> I was experimenting with printf dynamic precision field with hex and
> it was not quite working as expected. In particular, with precision 0,
> I was still able to print a single hex digit. That is the following
> still outputs 5 in stderr :
> 
>> fprintf(stderr, "%.*x\n", 0, 5);

Hi Ani, both the precision and the value need to be zero to omit the value,
and this is what the patch relies on.

Ciao,

Claudio

> 
> 
>> +                           pci_dev_fw_name(dev, name, sizeof(name)),
>> +                           PCI_SLOT(d->devfn),
>> +                           has_func ? "," : "",
>> +                           has_func,
>> +                           PCI_FUNC(d->devfn));
>>  }
>>
>>  static char *pcibus_get_dev_path(DeviceState *dev)
>> --
>> 2.26.2
>>
>>


