Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374B849E8BE
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 18:20:03 +0100 (CET)
Received: from localhost ([::1]:57676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD8RG-0005fx-9z
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 12:20:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nD7RF-0000mn-0a
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 11:15:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nD7RA-0004Eb-Te
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 11:15:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643300152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9JOWL2kClnf/OA5EXY+RnDqq8v1MvtMJGNt8CBRpENc=;
 b=XM4Zo1O/55lzWuj3Xy/p1Czq3qp9L3qBFF7t68ayK+JBeL2cy+k2HJs9NR1mA6GfRvOVYw
 JVLjkDdhiLmV373oJKY6bBskQjahtd4XLbTDblA0ncH5bYk+mnO1fgwZL7RDldfq8sYhbc
 EKr2XHK4kgSeEbJuxYk+MfuFqQRP3iQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-sd5tj32lNoO1ouLWGi7LjA-1; Thu, 27 Jan 2022 11:15:48 -0500
X-MC-Unique: sd5tj32lNoO1ouLWGi7LjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B75A8144E2;
 Thu, 27 Jan 2022 16:15:47 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AB75109005E;
 Thu, 27 Jan 2022 16:15:45 +0000 (UTC)
Date: Thu, 27 Jan 2022 17:15:43 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH] block/export/fuse: Fix build failure on FreeBSD
Message-ID: <YfLFLzOsqlzJUvNq@redhat.com>
References: <20220122134940.401590-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20220122134940.401590-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Ed Maste <emaste@freebsd.org>, qemu-block@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, qemu-devel@nongnu.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 22.01.2022 um 14:49 hat Philippe Mathieu-Daudé geschrieben:
> When building on FreeBSD we get:
> 
>   [816/6851] Compiling C object libblockdev.fa.p/block_export_fuse.c.o
>   ../block/export/fuse.c:628:16: error: use of undeclared identifier 'FALLOC_FL_KEEP_SIZE'
>       if (mode & FALLOC_FL_KEEP_SIZE) {
>                  ^
>   ../block/export/fuse.c:632:16: error: use of undeclared identifier 'FALLOC_FL_PUNCH_HOLE'
>       if (mode & FALLOC_FL_PUNCH_HOLE) {
>                  ^
>   ../block/export/fuse.c:633:22: error: use of undeclared identifier 'FALLOC_FL_KEEP_SIZE'
>           if (!(mode & FALLOC_FL_KEEP_SIZE)) {
>                        ^
>   3 errors generated.
>   FAILED: libblockdev.fa.p/block_export_fuse.c.o
> 
> Meson indeed reported FALLOC_FL_PUNCH_HOLE is not available:
> 
>   C compiler for the host machine: cc (clang 10.0.1 "FreeBSD clang version 10.0.1")
>   Checking for function "fallocate" : NO
>   Checking for function "posix_fallocate" : YES
>   Header <linux/falloc.h> has symbol "FALLOC_FL_PUNCH_HOLE" : NO
>   Header <linux/falloc.h> has symbol "FALLOC_FL_ZERO_RANGE" : NO
>   ...
> 
> Similarly to commit 304332039 ("block/export/fuse.c: fix musl build"),
> guard the code requiring FALLOC_FL_KEEP_SIZE / FALLOC_FL_PUNCH_HOLE
> definitions under CONFIG_FALLOCATE_PUNCH_HOLE #ifdef'ry.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Fragile #ifdef'ry... Any clever idea?

I guess we could reorder things. The last case (!mode) is mutually
exclusive with the other conditions, so checking it first doesn't make a
difference, and then you can #ifdef things out more cleanly.

>     ERROR: else should follow close brace '}'
>     #17: FILE: block/export/fuse.c:647:
>          }
>     +    else
> 
>     ERROR: else should follow close brace '}'
>     #29: FILE: block/export/fuse.c:670:
>          }
>     +    else
> 
>     total: 2 errors, 0 warnings, 28 lines checked

On the other hand, I'm not really worried about these either. The only
way this could fail in the future is build errors, which are obvious and
quick to fix.

If you hadn't marked this an RFC, I think I would just have applied it.

Kevin

> ---
>  block/export/fuse.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/block/export/fuse.c b/block/export/fuse.c
> index 6710d8aed86..d8bad0e53df 100644
> --- a/block/export/fuse.c
> +++ b/block/export/fuse.c
> @@ -625,6 +625,7 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
>          return;
>      }
>  
> +#ifdef CONFIG_FALLOCATE_PUNCH_HOLE
>      if (mode & FALLOC_FL_KEEP_SIZE) {
>          length = MIN(length, blk_len - offset);
>      }
> @@ -643,8 +644,10 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
>              length -= size;
>          } while (ret == 0 && length > 0);
>      }
> +    else
> +#endif /* CONFIG_FALLOCATE_PUNCH_HOLE */
>  #ifdef CONFIG_FALLOCATE_ZERO_RANGE
> -    else if (mode & FALLOC_FL_ZERO_RANGE) {
> +    if (mode & FALLOC_FL_ZERO_RANGE) {
>          if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + length > blk_len) {
>              /* No need for zeroes, we are going to write them ourselves */
>              ret = fuse_do_truncate(exp, offset + length, false,
> @@ -664,8 +667,9 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
>              length -= size;
>          } while (ret == 0 && length > 0);
>      }
> +    else
>  #endif /* CONFIG_FALLOCATE_ZERO_RANGE */
> -    else if (!mode) {
> +    if (!mode) {
>          /* We can only fallocate at the EOF with a truncate */
>          if (offset < blk_len) {
>              fuse_reply_err(req, EOPNOTSUPP);
> -- 
> 2.34.1
> 


