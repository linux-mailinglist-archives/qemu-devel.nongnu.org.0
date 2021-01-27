Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E28903063FD
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 20:28:36 +0100 (CET)
Received: from localhost ([::1]:58236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4qUV-0008EP-VQ
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 14:28:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l4qSz-0006wM-Eu
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:27:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l4qSx-0004K3-TY
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:27:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611775619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a4ggOdVtcEZBkv4A9aL3xbB0BD9HsLXQyDMjNKEfNSs=;
 b=LWv+tDEedc27cQQ8obdkLo62Ub7uQ+yP0/cGSJafZLC7ttqHL0/mlj6ABZDNQVWRUflO0Z
 2+bLFcQF5cctYzKrlqTfX60NJyiicYqyjgHTC/1qpmkN62luhhwF4ZbLluwOPY7y1VFnXv
 1nlb7z9tQnvJQyCxd54gPHZdF3Z5Kas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-aJWm4JY-NoqYYB4-1Ov_vQ-1; Wed, 27 Jan 2021 14:26:57 -0500
X-MC-Unique: aJWm4JY-NoqYYB4-1Ov_vQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C389801FD6
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 19:26:56 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A7FE60BF3;
 Wed, 27 Jan 2021 19:26:50 +0000 (UTC)
Subject: Re: [PATCH] docs/interop/qmp-spec: Document the request queue limit
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210127144734.2367693-1-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <ca649f4c-ba21-e3b6-9c56-c14138f88f45@redhat.com>
Date: Wed, 27 Jan 2021 14:26:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210127144734.2367693-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: libvir-list@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 9:47 AM, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   docs/interop/qmp-spec.txt | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/interop/qmp-spec.txt b/docs/interop/qmp-spec.txt
> index cdf5842555..b0e8351d5b 100644
> --- a/docs/interop/qmp-spec.txt
> +++ b/docs/interop/qmp-spec.txt
> @@ -133,9 +133,11 @@ to pass "id" with out-of-band commands.  Passing it with all commands
>   is recommended for clients that accept capability "oob".
>   
>   If the client sends in-band commands faster than the server can
> -execute them, the server will stop reading the requests from the QMP
> -channel until the request queue length is reduced to an acceptable
> -range.
> +execute them, the server will stop reading requests until the request
> +queue length is reduced to an acceptable range.
> +
> +To ensure commands to be executed out-of-band get read and executed,
> +the client should have at most eight in-band commands in flight.
>   
>   Only a few commands support out-of-band execution.  The ones that do
>   have "allow-oob": true in output of query-qmp-schema.
> 

Great to know, thank you!

Reviewed-by: John Snow <jsnow@redhat.com>


