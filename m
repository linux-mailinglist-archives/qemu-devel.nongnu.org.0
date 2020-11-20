Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DD62BB099
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:32:24 +0100 (CET)
Received: from localhost ([::1]:45418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9Kh-0006az-3X
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:32:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kg9HZ-0003N6-2V
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:29:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kg9HV-0006se-Rg
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:29:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605889745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w7ag3eEMuqeF000qnLpaNENa90V4HFQNPNETPT3u/78=;
 b=QGa18V5P1y+AlFUmcMdnLuviQJTBSx217BULoi4sC7BWgPPkFIm3dtSNicL2mmoN2/SLj8
 q7QyBpLN19zF5JdCRG2SnrvUuX2ncEMJWBB32lxBBfdNUE0QgtjZnmqXmvPp9FnTbpYRK5
 X8pMB+phmv2FT5YqcnSy27HXsQLVaOg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-ji8j8m-kPHOUDRQBWRAeRg-1; Fri, 20 Nov 2020 11:29:03 -0500
X-MC-Unique: ji8j8m-kPHOUDRQBWRAeRg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 644901DDE3
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 16:29:02 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BA125D9D0;
 Fri, 20 Nov 2020 16:29:01 +0000 (UTC)
Date: Fri, 20 Nov 2020 17:28:59 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 29/29] vl: allow -incoming defer with -preconfig
Message-ID: <20201120172859.38c76056@redhat.com>
In-Reply-To: <20201027182144.3315885-30-pbonzini@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-30-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Oct 2020 14:21:44 -0400
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Now that there is no RUN_STATE_PRECONFIG anymore that can conflict with
> RUN_STATE_INMIGRATE, we can allow -incoming defer with -preconfig.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  softmmu/vl.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 98666c0612..b0cb539da9 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3199,9 +3199,8 @@ static void qemu_validate_options(void)
>                       "mutually exclusive");
>          exit(EXIT_FAILURE);
>      }
> -    if (incoming && preconfig_requested) {
> -        error_report("'preconfig' and 'incoming' options are "
> -                     "mutually exclusive");
> +    if (incoming && preconfig_requested && strcmp(incoming, "defer") != 0) {
why limit it only to 'defer'?

> +        error_report("'preconfig' supports '-incoming defer' only");
>          exit(EXIT_FAILURE);
>      }
>  


