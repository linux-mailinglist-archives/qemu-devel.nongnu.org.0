Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E864B5F08C1
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 12:22:39 +0200 (CEST)
Received: from localhost ([::1]:55442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeDAD-000553-Na
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 06:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeD6g-0003Q1-0g
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 06:19:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeD6c-0005k3-OK
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 06:18:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664533134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dx4u6C08o9BTXEfrCLmxC1gx6puUDD58EjxmAp5+vbY=;
 b=BRYsqNQoNOYzVvJCR/TvoFwDTxBdh+XYWy/wXER8yzVIPEL7yZ+KvREK+/M/tFGj4t4aSn
 3+XYSxJ8b7TVboFt8kmhDIQkQrq18W4tBleTeLw+kCuYVtkcB/ZVi/5YgLk32MfLt/VVVg
 R6xeGhvgOAo2WiXwH/s4xr/5rsB+vXY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-uO57ZysoMKitYIcdHD8F-Q-1; Fri, 30 Sep 2022 06:18:50 -0400
X-MC-Unique: uO57ZysoMKitYIcdHD8F-Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AAE3185A7A4;
 Fri, 30 Sep 2022 10:18:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D15452166B26;
 Fri, 30 Sep 2022 10:18:48 +0000 (UTC)
Date: Fri, 30 Sep 2022 12:18:47 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Keith Busch <kbusch@meta.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCHv3 0/2] qemu direct io alignment fix
Message-ID: <YzbChwRW7CPAWs7L@redhat.com>
References: <20220929200523.3218710-1-kbusch@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929200523.3218710-1-kbusch@meta.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 29.09.2022 um 22:05 hat Keith Busch geschrieben:
> From: Keith Busch <kbusch@kernel.org>
> 
> Changes from v2:
> 
>   Split the patch so that the function move is separate from the
>   functional change. This makes it immediately obvious what criteria is
>   changing. (Kevin Wolf)
> 
>   Added received Tested-by tag in the changelog. 
> 
> Keith Busch (2):
>   block: move bdrv_qiov_is_aligned to file-posix
>   block: use the request length for iov alignment

Thanks, applied to the block branch.

Kevin


