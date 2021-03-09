Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D02D3329C8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:09:25 +0100 (CET)
Received: from localhost ([::1]:35034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJdzA-0008Ik-0y
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:09:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJdck-00089V-1N
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:46:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJdcg-0006H5-9h
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:46:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615301169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y1bJb+tSFkS5K99kv9TebDcfX6N3hZ5yPTZXW6JOfSk=;
 b=DZATUfKJ11Nnqm77Pe42PLMwmjhqVxXkjjJWAuHmWb4QiWSiCAx2zghfBXrH5SlhqF/UgW
 mgzekP9ZT/O/j6F8C+2yYwl5LK1gVGRhQpixLFscKq5xasvcwFeAteonCLUIwcBYKEQEqT
 wxzVyjE0Py/i1A2HFtI1lp9Xgk4S30M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-CBObweWBP5GiPbCwLPLl9A-1; Tue, 09 Mar 2021 09:46:06 -0500
X-MC-Unique: CBObweWBP5GiPbCwLPLl9A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 086B21005D50;
 Tue,  9 Mar 2021 14:46:05 +0000 (UTC)
Received: from [10.3.112.36] (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A945419C46;
 Tue,  9 Mar 2021 14:46:04 +0000 (UTC)
Subject: Re: [PATCH] storage-daemon: Call job_cancel_sync_all() on shutdown
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210309121814.31078-1-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ecd2f9bc-55e1-2e90-8655-faf03844cd24@redhat.com>
Date: Tue, 9 Mar 2021 08:46:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210309121814.31078-1-kwolf@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 6:18 AM, Kevin Wolf wrote:
> bdrv_close_all() asserts that no jobs are running any more, so we need
> to cancel all jobs first to avoid failing the assertion.
> 
> Fixes: b55a3c8860b763b62b2cc2f4a6f55379977bbde5
> Reported-by: Nini Gu <ngu@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  storage-daemon/qemu-storage-daemon.c  |  1 +
>  tests/qemu-iotests/tests/qsd-jobs     | 66 +++++++++++++++++++++++++++
>  tests/qemu-iotests/tests/qsd-jobs.out | 22 +++++++++
>  3 files changed, 89 insertions(+)
>  create mode 100755 tests/qemu-iotests/tests/qsd-jobs
>  create mode 100644 tests/qemu-iotests/tests/qsd-jobs.out

Reviewed-by: Eric Blake <eblake@redhat.com>

> +++ b/tests/qemu-iotests/tests/qsd-jobs

Yay for nicer iotest names ;)

> +seq="$(basename $0)"
> +echo "QA output created by $seq"

$seq is a bit of a misnomer, now, but such is life.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


