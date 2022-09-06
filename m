Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798215AE517
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:13:32 +0200 (CEST)
Received: from localhost ([::1]:38614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVVaE-0007Bd-Rf
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1oVUjt-00068a-1P
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:19:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1oVUjp-0003l2-RP
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:19:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662455960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WTRx7tfA540r/FUQkddIp6d+BYP5GkpLpF1JDCco29o=;
 b=BWZX66vnqrKvq+7vZHymC7pR/23+eYpQfJXBqhGe7i8q7aQQntvtx35zt1NIXE1pyBePa9
 OISeim8s0I/yvuA8jkyGZEtbx3y5RS/nMrJNAeZf21tU0ry08g4x/d+C4zTZ/g4zwh6Kc4
 YqOSpc2lbvw8FhgsaiJtKf5garUHvDE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-6V63_9WGPCys1LI4uKqLWA-1; Tue, 06 Sep 2022 05:19:19 -0400
X-MC-Unique: 6V63_9WGPCys1LI4uKqLWA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63DB83C0D848
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 09:19:19 +0000 (UTC)
Received: from localhost (unknown [10.39.193.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24750C15BB3;
 Tue,  6 Sep 2022 09:19:19 +0000 (UTC)
Date: Tue, 6 Sep 2022 10:19:18 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 04/11] crypto: validate that LUKS payload doesn't overlap
 with header
Message-ID: <20220906091918.GL7484@redhat.com>
References: <20220906084147.1423045-1-berrange@redhat.com>
 <20220906084147.1423045-5-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220906084147.1423045-5-berrange@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Sep 06, 2022 at 09:41:40AM +0100, Daniel P. Berrangé wrote:
> We already validate that LUKS keyslots don't overlap with the
> header, or with each other. This closes the remain hole in

remain -> remaining

> validation of LUKS file regions.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  crypto/block-luks.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/crypto/block-luks.c b/crypto/block-luks.c
> index 6ef9a89ffa..f22bc63e54 100644
> --- a/crypto/block-luks.c
> +++ b/crypto/block-luks.c
> @@ -572,6 +572,13 @@ qcrypto_block_luks_check_header(const QCryptoBlockLUKS *luks, Error **errp)
>          return -1;
>      }
>  
> +    if (luks->header.payload_offset_sector <
> +        DIV_ROUND_UP(QCRYPTO_BLOCK_LUKS_KEY_SLOT_OFFSET,
> +                     QCRYPTO_BLOCK_LUKS_SECTOR_SIZE)) {
> +        error_setg(errp, "LUKS payload is overlapping with the header");
> +        return -1;
> +    }
> +
>      /* Check all keyslots for corruption  */
>      for (i = 0 ; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS ; i++) {
>  
> -- 
> 2.37.2

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW


