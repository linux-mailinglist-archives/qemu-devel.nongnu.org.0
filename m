Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C964349CF9
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 00:39:19 +0100 (CET)
Received: from localhost ([::1]:33702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPZZN-00075A-Ov
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 19:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPZXf-0006c0-VN
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 19:37:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPZXd-0006H3-6N
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 19:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616715447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hiy7feR1O/+h/saGnnm/VHUJABic/lSYTgaXTZlhnWo=;
 b=ZVgBSH/qlzZ54p0uHWPPx0Xe7ggUstZmzfonlJe7w8gvYmUaA+D9RGXehEGp4gNOWvqoZf
 qo4znt93sWEpqCN4QCTWwkPKWw11RIvCV+P9pYOeUiul82bVgszyo9wSZ6+WGdDQltHZMR
 591lmX0M1tEYciUflQCwAfUTggxnF9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-bKJ6I0WNOU-93VmCsgjiyg-1; Thu, 25 Mar 2021 19:37:23 -0400
X-MC-Unique: bKJ6I0WNOU-93VmCsgjiyg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABC3410AF386;
 Thu, 25 Mar 2021 23:37:22 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02BF55D6D5;
 Thu, 25 Mar 2021 23:37:21 +0000 (UTC)
Subject: Re: [PATCH v4 11/19] qapi/expr.py: Modify check_keys to accept any
 Collection
To: Markus Armbruster <armbru@redhat.com>
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-12-jsnow@redhat.com>
 <87im5fs35b.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <437af1a2-f4f5-1341-6b96-cf10503db1da@redhat.com>
Date: Thu, 25 Mar 2021 19:37:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87im5fs35b.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 10:45 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> This is a minor adjustment that allows the 'required' and 'optional'
>> keys fields to take a default value of an empty, immutable sequence (the
>> empty tuple).
>>
>> This reveals a quirk of this function, which is that "a + b" is
>> list-specific behavior. We can accept a wider variety of types if we
>> avoid that behavior. Using Collection allows us to accept things like
>> lists, tuples, sets, and so on.
>>
>> (Iterable would also have worked, but Iterable also includes things like
>> generator expressions which are consumed upon iteration, which would
>> require a rewrite to make sure that each input was only traversed once.)
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
> 
> The commit message confused me briefly, until I realized v3 of this
> patch came later in the series, where it modified check_keys() type
> hints and added default values.
> 
> What about this:
> 
>    This is a minor adjustment that lets parameters @required and
>    @optional take tuple arguments, in particular ().  Later patches will
>    make use of that.
> 

OK


