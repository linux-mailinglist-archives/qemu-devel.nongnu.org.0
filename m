Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AB66DB45A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 21:42:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkryk-0000ef-EQ; Fri, 07 Apr 2023 15:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pkryf-0000cS-Hx
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 15:42:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pkrye-0005sj-8M
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 15:42:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680896547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0t2+b73pnhg6Yn8L4lkChHY2Xjl8Dpvo0fBYSMScxYs=;
 b=DI6HecQkbjz0tRVUnBjsXsyQTiMIwn8uRMLYQQqSqEkb558mMGVrDt4SRnfqrrONcXA5dh
 Rs2R/cr9jAHiwh/89a7BCbDhJkrG+yiwGW5r7EQ6WzhB1MGV5Z6i1YgQfhDr6T4pmwZMKZ
 aFHgx/fdmU9L/mSctPULcz76NPg72vM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-TTgmgVAFMimYeTXIZCikMA-1; Fri, 07 Apr 2023 15:42:26 -0400
X-MC-Unique: TTgmgVAFMimYeTXIZCikMA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F26D7800B23;
 Fri,  7 Apr 2023 19:42:25 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB2B140C6EC4;
 Fri,  7 Apr 2023 19:42:24 +0000 (UTC)
Date: Fri, 7 Apr 2023 14:42:23 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, kwolf@redhat.com, 
 qemu-block@nongnu.org, hreitz@redhat.com
Subject: Re: [PATCH 3/8] block: refresh bs->total_sectors on reopen
Message-ID: <dhbjszlzvcvphds4g2qwcyh3zsknksee5cu67ppgozy5waarur@gzshggbc2xw7>
References: <20230407153303.391121-1-pbonzini@redhat.com>
 <20230407153303.391121-4-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407153303.391121-4-pbonzini@redhat.com>
User-Agent: NeoMutt/20230322
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

On Fri, Apr 07, 2023 at 05:32:58PM +0200, Paolo Bonzini wrote:
> After reopening a BlockDriverState, it's possible that the size of the
> underlying file has changed.  This for example is covered by test 171.
> 
> Right now, this is handled by the raw driver's has_variable_length = true
> setting.  Since this will be removed by the next patch, handle it on
> reopen instead, together with the existing bdrv_refresh_limits.

Makes sense.  Normally, when exposing a host image to a guest, you
don't expect the image to be changing outside of qemu's control; there
are exceptions (like dealing with ENOSPC), but they are generally
limited to adding more space (and not modifying existing contents or
shrinking the volume).  Detecting growth at reopen seems reasonable,
and like it will cut out on some of the frequency of checks we are
currently doing even when most see no change.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


