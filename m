Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 485F650C135
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 23:42:59 +0200 (CEST)
Received: from localhost ([::1]:33302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ni13J-0007vG-Ty
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 17:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ni11i-0006GT-OZ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 17:41:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ni11f-0007GE-Lb
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 17:41:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650663675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ttfu3vQx0G0ObD/NcT8h2kZB+icFTgsC4ehBl81AojY=;
 b=PHu+/yT6cwJzc1+fDWPyWegxbvLYx8YAYWTSg++ty4GRXVUxwJ5en0usAL+H6XrPVt48i4
 LXdbjiNVY5VTPjpbT3yMH3KzOAVi0KG9MVtoPQnDf561O7KnSPPPiouyq/tPD8PMOzGTRp
 H7QG5LHWyg9TZ8kEBXt1H6CP4Mbiqqg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-9ppgTE0_P7K6_fz8J2JNEA-1; Fri, 22 Apr 2022 17:41:13 -0400
X-MC-Unique: 9ppgTE0_P7K6_fz8J2JNEA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8D343C23FA4;
 Fri, 22 Apr 2022 21:41:12 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 359892024CC3;
 Fri, 22 Apr 2022 21:41:12 +0000 (UTC)
Date: Fri, 22 Apr 2022 16:41:10 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] iotests/108: Fix when missing user_allow_other
Message-ID: <20220422214110.oqtuqa7nun52tb3r@redhat.com>
References: <20220421142435.569600-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421142435.569600-1-hreitz@redhat.com>
User-Agent: NeoMutt/20211029-35-db88c3
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 21, 2022 at 04:24:35PM +0200, Hanna Reitz wrote:
> FUSE exports' allow-other option defaults to "auto", which means that it
> will try passing allow_other as a mount option, and fall back to not
> using it when an error occurs.  We make no effort to hide fusermount's
> error message (because it would be difficult, and because users might
> want to know about the fallback occurring), and so when allow_other does
> not work (primarily when /etc/fuse.conf does not contain
> user_allow_other), this error message will appear and break the
> reference output.
> 
> We do not need allow_other here, though, so we can just pass
> allow-other=off to fix that.
> 
> Reported-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  tests/qemu-iotests/108 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I hit this today as well, and your fix works.

Tested-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


