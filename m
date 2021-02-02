Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D12C30C17A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:26:27 +0100 (CET)
Received: from localhost ([::1]:49444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wdO-0004fd-Eb
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:26:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6waf-00031B-40
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:23:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6wac-0001CB-Ap
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:23:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612275812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qsomA7YEkomwHhl0fhEREd84Cm7fRplzM+Wvt3A/hh8=;
 b=HhoBLQqnoGTk2rHst8HKYq3/6jJqp3BQydMod0+OfDwFacx4VvvZyfdTRlAxadE6GM/Gfh
 4AIaoojL4amfG9iEzyJSZseOEinJsPDZJRBI7g3zGb3nevrjbbg9TKGJtBcB8uzeKyCK1a
 PXvDY03bKRF+qR9tNmfUv+PRIDBgAp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-ZwlRYI_uNcW7wxNSxaaBqw-1; Tue, 02 Feb 2021 09:23:21 -0500
X-MC-Unique: ZwlRYI_uNcW7wxNSxaaBqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78983195D596
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 14:23:09 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5A4B6EF40;
 Tue,  2 Feb 2021 14:23:08 +0000 (UTC)
Subject: Re: [PATCH v2 3/4] migration: Fix cache_init()'s "Failed to allocate"
 error messages
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210202141734.2488076-1-armbru@redhat.com>
 <20210202141734.2488076-4-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <00a237bc-0d15-a27b-cd2f-e8dad4cccab3@redhat.com>
Date: Tue, 2 Feb 2021 08:23:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210202141734.2488076-4-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: berrange@redhat.com, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 8:17 AM, Markus Armbruster wrote:
> cache_init() attempts to handle allocation failure..  The two error

The double . looks odd.

> messages are garbage, as untested error messages commonly are:
> 
>     Parameter 'cache size' expects Failed to allocate cache
>     Parameter 'cache size' expects Failed to allocate page cache
> 
> Fix them to just
> 
>     Failed to allocate cache
>     Failed to allocate page cache
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  migration/page_cache.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


