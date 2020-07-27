Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B57F22EF65
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 16:16:13 +0200 (CEST)
Received: from localhost ([::1]:33570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k03vI-0000IL-3U
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 10:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k03u4-0007Uc-PF
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 10:14:56 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:59716
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k03u3-0006zv-4H
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 10:14:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595859294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fxC+cZ6VLaOI5kJV261YYh+1Yotchckq9CHo5uQIjn4=;
 b=i4y4KKPodjBnPA0BqRSry1c6JRAG8ZseB/RNCUxKUB+VVBrO8MehvlL5CYvNayOxDW+1FQ
 cBufME2497se+lNJSEldYPC4sULDpm8iJ2ZHawiOLaSVDRHxvBJ0YgR3RPV3liQuVkKdO5
 6TnIUsOEojl6mbuy6AMeAYHMw1YFC40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-2pWTBJBzP_im9aDq-Tqb3A-1; Mon, 27 Jul 2020 10:14:52 -0400
X-MC-Unique: 2pWTBJBzP_im9aDq-Tqb3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3969800597;
 Mon, 27 Jul 2020 14:14:51 +0000 (UTC)
Received: from [10.3.113.26] (ovpn-113-26.phx2.redhat.com [10.3.113.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F09D5D9E8;
 Mon, 27 Jul 2020 14:14:51 +0000 (UTC)
Subject: Re: [PATCH] iotests/197: Fix for compat=0.10
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20200727135237.1096841-1-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <c9bf6fff-a78a-e160-58be-5a8cb87549f9@redhat.com>
Date: Mon, 27 Jul 2020 09:14:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727135237.1096841-1-mreitz@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 03:37:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/27/20 8:52 AM, Max Reitz wrote:
> Writing zeroes to a qcow2 v2 images without a backing file results in an
> unallocated cluster as of 61b3043965.  197 has a test for COR-ing a
> cluster on an image without a backing file, which means that the data
> will be zero, so now on a v2 image that cluster will just stay
> unallocated, and so the test fails.  Just force compat=1.1 for that
> particular case to enforce the cluster to get allocated.
> 
> Fixes: 61b3043965fe3552ee2684a97e7cc809ca7a71b3
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/197 | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/tests/qemu-iotests/197 b/tests/qemu-iotests/197
> index 95f05b0e34..121959a09c 100755
> --- a/tests/qemu-iotests/197
> +++ b/tests/qemu-iotests/197
> @@ -112,7 +112,9 @@ echo
>   echo '=== Partial final cluster ==='
>   echo
>   
> -_make_test_img 1024
> +# Force compat=1.1, because writing zeroes on a v2 image without a
> +# backing file would just result in an unallocated cluster
> +_make_test_img -o compat=1.1 1024
>   $QEMU_IO -f $IMGFMT -C -c 'read 0 1024' "$TEST_IMG" | _filter_qemu_io
>   $QEMU_IO -f $IMGFMT -c map "$TEST_IMG"
>   _check_test_img
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


