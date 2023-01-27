Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C97C67F23A
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 00:26:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLY6Y-0000M3-3q; Fri, 27 Jan 2023 18:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pLY6W-0000Lu-P3
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 18:25:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pLY6V-0001VM-7e
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 18:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674861954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d5uxjgKYR8oycA1UbekLhvp3SrbwrcMDOxD4Hn45UAg=;
 b=NwnsQ0sLyKm3wnYNbbMPNzkLJwOcQeih1IzVgqbd9OdVImFRBB0WP8Kryq7c1E+65Hc4/i
 ngGyf13HxAksw7M9vHqjlfFkWdcmpu5k35IqB8VgRwUe/cqc0y6KHswWyREhvik2DuYyGC
 wVm3TbyhKXn6imv27+F9lzzk7/vS8wU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-aFbuH9WmOgaGh6iDGxbTfA-1; Fri, 27 Jan 2023 18:25:51 -0500
X-MC-Unique: aFbuH9WmOgaGh6iDGxbTfA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C27E2185A78B;
 Fri, 27 Jan 2023 23:25:50 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D44718EC1;
 Fri, 27 Jan 2023 23:25:50 +0000 (UTC)
Date: Fri, 27 Jan 2023 17:25:48 -0600
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Fiona Ebner <f.ebner@proxmox.com>
Subject: Re: [PATCH 4/4] iotests/detect-zeroes-registered-buf: add new test
Message-ID: <20230127232548.6hofhg4tketr5ex7@redhat.com>
References: <20230126201401.348845-1-stefanha@redhat.com>
 <20230126201401.348845-5-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126201401.348845-5-stefanha@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 26, 2023 at 03:14:01PM -0500, Stefan Hajnoczi wrote:
> This regression test demonstrates that detect-zeroes works with
> registered buffers. Bug details:
> https://gitlab.com/qemu-project/qemu/-/issues/1404
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  .../tests/detect-zeroes-registered-buf        | 58 +++++++++++++++++++
>  .../tests/detect-zeroes-registered-buf.out    |  7 +++
>  2 files changed, 65 insertions(+)
>  create mode 100755 tests/qemu-iotests/tests/detect-zeroes-registered-buf
>  create mode 100644 tests/qemu-iotests/tests/detect-zeroes-registered-buf.out
> 
> diff --git a/tests/qemu-iotests/tests/detect-zeroes-registered-buf b/tests/qemu-iotests/tests/detect-zeroes-registered-buf
> new file mode 100755
> index 0000000000..edb5f2cee5
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/detect-zeroes-registered-buf
> @@ -0,0 +1,58 @@
> +#!/usr/bin/env bash
> +# group: rw auto quick
> +#
> +# Check that detect-zeroes=unmap works on writes with registered I/O buffers.
> +# This is a regression test for
> +# https://gitlab.com/qemu-project/qemu/-/issues/1404 where I/O requests failed
> +# unexpectedly.
> +#
> +# Copyright Red Hat

Do you need a year or a (C) or similar?

Otherwise,

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


