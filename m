Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 261F55AE4D4
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 11:55:03 +0200 (CEST)
Received: from localhost ([::1]:58704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVVIL-0000GJ-Us
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 05:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1oVUZy-0005m4-8q
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:09:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1oVUZv-00029c-SE
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:09:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662455345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YEjZ/T0ghzKpuF0oXKubkqWEaEbFCF+OPb5bII70OZQ=;
 b=EZ6ZZ9aDTb3oLFGRrp2Dl1QGib6DtoG7Y8162Th3NPzqTAo67tL/NRrR8xIinaom9wUU3y
 Cvfum1lxAZWdrkkHIe29R2wC0l8YrknwpJgEMAm2Vi/w67eqMUAElHDsoTZk7Wbmin2GXU
 tFiaYCLIH+lq4A76BsUzQ0yigl7BnyY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-jPAdOmcROnGp-5JCbE20yg-1; Tue, 06 Sep 2022 05:09:04 -0400
X-MC-Unique: jPAdOmcROnGp-5JCbE20yg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B38673C01DF8
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 09:09:03 +0000 (UTC)
Received: from localhost (unknown [10.39.193.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7600EC15BB3;
 Tue,  6 Sep 2022 09:09:03 +0000 (UTC)
Date: Tue, 6 Sep 2022 10:09:02 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 02/11] crypto: enforce that LUKS stripes is always a
 fixed value
Message-ID: <20220906090902.GK7484@redhat.com>
References: <20220906084147.1423045-1-berrange@redhat.com>
 <20220906084147.1423045-3-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220906084147.1423045-3-berrange@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

On Tue, Sep 06, 2022 at 09:41:38AM +0100, Daniel P. Berrangé wrote:
> Although the LUKS stripes are encoded in the keyslot header and so
> potentially configurable, in pratice the cryptsetup impl mandates
> this has the fixed value 4000. To avoid incompatibility apply the
> same enforcement in QEMU too. This also caps the memory usage for
> key material when QEMU tries to open a LUKS volume.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  crypto/block-luks.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/crypto/block-luks.c b/crypto/block-luks.c
> index 27d1b34c1d..81744e2a8e 100644
> --- a/crypto/block-luks.c
> +++ b/crypto/block-luks.c
> @@ -582,8 +582,9 @@ qcrypto_block_luks_check_header(const QCryptoBlockLUKS *luks, Error **errp)
>                                                     header_sectors,
>                                                     slot1->stripes);
>  
> -        if (slot1->stripes == 0) {
> -            error_setg(errp, "Keyslot %zu is corrupted (stripes == 0)", i);
> +        if (slot1->stripes != QCRYPTO_BLOCK_LUKS_STRIPES) {
> +            error_setg(errp, "Keyslot %zu is corrupted (stripes %d != %d)",
> +                       i, slot1->stripes, QCRYPTO_BLOCK_LUKS_STRIPES);
>              return -1;
>          }

In nbdkit I decided to just check that this number < 10000, but I
agree that the only important implementation (the kernel) always fixes
this at 4000 (cryptsetup.git/lib/keymanage.c), so:

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html


