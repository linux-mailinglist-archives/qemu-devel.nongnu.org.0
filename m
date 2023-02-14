Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D09696E09
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 20:41:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS1BH-0000Ju-Lc; Tue, 14 Feb 2023 14:41:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pS1B6-00009e-Vf
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:41:25 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pS1B5-0004F9-C9
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:41:24 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 473BF60EB1;
 Tue, 14 Feb 2023 22:41:18 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6407::1:7] (unknown
 [2a02:6b8:b081:6407::1:7])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 EfpZB30Rd4Y1-lebUj4TT; Tue, 14 Feb 2023 22:41:17 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676403677; bh=4ua+GA68hyXGW4NGO+Euz2oaldqXD5ziEHSErpCsVfM=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=ZRudeuxmPmuN7uH6p+GtvbifojOtpJ8VZNbeGGefW09HJiI4F5pTlLfgb/Lcc7Vrn
 zyNwrleVQvsK6iu16tpSszPzHyUL5c5rRBuMHEIJD1IfNaM1q0XqX5cQ8CpiTU0g0h
 8q5AlwxDSO+zj5g0g06Quink7oWJbz8ayYLrIZPw=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <82dccce7-b5cd-d195-38a0-645739dd5eff@yandex-team.ru>
Date: Tue, 14 Feb 2023 21:41:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 10/16] pcie: pcie_cap_slot_enable_power() use correct
 helper
Content-Language: en-US, ru-RU
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, den-plotnikov@yandex-team.ru
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-11-vsementsov@yandex-team.ru>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <20230213140103.1518173-11-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
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
> *_by_mask() helpers shouldn't be used here (and that's the only one).
> *_by_mask() helpers do shift their value argument, but in pcie.c code
> we use values that are already shifted appropriately.
> Happily, PCI_EXP_SLTCTL_PWR_ON is zero, so shift doesn't matter. But if
> we apply same helper for PCI_EXP_SLTCTL_PWR_OFF constant it will do
> wrong thing.
>
> So, let's use instead pci_word_test_and_clear_mask() which is already
> used in the file to clear PCI_EXP_SLTCTL_PWR_OFF bit in
> pcie_cap_slot_init() and pcie_cap_slot_reset().
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
> ---
>   hw/pci/pcie.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index ccdb2377e1..db8360226f 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -373,8 +373,8 @@ void pcie_cap_slot_enable_power(PCIDevice *dev)
>       uint32_t sltcap = pci_get_long(exp_cap + PCI_EXP_SLTCAP);
>   
>       if (sltcap & PCI_EXP_SLTCAP_PCP) {
> -        pci_set_word_by_mask(exp_cap + PCI_EXP_SLTCTL,
> -                             PCI_EXP_SLTCTL_PCC, PCI_EXP_SLTCTL_PWR_ON);
> +        pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTCTL,
> +                                     PCI_EXP_SLTCTL_PCC);
>       }
>   }
>   

