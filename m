Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA1B4F8125
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 15:59:57 +0200 (CEST)
Received: from localhost ([::1]:53486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncSg0-00022J-Sg
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 09:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ncSeB-0000G8-Pk
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:58:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ncSe9-0004lh-4B
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:58:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649339866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kEP02RqBl5f9YW7+8Vy9Np6+IZhweo9l5Or3QR70rPI=;
 b=gx2/aF+co5/m+4owdlx9L59TMQAjuEPaI00u5bBhkolQiP1pWevTfWRH6xLqIO/nucAsw8
 bph1SrLGvEhbzNReCRURK0lg0JpYesULjqR05sqSnZmsNfEZ7svF1wd9rY2noK8wlHE3b/
 Xi02ga/x82gpqDBwsBnEE7yAyAdf8Os=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-TXoPL8EUPyCwEENJt8alBQ-1; Thu, 07 Apr 2022 09:57:43 -0400
X-MC-Unique: TXoPL8EUPyCwEENJt8alBQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39AD01C07854;
 Thu,  7 Apr 2022 13:57:43 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80F2840D2853;
 Thu,  7 Apr 2022 13:57:41 +0000 (UTC)
Date: Thu, 7 Apr 2022 08:57:39 -0500
From: Eric Blake <eblake@redhat.com>
To: "Denis V. Lunev" <den@openvz.org>
Subject: Re: [PATCH 1/1] qemu-img: properly list formats which have
 consistency check implemented
Message-ID: <20220407135739.onyeybgnnqhqwhet@redhat.com>
References: <20220407083932.531965-1-den@openvz.org>
MIME-Version: 1.0
In-Reply-To: <20220407083932.531965-1-den@openvz.org>
User-Agent: NeoMutt/20211029-554-53973f
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 07, 2022 at 11:39:32AM +0300, Denis V. Lunev wrote:
> Simple grep for the .bdrv_co_check callback presence gives the following
> list of block drivers
> * QED
> * VDI
> * VHDX
> * VMDK
> * Parallels
> which have this callback. The presense of the callback means that
> consistency check is supported.
> 
> The patch updates documentation accordingly.
> 
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Hanna Reitz <hreitz@redhat.com>
> ---
>  docs/tools/qemu-img.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


