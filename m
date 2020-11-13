Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4FB2B1D8A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 15:34:23 +0100 (CET)
Received: from localhost ([::1]:53558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kda9e-0005g3-8h
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 09:34:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kda8S-00050Z-Iv
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 09:33:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kda8O-0004Js-Pc
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 09:33:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605277983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wch0B5DczCrpITYCQUuCU79bqqjvZA1gOde3g0p+OgU=;
 b=fZGSx0a5Kx/HzUfA1Hydj/vdFJBzA9HsR4rd8XrhxuUXhqIoIkymjO/8ikRNCCESYuWbeq
 1V01/kMra3+Df2jeLvTksAiJ3OU3UW3dgZy6Q1U2Z4r4c1sDpdiWYToB1maGddQRS9Kw+d
 HE3YnywU756NAZi+doXtWywxEkbhn2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-1FbVDdE_PlSIdfzas0syow-1; Fri, 13 Nov 2020 09:32:59 -0500
X-MC-Unique: 1FbVDdE_PlSIdfzas0syow-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94A031009E2F;
 Fri, 13 Nov 2020 14:32:58 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-96.ams2.redhat.com
 [10.36.114.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B091610002A4;
 Fri, 13 Nov 2020 14:32:53 +0000 (UTC)
Subject: Re: [PATCH v7 08/21] block: introduce preallocate filter
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201021145859.11201-1-vsementsov@virtuozzo.com>
 <20201021145859.11201-9-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <78e540df-85b4-2a5a-7088-ef77eb7b5ab7@redhat.com>
Date: Fri, 13 Nov 2020 15:32:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201021145859.11201-9-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, den@virtuozzo.com, qemu-devel@nongnu.org,
 armbru@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.10.20 16:58, Vladimir Sementsov-Ogievskiy wrote:
> It's intended to be inserted between format and protocol nodes to
> preallocate additional space (expanding protocol file) on writes
> crossing EOF. It improves performance for file-systems with slow
> allocation.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   docs/system/qemu-block-drivers.rst.inc |  26 ++
>   qapi/block-core.json                   |  20 +-
>   block/preallocate.c                    | 559 +++++++++++++++++++++++++
>   block/meson.build                      |   1 +
>   4 files changed, 605 insertions(+), 1 deletion(-)
>   create mode 100644 block/preallocate.c

[...]

> +    if (end <= s->file_end) {
> +        /* No preallocation needed. */
> +        return want_merge_zero && offset >= s->zero_start;
> +    }
> +
> +    /* Now we want new preallocation, as request writes beyond s->data_end. */

True, but isn’t s->file_end more important?

> +
> +    prealloc_start = want_merge_zero ? MIN(offset, s->file_end) : s->file_end;
> +    prealloc_end = QEMU_ALIGN_UP(end + s->opts.prealloc_size,
> +                                 s->opts.prealloc_align);

[...]

> +        if (prealloc == PREALLOC_MODE_FALLOC) {
> +            /*
> +             * If offset <= s->file_end, the task is already done, just
> +             * update s->file_end, to move part of "filter preallocation"

s/file_end/data_end/

With those fixed, and with %s/5\.2/6.0/:

Reviewed-by: Max Reitz <mreitz@redhat.com>

> +             * to "preallocation requested by user".
> +             * Otherwise just proceed to preallocate missing part.
> +             */
> +            if (offset <= s->file_end) {
> +                s->data_end = offset;
> +                return 0;
> +            }


