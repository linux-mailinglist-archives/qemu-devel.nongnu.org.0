Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E851E3D5CF1
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 17:26:45 +0200 (CEST)
Received: from localhost ([::1]:37160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m82VA-00036Z-VO
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 11:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1m82U2-00025I-UC; Mon, 26 Jul 2021 11:25:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:49812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1m82U0-0000qE-KQ; Mon, 26 Jul 2021 11:25:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 12F5360F51;
 Mon, 26 Jul 2021 15:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627313130;
 bh=qw/v0bp2zPhvU0k+R87n9R7NJ0r+gz6Q+y9WsMLdtuo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EdrB0LZl4H7mJtaYu3t2EggJedswo8Z+Zh6GH39gcx2gCEL19zfaFxdYjT2120nqN
 OEScloIQmjh8YoeUblSmXFWqhrZ9suh/um3l7/9MbtNwWuL5KnpJ1R9iDw7gjM2jhU
 to67xD4aUz15ErYBCPXIwM5dS8zjSr1qjYsbPo0fctBPxKS9y3KoNfn0xFQznH5QM4
 XSL5sZR827We3DE/XI5EhLPX+zrkQ26nk91w61Xj8QPMPQWyjpj2jxzijEWiAnQGRo
 jNNMslFAWCulzcIALzQqWYmOteCVPcLqqgwkkY40ZlR+5mIj0N84Ca5ZpwCbllwkJW
 nSVpCP2Gz+McA==
Date: Mon, 26 Jul 2021 08:25:27 -0700
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v6 1/5] hw/nvme: split pmrmsc register into upper and lower
Message-ID: <20210726152527.GB2024939@dhcp-10-100-145-180.wdc.com>
References: <20210721074836.110232-1-its@irrelevant.dk>
 <20210721074836.110232-2-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721074836.110232-2-its@irrelevant.dk>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 21, 2021 at 09:48:32AM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> The specification uses a set of 32 bit PMRMSCL and PMRMSCU registers to
> make up the 64 bit logical PMRMSC register.
> 
> Make it so.

Looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

