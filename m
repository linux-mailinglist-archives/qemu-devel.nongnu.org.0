Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64793673B00
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 15:02:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIVUF-0004m6-K6; Thu, 19 Jan 2023 09:01:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIVTa-0004gh-PA
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:01:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIVTZ-0007A1-6e
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674136868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CtvbIT+3k6RfQLCV2bdPvw86WVukSx+D5A9vsWoSk2A=;
 b=Dbmh3KEqQGupWftrsgQGjRc7T0OL/8jfpYvOu/SuHMhc3t9PXxlpnBqe0PC/1oFR046SQz
 xXapvmrGzB1fKuLtijNlNZ7vRSB03t8XtPRXCXPdz5crYJZHuUtxhmifB0B9+7QaTyd9Qr
 TRTHyZEPuzVsqhMtS0sNjDYc69X6DNI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-Bwhsv64ePleahPUejM32nA-1; Thu, 19 Jan 2023 09:01:04 -0500
X-MC-Unique: Bwhsv64ePleahPUejM32nA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12FA13C1025D;
 Thu, 19 Jan 2023 14:01:02 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B772F40C6EC4;
 Thu, 19 Jan 2023 14:01:00 +0000 (UTC)
Date: Thu, 19 Jan 2023 15:00:58 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 01/12] block: Improve empty format-specific info dump
Message-ID: <Y8lNGgogFfitt7kr@redhat.com>
References: <20220620162704.80987-1-hreitz@redhat.com>
 <20220620162704.80987-2-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620162704.80987-2-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 20.06.2022 um 18:26 hat Hanna Reitz geschrieben:
> When a block driver supports obtaining format-specific information, but
> that object only contains optional fields, it is possible that none of
> them are present, so that dump_qobject() (called by
> bdrv_image_info_specific_dump()) will not print anything.
> 
> The callers of bdrv_image_info_specific_dump() put a header above this
> information ("Format specific information:\n"), which will look strange
> when there is nothing below.  Modify bdrv_image_info_specific_dump() to
> print this header instead of its callers, and only if there is indeed
> something to be printed.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>

> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> index 2f0d8ac25a..084ec44d3b 100644
> --- a/qemu-io-cmds.c
> +++ b/qemu-io-cmds.c
> @@ -1819,8 +1819,8 @@ static int info_f(BlockBackend *blk, int argc, char **argv)
>          return -EIO;
>      }
>      if (spec_info) {
> -        printf("Format specific information:\n");
> -        bdrv_image_info_specific_dump(spec_info);
> +        bdrv_image_info_specific_dump(spec_info,
> +                                      "Format specific information:\n");
>          qapi_free_ImageInfoSpecific(spec_info);
>      }

Interesting observation here: That qemu-io uses printf() instead of
qemu_printf() for the top level, but then dump_qobject() (which results
in qemu_printf()) for the format specific information, means that if you
use the 'qemu-io' HMP command, you'll get half of the output on stdout
and the other half in the monitor.

This series doesn't fix this, but the split makes a little more sense
after this patch at least...

Kevin


