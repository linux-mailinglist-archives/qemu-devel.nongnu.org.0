Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D222213C77
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 17:21:30 +0200 (CEST)
Received: from localhost ([::1]:55456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrNVJ-0007ix-B5
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 11:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jrNTs-0006YI-EC
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 11:20:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50492
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jrNTq-0004MD-Rj
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 11:20:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593789598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=s40v7PfWoXuPDmf2b/ptBLAUu5GdeQAAkss0IkmF7RE=;
 b=XM6NEsVTnJnEgPA+S1o381+EwMcPJpHMRgbvP4sZUof914YBEKtE4K/9J7C5VsHv/6dS2B
 KsXQaYPZJUzwjybHfo11GpPYWQNix3sJRbMQxnT4OSdctAMWtzxI7dNfj3K00yN2grtZx2
 YwqT8wPLDW8h1sw13MaNRxoq5BsnmaE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-X_j70FPOO92d3-zLZ3ms2A-1; Fri, 03 Jul 2020 11:19:54 -0400
X-MC-Unique: X_j70FPOO92d3-zLZ3ms2A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DAAE1883625;
 Fri,  3 Jul 2020 15:19:53 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 657DA71682;
 Fri,  3 Jul 2020 15:19:45 +0000 (UTC)
Subject: Re: [PATCH v3 7/9] util/compatfd.c: Only include <sys/syscall.h> if
 CONFIG_SIGNALFD
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20200703145614.16684-1-peter.maydell@linaro.org>
 <20200703145614.16684-8-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <7df5f560-42bd-c49a-e574-b432ddae3666@redhat.com>
Date: Fri, 3 Jul 2020 17:19:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200703145614.16684-8-peter.maydell@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 03:38:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: David Carlier <devnexen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/07/2020 16.56, Peter Maydell wrote:
> From: David CARLIER <devnexen@gmail.com>
> 
> util/compatfd.c includes <sys/syscall.h> so that the CONFIG_SIGNALFD
> code can use SYS_signalfd. Guard the #include with CONFIG_SIGNALFD
> to avoid portability issues on hosts like Haiku which do not
> provide that header file.
> 
> Signed-off-by: David Carlier <devnexen@gmail.com>
> [PMM: Expanded commit message]
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  util/compatfd.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/util/compatfd.c b/util/compatfd.c
> index c296f55d148..ee47dd80897 100644
> --- a/util/compatfd.c
> +++ b/util/compatfd.c
> @@ -16,7 +16,9 @@
>  #include "qemu/osdep.h"
>  #include "qemu/thread.h"
>  
> +#if defined(CONFIG_SIGNALFD)
>  #include <sys/syscall.h>
> +#endif
>  
>  struct sigfd_compat_info
>  {

Reviewed-by: Thomas Huth <thuth@redhat.com>


