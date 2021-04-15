Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8C6361068
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 18:50:23 +0200 (CEST)
Received: from localhost ([::1]:56338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX5CA-0005WR-7N
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 12:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lX4xF-00040s-Pk
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:34:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lX4x7-0006aX-46
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:34:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618504488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3qTmMZoeeOUn0OhNyXhML96YDNBq1z6zUuwVcZMBRY=;
 b=aAhHUC++/0E3xuRTsWI92cX1673arq1wQIUJ8/6NU9AJSQB8OGs0ae840wMPTqNZOMvtMf
 HoLAPZsGXL1FxmCBK5HS3mzBAa4kUMz1lthIEjcqp1DvCTLqF7bc2Z8p7toVKC5KxkqGr/
 ZPQghx7mk8o7IvV9bCbbaUJsYi8MiNU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-9U9qy1dTNDCDd1OIT4YbDA-1; Thu, 15 Apr 2021 12:34:44 -0400
X-MC-Unique: 9U9qy1dTNDCDd1OIT4YbDA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4D94189C447;
 Thu, 15 Apr 2021 16:34:43 +0000 (UTC)
Received: from work-vm (ovpn-113-195.ams2.redhat.com [10.36.113.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3076710016DB;
 Thu, 15 Apr 2021 16:34:42 +0000 (UTC)
Date: Thu, 15 Apr 2021 17:34:39 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 4/5] block: add trace point when fdatasync fails
Message-ID: <YHhrH5FFGZT+f1I+@work-vm>
References: <20210415135851.862406-1-berrange@redhat.com>
 <20210415135851.862406-5-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210415135851.862406-5-berrange@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> A flush failure is a critical failure scenario for some operations.
> For example, it will prevent migration from completing, as it will
> make vm_stop() report an error. Thus it is important to have a
> trace point present for debugging.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

I'd have had to admit to not having thought that would fail; the fact
we're debugging something where it does, suggests it's a good idea!


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  block/file-posix.c | 2 ++
>  block/trace-events | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 99cf452f84..6aafeda44f 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1362,6 +1362,8 @@ static int handle_aiocb_flush(void *opaque)
>  
>      ret = qemu_fdatasync(aiocb->aio_fildes);
>      if (ret == -1) {
> +        trace_file_flush_fdatasync_failed(errno);
> +
>          /* There is no clear definition of the semantics of a failing fsync(),
>           * so we may have to assume the worst. The sad truth is that this
>           * assumption is correct for Linux. Some pages are now probably marked
> diff --git a/block/trace-events b/block/trace-events
> index 1a12d634e2..c8a943e992 100644
> --- a/block/trace-events
> +++ b/block/trace-events
> @@ -206,6 +206,7 @@ file_copy_file_range(void *bs, int src, int64_t src_off, int dst, int64_t dst_of
>  file_FindEjectableOpticalMedia(const char *media) "Matching using %s"
>  file_setup_cdrom(const char *partition) "Using %s as optical disc"
>  file_hdev_is_sg(int type, int version) "SG device found: type=%d, version=%d"
> +file_flush_fdatasync_failed(int err) "errno %d"
>  
>  # sheepdog.c
>  sheepdog_reconnect_to_sdog(void) "Wait for connection to be established"
> -- 
> 2.30.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


