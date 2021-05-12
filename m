Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3295E37EFCA
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 01:34:41 +0200 (CEST)
Received: from localhost ([::1]:48734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgyNE-0004eQ-85
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 19:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgyLr-0003xQ-9L
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:33:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgyLo-0001bY-8O
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:33:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620862390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=snJJPYX8VKL63Bb2CNcI5IcQDuPwFGhoDL4TTnVeyvc=;
 b=eVPQ8VU3+9P/qSBJ/9MVRldi53I/9ah+NkVaqmcX+8fTin+2avUWQR66qG5TyXUVU49NMi
 wtCQbvodlNYMkN39CvSCdvXInlR83BFDnekx3uWmQqXEsNqDVz88h7aPDYUP1ac8YCMcOc
 9TcDGNy70tqg+EqiSBPDt5fbP9hT6cs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-vNrNYyYDOt67MlenNHYnTw-1; Wed, 12 May 2021 19:33:08 -0400
X-MC-Unique: vNrNYyYDOt67MlenNHYnTw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 447441007467
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 23:33:07 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5CA75D9D7;
 Wed, 12 May 2021 23:32:59 +0000 (UTC)
Subject: Re: [PATCH v3 5/9] qapi: add IfNot
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
 <20210429134032.1125111-6-marcandre.lureau@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <3c15973f-e049-c046-b657-88b586e88529@redhat.com>
Date: Wed, 12 May 2021 19:32:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210429134032.1125111-6-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 9:40 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Introduce IfNot predicate class, for 'not' condition expressions.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   scripts/qapi/common.py | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> index 102d347348..6236bfc457 100644
> --- a/scripts/qapi/common.py
> +++ b/scripts/qapi/common.py
> @@ -224,6 +224,28 @@ def __eq__(self, other: object) -> bool:
>           return self.option == other.option
>   
>   
> +class IfNot(IfPredicate):
> +    def __init__(self, pred: IfPredicate):
> +        self.pred = pred
> +
> +    def docgen(self) -> str:
> +        return "not " + self.pred.docgen()
> +
> +    def cgen(self) -> str:
> +        return "!" + self.pred.cgen()
> +
> +    def __bool__(self) -> bool:
> +        return bool(self.pred)
> +
> +    def __repr__(self) -> str:
> +        return f"IfNot({self.pred!r})"
> +
> +    def __eq__(self, other: object) -> bool:
> +        if not isinstance(other, type(self)):
> +            return False
> +        return self.pred == other.pred
> +
> +

Seems fine. Lot of boilerplate going on, but I don't have quick ideas 
for reducing it.

So far we have:

IfPredicate (abstract)

IfOption (wraps a <str>)
IfNot (wraps <IfPredicate>)
IfPredicateList (wraps <List[IfPredicate]>)
   - IfAll
   - IfAny

with fairly similar methods and boilerplate. I'm itching to reduce it a 
little, somehow...

--js

>   class IfPredicateList(IfPredicate):
>       C_SEP = ""
>       DOC_SEP = ""
> 

Tested-by: John Snow <jsnow@redhat.com>


