Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC42699C4A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 19:27:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSixW-0007wS-JS; Thu, 16 Feb 2023 13:26:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pSixU-0007s5-N7; Thu, 16 Feb 2023 13:26:16 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pSixR-0005yt-Sz; Thu, 16 Feb 2023 13:26:16 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 70035B82950;
 Thu, 16 Feb 2023 18:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6198AC433EF;
 Thu, 16 Feb 2023 18:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676571970;
 bh=P4KGNlaT/Wgx6bjfugDJchMP7F4W5S5KCA2/icRmor0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iFmgzs10P6NJI6rQWzbuX38cbGPHWVqVOgmn+1pXGRI+4bkcNgeIrbEYqtNvednWU
 UbSZB/IYxfdNnMOtR8JditoprvzHiwGILW/YWaTtLdMY1zE+1Tx1wMrSDmcOGATM8f
 Wb6E1Anm7uCrWlvo4DPZrLTdY0L0DtxaUpp5WCvPkiXgE9jdOpdUhyf0XSg70VD791
 9iOSwvGZcfJu1ueDCDsgqRz4CkeqBjXSVbW+iHO//Fl088drs14XoU03zcAGeKX5bz
 LmOGORx6gMyIg+xVlq+scf7+u8meCOwozwqeYNMqTv/YzMT9sUW0yCHttAmSElqMgC
 rTg1yY+SrtvUA==
Date: Thu, 16 Feb 2023 11:26:07 -0700
From: Keith Busch <kbusch@kernel.org>
To: Jesper Devantier <jwd@defmacro.it>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Jesper Devantier <j.devantier@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH 5/5] hw/nvme: flexible data placement emulation
Message-ID: <Y+51P1zL47f2poWr@kbusch-mbp>
References: <20230216164806.233533-1-jwd@defmacro.it>
 <20230216164806.233533-6-jwd@defmacro.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216164806.233533-6-jwd@defmacro.it>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=kbusch@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This mostly looks fine. I need to clarify some spec decisions, though.

By default, FDP feature is disabled: "The default value of this Feature shall
be 0h." You can't change the value as long as namespaces exist within the
group, so FDP requires NS Mgmt be supported if you're going to enable it. The
spec, however, doesn't seem to explicitly say that, and NS Mgmt isn't currently
supported in this controller.

We can look past that for this implementation to allow static settings even if
that doesn't perfectly align with this feature (NS Mgmt is kind of difficult
here). In order to match what the spec says is possible though, we can't have a
namespace with more than 128 placement handles since that's the most you can
provide when you create the namespace.

Does that make sense, or am I totally misunderstanding the details?

