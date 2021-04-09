Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9AB35A21B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 17:37:31 +0200 (CEST)
Received: from localhost ([::1]:41486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtCM-0001Yb-Rs
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 11:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lUtAP-0000kr-Ng; Fri, 09 Apr 2021 11:35:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:52918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lUtAO-0001fh-8C; Fri, 09 Apr 2021 11:35:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F04D61028;
 Fri,  9 Apr 2021 15:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617982526;
 bh=7oedXhgvlnDiKkamDo1pu/THCxT9ZajkAPgDQTWQ89g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dz0ecwRmYtCWB5A6Eezx/Ho9lPQOce76bgFJq6T0FxAbu3hMpL7TKwMom5Ij1apbI
 I/aQ6zeDHYBV6kNukKd5US3+eaTposi9dhXaNqq8FDzBjzO4okyUk+XT/vz3sQResv
 03HzeXt8MxlEYEBnyPhJxzICkSMnyqrYH/28uNhrDZd3u15QNvXxXsJAOK6fkIk9fo
 oES8Gf6fb34kcrIBrEIWzzs5TJ7oInEsQZMjm03QBIlCZQzjoKrEAtfqfBXNRspoDI
 2i865+fKWMxmnOQR+yUfNzFjygzw3880M+GUXq9BY4PCrpVOJH4JJjcQE1KYsFVOrd
 oFV7TuSCbsSkw==
Date: Sat, 10 Apr 2021 00:35:20 +0900
From: Keith Busch <kbusch@kernel.org>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH v3] hw/block/nvme: add device self test command support
Message-ID: <20210409153520.GC32304@redsun51.ssa.fujisawa.hgst.com>
References: <CGME20210331092753epcas5p33ef9360c0c8c6b6310108d2da9aa2687@epcas5p3.samsung.com>
 <20210331092427.13545-1-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210331092427.13545-1-anaidu.gollu@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 its@irrelevant.dk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 31, 2021 at 02:54:27PM +0530, Gollu Appalanaidu wrote:
> This is to add support for Device Self Test Command (DST) and
> DST Log Page. Refer NVM Express specification 1.4b section 5.8
> ("Device Self-test command")

Please don't write change logs that just say what you did. I can read
the code to see that. Explain why this is useful because this frankly
looks like another useless feature. We don't need to implement every
optional spec feature here. There should be a real value proposition.

