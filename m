Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA94696E0B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 20:42:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS1Be-0001hO-H2; Tue, 14 Feb 2023 14:41:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pS1Bc-0001aN-Bb
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:41:56 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pS1Ba-0004OD-Iq
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:41:56 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 064B260EC2;
 Tue, 14 Feb 2023 22:41:50 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6407::1:7] (unknown
 [2a02:6b8:b081:6407::1:7])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 kfpuj20RlOs1-Qe6wgtss; Tue, 14 Feb 2023 22:41:49 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676403709; bh=hAdROL29qeG8RLJ0CGKc0SF6bSHB6lmlxa4hxtlc+Q4=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Mmg/5kBBETl3VQmJaR8FXPPTQNbAToFfrz9tPPV8+Gli2GPX7KJKkOwjjrI8aOV2T
 Ftd5WRuafSwoOQYd28zs54KHuolAf39yBX5YGBkTom011IeUzdws1KoE7rVJ4fd8fY
 Ao/+hgw5X9ttoAoEB6YljNGMuTrCfncFKzul4xJ0=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <27a02ee6-2400-b8d5-1f0c-5ffda5615910@yandex-team.ru>
Date: Tue, 14 Feb 2023 21:41:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 11/16] pcie: introduce pcie_sltctl_powered_off() helper
Content-Language: en-US, ru-RU
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, den-plotnikov@yandex-team.ru
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-12-vsementsov@yandex-team.ru>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <20230213140103.1518173-12-vsementsov@yandex-team.ru>
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
> In pcie_cap_slot_write_config() we check for PCI_EXP_SLTCTL_PWR_OFF in
> a bad form. We should distinguish PCI_EXP_SLTCTL_PWR which is a "mask"
> and PCI_EXP_SLTCTL_PWR_OFF which is value for that mask.
>
> Better code is in pcie_cap_slot_unplug_request_cb() and in
> pcie_cap_update_power(). Let's use same pattern everywhere. To simplify
> things add also a helper.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
> ---
>   hw/pci/pcie.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index db8360226f..90faf0710a 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -39,6 +39,11 @@
>   #define PCIE_DEV_PRINTF(dev, fmt, ...)                                  \
>       PCIE_DPRINTF("%s:%x "fmt, (dev)->name, (dev)->devfn, ## __VA_ARGS__)
>   
> +static bool pcie_sltctl_powered_off(uint16_t sltctl)
> +{
> +    return (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_OFF
> +        && (sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF;
> +}
>   
>   /***************************************************************************
>    * pci express capability helper functions
> @@ -395,6 +400,7 @@ static void pcie_cap_update_power(PCIDevice *hotplug_dev)
>   
>       if (sltcap & PCI_EXP_SLTCAP_PCP) {
>           power = (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_ON;
> +        /* Don't we need to check also (sltctl & PCI_EXP_SLTCTL_PIC) ? */
>       }
>   
>       pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> @@ -579,8 +585,7 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
>           return;
>       }
>   
> -    if (((sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF) &&
> -        ((sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_OFF)) {
> +    if (pcie_sltctl_powered_off(sltctl)) {
>           /* slot is powered off -> unplug without round-trip to the guest */
>           pcie_cap_slot_do_unplug(hotplug_pdev);
>           hotplug_event_notify(hotplug_pdev);
> @@ -770,10 +775,9 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
>        * this is a work around for guests that overwrite
>        * control of powered off slots before powering them on.
>        */
> -    if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
> -        (val & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF &&
> -        (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
> -        (old_slt_ctl & PCI_EXP_SLTCTL_PIC) != PCI_EXP_SLTCTL_PWR_IND_OFF)) {
> +    if ((sltsta & PCI_EXP_SLTSTA_PDS) && pcie_sltctl_powered_off(val) &&
> +        !pcie_sltctl_powered_off(old_slt_ctl))
> +    {
>           pcie_cap_slot_do_unplug(dev);
>       }
>       pcie_cap_update_power(dev);

