Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9F56EDE3A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 10:34:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prE80-00068V-LZ; Tue, 25 Apr 2023 04:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prE7y-00068F-G1
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 04:34:22 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prE7v-00061G-SA
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 04:34:22 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:308d:0:640:82be:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id E8F326078B;
 Tue, 25 Apr 2023 11:34:10 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b440::1:14] (unknown
 [2a02:6b8:b081:b440::1:14])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 9YBnca0Or4Y0-trqDwjFA; Tue, 25 Apr 2023 11:34:09 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682411649; bh=aLBkWlnIzOt51pZ927bEcjPgRSK6Ni/xpcMo+U/PzO0=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Q8OY+wC6eLgu/TAzXPHohP2uj5dWJDvN0odJf1FhaTcexynCkTcx3Wlh/Psd5ggIY
 OFjWoWn/57IPcNFAbOzUcEV2l31trIEUQfk9nVc5w+z63skZYdgrf7KLhFU3ST3oIX
 XB9B7gzWG7WHecMyBXyKNL5bQJQiNFu0XwLNAXWc=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <f2fcb8b1-877c-59dc-3eb2-33a456fa7372@yandex-team.ru>
Date: Tue, 25 Apr 2023 11:34:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] pci: make ROM memory resizable
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, david@redhat.com,
 peterx@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 den-plotnikov@yandex-team.ru, Gerd Hoffmann <kraxel@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
References: <20230424203647.94614-1-vsementsov@yandex-team.ru>
 <20230425031348-mutt-send-email-mst@kernel.org>
 <20230425033455-mutt-send-email-mst@kernel.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230425033455-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
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

On 25.04.23 10:43, Michael S. Tsirkin wrote:
> On Tue, Apr 25, 2023 at 03:26:54AM -0400, Michael S. Tsirkin wrote:
>> On Mon, Apr 24, 2023 at 11:36:47PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>> On migration, on target we load local ROM file. But actual ROM content
>>> migrates through migration channel. Original ROM content from local
>>> file doesn't matter. But when size mismatch - we have an error like
>>>
>>>   Size mismatch: 0000:00:03.0/virtio-net-pci.rom: 0x40000 != 0x80000: Invalid argument
>>
>> Oh, this is this old bug then:
>> https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/1713490
>>
>> People seem to be "fixing" this by downgrading ROMs.
>>
>> Actually, I think the fix is different: we need to build
>> versions of ROMs for old machine types that can fit
>> in the old BAR size.
>>
>> Gerd, Laszlo what's your take on all this?
> Actually, ignore this - we do keep old ROMs around specifically to avoid
> ROM size changes and have been for ever. E.g.:
> 
> commit c45e5b5b30ac1f5505725a7b36e68cedfce4f01f
> Author: Gerd Hoffmann<kraxel@redhat.com>
> Date:   Tue Feb 26 17:46:11 2013 +0100
> 
>      Switch to efi-enabled nic roms by default
>      
>      All PCI nics are switched to EFI-enabled roms by default.  They are
>      composed from three images (legacy, efi ia32 & efi x86), so classic
>      pxe booting will continue to work.
>      
>      Exception: eepro100 is not switched, it uses a single rom for all
>      emulated eepro100 variants, then goes patch the rom header on the
>      fly with the correct PCI IDs.  I doubt that will work as-is with
>      the efi roms.
>      
>      Keep old roms for 1.4+older machine types via compat properties,
>      needed because the efi-enabled roms are larger so the pci rom bar
>      size would change.
>      
>      Signed-off-by: Gerd Hoffmann<kraxel@redhat.com>
> 
> 
> So it's downstream messing up with things, overriding the
> rom file then changing its size.
> 
> 
> On fedora I find both pxe virtio and efi virtio so it gets it right.
> 
> 

Yes I understand that distribution may work-around the problem just having all needed roms on target and specifying correct romfile= argument.

But this is not ideal: having the file only to get its size, to not mismatch with incoming RAM block. There should be way to migrate ROMs automatically without extra files on target.

-- 
Best regards,
Vladimir


