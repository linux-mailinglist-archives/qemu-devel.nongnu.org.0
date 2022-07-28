Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99BF584320
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 17:33:08 +0200 (CEST)
Received: from localhost ([::1]:46820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH5VW-0001sg-CM
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 11:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1oH5FD-0006KD-HQ; Thu, 28 Jul 2022 11:16:11 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:42338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1oH5FA-0006RG-4F; Thu, 28 Jul 2022 11:16:10 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B99261AF9;
 Thu, 28 Jul 2022 15:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA9C5C433D6;
 Thu, 28 Jul 2022 15:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659021362;
 bh=HKcV0VLiTHT9/K/bl8OzhHIrkOdo2TJuxwbPgq85C5Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FhX6xvV7B/5rcgtwBSXEzPAaM8231fGKLTQEG/9RHn5OJfOSYn9lXS5obQUigtuYb
 Q9GXHgWysZ8USd/Y4w5j1k+Sl8oE2ZpSR7VVY/5JTOmZU1hYqqKkfJzs3cum3cFj7+
 bndBpOhm9IavBBkIKaeLuoFp9AQmjy7K7Zfz3gmTMeeOWr9dd/z9UgRT6VC2NiL/wq
 eoeHvPa78GAiY3EHmpmwix+rHrcBZT7YJWq09HXqMkr20cWIvJdHd5FVTQkwyDKq7g
 arQlOq8vBKxs7HoVsIraR5BKhA1PfVcr8HkMeAWdqH8NqpTyAkVCha6YE58ga5sYlD
 8D3USQADsz/RQ==
Date: Thu, 28 Jul 2022 09:15:59 -0600
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH for-7.1 0/3] hw/nvme: misc ioeventfd fixes
Message-ID: <YuKoL3uMTRbcJOLh@kbusch-mbp.dhcp.thefacebook.com>
References: <20220728082522.3161739-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728082522.3161739-1-its@irrelevant.dk>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=kbusch@kernel.org;
 helo=dfw.source.kernel.org
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

On Thu, Jul 28, 2022 at 10:25:19AM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> A set of fixes/changes to the ioeventfd support.

Series looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

