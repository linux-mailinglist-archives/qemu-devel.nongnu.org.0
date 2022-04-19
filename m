Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5865C50708F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 16:34:39 +0200 (CEST)
Received: from localhost ([::1]:40500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngowA-0005uQ-88
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 10:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1ngouU-00052b-Nn; Tue, 19 Apr 2022 10:32:54 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:37660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1ngouS-0004c5-W3; Tue, 19 Apr 2022 10:32:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 39B0F60FEB;
 Tue, 19 Apr 2022 14:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2664AC385A5;
 Tue, 19 Apr 2022 14:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650378768;
 bh=cxHcvffBECWnCcQeo84D9HG5aUR/8excxfYiVSoy0TI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PmuARsi//1DxvXYBnftjpR+Jt58sCS3xHqUyyJ4Wl5jkEFZ0s5NhRpNOXKvyYopNb
 XSJ8fsQNDzvuZhichH9cqc6MgfDwlZMVShjr0A2N46AghkBNkUlLhYUCO9Gbg5hPDH
 KvUJOhQ0zeKkMfB/DP90y4DbCV754OVaOeY/YCqqNqw3Lb6KJgYRakLEQlVfOWW5iz
 TS3id3cCA3LKgEdXRdbJgjBMgO8XQwAREJm8I7VBzdRmoud3RCTmJtwiJCBfCZIncY
 ugUG5D6Ae1wYwndHY3ZB51mSzV8kez6evwDXiTEQLQr2jQPAoy9InKlKXLJtNK5A/v
 Qt6TSxbcKYtzg==
Date: Tue, 19 Apr 2022 08:32:43 -0600
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 0/5] hw/nvme: fix namespace identifiers
Message-ID: <Yl7IC+Ktbu14PZ6B@kbusch-mbp.dhcp.thefacebook.com>
References: <20220419121039.1259477-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419121039.1259477-1-its@irrelevant.dk>
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
Cc: Klaus Jensen <k.jensen@samsung.com>, Luis Chamberlain <mcgrof@kernel.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Christoph Hellwig <hch@lst.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 19, 2022 at 02:10:34PM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> The namespace identifiers reported by the controller is kind of a mess.
> See [1,2].
> 
> This series should fix this for both the `-device nvme,drive=...` and
> `-device nvme-ns,...` cases.

Series looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

