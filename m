Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A635AE4E1
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 11:58:28 +0200 (CEST)
Received: from localhost ([::1]:51270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVVLf-0005GT-2z
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 05:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1oVUqu-0002Ju-Kt
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:26:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1oVUqs-00050G-Jr
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662456397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GRw2iTEWZGAVnG8U+jD1TXCQqc3ha6QvZt3pkWhCjc0=;
 b=f+nlO/odLmuFD4g6TTjmElS+HCYIKlHGPlTOnM2h6SqOOSHlnoJo2niE+S4GZaxrtCDOdx
 1WP382Bb9WQSjJV7bNpU0B8IrEIJuo3vAdFZJSd8xBMiq0ji9C0TvRKNEjpkakQfGWIOz2
 iorls5F9eZkkn3RALq0GFJjxz5xClrM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-AOvGD8z3NUeztd0Qvf_1AA-1; Tue, 06 Sep 2022 05:26:36 -0400
X-MC-Unique: AOvGD8z3NUeztd0Qvf_1AA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 573F585A585
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 09:26:36 +0000 (UTC)
Received: from localhost (unknown [10.39.193.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19C7A2026D4C;
 Tue,  6 Sep 2022 09:26:35 +0000 (UTC)
Date: Tue, 6 Sep 2022 10:26:35 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 06/11] crypto: check that LUKS PBKDF2 iterations count is
 non-zero
Message-ID: <20220906092635.GM7484@redhat.com>
References: <20220906084147.1423045-1-berrange@redhat.com>
 <20220906084147.1423045-7-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220906084147.1423045-7-berrange@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 06, 2022 at 09:41:42AM +0100, Daniel P. Berrangé wrote:
> Both the master key and key slot passphrases are run through the PBKDF2
> algorithm. The iterations count is expected to be generally very large
> (many 10's or 100's of 1000s). It is hard to define a low level cutoff,
> but we can certainly say that iterations count should be non-zero. A
> zero count likely indicates an initialization mistake so reject it.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  crypto/block-luks.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/crypto/block-luks.c b/crypto/block-luks.c
> index e6ee8506b2..254490c256 100644
> --- a/crypto/block-luks.c
> +++ b/crypto/block-luks.c
> @@ -579,6 +579,11 @@ qcrypto_block_luks_check_header(const QCryptoBlockLUKS *luks, Error **errp)
>          return -1;
>      }
>  
> +    if (luks->header.master_key_iterations == 0) {
> +        error_setg(errp, "LUKS key iteration count is zero");
> +        return -1;
> +    }
> +
>      /* Check all keyslots for corruption  */
>      for (i = 0 ; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS ; i++) {
>  
> @@ -602,6 +607,12 @@ qcrypto_block_luks_check_header(const QCryptoBlockLUKS *luks, Error **errp)
>              return -1;
>          }
>  
> +        if (slot1->active == QCRYPTO_BLOCK_LUKS_KEY_SLOT_ENABLED &&
> +            slot1->iterations == 0) {
> +            error_setg(errp, "Keyslot %zu iteration count is zero", i);
> +            return -1;
> +        }
> +
>          if (start1 < DIV_ROUND_UP(QCRYPTO_BLOCK_LUKS_KEY_SLOT_OFFSET,
>                                    QCRYPTO_BLOCK_LUKS_SECTOR_SIZE)) {
>              error_setg(errp,

Equivalent checks were missing in nbdkit - I've added them.

I wonder if there's a problem that a very large number here would
cause long delays opening the device.  In general it's not very clear
to me if the aim is to prevent malicious LUKS input, or if we're just
trying to sanity check the device hasn't been corrupted or improperly
prepared.  The test above is the latter, I think.

Nevertheless as this is an improvement over the current situation:

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html


