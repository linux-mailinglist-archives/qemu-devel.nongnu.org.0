Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B6A2F32A3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 15:07:28 +0100 (CET)
Received: from localhost ([::1]:34732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzKKV-0006MT-RO
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 09:07:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzKIq-00055G-Br
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:05:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzKIn-0004EV-B0
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610460340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=owOb4Kf/LsqoT8HgH+O5+p58WWqWwBva7DaV1QMD+tU=;
 b=Un9tCHN1bo9nLXnH58DXgnriHu8HYQmxvQIzME2hmb3+aZI/MmQqfbpEErXTiGKDjS12dO
 AUqiirpmLoU7mEFthbI/oijHjXNhhQeFy5xxuSeAikElFsC2PmbZK2keLQ4OnLDC7OZBW0
 64IZps4cONs3LNoiUiEQc9WV2nfJZPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-_NlNmKD4OhmgdcNeWtxbPA-1; Tue, 12 Jan 2021 09:05:38 -0500
X-MC-Unique: _NlNmKD4OhmgdcNeWtxbPA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6451A801B13;
 Tue, 12 Jan 2021 14:05:36 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-161.ams2.redhat.com
 [10.36.115.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D886F5B692;
 Tue, 12 Jan 2021 14:05:33 +0000 (UTC)
Subject: Re: [PATCH v3 20/25] qapi: backup: disable copy_range by default
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201026171815.13233-1-vsementsov@virtuozzo.com>
 <20201026171815.13233-21-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <c7c8350e-10cd-c8fa-552c-e3ced98ef861@redhat.com>
Date: Tue, 12 Jan 2021 15:05:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201026171815.13233-21-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.10.20 18:18, Vladimir Sementsov-Ogievskiy wrote:
> Further commit will add a benchmark
> (scripts/simplebench/bench-backup.py), which will show that backup
> works better with async parallel requests (previous commit) and
> disabled copy_range. So, let's disable copy_range by default.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   qapi/block-core.json | 2 +-
>   blockdev.c           | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Uh, well, er, then why did you add it as true in patch 2?

Do you mean this patch as the basis for a discussion whether it should 
be true or false by default?  I don’t have anything to contribute, 
though, ergo I don’t mind either way.

Do you have an idea why copy offloading isn’t better?

Max

> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 5a21c24c1d..58eb2bcb86 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -1376,7 +1376,7 @@
>   # Optional parameters for backup. These parameters don't affect
>   # functionality, but may significantly affect performance.
>   #
> -# @use-copy-range: Use copy offloading. Default true.
> +# @use-copy-range: Use copy offloading. Default false.
>   #
>   # @max-workers: Maximum number of parallel requests for the sustained background
>   #               copying process. Doesn't influence copy-before-write operations.
> diff --git a/blockdev.c b/blockdev.c
> index 0ed390abe0..1ac64d8ee2 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -2788,7 +2788,7 @@ static BlockJob *do_backup_common(BackupCommon *backup,
>   {
>       BlockJob *job = NULL;
>       BdrvDirtyBitmap *bmap = NULL;
> -    BackupPerf perf = { .use_copy_range = true, .max_workers = 64 };
> +    BackupPerf perf = { .max_workers = 64 };
>       int job_flags = JOB_DEFAULT;
>   
>       if (!backup->has_speed) {
> 


