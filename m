Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1BC184E4C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 19:03:34 +0100 (CET)
Received: from localhost ([::1]:34628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCoei-00007j-Es
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 14:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50291)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jCocr-0007nx-NH
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 14:01:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jCocq-0007JY-06
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 14:01:37 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45396
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jCocp-0007GJ-Pf
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 14:01:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584122494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uYkzSkrBA8SBvnascjC3hrbAinwHpvUBwl9A4pXHbx0=;
 b=PP9s1t2s390yksP0/B09DdTlUHJnVRLJEtsnWuzzEd/o8ToshCz7dGwhJdKLMT+03adh2q
 9HlLghlROUKXYNvUJTziMok02GzZDycyNgVRlVmCm7TfmZKW79LZAFJ205g5/JJilmP6Pr
 0RXSzH2EHBgGFCCVVYlT93P5dUQg2CY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-WzW7BqdfMK22wHVx3an3rg-1; Fri, 13 Mar 2020 14:01:32 -0400
X-MC-Unique: WzW7BqdfMK22wHVx3an3rg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BB3A8017CC;
 Fri, 13 Mar 2020 18:01:31 +0000 (UTC)
Received: from [10.3.118.63] (ovpn-118-63.phx2.redhat.com [10.3.118.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82A765C1BB;
 Fri, 13 Mar 2020 18:01:30 +0000 (UTC)
Subject: Re: [PATCH 3/3] xen-block: Use one Error * variable instead of two
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200313170517.22480-1-armbru@redhat.com>
 <20200313170517.22480-4-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <193f91f8-0f79-4371-6341-b8fc5178e8be@redhat.com>
Date: Fri, 13 Mar 2020 13:01:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313170517.22480-4-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: alxndr@bu.edu, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 ashijeetacharya@gmail.com, paul.durrant@citrix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/20 12:05 PM, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/block/xen-block.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


