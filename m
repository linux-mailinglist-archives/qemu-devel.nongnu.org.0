Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4A76F1F91
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 22:39:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psUqh-0007Z1-Vj; Fri, 28 Apr 2023 16:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1psUqg-0007Ys-Ez
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 16:37:46 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1psUqd-0001rf-9v
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 16:37:46 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:369a:0:640:c31a:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 64C165F767;
 Fri, 28 Apr 2023 23:37:35 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b432::1:18] (unknown
 [2a02:6b8:b081:b432::1:18])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id YbQS260Oka60-9g2PQSYa; Fri, 28 Apr 2023 23:37:34 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682714254; bh=/Wql7gg65J36qVqb7UTwLL7lo7Rd7yUId8VExK+u7RY=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=dLeN3Ttu94cTVX6rH+eNdm+N43gOpXqH/ijQL92YXtEtI719FfngtgfR8bxhtg+5P
 yFwulY0xS9tFv7GUu3RR6m60eizRLQSMZCS37bUjF+0Ux7ap9MtQjy4WysO7/sg5ca
 znueOy0gwjqmaHfy2KFuzOvZUWyX6+zMyIMNV3sg=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <26d09b06-bded-6b98-b388-acecda3f21c3@yandex-team.ru>
Date: Fri, 28 Apr 2023 23:37:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/3] pci: ROM preallocation for incoming migration
Content-Language: en-US
To: quintela@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 david@redhat.com, peterx@redhat.com, pbonzini@redhat.com,
 den-plotnikov@yandex-team.ru, lersek@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com, armbru@redhat.com
References: <20230425161434.173022-1-vsementsov@yandex-team.ru>
 <20230425161434.173022-4-vsementsov@yandex-team.ru>
 <20230426002135-mutt-send-email-mst@kernel.org>
 <877ctwbe8u.fsf@secure.mitica>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <877ctwbe8u.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28.04.23 11:30, Juan Quintela wrote:
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>> On Tue, Apr 25, 2023 at 07:14:34PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>> On incoming migration we have the following sequence to load option
>>> ROM:
>>>
>>> 1. On device realize we do normal load ROM from the file
>>>
>>> 2. Than, on incoming migration we rewrite ROM from the incoming RAM
>>>     block. If sizes mismatch we fail.
>>
>> let's mention an example error message:
>>   Size mismatch: 0000:00:03.0/virtio-net-pci.rom: 0x40000 != 0x80000: Invalid argument
> 
> This is a mess(TM).
> And no easy way to fix it.  Everything has its problems.
> 
> Ok, I will elaborate.
> 
> We have source machine and destination machine.
> Easy case, same version of qemu (or at least the same rom files).
> The interesting ones is when the sizes are wrong.
> 
> Again this splits on two cases:
> - target side is bigger
>    not big deal, during migration we just don't use all the space.

But still doesn't work without my patch, as size mismatch -> migration fail.

Or, if you try to set romsize to match source, it fails on realize, when trying to load ROM from file and see that specified size is smaller. (again my patch fixes it).

> - target side is smaller
>    guess what, not easy way to get this working O:-)
> 
> We added some changes on the past for this, but I don't remember the
> details.

romsize parameter is added. Still, it can't help in all cases.

> 
> If I understood his patch correctly, it set seems to try to fix this to
> always do the right thing with respect to migration, i.e. using whatever
> was on the source.  I think this is nice.

Yes. In details:

- If you didn't use romsize before, all you need is to specify correct romsize on target, it will work, no matter which rom files you have on target
- If you already use romsize - just keep same parameters on target, it will work, no matter which rom files you have on target.

> 
> But we still have left out the big elephant on the ROM, what happens
> when we reboot.

Hmm. I now checked, seems nothing happen with these pci ROMs on reboot. They are not reloaded. pci_qdev_realize() is not called again on reboot.. Or what I miss?

> 
> Right now, when we reboot we still use the rom files for the source.
> 
> And I think that in the case of reboot, if the ROM files have changed
> (because there was an upgrade or we migrate to a host with a never
> version, etc,) we should always do a powerdown + start to let qemu use
> the new ROM files.
> 
> As far as I know, no management app does that, and especially as we move
> to UEFI (i.e. more complex firmware with more posibilities for CVE's) I
> think we should considerd this case.
> 
>>> @@ -2293,10 +2294,16 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>>>   {
>>>       int64_t size;
>>>       g_autofree char *path = NULL;
>>> -    void *ptr;
>>>       char name[32];
>>>       const VMStateDescription *vmsd;
>>>   
>>> +    /*
>>> +     * In case of incoming migration ROM will come with migration stream, no
>>> +     * reason to load the file.  Neither we want to fail if local ROM file
>>> +     * mismatches with specified romsize.
>>> +     */
>>> +    bool load_file = !runstate_check(RUN_STATE_INMIGRATE);
>>> +
>>>       if (!pdev->romfile) {
>>>           return;
>>>       }
>>
>> CC pbonzini,dgilbert,quintela,armbru : guys, is poking at runstate_check like
>> this the right way to figure out we are not going to use the
>> device locally before incoming migration will overwrite ROM contents?
> 
> There is only a way to get into RUN_STATE_INMIGRATE, and that is that we
> have started the guest with --incoming <something>.  So the check does
> what it is intended.
> 
> Once told that, I have never been seen it used for this.
> /me launches grep on source tree
> 
> At least the block layer and usb use it exactly for this.  So I will say
> it is the correct way of doing it (or at least I can think of a better
> way right now).
> 
> The grep also shows this:
> 
> static void rom_reset(void *unused)
> {
>      Rom *rom;
> 
>      QTAILQ_FOREACH(rom, &roms, next) {
>          if (rom->fw_file) {
>              continue;
>          }
>          /*
>           * We don't need to fill in the RAM with ROM data because we'll fill
>           * the data in during the next incoming migration in all cases.  Note
>           * that some of those RAMs can actually be modified by the guest.
>           */
>          if (runstate_check(RUN_STATE_INMIGRATE)) {
>              if (rom->data && rom->isrom) {
>                  /*
>                   * Free it so that a rom_reset after migration doesn't
>                   * overwrite a potentially modified 'rom'.
>                   */
>                  rom_free_data(rom);
>              }
>              continue;
>          }
> 
> It is not exactly the problem at hand, but it is related.  I am just
> wondering if we can do something common.

Does these roms (of type Rom) from hw/core/loader.c relate to roms in hw/pci/pci.c, which are "MemoryRegion" ?

-- 
Best regards,
Vladimir


