Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC74750C0B1
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 22:26:36 +0200 (CEST)
Received: from localhost ([::1]:60692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhzrP-0002Pl-JW
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 16:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nhzp2-0001aR-9G
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 16:24:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nhzp0-0004aI-CR
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 16:24:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650659045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pSj0BWXct/zGHgZvSHkw6dnDMZ3jqgP+g1eXy3h1AoU=;
 b=JHPDPpiWlmfgwnw5ee9479JDspNfgvfosyZMOYDnSd2ZjmEMHsG7Ably53MgJ9fODDzrAS
 lH7tnwWQkJ+vj05URu9QDw3D3qwSFtsS+Kn6Zo/vnTL6/ZKxiVlm8MR23XGrURxx2ZzYN1
 DeENpp7i0LpR030RvPX56uqg+bzn/Fc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-21UpyDYHMnaifILR3xgcxw-1; Fri, 22 Apr 2022 16:24:01 -0400
X-MC-Unique: 21UpyDYHMnaifILR3xgcxw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75A3A811E7A;
 Fri, 22 Apr 2022 20:24:01 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F291F9D45;
 Fri, 22 Apr 2022 20:24:00 +0000 (UTC)
Date: Fri, 22 Apr 2022 15:23:59 -0500
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/3] nbd: MULTI_CONN for shared writable exports
Message-ID: <20220422202359.xjhdomwmnwijvkda@redhat.com>
References: <20220314203818.3681277-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314203818.3681277-1-eblake@redhat.com>
User-Agent: NeoMutt/20211029-35-db88c3
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: v.sementsov-og@mail.ru, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping. Now that 7.1 is open, I'd like to include this series in my next
NBD pull request.

On Mon, Mar 14, 2022 at 03:38:15PM -0500, Eric Blake wrote:
> v2 was here:
> https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg03314.html
> 
> Since then:
> - expose the knob through 'qemu-nbd -m on|off|auto'
> - reuse QAPI OnOffAuto type instead of rolling my own
> - rewrite the iotest from bash into python (thanks: Nir, Vladimir)
> - split out easy preliminary fixes (patches 1 and 2 are new)
> 
> Given that this is a new feature, it probably needs to be 7.1 material.
> 
> Eric Blake (3):
>   docs: Consistent typography for options of qemu-nbd
>   qemu-nbd: Pass max connections to blockdev layer
>   nbd/server: Allow MULTI_CONN for shared writable exports
> 
>  docs/interop/nbd.txt                       |   1 +
>  docs/tools/qemu-nbd.rst                    |  26 ++--
>  qapi/block-export.json                     |  19 ++-
>  include/block/nbd.h                        |   5 +-
>  blockdev-nbd.c                             |  13 +-
>  nbd/server.c                               |  27 +++-
>  qemu-nbd.c                                 |  22 ++-
>  MAINTAINERS                                |   1 +
>  tests/qemu-iotests/tests/nbd-multiconn     | 157 +++++++++++++++++++++
>  tests/qemu-iotests/tests/nbd-multiconn.out |   5 +
>  10 files changed, 252 insertions(+), 24 deletions(-)
>  create mode 100755 tests/qemu-iotests/tests/nbd-multiconn
>  create mode 100644 tests/qemu-iotests/tests/nbd-multiconn.out
> 
> -- 
> 2.35.1
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


