Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33435338704
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 09:04:16 +0100 (CET)
Received: from localhost ([::1]:34348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKcmM-0005iC-NI
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 03:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKckA-0004qz-MS
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:02:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKck5-0004nT-ML
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:01:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615536108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=suRFzhECfLZAXLc0ZVFIFLexqs7VyZyGFnIaUpd0b2Q=;
 b=TJBCCMhsiRN5dwtRe6Qc2g9jp9m0nhR83ilgItp/CmgF9GIA2iUiO3hBVLxN6Zct8rDz1N
 6rzmaglgIdrJGVAMX04KhnbdNa1mhj+OdJ5J1uCXfKP5B1iTck1Vi5CERtt15j22VoFbve
 6dxgr6/DG2z2GfpsQLX601k1QICC9Gc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-Dt3ODO_WPFWJqawWK3J_Cw-1; Fri, 12 Mar 2021 03:01:45 -0500
X-MC-Unique: Dt3ODO_WPFWJqawWK3J_Cw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AD2F1074659;
 Fri, 12 Mar 2021 08:01:44 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C33A5B4A0;
 Fri, 12 Mar 2021 08:01:42 +0000 (UTC)
Subject: Re: [PATCH] fdc: fix floppy boot for Red Hat Linux 5.2
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210312063259.1721939-1-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0badfac5-8c0e-600c-949c-61e196e7aa31@redhat.com>
Date: Fri, 12 Mar 2021 09:01:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312063259.1721939-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/2021 07.32, John Snow wrote:
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
> ---
>   hw/block/fdc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> index 198940e737..b2f26ba587 100644
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

That whole table-based approach seems quite unreliable to me - I've seen 
floppy disks with 80, 81, 82 or sometimes even 83 tracks in the past, so I 
think we would do better with a more flexible way of guessing ... but for 
the time being, this is certainly a quick and easy fix that also should not 
have any negative impact, thus:

Reviewed-by: Thomas Huth <thuth@redhat.com>


