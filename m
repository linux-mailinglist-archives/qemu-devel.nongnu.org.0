Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED898696E03
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 20:38:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS17e-0005zj-2q; Tue, 14 Feb 2023 14:37:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pS17Z-0005nJ-Ax
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:37:47 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pS17W-0003aU-VJ
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:37:44 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 5673D61090;
 Tue, 14 Feb 2023 22:37:37 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6407::1:7] (unknown
 [2a02:6b8:b081:6407::1:7])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 Xbp6i20Rj0U1-0ZMzWJjg; Tue, 14 Feb 2023 22:37:36 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676403456; bh=LNHrcpwE6UmG4DLlcyXIrIRo/7XoJbp+cSIme+Reu1E=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=nSuavpD8oBJeuQpJu7q+2U0XpN1enOVothTwePqD6q0PijC7Id42AbJ5Jr0qoTt45
 tH+Wpw7z4LLm/s8fneZO1VSOF0gOAnuWie2fDhB7l3UMosgx7U9pqAtM12XAnVDKRW
 1i9ZucdJ4YsvKGJJL7Hl3sNPigxDUzMT2fo1B3z8=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <2349ae05-9262-b769-4ba9-49cc21cdc945@yandex-team.ru>
Date: Tue, 14 Feb 2023 21:37:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 07/16] pcie: pcie_cap_slot_write_config(): use correct
 macro
Content-Language: en-US, ru-RU
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, den-plotnikov@yandex-team.ru
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-8-vsementsov@yandex-team.ru>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <20230213140103.1518173-8-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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

On 13/02/2023 16:00, Vladimir Sementsov-Ogievskiy wrote:
> PCI_EXP_SLTCTL_PIC_OFF is a value, and PCI_EXP_SLTCTL_PIC is a mask.
> Happily PCI_EXP_SLTCTL_PIC_OFF is a maximum value for this mask and is
> equal to the mask itself. Still the code looks like a bug. Let's make
> it more reader-friendly.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/pci/pcie.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 924fdabd15..82ef723983 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -770,9 +770,9 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
>        * control of powered off slots before powering them on.
>        */
>       if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
> -        (val & PCI_EXP_SLTCTL_PIC_OFF) == PCI_EXP_SLTCTL_PIC_OFF &&
> +        (val & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PIC_OFF &&
>           (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
> -        (old_slt_ctl & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_OFF)) {
> +        (old_slt_ctl & PCI_EXP_SLTCTL_PIC) != PCI_EXP_SLTCTL_PIC_OFF)) {
>           pcie_cap_slot_do_unplug(dev);
>       }
>       pcie_cap_update_power(dev);
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>

