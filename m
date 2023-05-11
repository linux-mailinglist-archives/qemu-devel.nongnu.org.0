Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA336FF492
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 16:37:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px7Pu-0008A3-5x; Thu, 11 May 2023 10:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1px7Ps-00084v-72
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:37:12 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1px7Po-0001qv-Gu
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:37:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=ZvFzNgT8EWhTMGeJIh+BNbNw30pANCcOXAnUd2eArkQ=; b=WYpY4PnnYEJXSWyMQhw2u2WvHa
 pPT/dMcCgEMXDKZLvpPZSSTwSlaMbzaTHVIpG3GjoKYVMS26qIivqMsg7W0qaySl7DwzQO20alYpv
 3JXaZV1W11VeMxEApEhg64edDAMkFIqJPGSkXEe35GX88YfQDsBMAxlBN0Yh6MSEl+BCcz6k7ii21
 3zwut/j/xJgi0nQR3Q2VgWUlgIcrTvym8cvvJPC5GQgLGj03vYltU+mkegabM+zeS7vimHx5ZTtst
 f1J+Q2LiXpUgFUDkS3fw6gJxjp1uqCaGndWLdeobxGzw0SCbLVAw8iRWYd4rfPF1SgGEHQV/mPHHM
 rnF5rIWv8JzA3FEFtyGXqkLP7sXpVtbnmBcinrr+YAgly/WeHiQ7uqpoR0bgDRBH6w0AIHsvKyBkQ
 IDsb+ksmeHH2ApBF+i6zZEbC2G3LTRqZ3dN3ELT86RYJDBy52zSKAWH6FJVdFEQWRDozxvax7Ogyr
 tWcCNWVjIFjLOMoFdK+mu42R4MKaBSHWiOBxLoaSa2xETEE6NEuzqJGJCjLHrjv1OJ8GS/Aml20mN
 JZlDzIM+XZ+GBbYCEENQcN3YjtV2QnF0rCFKKit067BsI5tTPB1pOv+6ZhDMLkHsl5bdhNNjdvAsZ
 P+v4epzQqVo1mFiuXDdUDabPn4j2jQ/GXO2l0LlwY=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Jason Andryuk <jandryuk@gmail.com>, Greg Kurz <groug@kaod.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] 9pfs/xen: Fix segfault on shutdown
Date: Thu, 11 May 2023 16:37:01 +0200
Message-ID: <2110128.8IRXTbt6Kt@silver>
In-Reply-To: <20230502143722.15613-1-jandryuk@gmail.com>
References: <20230502143722.15613-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tuesday, May 2, 2023 4:37:22 PM CEST Jason Andryuk wrote:
> xen_9pfs_free can't use gnttabdev since it is already closed and NULL-ed
> out when free is called.  Do the teardown in _disconnect().  This
> matches the setup done in _connect().
> 
> trace-events are also added for the XenDevOps functions.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
>  hw/9pfs/trace-events     |  5 +++++
>  hw/9pfs/xen-9p-backend.c | 36 +++++++++++++++++++++++-------------
>  2 files changed, 28 insertions(+), 13 deletions(-)

With aforementioned 2 minor changes, queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

Best regards,
Christian Schoenebeck



