Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85414C4D1E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 19:00:35 +0100 (CET)
Received: from localhost ([::1]:59070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNetO-0004H4-DV
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 13:00:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nNebY-0008Kd-EX
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:42:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nNebT-0002Kx-20
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:42:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645810921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SC+ucLUfXaGhchboy+1AqsW7NTjl9ezR4/vHjEJptGY=;
 b=Algc4z++Ufo2Di1m8SLORlcZxDjHYLOlqgEEDzz1W9u2cxaPI68R3GllekCwc+Piw0iICf
 eFFVw2Jim2GUkkZFOrqCe3K+HryAIfbUGSojfDJI9a7FcoWLJJPcz3WyV4A2Xfdqf24BaR
 KTWWTZb0xXVd2ow6fX8KLuFGBwZcSyQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-9_FSsN_fNk2XPS04yZzvnQ-1; Fri, 25 Feb 2022 12:41:59 -0500
X-MC-Unique: 9_FSsN_fNk2XPS04yZzvnQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B34680D6A7
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 17:41:59 +0000 (UTC)
Received: from paraplu (unknown [10.39.192.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 250408000C;
 Fri, 25 Feb 2022 17:41:51 +0000 (UTC)
Date: Fri, 25 Feb 2022 18:41:49 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH] scripts/qmp-shell-wrap: Fix import path
Message-ID: <YhkU3ViX30GRjfHZ@paraplu>
References: <20220225170828.3418305-1-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220225170828.3418305-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 12:08:28PM -0500, John Snow wrote:
> Mea culpa. Dan's patch wound up with the wrong import path because I
> re-ordered my most recent pull request and missed that this needed a fix
> on rebase.
> 
> Fixes: 43912529
> Reported-by: Kashyap Chamarthy <kchamart@redhat.com>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qmp/qmp-shell-wrap | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/qmp/qmp-shell-wrap b/scripts/qmp/qmp-shell-wrap
> index 9e94da114f..66846e36d1 100755
> --- a/scripts/qmp/qmp-shell-wrap
> +++ b/scripts/qmp/qmp-shell-wrap
> @@ -4,7 +4,7 @@ import os
>  import sys
>  
>  sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
> -from qemu.qmp import qmp_shell
> +from qemu.aqmp import qmp_shell
>  
>  
>  if __name__ == '__main__':

Works for me; thank you.

Tested-by: Kashyap Chamarthy <kchamart@redhat.com>  

> -- 
> 2.34.1
> 

-- 
/kashyap


