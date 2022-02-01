Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13524A6052
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 16:43:32 +0100 (CET)
Received: from localhost ([::1]:42692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEvJb-00007x-Sx
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 10:43:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEsl6-0003ng-P9
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 07:59:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEsl4-0004h7-4Z
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 07:59:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643720380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PLHlYVsCAvye/GUh+667pfBpHMsw/XofDNK3Q9gk9CE=;
 b=LDdUEoG2LluR5Dx9mu+GPE+Aim7YwOVzXuIlBjJusbMFA9ePw8nhgtwIO5dRVU0ceckLrt
 OiMcouF2AT8Lwii52n9hYNpTESba75PwYgsepFdB/cLdSNPH65GwNVvynq/l1CeMdgQy2Y
 kP/A2naK1Z6VnyKetF7yrEaQ9Dld7+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-tfGGmt3pPtuzNtGJJLBnvw-1; Tue, 01 Feb 2022 07:59:37 -0500
X-MC-Unique: tfGGmt3pPtuzNtGJJLBnvw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56DF419251A0;
 Tue,  1 Feb 2022 12:59:36 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E9177D3F4;
 Tue,  1 Feb 2022 12:59:26 +0000 (UTC)
Date: Tue, 1 Feb 2022 13:59:25 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 1/4] python/aqmp: Fix negotiation with pre-"oob" QEMU
Message-ID: <YfkurVhVj0L0Il1p@redhat.com>
References: <20220201041134.1237016-1-jsnow@redhat.com>
 <20220201041134.1237016-2-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220201041134.1237016-2-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.02.2022 um 05:11 hat John Snow geschrieben:
> QEMU versions prior to the "oob" capability *also* can't accept the
> "enable" keyword argument at all. Fix the handshake process with older
> QEMU versions.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  python/qemu/aqmp/qmp_client.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/aqmp/qmp_client.py
> index f1a845cc82..90a8737f03 100644
> --- a/python/qemu/aqmp/qmp_client.py
> +++ b/python/qemu/aqmp/qmp_client.py
> @@ -292,9 +292,9 @@ async def _negotiate(self) -> None:
>          """
>          self.logger.debug("Negotiating capabilities ...")
>  
> -        arguments: Dict[str, List[str]] = {'enable': []}
> +        arguments: Dict[str, List[str]] = {}
>          if self._greeting and 'oob' in self._greeting.QMP.capabilities:
> -            arguments['enable'].append('oob')
> +            arguments.setdefault('enable', []).append('oob')
>          msg = self.make_execute_msg('qmp_capabilities', arguments=arguments)

In case you have some interest in bike sheds:

As long as we only ever append a single capability, it doesn't really
make a difference and an explicit setdefault() when adding it is fine.
But if we had more than one, maybe making arguments a defaultdict(list)
would be nicer.

Not worth respinning, of course, if you don't for another reason.

Kevin


