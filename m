Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8CC40E18C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 18:31:47 +0200 (CEST)
Received: from localhost ([::1]:37720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQuIb-0000G1-Oy
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 12:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1mQtts-0004bP-Bo; Thu, 16 Sep 2021 12:06:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:33062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1mQttq-0006cM-Gi; Thu, 16 Sep 2021 12:06:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D49A61279;
 Thu, 16 Sep 2021 16:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631808367;
 bh=wJVB3s73fHyOgU11KaO2kBjMEvFeyUaHVulRaXAqoCY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n9xNBWY3cliaGPjcNq1Nk+NC3zv0Lq05BECUdyI44gm3seWfDUA3AZNFlEGF0TVlZ
 2gUaV7jdU4TU8Qbp3RZyLMdcohSibRmJa+kgHMtjCQ396zmDCyadKVnHcDYi7UFI2v
 j0DPlh11bk3bxAbCDvJYYIhHTfH3yw4abOLEEft5x+UcTi3VWfo49LYgSnwgpY7P8a
 7wBGVbBAc8xkEMtyIRmdpBypdK3kDE1bVe68cYJuC0sJzveRVIFpunKzLWqX7/CtYG
 XOGccP+85EsmaU8hyZNdvUtpULhaXsEXSzu6UWIv5bXwxBkAZ0dJlLP92hdAwWbdX2
 KKroJMRat2OFg==
Date: Thu, 16 Sep 2021 09:06:05 -0700
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH RFC 02/13] hw/nvme: move zns helpers and types into zoned.h
Message-ID: <20210916160605.GA3908552@dhcp-10-100-145-180.wdc.com>
References: <20210914203737.182571-1-its@irrelevant.dk>
 <20210914203737.182571-3-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914203737.182571-3-its@irrelevant.dk>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 14, 2021 at 10:37:26PM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Move ZNS related helpers and types into zoned.h. Use a common prefix
> (nvme_zoned or nvme_ns_zoned) for zns related functions.

Just a nitpicks on the naming, you can feel free to ignore.

Since we're within NVMe specific protocol here, using that terminology
should be fine. I prefer "nvme_zns_" for the prefix.

And for function names like "nvme_zoned_zs()", the "zs" abbreviation
expands to "zone_state", so "zone" is redunant. I think
"nvme_zns_state()" is a good name for that one.

