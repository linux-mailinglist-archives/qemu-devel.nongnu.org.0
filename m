Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7129D1376FD
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 20:28:13 +0100 (CET)
Received: from localhost ([::1]:50906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipzx6-0005c0-HY
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 14:28:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38060)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1ipzug-0003Ze-3H
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 14:25:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1ipzue-0003SK-W4
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 14:25:41 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:56533
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1ipzue-0003PR-OY
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 14:25:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578684340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VfuKiu8auHN5XPAYD+IZRNU9k26s4jyUjoOnpkasq3I=;
 b=cgqb6s8XYWzALnrvAvh/N92Entjp0rt65QDS4x1avXunBFrlL4EgYL1HiBscmKhb7r/6iV
 pctZ78IErt08+d6n12CeS4Rqu4cMtkO2DrK4Ge0VWgxaDXnH4AnmPJ37aSKwghLXsfxcJa
 47/SHgbpY8AkfaEA+nQa5Gj1W6lMbhw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-0l_cHV46Na6ini6VhiX36w-1; Fri, 10 Jan 2020 14:25:36 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BBEDDB20;
 Fri, 10 Jan 2020 19:25:35 +0000 (UTC)
Received: from [10.3.117.16] (ovpn-117-16.phx2.redhat.com [10.3.117.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEC5219C7F;
 Fri, 10 Jan 2020 19:25:33 +0000 (UTC)
Subject: Re: [PATCH] block: Use a GString in bdrv_perm_names()
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <20200110171518.22168-1-berto@igalia.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <3670db3f-b77d-8333-d76c-98ff64adcf9e@redhat.com>
Date: Fri, 10 Jan 2020 13:25:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200110171518.22168-1-berto@igalia.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 0l_cHV46Na6ini6VhiX36w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/20 11:15 AM, Alberto Garcia wrote:
> This is a bit more efficient than having to allocate and free memory
> for each new permission.
> 
> The default size (30) is enough for "consistent read, write, resize".
> 
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>   block.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


