Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B245652A521
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:43:56 +0200 (CEST)
Received: from localhost ([::1]:34692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqyQV-0004XK-NO
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nqyJg-0007M1-AM
 for qemu-devel@nongnu.org; Tue, 17 May 2022 10:36:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nqyJe-000155-Sv
 for qemu-devel@nongnu.org; Tue, 17 May 2022 10:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652798205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kCvpgQ6zTGSECR2Zbv5pcP+V106HHEXBXXbrn//luKc=;
 b=R8HeKGokgs1HDJ1rhwMWNn8910qcuE/qxiOaRhBfZYJlqn80eXOGxY4zT6DUmPOPbPv/Nd
 llTZWytd1uGF9AqO55qA3jB7eNpRQjx+uzew3kHfyT8CzKAd7MgXHivSbxx4AwU/9Wqaq6
 RKbDglX6GXDq+dmEgYd1Gun28ip2mQ0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-m3Y3SopXPYa3kWwEDd-0IQ-1; Tue, 17 May 2022 10:36:42 -0400
X-MC-Unique: m3Y3SopXPYa3kWwEDd-0IQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6DD196FE61;
 Tue, 17 May 2022 14:36:41 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 417D640CF8F0;
 Tue, 17 May 2022 14:36:41 +0000 (UTC)
Date: Tue, 17 May 2022 09:36:39 -0500
From: Eric Blake <eblake@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 10/10] block/qcow2: Use bdrv_pwrite_sync() in
 qcow2_mark_dirty()
Message-ID: <20220517143639.nlennkflcdqywhmj@redhat.com>
References: <20220513155418.2486450-1-afaria@redhat.com>
 <20220513155749.2488070-8-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513155749.2488070-8-afaria@redhat.com>
User-Agent: NeoMutt/20220429-68-cedf86
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 13, 2022 at 04:57:49PM +0100, Alberto Faria wrote:
> Use bdrv_pwrite_sync() instead of calling bdrv_pwrite() and bdrv_flush()
> separately.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>  block/qcow2.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


