Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A4B4A603A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 16:36:01 +0100 (CET)
Received: from localhost ([::1]:54594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEvCK-0005pO-9o
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 10:36:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEuKn-0001s2-1y
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:40:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEuKj-00026i-3e
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:40:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643726376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z5/QtoRnpHBxS/BbJed7HuHYIKkJ3KHYeQOuv0uyYzA=;
 b=O1X3nCRJf2fGJhGpbQ0uMYnLvm3Z61JI2L0Nro2DFTOS1S8C5G5fHMuoc5diqzzQya9AaH
 ICvglCFuISVcLXa9xzPogOVTIZeuN1/PRXK+4GtXsqkYxB2Pw0lXXfI3Qd98X2d3mkUSgR
 6uw3y9plEVaIuTDXrEoItPk8s8V/8+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-KXf3aVG7OiSB_KaePdv89g-1; Tue, 01 Feb 2022 09:39:33 -0500
X-MC-Unique: KXf3aVG7OiSB_KaePdv89g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0898C8519E5;
 Tue,  1 Feb 2022 14:39:32 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 981A870D3A;
 Tue,  1 Feb 2022 14:39:29 +0000 (UTC)
Date: Tue, 1 Feb 2022 15:39:28 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH V2 for-6.2 0/2] fixes for bdrv_co_block_status
Message-ID: <YflB4LKDdf8ay1PU@redhat.com>
References: <20220113144426.4036493-1-pl@kamp.de>
MIME-Version: 1.0
In-Reply-To: <20220113144426.4036493-1-pl@kamp.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: idryomov@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 ct@flyingcircus.io, qemu-devel@nongnu.org, pbonzini@redhat.com,
 idryomov@gmail.com, mreitz@redhat.com, dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.01.2022 um 15:44 hat Peter Lieven geschrieben:
> V1->V2:
>  Patch 1: Treat a hole just like an unallocated area. [Ilya]
>  Patch 2: Apply workaround only for pre-Quincy librbd versions and
>           ensure default striping and non child images. [Ilya]
> 
> Peter Lieven (2):
>   block/rbd: fix handling of holes in .bdrv_co_block_status
>   block/rbd: workaround for ceph issue #53784

Thanks, applied to the block branch.

Kevin


