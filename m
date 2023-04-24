Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14626ED651
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 22:49:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr37G-0006p1-H9; Mon, 24 Apr 2023 16:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pr37D-0006oR-JY
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:48:51 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pr37B-0003Bp-8c
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:48:51 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:2582:0:640:9a17:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 1041D5F3F7;
 Mon, 24 Apr 2023 23:48:43 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6523::1:a] (unknown
 [2a02:6b8:b081:6523::1:a])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id gmM6OO1OjGk0-YkiThJDA; Mon, 24 Apr 2023 23:48:42 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682369322; bh=W+OlM/OC3Ksh3uCjGnF+IFpj2/v9JkEvn7htiBlyQCA=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=WPsN+3E2cDK6Jd4M9CcMo3Bs29Ck6wep2+ErJYVuyxB5LtOQ624p2ymk92c0gacpz
 lclOPtrtZhuncLL1enviEn+zUYGDwkWolngfXM3lw/MhJ41pqwK6jvCSoNKN4GyT3q
 HB/OgdSBA1rtfVgu6g2jPwYIWwQL2JSWlvURnJJM=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <5231bc91-f06b-fbd2-9836-c0df97756317@yandex-team.ru>
Date: Mon, 24 Apr 2023 23:48:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] pci: make ROM memory resizable
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, david@redhat.com,
 peterx@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 den-plotnikov@yandex-team.ru
References: <20230424203647.94614-1-vsementsov@yandex-team.ru>
 <20230424164105-mutt-send-email-mst@kernel.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230424164105-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
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

On 24.04.23 23:41, Michael S. Tsirkin wrote:
>> @@ -2366,7 +2368,8 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>>           snprintf(name, sizeof(name), "%s.rom", object_get_typename(OBJECT(pdev)));
>>       }
>>       pdev->has_rom = true;
>> -    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize, &error_fatal);
>> +    memory_region_init_rom_resizable(&pdev->rom, OBJECT(pdev), name,
>> +                                     pdev->romsize, MAX_ROM_SIZE, &error_fatal);
>>       ptr = memory_region_get_ram_ptr(&pdev->rom);
>>       if (load_image_size(path, ptr, size) < 0) {
>>           error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
> You know this steals 2GB from address space, yes? This is quite a lot

Oops no, I didn't.

-- 
Best regards,
Vladimir


