Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992506F408C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 11:59:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptmn5-0006EP-Nk; Tue, 02 May 2023 05:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ptmn2-0006E5-EI
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:59:20 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ptmmy-0002EB-RL
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:59:19 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:2502:0:640:10a:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 53AC5605A5;
 Tue,  2 May 2023 12:59:08 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b43b::1:1a] (unknown
 [2a02:6b8:b081:b43b::1:1a])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 6xJ2pP0OcCg0-Rk0NUEDZ; Tue, 02 May 2023 12:59:06 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1683021546; bh=VR1E0oBV0NhnkMTYAiH1l+pFoKNMFtYKcIr8VKDGr8Q=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=KWEtjs9nWt0V0Hi3ZQUvcykxCxluJ+wRiNecFDL23B+XVR8egBEJUj+HmxVGyDDFB
 mDLNcyGQF1uOC7dW9pRbVM6pyB0PpGiV72jCPn/WNTSxQZJMWnaru8iPWMoUy4pOs7
 1kIuxoR5Koy1KnnsUJh5Lmzi2cvHsWVuZFLvkqGk=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <0b23a8b3-b965-5992-3884-eff4ab6c6022@yandex-team.ru>
Date: Tue, 2 May 2023 12:59:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/3] pci: ROM preallocation for incoming migration
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 david@redhat.com, peterx@redhat.com, pbonzini@redhat.com,
 den-plotnikov@yandex-team.ru, lersek@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com, quintela@redhat.com, armbru@redhat.com
References: <20230425161434.173022-1-vsementsov@yandex-team.ru>
 <20230425161434.173022-4-vsementsov@yandex-team.ru>
 <20230426002135-mutt-send-email-mst@kernel.org>
 <bf295d76-9c33-4eca-4b88-2d1a299c8b94@yandex-team.ru>
 <20230502054519-mutt-send-email-mst@kernel.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230502054519-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 02.05.23 12:48, Michael S. Tsirkin wrote:
> On Wed, Apr 26, 2023 at 11:00:46PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> On 26.04.23 07:43, Michael S. Tsirkin wrote:
>>> On Tue, Apr 25, 2023 at 07:14:34PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>> On incoming migration we have the following sequence to load option
>>>> ROM:
>>>>
>>>> 1. On device realize we do normal load ROM from the file
>>>>
>>>> 2. Than, on incoming migration we rewrite ROM from the incoming RAM
>>>>      block. If sizes mismatch we fail.
>>> let's mention an example error message:
>>>    Size mismatch: 0000:00:03.0/virtio-net-pci.rom: 0x40000 != 0x80000: Invalid argument
>>>
>>>
>>>> This is not ideal when we migrate to updated distribution: we have to
>>>> keep old ROM files in new distribution and be careful around romfile
>>>> property to load correct ROM file.
>>>> Which is loaded actually just to
>>>> allocate the ROM with correct length.
>>>> Note, that romsize property doesn't really help: if we try to specify
>>>> it when default romfile is larger, it fails with something like:
>>>>
>>>> romfile "efi-virtio.rom" (160768 bytes) is too large for ROM size 65536
>>> Something I'd like to clarify is that the comment applies to uses where
>>> users/distributions supply their own ROM file.  And lots of
>>> users/distributions seem to have already painted themselves into a
>>> corner by supplying a mix of ROM files of unmatching sizes -
>>> basically they don't understand the detail of live migration,
>>> ROM size interaction with it and with memory layout, etc -
>>> as a very small number of people does.
>>> For example, ubuntu doubled ROM file size by padding their ROMs
>>> with 0xffffffff at some point, breaking migration for all existing machine
>>> types.
>>>
>>> just a web search for
>>>    Size mismatch: 0000:00:03.0/virtio-net-pci.rom: 0x40000 != 0x80000: Invalid argument
>>>
>>> will turn up a bunch of confused distros and users.
>>>
>>>
>>>> Let's just ignore ROM file when romsize is specified and we are in
>>>> incoming migration state. In other words, we need only to preallocate
>>>> ROM of specified size, local ROM file is unrelated.
>>>
>>>
>>>
>>>> This way:
>>>>
>>>> If romsize was specified on source, we just use same commandline as on
>>>> source, and migration will work independently of local ROM files on
>>>> target.
>>>>
>>>> If romsize was not specified on source (and we have mismatching local
>>>> ROM file on target host), we have to specify romsize on target to match
>>>> source romsize. romfile parameter may be kept same as on source or may
>>>> be dropped, the file is not loaded anyway.
>>>>
>>>> As a bonus we avoid extra reading from ROM file on target.
>>>>
>>>> Note: when we don't have romsize parameter on source command line and
>>>> need it for target, it may be calculated as aligned up to power of two
>>>> size of ROM file on source (if we know, which file is it) or,
>>>> alternatively it may be retrieved from source QEMU by QMP qom-get
>>>> command, like
>>>>
>>>>     { "execute": "qom-get",
>>>>       "arguments": {
>>>>         "path": "/machine/peripheral/CARD_ID/virtio-net-pci.rom[0]",
>>>>         "property": "size" } }
>>>>
>>>> Suggested-by: Michael S. Tsirkin<mst@redhat.com>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>
>>>> ---
>>>>    hw/pci/pci.c | 77 ++++++++++++++++++++++++++++++----------------------
>>>>    1 file changed, 45 insertions(+), 32 deletions(-)
>>>>
>>>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>>>> index a442f8fce1..e2cab622e4 100644
>>>> --- a/hw/pci/pci.c
>>>> +++ b/hw/pci/pci.c
>>>> @@ -36,6 +36,7 @@
>>>>    #include "migration/vmstate.h"
>>>>    #include "net/net.h"
>>>>    #include "sysemu/numa.h"
>>>> +#include "sysemu/runstate.h"
>>>>    #include "sysemu/sysemu.h"
>>>>    #include "hw/loader.h"
>>>>    #include "qemu/error-report.h"
>>>> @@ -2293,10 +2294,16 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>>>>    {
>>>>        int64_t size;
>>>>        g_autofree char *path = NULL;
>>>> -    void *ptr;
>>>>        char name[32];
>>>>        const VMStateDescription *vmsd;
>>>> +    /*
>>>> +     * In case of incoming migration ROM will come with migration stream, no
>>>> +     * reason to load the file.  Neither we want to fail if local ROM file
>>>> +     * mismatches with specified romsize.
>>>> +     */
>>>> +    bool load_file = !runstate_check(RUN_STATE_INMIGRATE);
>>>> +
>>>>        if (!pdev->romfile) {
>>>>            return;
>>>>        }
>>> CC pbonzini,dgilbert,quintela,armbru : guys, is poking at runstate_check like
>>> this the right way to figure out we are not going to use the
>>> device locally before incoming migration will overwrite ROM contents?
>> RUN_STATE_INMIGRATE is set in the only one place in qemu_init() when we parse cmdline option -incoming. VM is not running for sure. And starting the VM comes with changing the state. So it's OK.
>>
>> The possible problem, if we add netcard on target which we didn't have on source. I now checked, this works.. But that doesn't seem correct to add device that was not present on source - how would it work - it's not guaranteed anyway.
> You can add it on source too while migration is in progress, no?
> 

No, as INMIGRATE - means incoming migration, it's only on target

-- 
Best regards,
Vladimir


