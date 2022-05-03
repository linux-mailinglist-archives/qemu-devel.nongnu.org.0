Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D25F518041
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 10:56:33 +0200 (CEST)
Received: from localhost ([::1]:52810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nloKd-0003rR-PD
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 04:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nlo9B-00077d-PJ
 for qemu-devel@nongnu.org; Tue, 03 May 2022 04:44:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nlo9A-0004Rx-AX
 for qemu-devel@nongnu.org; Tue, 03 May 2022 04:44:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651567479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=or+Y8jQY+EKc6x2y/8xFEqoIpt2PJf5PRkfZv/pqe6I=;
 b=SQD4tMutTig0hbhcuvgwgtb9/55IF3nvyVjBiF+w2pTAvJFpiowCOIu9BkiaZgztJVzXqc
 kEDV8Y9G/a8RyLX5bRaA6Pw985Ac67YjcjaMyxHEfCiYtIWLcIC3QGUIb77gwVEq2XEcpg
 erAMhapV031h5vf4eiLA1pzIGtwEpps=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-2X2GRWpNOPS256yhYs8tOw-1; Tue, 03 May 2022 04:44:38 -0400
X-MC-Unique: 2X2GRWpNOPS256yhYs8tOw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F42829ABA17
 for <qemu-devel@nongnu.org>; Tue,  3 May 2022 08:44:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BF13400F736;
 Tue,  3 May 2022 08:44:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1AC3821E68BC; Tue,  3 May 2022 10:44:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH] qapi: Fix incorrect Since tags
References: <20220503082748.89847-1-abologna@redhat.com>
Date: Tue, 03 May 2022 10:44:37 +0200
In-Reply-To: <20220503082748.89847-1-abologna@redhat.com> (Andrea Bolognani's
 message of "Tue, 3 May 2022 10:27:48 +0200")
Message-ID: <874k27dmyy.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

Andrea Bolognani <abologna@redhat.com> writes:

> The missing colon causes them to be interpreted as regular
> text.
>
> Signed-off-by: Andrea Bolognani <abologna@redhat.com>
> ---
>  qapi/crypto.json | 2 +-
>  qapi/misc.json   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/crypto.json b/qapi/crypto.json
> index 1ec54c15ca..529aa730d4 100644
> --- a/qapi/crypto.json
> +++ b/qapi/crypto.json
> @@ -358,7 +358,7 @@
>  #                 Defaults to the same secret that was used to open the image
>  #
>  #
> -# Since 5.1
> +# Since: 5.1
>  ##
>  { 'struct': 'QCryptoBlockAmendOptionsLUKS',
>    'data': { 'state': 'QCryptoBlockLUKSKeyslotState',
> diff --git a/qapi/misc.json b/qapi/misc.json
> index b83cc39029..f8a9feda30 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -188,7 +188,7 @@
>  # Features:
>  # @unstable: This command is experimental.
>  #
> -# Since 3.0
> +# Since: 3.0
>  #
>  # Returns: nothing
>  #

I posted a more complete fix as "[PATCH] qapi: Fix malformed "Since:"
section tags", and you even reviewed it :)

Thanks anyway!


