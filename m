Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86EC3245A6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 22:18:23 +0100 (CET)
Received: from localhost ([::1]:49794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF1Y6-0004M2-8C
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 16:18:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lF1Vk-0003TQ-C5
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 16:15:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lF1Vf-0006Oa-Qh
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 16:15:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614201347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pGCDwB3DW3VPoWU4mPPc9WdHBtgejJ7RnAYwBTRx6IY=;
 b=Gbc2n9fZ/Man7CzKsRtHwL5SZBgOJ2YNjnO2d12kmUVw98Oh8AkjJSc3irqUEhQuFriWbd
 6o8kO7hVWA+9M//gqwEz96KxV6Czt7tI/FMZGwR1vhNYXYqoa7/gEAzjDMWoi2FcRD2pwq
 V59Uy7shs8L1BUF7w9LJGQUf9UKagIA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-tH4BJhoCOte3q6I1HGbm8g-1; Wed, 24 Feb 2021 16:15:45 -0500
X-MC-Unique: tH4BJhoCOte3q6I1HGbm8g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A86901E56B;
 Wed, 24 Feb 2021 21:15:44 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7709D60C91;
 Wed, 24 Feb 2021 21:15:43 +0000 (UTC)
Subject: Re: [PATCH] qapi: Fix parse errors for removal of null from schema
 language
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210224101442.1837475-1-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <1d60d007-c8b8-923b-58a3-82543c770b7d@redhat.com>
Date: Wed, 24 Feb 2021 16:15:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224101442.1837475-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: michael.roth@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 5:14 AM, Markus Armbruster wrote:
> Commit 9d55380b5a "qapi: Remove null from schema language" (v4.2.0)
> neglected to update two error messages.  Do that now.
> 

One less patch in part 5.

Reviewed-by: John Snow <jsnow@redhat.com>

> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   scripts/qapi/parser.py                    | 8 ++++----
>   tests/qapi-schema/leading-comma-list.err  | 2 +-
>   tests/qapi-schema/trailing-comma-list.err | 2 +-
>   3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> index e7b9d670ad..116afe549a 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py
> @@ -236,9 +236,9 @@ def get_values(self):
>           if self.tok == ']':
>               self.accept()
>               return expr
> -        if self.tok not in "{['tfn":
> +        if self.tok not in "{['tf":
>               raise QAPIParseError(
> -                self, "expected '{', '[', ']', string, boolean or 'null'")
> +                self, "expected '{', '[', ']', string, or boolean")
>           while True:
>               expr.append(self.get_expr(True))
>               if self.tok == ']':
> @@ -257,12 +257,12 @@ def get_expr(self, nested):
>           elif self.tok == '[':
>               self.accept()
>               expr = self.get_values()
> -        elif self.tok in "'tfn":
> +        elif self.tok in "'tf":
>               expr = self.val
>               self.accept()
>           else:
>               raise QAPIParseError(
> -                self, "expected '{', '[', string, boolean or 'null'")
> +                self, "expected '{', '[', string, or boolean")
>           return expr
>   
>       def get_doc(self, info):
> diff --git a/tests/qapi-schema/leading-comma-list.err b/tests/qapi-schema/leading-comma-list.err
> index 76eed2b5b3..0725d6529f 100644
> --- a/tests/qapi-schema/leading-comma-list.err
> +++ b/tests/qapi-schema/leading-comma-list.err
> @@ -1 +1 @@
> -leading-comma-list.json:2:13: expected '{', '[', ']', string, boolean or 'null'
> +leading-comma-list.json:2:13: expected '{', '[', ']', string, or boolean
> diff --git a/tests/qapi-schema/trailing-comma-list.err b/tests/qapi-schema/trailing-comma-list.err
> index ad2f2d7c97..bb5f8c3c90 100644
> --- a/tests/qapi-schema/trailing-comma-list.err
> +++ b/tests/qapi-schema/trailing-comma-list.err
> @@ -1 +1 @@
> -trailing-comma-list.json:2:36: expected '{', '[', string, boolean or 'null'
> +trailing-comma-list.json:2:36: expected '{', '[', string, or boolean
> 


