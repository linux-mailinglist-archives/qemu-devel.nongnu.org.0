Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E35C3633D37
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 14:12:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxT3t-00029A-7l; Tue, 22 Nov 2022 08:11:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oxT3q-0001zy-Ah
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 08:11:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oxT3o-0003nV-2e
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 08:11:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669122695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JPjSP/iEW2BSTN4Yx0TIOC5DOP9hg7T66ZoaJ2pSjuU=;
 b=Zv3qu9Co6cpOK6ZZbOgAu/OBi2i/tmS6JT055e1euQu78vEXY0gLUL/TKsoEo8Ylm/gqr4
 kmdXEY/Wo816MpTBxxvJRafysdPGsc2amiyWuL6G9C+4R4m3ryiQL7V7IxRpDaC2tJa/Pb
 2Q1zEpL72jvzYcc9/xUEFnEoLI5snzU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-A1lDcnSxPm6-rWv9nlhWxQ-1; Tue, 22 Nov 2022 08:11:32 -0500
X-MC-Unique: A1lDcnSxPm6-rWv9nlhWxQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86DC03C0E455;
 Tue, 22 Nov 2022 13:11:32 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2262C16922;
 Tue, 22 Nov 2022 13:11:31 +0000 (UTC)
Date: Tue, 22 Nov 2022 14:11:28 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com
Subject: Re: [PATCH v8 0/4] block: small refactorings
Message-ID: <Y3zKgHTIWlErbMcr@redhat.com>
References: <20221107163558.618889-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107163558.618889-1-vsementsov@yandex-team.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Am 07.11.2022 um 17:35 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Hi all!
> 
> Here is 4-more simple already reviewed patches from
>  "[PATCH v5 00/45] Transactional block-graph modifying API" [1]
> 
> Called v8 because first part of [1] was recently merged as
>  "[PATCH v7 for-7.2 00/15] block: cleanup backing and file handling"

Thanks, applied to block-next.

Kevin


