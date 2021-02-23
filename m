Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7027322987
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 12:34:24 +0100 (CET)
Received: from localhost ([::1]:40522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEVxP-0003aE-Mn
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 06:34:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEVwG-0002YT-T0
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:33:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEVwF-0007f8-3x
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:33:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614079990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=syDsQho4IHX9F8BHNatwacJ/qpLTQrnr8JiN8KEm3sI=;
 b=fj313HkdiWOeexeVBCTCtS5vMl/S8ZNWRRZYI+66xXCaoIcAerAZe+qe+4eeGSE+4lgd0g
 XnR4Pt28yrayPRl5KDuqXHaKUy3EIgZgEvvM9MueHDT8HXkFZFlW8BLUTSX9pXzh9zvc+P
 AKqf0PTzsLzf8kPyU7yK8hdK8tW4D44=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-ayI9VzBAN_6VtN-7eeY7rA-1; Tue, 23 Feb 2021 06:33:05 -0500
X-MC-Unique: ayI9VzBAN_6VtN-7eeY7rA-1
Received: by mail-wm1-f69.google.com with SMTP id b62so1076600wmc.5
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 03:33:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=syDsQho4IHX9F8BHNatwacJ/qpLTQrnr8JiN8KEm3sI=;
 b=YI/1+alYr6dg8DsdxiiadPTqJzL9ynSBvdLMbPBMRWieJgG0k1FFstPPn9q/VeOe8U
 IaXdtZQXj+gzwIYh2MHfFm+8QRs3qpCLEGxyQTiPnZbdCKeOt++l7ylZhj5rhCv7kMIA
 EE0AfOebDkZPOcq+uX4n6l1B6+EaYsNqlkBDb3x2etPL5/dQ77G99UGQGbknb+5sgs93
 xv4C5MSaQk0H9+7BP1zXKeO5JpFdU6Hr8JpZU9iQATYgbuuwPymaIo6WN7FUhfjdjAnJ
 Ucdb03jqmC1TbIWtHTd9evD8STV3vU4mBtyne1qn4vaKvGwQtdB112ctoqX3GXZvKmr6
 73UA==
X-Gm-Message-State: AOAM5307BMVvG3nwBFf/4n+7VA+WRdT+bm+zepISEKTNthaX9HgoVqfg
 Uv2otL4tH2Ol2CiLUkCiwc179XuF5fffOo4zQkuzBUuWlt4bdBlo6WNmejiujDOTHV8PD6hI8O9
 zkb/kkBl+riyEwW4=
X-Received: by 2002:adf:b345:: with SMTP id k5mr1639006wrd.14.1614079984289;
 Tue, 23 Feb 2021 03:33:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhRMCfkgNzV5r/SXJpBN3DqwCRSq9qnADP1OnC2jV0lG8AQA4dwg4ndLgOSdgq/z2vntQ9iA==
X-Received: by 2002:adf:b345:: with SMTP id k5mr1638990wrd.14.1614079984121;
 Tue, 23 Feb 2021 03:33:04 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c6sm30842304wrt.26.2021.02.23.03.33.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 03:33:03 -0800 (PST)
Subject: Re: [PATCH] docs: move CODING_STYLE into the developer documentation
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210223095931.16908-1-alex.bennee@linaro.org>
 <CAFEAcA-v51sgBiNs5hpHwyQx0X=rYdmaWYPesJ0pGy=+ufyi4w@mail.gmail.com>
 <2ee6c3b3-7b90-e10c-8950-bfd07c963558@redhat.com>
Message-ID: <5a1c4191-b0e6-8dcf-d5db-7335b5f41628@redhat.com>
Date: Tue, 23 Feb 2021 12:33:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <2ee6c3b3-7b90-e10c-8950-bfd07c963558@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, CONTENT_AFTER_HTML=2.328,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 12:29 PM, Philippe Mathieu-Daudé wrote:
> On 2/23/21 12:07 PM, Peter Maydell wrote:
>> On Tue, 23 Feb 2021 at 10:02, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>
>>> There is no particular reason to keep this on it's own in the root of
>>> the tree. Move it into the rest of the fine developer manual and fixup
>>> any links to it. The only tweak I've made is to fix the code-block
>>> annotations to mention the language C.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>> diff --git a/README.rst b/README.rst
>>> index ce39d89077..f5d41e59b1 100644
>>> --- a/README.rst
>>> +++ b/README.rst
>>> @@ -66,7 +66,9 @@ When submitting patches, one common approach is to use 'git
>>>  format-patch' and/or 'git send-email' to format & send the mail to the
>>>  qemu-devel@nongnu.org mailing list. All patches submitted must contain
>>>  a 'Signed-off-by' line from the author. Patches should follow the
>>> -guidelines set out in the CODING_STYLE.rst file.
>>> +guidelines set out in the `style section
>>> +<https://qemu.readthedocs.io/en/latest/devel/style.html>` of
>>> +the Developers Guide.
>>
>> This is the first instance of a qemu.readthedocs.io URL in the
>> tree. Do we really want to have our references to our documentation
>> be to a third party website ?
> 
> We can use https://www.qemu.org/docs/master/devel/style.html:
> 
> $ curl https://www.qemu.org/docs/master/devel/style.html
> <!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
> <html><head>
> <title>302 Found</title>
> </head><body>
> <h1>Found</h1>
> <p>The document has moved <a
> href="https://qemu.readthedocs.io/en/latest/devel/style.html">here</a>.</p>
> </body></html>

Or even better since we have a job pushing to Gitlab pages
accessible on https://qemu-project.gitlab.io/qemu/:

https://qemu-project.gitlab.io/qemu/devel/style.html

Maybe the https://www.qemu.org/docs/ redirect should
go to gitlab page now?

Phil.


