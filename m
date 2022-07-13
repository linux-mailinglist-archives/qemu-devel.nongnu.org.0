Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0824573BC4
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 19:06:24 +0200 (CEST)
Received: from localhost ([::1]:46064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBfod-000572-OY
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 13:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1oBfle-0002tc-Et; Wed, 13 Jul 2022 13:03:18 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:41138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1oBflc-0001ZF-EJ; Wed, 13 Jul 2022 13:03:17 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 14BDC61CC1;
 Wed, 13 Jul 2022 17:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 191C7C341C6;
 Wed, 13 Jul 2022 17:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657731787;
 bh=5GtgOQeSWW/O9NtTsqB1MldHPpQEkj23U/jt/z2zcMs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kM8FOaOGQNXWhpVqegSNVSIBpIh7hbHFq3plFcqN6tVCaxqPx3JWryeyQkdTij6m8
 19JznS6etCGBhjD2G4pWaDHx2OnnYTnX2d2sRGXtiTaOGMNTU3lhJvBCOH7qqoUIlF
 dy49grm9J1QjSScBO4DjL8zkJy4pfRIIBYmtmkogerICEvPZqrtl1bmGrvgBIgWPi1
 8HmBRX10NvttHHiE+VsHTuZmxlRBq/RwgOdkORwSHyI7SkMAdPGOr7bEG5iguifysu
 2rsLTDukozbzejWbJ6sBDo4/wAA3lXvk0nOBL9dDiyjSy74EULsL/E8e6QBGrpT58l
 CjebYU/4aD/Rw==
Date: Wed, 13 Jul 2022 11:03:04 -0600
From: Keith Busch <kbusch@kernel.org>
To: Mauricio Sandt <mauricio@mailbox.org>
Cc: qemu-devel@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org
Subject: Re: [PATCH] hw/nvme: Add options to override hardcoded values
Message-ID: <Ys76yHpwdm4eyTbs@kbusch-mbp.dhcp.thefacebook.com>
References: <20220611223509.32280-1-mauricio@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220611223509.32280-1-mauricio@mailbox.org>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=kbusch@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Sun, Jun 12, 2022 at 12:35:09AM +0200, Mauricio Sandt wrote:
> This small patch is the result of some recent malware research I did
> in a QEMU VM. The malware used multiple ways of querying info from
> the VM disk and I needed a clean way to change those values from the
> hypervisor.
> 
> I believe this functionality could be useful to more people from multiple
> fields, sometimes you just want to change some default values and having
> them hardcoded in the sourcecode makes that much harder.
> 
> This patch adds three config parameters to the nvme device, all of them
> are optional to not break anything. If any of them are not specified,
> the previous (before this patch) default is used.
> 
> -model - This takes a string and sets it as the devices model name.
> If you don't specify this parameter, the default is "QEMU NVMe Ctrl".
> 
> -firmware - The firmware version string, max 8 ascii characters.
> The default is whatever `QEMU_VERSION` evaluates to.
> 
> -nqn_override - Allows to set a custom nqn on the nvme device.
> Only used if there is no subsystem. This string should be in the same
> format as the default "nqn.2019-08.org.qemu:...", but there is no
> validation for that. Its up to the user to provide a valid string.

I guess the nqn can be user tunable just like it is when used with subsystems,
but what's the point of messing with model and firmware? That could mess with
host drivers' ability to detect what quirks it needs to apply to specific
instances of this virtual controller.

