Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F10B3141E4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:34:29 +0100 (CET)
Received: from localhost ([::1]:42964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EAu-0000vo-C5
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:34:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1l98s7-0003Ru-28
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 10:54:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:56338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1l98s5-00062b-H7
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 10:54:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA97A64DCC;
 Mon,  8 Feb 2021 15:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612799679;
 bh=O2skBSuLNPDYERU/eq1mfqb59JBoNejXE0JZW8ydH+g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sU150IeYcinYOa06nr2HBTqjMi1URXilrWaxMeB47wnYEVXn0kBcRwaZINkfz43ZY
 wsAax0Fckq94HEDXkgy99t/e/YPxjL8HsVCiDVfWLq33V71mqDuUc7tB6aq8IqAkDs
 AQL86+s6Zf38ePavwcIbylVcc4QO+vIA7xykTguA+yEkCqXRlDmEF/RiOz6uXZ6VRu
 C1+Tt5HFSV8ReMi0QvpyTQrNxrDHQYIjDPR3CVctNCiKur+yX7WWJzZQ4LTxX+CrnP
 OWh07MwQefJmX9UEHEqJUXRD++UBbjFQVxt28Pv32i5uE0jkk9Ii3FnvKSjYIJ8TY7
 MF8CRdHsLbOBw==
Date: Tue, 9 Feb 2021 00:54:36 +0900
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH] hw/block/nvme: fix Close Zone
Message-ID: <20210208155436.GD16360@redsun51.ssa.fujisawa.hgst.com>
References: <20210208003256.9280-1-dmitry.fomichev@wdc.com>
 <CGME20210208090325eucas1p1e86d183879827f4a8dfbed6d96051418@eucas1p1.samsung.com>
 <435eb631-e53d-a47a-6c27-68d12496fe00@redhat.com>
 <YCECcyQx8oUVfNvM@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YCECcyQx8oUVfNvM@apples.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Niklas Cassel <niklas.cassel@wdc.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 08, 2021 at 10:20:51AM +0100, Klaus Jensen wrote:
> On Feb  8 10:03, Philippe Mathieu-Daudé wrote:
> > Hi Dmitry, Klaus.
> > 
> > On 2/8/21 1:32 AM, Dmitry Fomichev wrote:
> > > Implicitly and Explicitly Open zones can be closed by Close Zone
> > > management function. This got broken by a recent commit and now such
> > > commands fail with Invalid Zone State Transition status.
> > > 
> > > Modify nvm_zrm_close() function to make Close Zone work correctly.
> > > 
> > > Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> > > Fixes: 053b5a302c3("hw/block/nvme: refactor zone resource management")
> > 
> > '053b5a302c3': unknown revision or path not in the working tree.
> > 
> > If you point at an unmerged commit, why not fix it directly
> > before merging?
> > 
> 
> Dmitry, you OK with me squashing this fix and appending
> 
>     [dmitry: fix broken Close Zone]
>     Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> 
> to the commit message?

IMO, we should avoid the habit of rebasing and force pushes on staging
trees once they're public.

