Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BC81B77C4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 16:03:06 +0200 (CEST)
Received: from localhost ([::1]:38484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRyv3-0001TJ-E0
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 10:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47972)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jRytP-0000gX-CD
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 10:01:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jRytM-0002NS-C5
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 10:01:22 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:38581
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jRytL-0002Gk-U5
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 10:01:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587736878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s4UxI1SjG8FWjUXmxA1uM6KYsP3QIdcJmhQfvfNXvsA=;
 b=NA+LDcdISPJczjjiSgzDOGjOn+0RSJ3i79WVDkpw5IU3MdDaFoC7DZF9Ak2nrt4gFgmotw
 Fiwa2Lkjl/3xkQV/7W8dzXQxAEJeUrSRU1Jw0qietVzxi1zRya9oUDjZDL2E/NZSroKZvL
 iCPUtt5m+mUwhzDtPvtNb/gr125rg3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-qbAURsAgOpyd4c9L_xOtGg-1; Fri, 24 Apr 2020 10:01:16 -0400
X-MC-Unique: qbAURsAgOpyd4c9L_xOtGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A158019057A3;
 Fri, 24 Apr 2020 14:01:15 +0000 (UTC)
Received: from [10.10.116.80] (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC63C60D39;
 Fri, 24 Apr 2020 14:01:14 +0000 (UTC)
Subject: Re: [PATCH v2 14/15] qapi: Disallow qmp_marshal_FOO(NULL, ...)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200424084338.26803-1-armbru@redhat.com>
 <20200424084338.26803-15-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <9b1d7868-b934-46b8-bf58-52e09314e97c@redhat.com>
Date: Fri, 24 Apr 2020 09:01:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424084338.26803-15-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 02:57:59
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
Cc: mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/20 3:43 AM, Markus Armbruster wrote:
> For QMP commands without arguments, gen_marshal() laboriously
> generates a qmp_marshal_FOO() that copes with null @args.  Turns
> there's just one caller that passes null instead of an empty QDict.
> Adjust that caller, and simplify gen_marshal().
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   docs/devel/qapi-code-gen.txt |  2 +-
>   monitor/qmp.c                |  5 ++++-
>   scripts/qapi/commands.py     | 26 ++------------------------
>   3 files changed, 7 insertions(+), 26 deletions(-)
> 

Fun diffstat.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


