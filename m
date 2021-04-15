Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93C03602E9
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 09:02:43 +0200 (CEST)
Received: from localhost ([::1]:45156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWw1S-0002Do-HB
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 03:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWvzx-0001hy-KF
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 03:01:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWvzt-0003OW-G6
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 03:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618470063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6aCYtcEHu+Hy3kbg68qhg3RgmW6MbsX6bLuHuelOcVY=;
 b=Ui4mN6Ft9fW5sCKW1+c/P7pndEa3QiGha0IbOWqoY2HUWoQle6nhpVh4M58nhF0erQzfkT
 X+YTNdJZPzRnepYavmKja2tFao4y5whQZGMwVeUXv3Yu1zlaIS+nTKup+ocpQdItMmkJnx
 VG5mTN/PanicXFgtpnH5m11JNKnU0CA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-9VJkhQ7fNgK4-HX2fQrf3w-1; Thu, 15 Apr 2021 03:01:01 -0400
X-MC-Unique: 9VJkhQ7fNgK4-HX2fQrf3w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 342BF1883522;
 Thu, 15 Apr 2021 07:01:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAAB65D9DE;
 Thu, 15 Apr 2021 07:00:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5E5F9113525D; Thu, 15 Apr 2021 09:00:58 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 4/8] qapi/error: Change assertion
References: <20210330171844.1197918-1-jsnow@redhat.com>
 <20210330171844.1197918-5-jsnow@redhat.com>
 <e760661b-0c3f-bb9b-0b4d-6c5ff77cfd70@redhat.com>
Date: Thu, 15 Apr 2021 09:00:58 +0200
In-Reply-To: <e760661b-0c3f-bb9b-0b4d-6c5ff77cfd70@redhat.com> (John Snow's
 message of "Thu, 8 Apr 2021 11:31:25 -0400")
Message-ID: <87blagghg5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 3/30/21 1:18 PM, John Snow wrote:
>
> Realizing now that this commit topic is wrong :)
>
> A prior version modified the assertion, I decided it was less churn to 
> simply add one.
>
> I think ideally we'd have no assertions here and we'd rely on the type 
> hints, but I don't think I can prove that this is safe until after part 
> 6, so I did this for now instead.
>
>> Eventually, we'll be able to prove that 'info.line' must be an int and
>> is never None at static analysis time, and this assert can go
>> away. Until then, it's a type error to assume that self.info is not
>> None.
>> 
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/error.py | 1 +
>>   1 file changed, 1 insertion(+)
>> 
>> diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
>> index d179a3bd0c..d0bc7af6e7 100644
>> --- a/scripts/qapi/error.py
>> +++ b/scripts/qapi/error.py
>> @@ -25,6 +25,7 @@ def __init__(self, info, msg, col=None):
>>           self.col = col
>>   
>>       def __str__(self):
>> +        assert self.info is not None
>>           loc = str(self.info)
>>           if self.col is not None:
>>               assert self.info.line is not None
>> 

Please show us the revised commit message.  I'm asking because the
patch's purpose isn't quite clear to me.  Peeking ahead at PATCH 7, I
see that info becomes Optional[QAPISourceInfo].  This means something
passes None for info (else you wouldn't make it optional).  None info
Works (in the sense of "doesn't crash") as long as col is also None.
After the patch, it doesn't.  I'm not saying that's bad, only that I
don't quite understand what you're trying to accomplish here.


