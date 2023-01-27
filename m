Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B1367F239
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 00:25:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLY5K-00084u-8F; Fri, 27 Jan 2023 18:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pLY5H-000847-KR
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 18:24:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pLY5E-000108-JP
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 18:24:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674861875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DAjFcAghqeqmLbhNjEYbBwcM4UOMuG5fHUiGn7ewlyc=;
 b=K2lSF5YrbSdV4ZxhVmJuf1ZwdApoyta2MpfoirkRmOmAAHqdbnsE3NT2R/quxkcvmSVN26
 oBkjr6in5X75ZjEDeL9ecjf79TrMjYn+wzKIXQlgBs/3qpktx7YPnBW8A1hQ9OVFC7UXyi
 LfwaoQgdL1z7W/reGkKL3RBad9kanuk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-5I95SaPYNdi-uj5WlPFPkQ-1; Fri, 27 Jan 2023 18:24:33 -0500
X-MC-Unique: 5I95SaPYNdi-uj5WlPFPkQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D81E802BF5;
 Fri, 27 Jan 2023 23:24:33 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63CEE2166B26;
 Fri, 27 Jan 2023 23:24:32 +0000 (UTC)
Date: Fri, 27 Jan 2023 17:24:30 -0600
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Fiona Ebner <f.ebner@proxmox.com>
Subject: Re: [PATCH 3/4] qemu-io: add -r option to register I/O buffer
Message-ID: <20230127232430.zy7x7wq2dvb3g3y2@redhat.com>
References: <20230126201401.348845-1-stefanha@redhat.com>
 <20230126201401.348845-4-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126201401.348845-4-stefanha@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

On Thu, Jan 26, 2023 at 03:14:00PM -0500, Stefan Hajnoczi wrote:
> The blk_register_buf() API is an optimization hint that allows some
> block drivers to avoid I/O buffer housekeeping or bounce buffers.
> 
> Add an -r option to register the I/O buffer so that qemu-io can be used
> to test the blk_register_buf() API. The next commit will add a test that
> uses the new option.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  qemu-io-cmds.c | 149 ++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 103 insertions(+), 46 deletions(-)
> 

>  static void *qemu_io_alloc_from_file(BlockBackend *blk, size_t len,
> -                                     const char *file_name)
> +                                     const char *file_name, bool register_buf)
>  {
>      char *buf, *buf_origin;
>      FILE *f = fopen(file_name, "r");
> @@ -414,6 +423,10 @@ static void *qemu_io_alloc_from_file(BlockBackend *blk, size_t len,
>      fclose(f);
>      f = NULL;
>  
> +    if (register_buf) {
> +        blk_register_buf(blk, buf_origin, len, &error_abort);
> +    }

Why is this conditionally true...

> +
>      if (len > pattern_len) {
>          len -= pattern_len;
>          buf += pattern_len;
> @@ -431,7 +444,7 @@ static void *qemu_io_alloc_from_file(BlockBackend *blk, size_t len,
>      return buf_origin;
>  
>  error:
> -    qemu_io_free(buf_origin);
> +    qemu_io_free(blk, buf_origin, len, false);

...but cleanup unconditionally false?

> @@ -719,6 +732,7 @@ static void read_help(void)
>  " -p, -- ignored for backwards compatibility\n"
>  " -P, -- use a pattern to verify read data\n"
>  " -q, -- quiet mode, do not show I/O statistics\n"
> +" -r, -- register I/O buffer\n"
>  " -s, -- start offset for pattern verification (only with -P)\n"
>  " -v, -- dump buffer to standard output\n"

Here we have kept more or less alphabetical...

> @@ -909,6 +932,7 @@ static void readv_help(void)
>  " -P, -- use a pattern to verify read data\n"
>  " -v, -- dump buffer to standard output\n"
>  " -q, -- quiet mode, do not show I/O statistics\n"
> +" -r, -- register I/O buffer\n"

...here we have not.  While it's pre-existing, would it be worth
touching up while you're here?

> @@ -1455,6 +1503,7 @@ static void aio_read_help(void)
>  " -i, -- treat request as invalid, for exercising stats\n"
>  " -v, -- dump buffer to standard output\n"
>  " -q, -- quiet mode, do not show I/O statistics\n"
> +" -r, -- register I/O buffer\n"

Another pre-existing spot.

Overall makes sense to me.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


