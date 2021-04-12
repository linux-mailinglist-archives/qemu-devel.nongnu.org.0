Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A6D35C8E1
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 16:37:29 +0200 (CEST)
Received: from localhost ([::1]:38114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVxgu-0007Yh-K2
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 10:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lVxfV-0006EE-CO
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:36:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lVxfT-0008Vd-J0
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:36:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618238158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y8gKvvBxNfNQoT8lNw+LG0FKSctN8XPq9iYmjYzvPr0=;
 b=PNYhbURYq3oK1bSQ5MMi+/a/aY2ISSmvrxTydWJBaSh9ToKgACNGS0nxYDRMpnl5eYmoRU
 6DAq9VwwrlhASncSuXgc/vr5SI7iAW6Dh/ZcGeBp26XG3uyl1M/SMczdXuIer/wR/gJj5a
 DOU+kPCs6SwQg22g8g2VcGvAOBWeRkw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-oJXNfjogN4mywZHcMhWgvg-1; Mon, 12 Apr 2021 10:35:56 -0400
X-MC-Unique: oJXNfjogN4mywZHcMhWgvg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE7DE802B56;
 Mon, 12 Apr 2021 14:35:54 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BBFD5C1C2;
 Mon, 12 Apr 2021 14:35:52 +0000 (UTC)
Subject: Re: [PATCH v2] libqtest: refuse QTEST_QEMU_BINARY=qemu-kvm
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210412091824.707855-1-stefanha@redhat.com>
 <942ea12a-d187-9533-eba6-298c4eb7d82d@redhat.com>
 <YHRXXK7RxglGt+zE@stefanha-x1.localdomain>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <eff32f8e-766f-f54f-741b-c4cdfe7afad0@redhat.com>
Date: Mon, 12 Apr 2021 16:35:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHRXXK7RxglGt+zE@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Qin Wang <qinwang@rehdat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/04/2021 16.21, Stefan Hajnoczi wrote:
> On Mon, Apr 12, 2021 at 11:35:40AM +0200, Thomas Huth wrote:
>> On 12/04/2021 11.18, Stefan Hajnoczi wrote:
>>> Some downstreams rename the QEMU binary to "qemu-kvm". This breaks
>>> qtest_get_arch(), which attempts to parse the target architecture from
>>> the QTEST_QEMU_BINARY environment variable.
>>>
>>> Print an error instead of returning the architecture "kvm". Things fail
>>> in weird ways when the architecture string is bogus.
>>>
>>> Arguably qtests should always be run in a build directory instead of
>>> against an installed QEMU. In any case, printing a clear error when this
>>> happens is helpful.
>>>
>>> Reported-by: Qin Wang <qinwang@rehdat.com>
>>> Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>>    tests/qtest/libqtest.c | 10 ++++++++++
>>>    1 file changed, 10 insertions(+)
>>>
>>> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
>>> index 71e359efcd..7caf20f56b 100644
>>> --- a/tests/qtest/libqtest.c
>>> +++ b/tests/qtest/libqtest.c
>>> @@ -910,6 +910,16 @@ const char *qtest_get_arch(void)
>>>            abort();
>>>        }
>>> +    if (!strstr(qemu, "-system-")) {
>>> +        fprintf(stderr, "QTEST_QEMU_BINARY must end with *-system-<arch> where "
>>> +                        "'arch' is the target architecture (x86_64, aarch64, "
>>> +                        "etc). If you are using qemu-kvm or another custom "
>>> +                        "name, please create a symlink like ln -s "
>>> +                        "path/to/qemu-kvm qemu-system-x86_64 and use that "
>>> +                        "instead.\n");
>>
>> The text is very long ... maybe add some \n to wrap it after 80 columns?
>> (also not sure whether we really need the second part about the symlink...
>> but I also don't mind leaving it in)
>>
>>> +        abort();
>>
>> Since this can be triggered by the user, I'd rather use exit(1) instead,
>> what do you think?
> 
> Sure, but in that case I guess the abort() call above also needs to be
> changed? It is triggered when the QTEST_QEMU_BINARY path does not
> contain a hyphen ('-') and it currently aborts.

Drat, you're right, and it was even me who added that :-/ ... if you've got 
some spare minutes, could you send a patch for that, too, please? (Otherwise 
I'll do it later)

  Thomas


