Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAA6DC779
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 16:36:45 +0200 (CEST)
Received: from localhost ([::1]:41070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLTMy-000570-E2
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 10:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34042)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iLTLg-0004JL-BV
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 10:35:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iLTLf-0003nS-Av
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 10:35:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57612)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iLTLc-0003mU-WB; Fri, 18 Oct 2019 10:35:21 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3130510C093F;
 Fri, 18 Oct 2019 14:35:20 +0000 (UTC)
Received: from [10.3.116.168] (ovpn-116-168.phx2.redhat.com [10.3.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 801FA60BF1;
 Fri, 18 Oct 2019 14:35:19 +0000 (UTC)
Subject: Re: [PATCH] blockdev: modify blockdev-change-medium to change
 non-removable device
To: Denis Plotnikov <dplotnikov@virtuozzo.com>, qemu-block@nongnu.org
References: <20191018120950.26849-1-dplotnikov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <7bdd4dcf-da43-6169-382f-32b248ec72bb@redhat.com>
Date: Fri, 18 Oct 2019 09:35:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191018120950.26849-1-dplotnikov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Fri, 18 Oct 2019 14:35:20 +0000 (UTC)
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
Cc: kwolf@redhat.com, den@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/19 7:09 AM, Denis Plotnikov wrote:
> The modification is useful to workaround exclusive file access restrictions,
> e.g. to implement VM migration with shared disk stored on a storage with
> the exclusive file opening model: a destination VM is started waiting for
> incomming migration with a fake image drive, and later, on the last migration
> phase, the fake image file is replaced with the real one.
> 
> Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
> ---

> +++ b/qapi/block-core.json
> @@ -4769,6 +4769,8 @@
>   # @read-only-mode:  change the read-only mode of the device; defaults
>   #                   to 'retain'
>   #
> +# @medium-name:     drive-name when changing the media in non-removable devices
> +#                   ignored when changing media in removable devices

s/devices ignored/devices. Ignored/

Missing a '(since 4.2)' tag.


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

