Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C14683890
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 22:25:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMy6Y-0001bv-6u; Tue, 31 Jan 2023 16:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pMy6W-0001bN-En
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 16:23:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pMy6U-0007p1-QU
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 16:23:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675200225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3V/ixIshq5MmNIZdagbUJxD3lm8d4/nlhjJtws7aVgM=;
 b=fPLMXvnU6y9y0yGzrloVdX1NVmcidoW6+ess9u4Zf3heAIQFli2Y9KhF2uXZvFK61Isq3Z
 eLPO/JMQUyph1GX1xn5uKXJqScdUAFKUFX0rQPPM2rmffPYYRJTfw1xyYelZKIqyj0uKpo
 5x00ulH4oO0L7lFbDigrTUY1VjtbkoE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-fxYWK9bcOr62tPw2m2gbmg-1; Tue, 31 Jan 2023 16:23:42 -0500
X-MC-Unique: fxYWK9bcOr62tPw2m2gbmg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 990F4800B30;
 Tue, 31 Jan 2023 21:23:41 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45B57492C3E;
 Tue, 31 Jan 2023 21:23:36 +0000 (UTC)
Date: Tue, 31 Jan 2023 15:23:24 -0600
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, Fiona Ebner <f.ebner@proxmox.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 3/4] qemu-io: add -r option to register I/O buffer
Message-ID: <20230131212324.4btboq2utna6hx3w@redhat.com>
References: <20230130215415.919494-1-stefanha@redhat.com>
 <20230130215415.919494-4-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130215415.919494-4-stefanha@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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

On Mon, Jan 30, 2023 at 04:54:14PM -0500, Stefan Hajnoczi wrote:
> The blk_register_buf() API is an optimization hint that allows some
> block drivers to avoid I/O buffer housekeeping or bounce buffers.
> 
> Add an -r option to register the I/O buffer so that qemu-io can be used
> to test the blk_register_buf() API. The next commit will add a test that
> uses the new option.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  qemu-io-cmds.c | 167 +++++++++++++++++++++++++++++++++----------------
>  1 file changed, 114 insertions(+), 53 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> @@ -1277,7 +1322,7 @@ static int writev_f(BlockBackend *blk, int argc, char **argv)
>      int pattern = 0xcd;
>      QEMUIOVector qiov;
>  
> -    while ((c = getopt(argc, argv, "CfqP:")) != -1) {
> +    while ((c = getopt(argc, argv, "CfqrP:")) != -1) {

This one is still odd - it is neither case-sensitive nor
case-insensitive in order, because of P: coming after qr.

> @@ -1476,7 +1529,7 @@ static int aio_read_f(BlockBackend *blk, int argc, char **argv)
>      struct aio_ctx *ctx = g_new0(struct aio_ctx, 1);
>  
>      ctx->blk = blk;
> -    while ((c = getopt(argc, argv, "CP:iqv")) != -1) {
> +    while ((c = getopt(argc, argv, "CP:iqrv")) != -1) {

This one could at least argue that all capitals are before any
lower-case, although case-insensitive would put i before P:.

> @@ -1582,22 +1641,24 @@ static int aio_write_f(BlockBackend *blk, int argc, char **argv)
>      int nr_iov, c;
>      int pattern = 0xcd;
>      struct aio_ctx *ctx = g_new0(struct aio_ctx, 1);
> -    BdrvRequestFlags flags = 0;
>  
>      ctx->blk = blk;
> -    while ((c = getopt(argc, argv, "CfiqP:uz")) != -1) {
> +    while ((c = getopt(argc, argv, "CfiqrP:uz")) != -1) {

Another odd spot where P: would fit better before qr.

Those are still minor, so I don't care if you further touch them
up. My R-b applies either way.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


