Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7958386C39
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 23:23:21 +0200 (CEST)
Received: from localhost ([::1]:56722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1likhs-0001SA-GZ
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 17:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1likh7-0000du-Rt
 for qemu-devel@nongnu.org; Mon, 17 May 2021 17:22:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1likh6-0003kh-1K
 for qemu-devel@nongnu.org; Mon, 17 May 2021 17:22:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621286551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yu4xNbAigyxijjzYFGDoVeqa1x14oraSPgGnWgJ0ZfI=;
 b=JaML5+DfoWiS+UoIFkc1/Vb02/bGf3RRcCU48V2jUMU+dzVAfRQqCkLWzERV4yCI3YnL3j
 ZHIkUSWQBKwzwFnhzUkRy0uSbLzJYs60KDO5j6u7yTc4ogUL9Hg4MvyLqnX3SC8XR4W0tn
 eh8ebVYlVwt3C2+HqwZVOOXeYdGUFro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-XfYIo5Q6NzKAgR2gjnqtkg-1; Mon, 17 May 2021 17:22:27 -0400
X-MC-Unique: XfYIo5Q6NzKAgR2gjnqtkg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 858ED107ACE4;
 Mon, 17 May 2021 21:22:26 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B80885D6A8;
 Mon, 17 May 2021 21:22:25 +0000 (UTC)
Subject: Re: [PATCH v2] fdc: fix floppy boot for Red Hat Linux 5.2
To: qemu-devel@nongnu.org
References: <20210427181010.1920534-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <d4d0a020-1516-5508-0ddf-f2795e75b2a5@redhat.com>
Date: Mon, 17 May 2021 17:22:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210427181010.1920534-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/21 2:10 PM, John Snow wrote:
> The image size indicates it's an 81 track floppy disk image, which we
> don't have a listing for in the geometry table. When you force the drive
> type to 1.44MB, it guesses the reasonably close 18/80. When the drive
> type is allowed to auto-detect or set to 2.88, it guesses a very
> incorrect geometry.
> 
> auto, 144 and 288 drive types get the right geometry with the new entry
> in the table.
> 
> Reported-by: Michael Tokarev <mjt@tls.msk.ru>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> ---
> 
> V2: I didn't actually stage this, so this is just a re-send to get a
> fresh Message-ID to reference in the PR. Added Thomas's R-B.
> 
>   hw/block/fdc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> index a825c2acbae..0f0c716d878 100644
> --- a/hw/block/fdc.c
> +++ b/hw/block/fdc.c
> @@ -122,6 +122,7 @@ static const FDFormat fd_formats[] = {
>       /* First entry is default format */
>       /* 1.44 MB 3"1/2 floppy disks */
>       { FLOPPY_DRIVE_TYPE_144, 18, 80, 1, FDRIVE_RATE_500K, }, /* 3.5" 2880 */
> +    { FLOPPY_DRIVE_TYPE_144, 18, 81, 1, FDRIVE_RATE_500K, },
>       { FLOPPY_DRIVE_TYPE_144, 20, 80, 1, FDRIVE_RATE_500K, }, /* 3.5" 3200 */
>       { FLOPPY_DRIVE_TYPE_144, 21, 80, 1, FDRIVE_RATE_500K, },
>       { FLOPPY_DRIVE_TYPE_144, 21, 82, 1, FDRIVE_RATE_500K, },
> 

Staged on my floppy branch.

--js


