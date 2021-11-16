Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D994536C5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:05:36 +0100 (CET)
Received: from localhost ([::1]:43144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn0xk-00047M-2P
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:05:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1mn0oP-0002Jb-SP; Tue, 16 Nov 2021 10:55:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:44386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1mn0oN-0008AX-PM; Tue, 16 Nov 2021 10:55:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A892D61BFE;
 Tue, 16 Nov 2021 15:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637078153;
 bh=6xrkAh6Pk77nk+vG8vIGl45zavc8ijXjPpkBq+Pd5l4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FChugT7j/YUgAzgw1JuunX7UPLn18dpz/jdV/hTvm5jpplumYFQYHN3z/c8H9xj3S
 j7c/P4hVE7qbLfglGzhhPFDzrw+fDTjvMRW3fZgiIx7HVeBOEhI6hOzI6O5RFOpzu5
 884pjE2DNFnJ56wVkwZ2yttitDPoZxz55l/lGF+9nz2fTW5H5tDM+v1TkryccBJuMB
 MwtebF+lISigsyK5VWBswhJrDgCtBNTQaKoguqqyKqABxx4EdDBQVBFm5FV4ea+GCu
 +oVFZ7KR6jP9zbjfADeC0cw+utqnoELzLMBwpVScsdpnAZOa2F9hLjE83v27aE4Viu
 +tdM3/C9NkrQw==
Date: Tue, 16 Nov 2021 07:55:50 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 0/2] hw/nvme: fix namespace attachment on controller
 hotplug
Message-ID: <20211116155550.GA2984697@dhcp-10-100-145-180.wdc.com>
References: <20210924072742.306473-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924072742.306473-1-its@irrelevant.dk>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 24, 2021 at 09:27:40AM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> First patch from Hannes fixes the subsystem registration process such
> that shared (but non-detached) namespaces are automatically attached to
> hotplugged controllers.
> 
> The second patch changes the default for 'shared' such that namespaces
> are shared by default and will thus by default be attached to hotplugged
> controllers. This adds a compat property for older machine versions and
> updates the documentation to reflect this.

Series looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

