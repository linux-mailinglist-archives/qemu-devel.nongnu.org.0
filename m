Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0D3544C9E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 14:52:17 +0200 (CEST)
Received: from localhost ([::1]:34408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHe2-0002Vw-Pv
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 08:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzF7A-0006F8-R3
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:10:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzF79-0007Pf-2D
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:10:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654769406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=poq99EVIsEAnGhH1RByOMe+7V3heirglEzIXUOIHxf8=;
 b=XJbb7cLA+mbmEmjGEaVJrZVGjOk/LpDGLjtkxlrx7+2e0iGVH1+GD2AKadEf6bGU0kGhSV
 M6640SmubO1AVT1najJOMhJHvorojPqTBVwNwyU6kjoFdkfGUn6K9M4tRPN8r1Ba0zcHTE
 NhLQtPqhoOyk2PA7nhMyG/NPMObE51E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-JxZApfiXPLaUkLqOAdYB-A-1; Thu, 09 Jun 2022 06:10:03 -0400
X-MC-Unique: JxZApfiXPLaUkLqOAdYB-A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB09886F154;
 Thu,  9 Jun 2022 10:09:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80D6A456CD5;
 Thu,  9 Jun 2022 10:09:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2C67B1800094; Thu,  9 Jun 2022 12:09:55 +0200 (CEST)
Date: Thu, 9 Jun 2022 12:09:55 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Arnout Engelen <arnout@bzzt.net>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/usb/hcd-ehci.c: print diagnostics when cpage out of
 range
Message-ID: <20220609100955.ybq55nbapi2ach47@sirius.home.kraxel.org>
References: <20220430082556.271627-1-arnout@bzzt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220430082556.271627-1-arnout@bzzt.net>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

  Hi,

>          if (cpage > 4) {
>              fprintf(stderr, "cpage out of range (%u)\n", cpage);
> +            bytes  = get_field(p->qtd.token, QTD_TOKEN_TBYTES);
> +            offset = p->qtd.bufptr[0] & ~QTD_BUFPTR_MASK;
> +            cpage  = get_field(p->qtd.token, QTD_TOKEN_CPAGE);
> +            fprintf(stderr, "reading %u bytes from offset %u at page %u\n",
> +                    bytes, offset, cpage);

I think we should either drop it (you've successfully debugged the
problem meanwhile, thanks for that), or turn it into a tracepoint.
Simply printing to stderr is deprecated.

take care,
  Gerd


