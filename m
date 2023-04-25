Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F22B6EE0BD
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 12:57:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prGLI-0001ri-L4; Tue, 25 Apr 2023 06:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prGLD-0001qa-Gd
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 06:56:11 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prGL7-0004dU-Dm
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 06:56:11 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:2582:0:640:9a17:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 900205F498;
 Tue, 25 Apr 2023 13:55:56 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b440::1:14] (unknown
 [2a02:6b8:b081:b440::1:14])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id ttDHUS1OluQ0-1ld879Xk; Tue, 25 Apr 2023 13:55:55 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682420155; bh=eUopfwc4pW/pFxEjLtYZlzE8pmqWNb/pWuEHAZl7+fE=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=J3DV/9m2vz5fAjvQxXRkW2wYj9NJWVYJlmWV+H+0EFoTxh32Yg1Ca06NiEXwIzd/S
 eZR8Prd4knzyts7x0HJAJjK5hHoS3J+mLikjWrv+3+Oq0Owc2xTkd3eF7LchZVQBsm
 wIpvAhSIHu+0BIs9xJEqmuEdjp2ChgKMpQTq1Muo=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <f1503dee-e297-ae5d-1826-6858236ee029@yandex-team.ru>
Date: Tue, 25 Apr 2023 13:55:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] pci: make ROM memory resizable
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, david@redhat.com, peterx@redhat.com,
 pbonzini@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 den-plotnikov@yandex-team.ru
References: <20230424203647.94614-1-vsementsov@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230424203647.94614-1-vsementsov@yandex-team.ru>
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

On 24.04.23 23:36, Vladimir Sementsov-Ogievskiy wrote:
> On migration, on target we load local ROM file. But actual ROM content
> migrates through migration channel. Original ROM content from local
> file doesn't matter. But when size mismatch - we have an error like
> 
>   Size mismatch: 0000:00:03.0/virtio-net-pci.rom: 0x40000 != 0x80000: Invalid argument
> 
> Let's just allow resizing of ROM memory. This way migration is not
> relate on local ROM file on target node which is loaded by default but
> is not actually needed.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Seems, automatically reconfigure the memory on incoming migration is not so easy.. ROM size really influence config of the device, and after some digging in the code I still cannot say where it happens.

So, I'm going to suggest another way, new series "[PATCH 0/3] ROM migration" will substitute this patch.

-- 
Best regards,
Vladimir


