Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 386705AE526
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:18:54 +0200 (CEST)
Received: from localhost ([::1]:47726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVVfR-0004N1-4K
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1oVUuK-0005kL-OU
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:30:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1oVUuG-0005Yd-GB
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:30:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662456607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bDwRtBmdRIlco6nQzhPnQOZp+rIoluS1D/vlJMcUPcA=;
 b=P6CK8mAMCAfwoBP1O0Nb7LBg0L294zrCVofmaU9PZG5trWTIghwwbbH2C2hzV1y1dJmwek
 UaZgnYYXDu85fi398U6RaSEHlWAypffhtsouscX5D5dfEMaqIGM9te7t4+09QB5pO2sdQs
 AErLnSKTfwQpLTI1BDlWZXFsWeQbRAY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-g_uErOuIPw2F0_vdKoV8QA-1; Tue, 06 Sep 2022 05:30:06 -0400
X-MC-Unique: g_uErOuIPw2F0_vdKoV8QA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51C20801755
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 09:30:06 +0000 (UTC)
Received: from localhost (unknown [10.39.193.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0101D492C3B;
 Tue,  6 Sep 2022 09:30:05 +0000 (UTC)
Date: Tue, 6 Sep 2022 10:30:05 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 01/11] crypto: sanity check that LUKS header strings are
 NUL-terminated
Message-ID: <20220906093005.GN7484@redhat.com>
References: <20220906084147.1423045-1-berrange@redhat.com>
 <20220906084147.1423045-2-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220906084147.1423045-2-berrange@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

On Tue, Sep 06, 2022 at 09:41:37AM +0100, Daniel P. Berrangé wrote:
> The LUKS spec requires that header strings are NUL-terminated, and our
> code relies on that. Protect against maliciously crafted headers by
> adding validation.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  crypto/block-luks.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/crypto/block-luks.c b/crypto/block-luks.c
> index f62be6836b..27d1b34c1d 100644
> --- a/crypto/block-luks.c
> +++ b/crypto/block-luks.c
> @@ -554,6 +554,24 @@ qcrypto_block_luks_check_header(const QCryptoBlockLUKS *luks, Error **errp)
>          return -1;
>      }
>  
> +    if (!memchr(luks->header.cipher_name, '\0',
> +                sizeof(luks->header.cipher_name))) {
> +        error_setg(errp, "LUKS header cipher name is not NUL terminated");
> +        return -1;
> +    }
> +
> +    if (!memchr(luks->header.cipher_mode, '\0',
> +                sizeof(luks->header.cipher_mode))) {
> +        error_setg(errp, "LUKS header cipher mode is not NUL terminated");
> +        return -1;
> +    }
> +
> +    if (!memchr(luks->header.hash_spec, '\0',
> +                sizeof(luks->header.hash_spec))) {
> +        error_setg(errp, "LUKS header hash spec is not NUL terminated");
> +        return -1;
> +    }
> +
>      /* Check all keyslots for corruption  */
>      for (i = 0 ; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS ; i++) {

I think this was the error I originally wrote to you about, and I
think it's the most important fix because non-terminated strings seem
(possibly) exploitable.

FWIW nbdkit does this which is slightly different:

  char cipher_name[33], cipher_mode[33], hash_spec[33];

  /* Copy the header fields locally and ensure they are \0 terminated. */
  memcpy (cipher_name, h->phdr.cipher_name, 32);
  cipher_name[32] = 0;
  memcpy (cipher_mode, h->phdr.cipher_mode, 32);
  cipher_mode[32] = 0;
  memcpy (hash_spec, h->phdr.hash_spec, 32);
  hash_spec[32] = 0;

Anyway the change above looks good so:

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW


