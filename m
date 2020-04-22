Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E50F1B4614
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 15:17:21 +0200 (CEST)
Received: from localhost ([::1]:50412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRFFg-0001Be-2t
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 09:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50470)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jRFD3-0007BM-Ug
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:14:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jRFD2-0002Xu-Vb
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:14:37 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:53248
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jRFD2-0002UX-GV
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:14:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587561275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pwbj73tQpCexd+osvs/hutlHUhM/raO3NFZx6+OxvOM=;
 b=gyWb64bUW0jWqyGyyV/JPTuyjikAJ25aOy4yxEUNuH2e8pDzIkMUOVvpwHWb+trdwx/aow
 z8Si1fNUGXgYbc3Lyw8Ptk3J23nMjeNlixbearlWaopzWuANUmQ14lDrPaMcda+6kFNROS
 MALLj3jgts2tjRLaax1QtmJiyX+Tp8E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-Wg9PccM-PHyK18iTRIeGww-1; Wed, 22 Apr 2020 09:14:29 -0400
X-MC-Unique: Wg9PccM-PHyK18iTRIeGww-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF7EF8EB020;
 Wed, 22 Apr 2020 13:14:28 +0000 (UTC)
Received: from [10.10.116.80] (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9C985D753;
 Wed, 22 Apr 2020 13:14:26 +0000 (UTC)
Subject: Re: [PATCH v2 13/14] qga: Fix qmp_guest_get_memory_blocks() error
 handling
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200422130719.28225-1-armbru@redhat.com>
 <20200422130719.28225-14-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ba3b2ff6-db95-61c3-80db-9b7713b59970@redhat.com>
Date: Wed, 22 Apr 2020 08:14:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422130719.28225-14-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:57:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/20 8:07 AM, Markus Armbruster wrote:
> The Error ** argument must be NULL, &error_abort, &error_fatal, or a
> pointer to a variable containing NULL.  Passing an argument of the
> latter kind twice without clearing it in between is wrong: if the
> first call sets an error, it no longer points to NULL for the second
> call.
> 
> qmp_guest_get_memory_blocks() passes &local_err to
> transfer_memory_block() in a loop.  If this fails in more than one
> iteration, it can trip error_setv()'s assertion.
> 
> Fix it to break the loop.
> 
> Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   qga/commands-posix.c | 3 +++
>   1 file changed, 3 insertions(+)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index a52af0315f..ae1348dc8f 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2518,6 +2518,9 @@ GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)
>           mem_blk->phys_index = strtoul(&de->d_name[6], NULL, 10);
>           mem_blk->has_can_offline = true; /* lolspeak ftw */
>           transfer_memory_block(mem_blk, true, NULL, &local_err);
> +        if (local_err) {
> +            break;
> +        }
>   
>           entry = g_malloc0(sizeof *entry);
>           entry->value = mem_blk;
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


