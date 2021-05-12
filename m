Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F68937EFC9
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 01:30:34 +0200 (CEST)
Received: from localhost ([::1]:45340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgyJF-00024W-KW
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 19:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgyFj-0004xM-WD
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:26:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgyFg-00069N-47
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:26:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620862010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ynzO9GiYhb7CbHD/kThxLd3xbUn2wewZ39yuGY8GU6I=;
 b=U40Jk5DqG0gtFOAxXSw4/K7x4toWKaUFRi1BI1+AoBUUZE7ySdTQNVP1dzQXNB/sPibiCX
 RBiOKGUTLVyWwNP394SVZ2+EzlH1lxZBL0Lu+XtDUP8Vccff4mEEvapsyKqPDTGxqlTeRw
 my8QBu3hrkihA4oEG9rsrE5nmDVPiqY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-X7eOHYnzP2GohGBh835HQQ-1; Wed, 12 May 2021 19:26:48 -0400
X-MC-Unique: X7eOHYnzP2GohGBh835HQQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4C1E801817
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 23:26:47 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4797C5D9D7;
 Wed, 12 May 2021 23:26:45 +0000 (UTC)
Subject: Re: [PATCH v3 4/9] qapi: introduce IfPredicateList and IfAny
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
 <20210429134032.1125111-5-marcandre.lureau@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <d974cb2c-0f54-9c19-f973-c74cee3d192b@redhat.com>
Date: Wed, 12 May 2021 19:26:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210429134032.1125111-5-marcandre.lureau@redhat.com>
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
> Refactor IfAll class, to introduce a base class IfPredicateList and add
> IfAny for the 'any' conditions.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   scripts/qapi/common.py | 32 +++++++++++++++++++++++++++-----
>   1 file changed, 27 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> index 59a7ee2f32..102d347348 100644
> --- a/scripts/qapi/common.py
> +++ b/scripts/qapi/common.py
> @@ -224,23 +224,45 @@ def __eq__(self, other: object) -> bool:
>           return self.option == other.option
>   
>   
> -class IfAll(IfPredicate):
> +class IfPredicateList(IfPredicate):
> +    C_SEP = ""
> +    DOC_SEP = ""
> +
>       def __init__(self, pred_list: Sequence[IfPredicate]):
>           self.pred_list = pred_list
>   
>       def cgen(self) -> str:
> -        return " && ".join([p.cgen() for p in self.pred_list])
> +        sep = " " + self.C_SEP + " "
> +        gen = sep.join([p.cgen() for p in self.pred_list])
> +        if len(self.pred_list) == 1:
> +            return gen
> +        return "(%s)" % gen
>   
>       def docgen(self) -> str:
> -        return " and ".join([p.docgen() for p in self.pred_list])
> +        sep = " " + self.DOC_SEP + " "
> +        gen = sep.join([p.docgen() for p in self.pred_list])
> +        if len(self.pred_list) == 1:
> +            return gen
> +        return "(%s)" % gen
>   
>       def __bool__(self) -> bool:
>           return bool(self.pred_list)
>   
>       def __repr__(self) -> str:
> -        return f"IfAll({self.pred_list})"
> +        ty = type(self)
> +        return f"{ty.__qualname__}({self.pred_list})"
>   
>       def __eq__(self, other: object) -> bool:
> -        if not isinstance(other, IfAll):
> +        if not isinstance(other, type(self)):
>               return False
>           return self.pred_list == other.pred_list
> +
> +
> +class IfAll(IfPredicateList):
> +    C_SEP = "&&"
> +    DOC_SEP = "and"
> +
> +
> +class IfAny(IfPredicateList):
> +    C_SEP = "||"
> +    DOC_SEP = "or"
> 

I do like the way these get combined. Is there a reason it's not 
squashed into the earlier commit?

(Qualms about not having a visitor or a callback or whatever you want to 
call it remain, but I'll stop remarking on that for the rest of this 
series.)

Tested-by: John Snow <jsnow@redhat.com>


