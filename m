Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5F42C6372
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 11:53:03 +0100 (CET)
Received: from localhost ([::1]:60160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kibN8-0001D5-BV
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 05:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kibLa-000800-8S
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 05:51:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kibLW-0002BC-8G
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 05:51:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606474281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8mxRzDEPUr+92TCWxu2oMkl6T4Q6lGNmhVk/oGhJAAI=;
 b=DXELSJ8AWi5R7dDxugBEnNVWPveED/poMgdVx24XaD+f33iLcGTtMsn9GsMwGzVzdwIyLn
 c6IZcqFK8c3sDEWoTdth+ydQ1/6fuASzIXgpPUHMI62e+erNh5bBgtNe1tifP2ttNUlWAU
 eOu2zzvvTqRZMv8wd9DIzvY780gqoFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-DE8dHQlUMNKJODPhgErfLw-1; Fri, 27 Nov 2020 05:51:19 -0500
X-MC-Unique: DE8dHQlUMNKJODPhgErfLw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93E441DE0E
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 10:51:18 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACA2C18993;
 Fri, 27 Nov 2020 10:51:17 +0000 (UTC)
Date: Fri, 27 Nov 2020 11:51:15 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 28/36] vl: allow -incoming defer with -preconfig
Message-ID: <20201127115115.3272c411@redhat.com>
In-Reply-To: <20201123141435.2726558-29-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
 <20201123141435.2726558-29-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

On Mon, 23 Nov 2020 09:14:27 -0500
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Now that there is no RUN_STATE_PRECONFIG anymore that can conflict with
> RUN_STATE_INMIGRATE, we can allow -incoming defer with -preconfig.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  softmmu/vl.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index aa11fc4871..0ba1fcdb3d 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3200,9 +3200,8 @@ static void qemu_validate_options(void)
>                       "mutually exclusive");
>          exit(EXIT_FAILURE);
>      }
> -    if (incoming && preconfig_requested) {
> -        error_report("'preconfig' and 'incoming' options are "
> -                     "mutually exclusive");
> +    if (incoming && preconfig_requested && strcmp(incoming, "defer") != 0) {
> +        error_report("'preconfig' supports '-incoming defer' only");
>          exit(EXIT_FAILURE);
>      }
>  


