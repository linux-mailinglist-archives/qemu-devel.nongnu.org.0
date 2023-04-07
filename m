Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B586DB462
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 21:48:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pks4E-0001zh-AY; Fri, 07 Apr 2023 15:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pks49-0001zG-5l
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 15:48:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pks47-0000Ex-GE
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 15:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680896886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=voOaqwgLuAWMf8vUHs88fVm9+U8nkxRv6AYXpS5mVak=;
 b=I1E0SeGoai8S8VYBE8xpMJVOgiumsw7jdyjKV90TKXfC+Qb8DU/WwMQty4FIsy9oqsBHCs
 5NwHVRHX0vVWUVoWhgl1iXSXjaLG/HmZyPFF1QdbdhmenmOIDQJ5begjV8cL2McW9gbSo/
 YA/DKG3beQ42vsgIoRIjGigKFnk/Avw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-5ECcZsVpOlS_5eVq0JI4WQ-1; Fri, 07 Apr 2023 15:48:05 -0400
X-MC-Unique: 5ECcZsVpOlS_5eVq0JI4WQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EC9985A5A3;
 Fri,  7 Apr 2023 19:48:05 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CE0E2027062;
 Fri,  7 Apr 2023 19:48:04 +0000 (UTC)
Date: Fri, 7 Apr 2023 14:48:02 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, kwolf@redhat.com, 
 qemu-block@nongnu.org, hreitz@redhat.com
Subject: Re: [PATCH 4/8] block: remove has_variable_length from BlockDriver
Message-ID: <qvrzciisent5zcm4lottvqwyiivhb25hnzq3q3q4thivhn5brn@bkvyrlxw4yhl>
References: <20230407153303.391121-1-pbonzini@redhat.com>
 <20230407153303.391121-5-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407153303.391121-5-pbonzini@redhat.com>
User-Agent: NeoMutt/20230322
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

On Fri, Apr 07, 2023 at 05:32:59PM +0200, Paolo Bonzini wrote:
> Fill in the field in BlockLimits directly for host devices, and
> copy it from there for the raw format.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/file-posix.c               | 12 ++++++++----
>  block/file-win32.c               |  2 +-
>  block/io.c                       |  2 --
>  block/raw-format.c               |  3 ++-
>  include/block/block_int-common.h |  2 --
>  5 files changed, 11 insertions(+), 10 deletions(-)

The change makes sense to me.  I'm having a slight doubt on whether it
might cause any regression in the bigger picture where a regular host
file exposed as a guest image grew outside of qemu's control but where
qemu used to see the new size automatically but now won't see it until
an explicit QMP action.  But I suspect that since we already do have a
QMP size for telling qemu to do resizes itself, or to at least refresh
its notion of size (for that very case of a third-party adding more
storage and telling qemu it is now safe to use that extra space), the
explicit QMP interaction is probably sufficient, and that any such
corner-case regression I'm worrying about is not a problem in reality.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


