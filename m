Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D1BD46E7
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 19:49:01 +0200 (CEST)
Received: from localhost ([::1]:54896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIz2B-0005ad-Nv
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 13:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44892)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iIy9F-00015H-Om
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:52:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iIy9E-0007Z4-PN
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:52:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:12687)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iIy9D-0007TA-0p
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:52:11 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0BCC582A4C9;
 Fri, 11 Oct 2019 16:52:09 +0000 (UTC)
Received: from [10.3.116.168] (ovpn-116-168.phx2.redhat.com [10.3.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88F3A3DA3;
 Fri, 11 Oct 2019 16:52:08 +0000 (UTC)
Subject: Re: [RFC v5 010/126] hw/core/qdev: cleanup Error ** variables
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <20191011160552.22907-11-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <c51fce8f-ee95-1705-85b3-6a9d27b31f3f@redhat.com>
Date: Fri, 11 Oct 2019 11:52:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191011160552.22907-11-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Fri, 11 Oct 2019 16:52:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>, armbru@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/19 11:03 AM, Vladimir Sementsov-Ogievskiy wrote:
> Rename Error ** parameter in check_only_migratable to common errp.
> 
> In device_set_realized:
> 
>   - Move "if (local_err != NULL)" closer to error setters.
> 
>   - Drop 'Error **local_errp': it doesn't save any LoCs, but it's very
>     unusual.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   hw/core/qdev.c | 28 +++++++++++++---------------
>   1 file changed, 13 insertions(+), 15 deletions(-)
> 

> @@ -894,27 +893,26 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
>          }
>   
>       } else if (!value && dev->realized) {
> -        Error **local_errp = NULL;
> +        /* We want to catch in local_err only first error */

grammar:
/* We want local_err to track only the first error */

>           QLIST_FOREACH(bus, &dev->child_bus, sibling) {
> -            local_errp = local_err ? NULL : &local_err;
>               object_property_set_bool(OBJECT(bus), false, "realized",
> -                                     local_errp);
> +                                     local_err ? NULL : &local_err);
>           }

Otherwise,
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

