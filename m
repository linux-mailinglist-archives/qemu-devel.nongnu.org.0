Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380A05EFC2D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:45:35 +0200 (CEST)
Received: from localhost ([::1]:41686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odxbJ-0003EO-M2
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1odvlm-0006cB-VT
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 11:48:15 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:44650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1odvlj-00031B-R6
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 11:48:13 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 972A0B824B7;
 Thu, 29 Sep 2022 15:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD70C433C1;
 Thu, 29 Sep 2022 15:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664466486;
 bh=HFVqVM8he9K7QibhHjqjVgJk0ZPotaqgYB2utTtMyrk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nj3k92wyH1ZIhG7QfdD8ACdpmTfWEk+9o7i6zFEE/GbRrmQ/dNSC41mHmfZ+5I4pt
 d5D3NzokODjsSi81aEBXpeTPsCV0NqPs4+aGVnhKLuGI7lUCSukSSIUCJ+/xloGJyb
 FMfe+yu4tK7LxmUG7SKhkJoXPj6HkV3MphT+37XEEYEgTfh6p+W7UE+28dvjwpTH5d
 5oIxjgQ7lRJsW/CLkqGNlY71IepZt+c1ug06pWQevuQbnbduGgHc7LjrBG4t8kn4ca
 a6qhhBvYIUHpIY94VelKO2gDopnKqBt2pA2I3Le/3/RMnHCw45dS64Zq9MLq9oWh69
 6miP8BlaGVmuQ==
Date: Thu, 29 Sep 2022 09:48:03 -0600
From: Keith Busch <kbusch@kernel.org>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: Commit 'iomap: add support for dma aligned direct-io' causes
 qemu/KVM boot failures
Message-ID: <YzW+Mz12JT1BXoZA@kbusch-mbp.dhcp.thefacebook.com>
References: <fb869c88bd48ea9018e1cc349918aa7cdd524931.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb869c88bd48ea9018e1cc349918aa7cdd524931.camel@redhat.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=kbusch@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I am aware, and I've submitted the fix to qemu here:

  https://lists.nongnu.org/archive/html/qemu-block/2022-09/msg00398.html

