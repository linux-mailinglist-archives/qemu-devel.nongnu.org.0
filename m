Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2371A39BB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Apr 2020 20:17:43 +0200 (CEST)
Received: from localhost ([::1]:53848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMbkE-0007Zd-BB
	for lists+qemu-devel@lfdr.de; Thu, 09 Apr 2020 14:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45795)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jMbht-0005yz-E6
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 14:15:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jMbhr-00017c-Gm
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 14:15:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32423
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jMbhr-00016S-Ca
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 14:15:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586456114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tUOdX5VmaYaDcfBrvu2Ha1Cqa2DYu51k0cPHRZwgZXc=;
 b=EyzxtxVjo3F4o4qrD0UgM3aSGBnrL/b2b3wBJ9yGpySZulQXmObYNlirhamE8uu3bI9PLO
 S+ZXpMqVlFfi+Fd4nDlbT0HZTHpgkBFFbw00AD+FfOgxqweq1MXVbghLdAKQDpQrPyGtvf
 S3J1+EATJEhG4HjXHfdNA6OJ4nM7boo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-p_NrNdiiPKqT5uAi-RldRA-1; Thu, 09 Apr 2020 14:15:09 -0400
X-MC-Unique: p_NrNdiiPKqT5uAi-RldRA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F952107ACC4;
 Thu,  9 Apr 2020 18:15:08 +0000 (UTC)
Received: from [10.3.114.49] (ovpn-114-49.phx2.redhat.com [10.3.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 34F0D99E01;
 Thu,  9 Apr 2020 18:15:08 +0000 (UTC)
Subject: Re: [PATCH for-5.1 7/8] qemu-img: Factor out accumulate_options()
 helper
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200409153041.17576-1-armbru@redhat.com>
 <20200409153041.17576-8-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <3534b21e-b3c3-33af-9864-5ed8b2a37d9d@redhat.com>
Date: Thu, 9 Apr 2020 13:15:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200409153041.17576-8-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/20 10:30 AM, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   qemu-img.c | 59 +++++++++++++++++++++---------------------------------
>   1 file changed, 23 insertions(+), 36 deletions(-)
> 
Nice.
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


