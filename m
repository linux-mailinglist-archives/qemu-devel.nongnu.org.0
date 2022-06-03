Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A815253D2F4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 22:51:03 +0200 (CEST)
Received: from localhost ([::1]:33288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxEG6-0005cD-NZ
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 16:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nxEEq-0004is-NC; Fri, 03 Jun 2022 16:49:45 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:47120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nxEEo-0001yx-PG; Fri, 03 Jun 2022 16:49:44 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 09743B82477;
 Fri,  3 Jun 2022 20:49:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3F3C385B8;
 Fri,  3 Jun 2022 20:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654289379;
 bh=V+KujAhmjDzO5Aeoil1ijpMtl9EdbmpEQB+eUIU1KPQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oRvtSy+WqgfmqMIIy6lM2DDABJTm9Mauc0/3M9mZPy1b3oNlOIVkmGO2oiKCiKzcP
 810ywXx/sOG3qhAbAwBQEKNH2LW7ar3oPgz+9DKjBJ3DIB4lG31idmfKmAJc4le00i
 3eHwJCiqOgj/E5F14/tVFovQIzc6/9ou2NczjaqafWCT0rD2Rv7R6eUe3iOE9KO0hg
 wGSkbGO8bSEAIGpmJjKFVsMQc8tIMFsBtnTBXIBdLguOPui1IS9PnFWbGgGE9/cIqF
 a109PASl3YcTe3mvWQ9yIZGimChpSVRkawRa+5fMRMm8dzic5dg3wKcChSbLwZqU/o
 9gTBwCSsb1qUQ==
Date: Fri, 3 Jun 2022 14:49:37 -0600
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH] hw/nvme: clear aen mask on reset
Message-ID: <Yppz4bqeATpprsTJ@kbusch-mbp.dhcp.thefacebook.com>
References: <20220512093055.726022-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512093055.726022-1-its@irrelevant.dk>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=kbusch@kernel.org; helo=ams.source.kernel.org
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

On Thu, May 12, 2022 at 11:30:55AM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> The internally maintained AEN mask is not cleared on reset. Fix this.

Looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

