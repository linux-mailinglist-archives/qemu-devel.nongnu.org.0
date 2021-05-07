Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7A33767EF
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 17:28:50 +0200 (CEST)
Received: from localhost ([::1]:35224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf2PJ-0002Z8-Jg
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 11:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lf2Me-0008Vk-71
 for qemu-devel@nongnu.org; Fri, 07 May 2021 11:26:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lf2Mc-0001UX-Ae
 for qemu-devel@nongnu.org; Fri, 07 May 2021 11:26:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620401161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fykrS4yEnEjIRXYV3U474rZi6MCPK8bJJDekUby4H4M=;
 b=K2+ATPjDJwA2Tk0r2Qw45bMTSNlFnc7xaVm23fZ43+whabTqRA4nXxK+ILO8XZHfotT4v9
 6xIZXg8ryeJwZ57YKsz7Ff2wka2S6s9wfIZuuo0DGtD6TvfC2mPQNH5RpM9q7UMxx1J9Aj
 P/sj+bceVxjKesyM0E+SV9kKBoHrrUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-i_XVtffCOnCog98ZxgfaMw-1; Fri, 07 May 2021 11:25:58 -0400
X-MC-Unique: i_XVtffCOnCog98ZxgfaMw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDADF800D62;
 Fri,  7 May 2021 15:25:57 +0000 (UTC)
Received: from [10.3.113.56] (ovpn-113-56.phx2.redhat.com [10.3.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60A515D6A1;
 Fri,  7 May 2021 15:25:57 +0000 (UTC)
Subject: Re: [PATCH v2 4/5] blkdebug: do not suspend in the middle of
 QLIST_FOREACH_SAFE
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210507151203.39643-1-eesposit@redhat.com>
 <20210507151203.39643-5-eesposit@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <d2b989cd-8002-328f-e15b-e558903f2bf8@redhat.com>
Date: Fri, 7 May 2021 10:25:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210507151203.39643-5-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/7/21 10:12 AM, Emanuele Giuseppe Esposito wrote:
> That would be unsafe in case a rule other than the current one
> is removed while the coroutine has yielded.
> Keep FOREACH_SAFE because suspend_request deletes the current rule.
> 
> After this patch, *all* matching rules are deleted before suspending
> the coroutine, rather than just one.
> This doesn't affect the existing testcases.
> 
> Use actions_count to see how many yeld to issue.

yield

> 
> Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block/blkdebug.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


