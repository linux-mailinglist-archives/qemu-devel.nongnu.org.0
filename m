Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A712D16CA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 17:51:53 +0100 (CET)
Received: from localhost ([::1]:59874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmJjs-0000gx-EY
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 11:51:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmJdZ-0004NA-Ls
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:45:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmJdY-0000aq-4K
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:45:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607359519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OWtvgzAknc+9+JtbYR+phbUUfNLaild05pMz1UGfFUw=;
 b=UQ9mRupq9jA+cJl1yY998Nq2L4BQb7pfFKKOIdMAj/jnKers75U04tpDfnTSmygE6hW3pM
 1+bb1JoboCEU7btkK2tKyYrFsbeOfbw3f99Wjd1cGocfrVScDpeOB+WwY6wa1nReevDEpS
 qVUNXhAUGkYRofW1P7Ex5MPaySWRbRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-ztS9iXrwMn-eQETL-AJ5Bg-1; Mon, 07 Dec 2020 11:45:17 -0500
X-MC-Unique: ztS9iXrwMn-eQETL-AJ5Bg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9217E9CDA3
 for <qemu-devel@nongnu.org>; Mon,  7 Dec 2020 16:45:16 +0000 (UTC)
Received: from localhost (unknown [10.40.208.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A92345C1A1;
 Mon,  7 Dec 2020 16:45:15 +0000 (UTC)
Date: Mon, 7 Dec 2020 17:45:14 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 15/15] monitor: allow quitting while in preconfig state
Message-ID: <20201207174514.71fb9e37@redhat.com>
In-Reply-To: <20201202081854.4126071-16-pbonzini@redhat.com>
References: <20201202081854.4126071-1-pbonzini@redhat.com>
 <20201202081854.4126071-16-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed,  2 Dec 2020 03:18:54 -0500
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hmp-commands.hx   | 1 +
>  qapi/control.json | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index ff2d7aa8f3..d192afa652 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -45,6 +45,7 @@ ERST
>          .params     = "",
>          .help       = "quit the emulator",
>          .cmd        = hmp_quit,
> +        .flags      = "p",
>      },
>  
>  SRST
> diff --git a/qapi/control.json b/qapi/control.json
> index 134f842baf..1ebc450aad 100644
> --- a/qapi/control.json
> +++ b/qapi/control.json
> @@ -219,7 +219,8 @@
>  # -> { "execute": "quit" }
>  # <- { "return": {} }
>  ##
> -{ 'command': 'quit' }
> +{ 'command': 'quit',
> +  'allow-preconfig': true }
>  
>  ##
>  # @MonitorMode:


