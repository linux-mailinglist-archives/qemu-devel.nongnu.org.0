Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DBC6EE24C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:00:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIGZ-0001e9-PI; Tue, 25 Apr 2023 08:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prIGW-0001dk-BN
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:59:28 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prIGU-0003iF-FU
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:59:28 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:369a:0:640:c31a:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 22B3360D10;
 Tue, 25 Apr 2023 15:59:20 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b440::1:14] (unknown
 [2a02:6b8:b081:b440::1:14])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id IxFI900OoGk0-imCFZjyJ; Tue, 25 Apr 2023 15:59:18 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682427558; bh=PJaSB5DXn+5g+MP6h1LBcpAwX7qnqukld8EVHoV6A5g=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Z1MJJQxC/vFPFfhreRdVMmKEGdPzA9sNIts8nrPEYFEG+vzCsFa/pXsjo9J+4POu1
 txqZtBGWbAAEmpXkMZdrKnKxYaLYDcdc8yatblyTD5cocjWgGGee0KOD0iU+NVSAJb
 LTwJbrY1VOMyFvvjSrGBJslt3l4fsNj7V/jZjTBQ=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <bc9f987b-e66c-ea23-1ff0-c921b7de14ad@yandex-team.ru>
Date: Tue, 25 Apr 2023 15:59:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] pci: make ROM memory resizable
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, david@redhat.com,
 peterx@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 den-plotnikov@yandex-team.ru, Laszlo Ersek <lersek@redhat.com>
References: <20230424203647.94614-1-vsementsov@yandex-team.ru>
 <20230425031348-mutt-send-email-mst@kernel.org>
 <kwqw7gyagjlykfvdyiwlfr3tuepofr5o7e2mtute6dmltbzkg6@jy3ea7jlvllc>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <kwqw7gyagjlykfvdyiwlfr3tuepofr5o7e2mtute6dmltbzkg6@jy3ea7jlvllc>
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

On 25.04.23 15:10, Gerd Hoffmann wrote:
> On Tue, Apr 25, 2023 at 03:26:50AM -0400, Michael S. Tsirkin wrote:
>> On Mon, Apr 24, 2023 at 11:36:47PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>> On migration, on target we load local ROM file. But actual ROM content
>>> migrates through migration channel. Original ROM content from local
>>> file doesn't matter. But when size mismatch - we have an error like
>>>
>>>   Size mismatch: 0000:00:03.0/virtio-net-pci.rom: 0x40000 != 0x80000: Invalid argument
> 
> Oh, a 512k rom.  Where does that come from?
> 
> The ones shipped by qemu are all between 128k and 256k in size,
> which gets rounded up to 256k (0x40000).  Has not changed since
> we added efi boot rom support ...
> 
> If you supply your own versions for some reason you must make sure
> they have identical size on all host machines.
> 

on my ubuntu 22.04:

dpkg -L ipxe-qemu | grep efi-virtio
/usr/lib/ipxe/qemu/efi-virtio.rom

ls -lthr /usr/lib/ipxe/qemu/efi-virtio.rom
-rw-r--r-- 1 root root 512K Jan 13  2022 /usr/lib/ipxe/qemu/efi-virtio.rom

If look inside the file, it's filled with ffff starting from 0x32400

-- 
Best regards,
Vladimir


