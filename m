Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7752A27F160
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 20:34:47 +0200 (CEST)
Received: from localhost ([::1]:52472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNgw9-0004Ej-VK
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 14:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNguR-0003X4-B7
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 14:32:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNguP-0000XW-Ml
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 14:32:59 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601490777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pPpQHy9mDtXdJFY/D3gNyEhkrzWV9LvVi4U/CuOoVOY=;
 b=WgxRGb8rVzQ09eBNR/pc7WlOy8gZMysmhIB5O84RjMRYYQxUcK2VSNfRxYq9spCUiYoQjc
 RGHGP9mOjCAnmJGBz4ZBoxs8nrUZNML/8yuy7m+HOTRHU+jDDKb4HOvU9bnDkNYtjg75qk
 loI8ULLlkcURV6tFp/ScA02UHwo67yM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-0eEIQlLsNlqxm8x9nLrYYQ-1; Wed, 30 Sep 2020 14:32:54 -0400
X-MC-Unique: 0eEIQlLsNlqxm8x9nLrYYQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1067C80ED9A;
 Wed, 30 Sep 2020 18:32:53 +0000 (UTC)
Received: from [10.10.119.140] (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78D775D9D3;
 Wed, 30 Sep 2020 18:32:49 +0000 (UTC)
Subject: Re: [PATCH v4 39/46] qapi/introspect.py: Unify return type of
 _make_tree()
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20200930043150.1454766-1-jsnow@redhat.com>
 <20200930043150.1454766-40-jsnow@redhat.com>
 <20200930182408.GV3717385@habkost.net>
From: John Snow <jsnow@redhat.com>
Message-ID: <20fa2354-e65b-0849-78e1-687a248b329b@redhat.com>
Date: Wed, 30 Sep 2020 14:32:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200930182408.GV3717385@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:26:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/30/20 2:24 PM, Eduardo Habkost wrote:
> On Wed, Sep 30, 2020 at 12:31:43AM -0400, John Snow wrote:
>> Returning a *something* or a Tuple of *something* is hard to accurately
>> type. Let's just always return a tuple for structural consistency.
>>
>> Instances of the 'TreeNode' type can be replaced with the slightly more
>> specific 'AnnotatedNode' type.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
> 
> So, the only place where this seems to make a difference is
> _tree_to_qlit().
> 
> We just need to prove that
>    _tree_to_qlit(o, ...)
> will have exactly the same result as
>    _tree_to_qlit((o, None), ...).
> 
> For reference, this is the beginning of _tree_to_qlit():
> 
> | def _tree_to_qlit(obj: TreeNode,
> |                   level: int = 0,
> |                   suppress_first_indent: bool = False) -> str:
> |
> |     def indent(level: int) -> str:
> |         return level * 4 * ' '
> |
> |     if isinstance(obj, tuple):
> |         ifobj, extra = obj
> 
> `obj` is the return value of _make_tree()
> 
> `ifobj` is the original `obj` argument to _make_tree().
> 
> |         ifcond = extra.get('if')
> 
> ifcond will be None.
> 
> |         comment = extra.get('comment')
> 
> comment will be None
> 
> |         ret = ''
> |         if comment:
> |             ret += indent(level) + '/* %s */\n' % comment
> 
> nop
> 
> |         if ifcond:
> |             ret += gen_if(ifcond)
> 
> nop
> 
> |         ret += _tree_to_qlit(ifobj, level)
> 
> ret will be '', so this is equivalent to:
> 
>    ret = _tree_to_qlit(ifobj, level)
> 
> which is almost good.
> 
> The only difference seems to that suppress_first_indent=True will
> be ignored.  We should pass suppress_first_indent as argument in
> the recursive call above, just in case.
> 

This is a really good spot, and I indeed hadn't considered it at all 
when I did this.

(I simply made the change and observed it worked just fine!)

> The existing code will behave weirdly if there are comments or
> conditions and suppress_first_indent=True, but I suggest we try
> to address this issue later.
> 
> |         if ifcond:
> |             ret += '\n' + gen_endif(ifcond)
> 
> nop
> 
> |         return ret
> 

Hm, yes, it's a hypothetical case, but perhaps we can use an assertion 
to help guard against it if development creates that case later by accident.

That ought to be good enough for now to not waste time accommodating a 
(presently) fictional circumstance?

Thanks for the good sleuthing here.

--js


