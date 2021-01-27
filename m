Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3103061C9
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 18:20:08 +0100 (CET)
Received: from localhost ([::1]:36876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4oUB-00008F-Pr
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 12:20:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l4oRF-00079o-SV
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 12:17:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l4oRC-0006Ms-Oa
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 12:17:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611767818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=38vQ6deeXeYqes/GQDxYc5POs4fisFh5hCUOYJCiyLw=;
 b=AhSYbKhkZPW1Zl0yPbHe9jLfRJKXqVdaqaJR4xr2sXXfgBVpj+hhsSVhkZYzYbgN1AKngc
 OSyIhjPb6Lj5moO0gq71njTjhlIGfeTOX81zshTRuBry9Pr74meINxBAP0y/21M/m9JKcj
 0c7DzNSFbEA2+Qs5T4tLmQRJi7Z8sxg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-_uVULYcOMLi58ldzOkWkyg-1; Wed, 27 Jan 2021 12:16:53 -0500
X-MC-Unique: _uVULYcOMLi58ldzOkWkyg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19107AFA80;
 Wed, 27 Jan 2021 17:16:52 +0000 (UTC)
Received: from [10.3.113.91] (ovpn-113-91.phx2.redhat.com [10.3.113.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4550519D9D;
 Wed, 27 Jan 2021 17:16:44 +0000 (UTC)
Subject: Re: [PATCH v4 1/7] qapi/block-core: Add retry option for error action
To: Jiahui Cen <cenjiahui@huawei.com>, qemu-devel@nongnu.org
References: <20201215123011.4048-1-cenjiahui@huawei.com>
 <20201215123011.4048-2-cenjiahui@huawei.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <5470cc4f-5bcf-74d2-4e93-4de0b3ab6afa@redhat.com>
Date: Wed, 27 Jan 2021 11:16:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201215123011.4048-2-cenjiahui@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, zhang.zhanghailiang@huawei.com,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, fangying1@huawei.com,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 6:30 AM, Jiahui Cen wrote:
> Add a new error action 'retry' to support retry on errors.
> 
> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> ---
>  blockdev.c           | 2 ++
>  qapi/block-core.json | 4 ++--
>  2 files changed, 4 insertions(+), 2 deletions(-)

> +++ b/qapi/block-core.json
> @@ -1146,7 +1146,7 @@
>  # Since: 1.3
>  ##
>  { 'enum': 'BlockdevOnError',
> -  'data': ['report', 'ignore', 'enospc', 'stop', 'auto'] }
> +  'data': ['report', 'ignore', 'enospc', 'stop', 'auto', 'retry'] }

Missing a documentation line that 'retry' was added in 6.0.

>  
>  ##
>  # @MirrorSyncMode:
> @@ -4770,7 +4770,7 @@
>  # Since: 2.1
>  ##
>  { 'enum': 'BlockErrorAction',
> -  'data': [ 'ignore', 'report', 'stop' ] }
> +  'data': [ 'ignore', 'report', 'stop', 'retry' ] }

Likewise.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


