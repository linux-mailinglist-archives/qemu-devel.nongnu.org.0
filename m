Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D076188EF1
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 21:24:27 +0100 (CET)
Received: from localhost ([::1]:40903 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEIlG-0007i3-E2
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 16:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38791)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jEIjo-0006SV-PK
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 16:22:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jEIjn-0004mA-Gw
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 16:22:56 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:20902)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jEIjn-0004hF-Bn
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 16:22:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584476574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L5+iSchSFuWazFUH8RFVwXYc7pfpIAtoBqV3E3LjpuE=;
 b=hvhY0ert3QsWYm/kgxTghvLXXxR8K1LaQyxNo0brrDOK/b7ojYvIcniqcu30glPcLhal5F
 ON2jwrxSSH3gGfQvJDdeHicibKvcfLRNW7jaAP2IxeEJ/tYiRvj1wLHRYSp9NAq57QlokX
 O6Xcc5SosI+zaPnk33FPhUw0eHvpoIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-FTouatfYMwmln-8SJJiz0g-1; Tue, 17 Mar 2020 16:22:52 -0400
X-MC-Unique: FTouatfYMwmln-8SJJiz0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8651118A8C81;
 Tue, 17 Mar 2020 20:22:51 +0000 (UTC)
Received: from [10.3.112.193] (ovpn-112-193.phx2.redhat.com [10.3.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D6B093520;
 Tue, 17 Mar 2020 20:22:51 +0000 (UTC)
Subject: Re: [PATCH v4 16/34] qapi/schema: Change _make_features() to a take
 feature list
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200317115459.31821-1-armbru@redhat.com>
 <20200317115459.31821-17-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <c2ff67b2-c14e-61e0-f314-98a08d401930@redhat.com>
Date: Tue, 17 Mar 2020 15:22:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200317115459.31821-17-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: marcandre.lureau@gmail.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/20 6:54 AM, Markus Armbruster wrote:
> QAPISchema._make_features() takes a definition expression, and
> extracts its 'features' member.  The other ._make_FOO() leave
> destructuring expressions to their callers.  Change ._make_features()
> to match them.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   scripts/qapi/schema.py | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


