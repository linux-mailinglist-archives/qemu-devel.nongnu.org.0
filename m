Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D73E330C18
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 12:19:04 +0100 (CET)
Received: from localhost ([::1]:43628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJDuh-0007qU-41
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 06:19:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJDsY-0006n3-NE
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:16:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJDsU-00025S-Hj
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:16:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615202205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fn125XYC++D2f8QRXbixeiep14LQqwK0hHRl1JBGekw=;
 b=bT7rMdELFvrWiyH0OuaDJ5d7HYsFwWi+06PXBGgskHoad72frQbFZ+JsvJFLcCRrwYjbVW
 HT+7NImW2pqL8Y4d1FciSxeliiF7E0yAfJMWbKf3pldTmYGQ+fLMV/bGi9Pn/dZsNndJC8
 V5I83vFbY1sylp/e4w9WlTDAOxdplTY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-WKAflemqN_-sc54zW6tfdg-1; Mon, 08 Mar 2021 06:16:42 -0500
X-MC-Unique: WKAflemqN_-sc54zW6tfdg-1
Received: by mail-ed1-f70.google.com with SMTP id a2so4848972edx.0
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 03:16:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fn125XYC++D2f8QRXbixeiep14LQqwK0hHRl1JBGekw=;
 b=NrxqzxfkkyoYR9aWSp9Xq1+ObbSeFD14Zfdwb1/w2oIQU8BfcsazJjcIaGrkVNqDEo
 Jdp3+HMkmeaApuKS8BdyYJbAZkeNGisD0ToCp+iPA2/0nGEp4rkmWa9leExWoDi8uCHk
 JK7JSFsUcGpLP0NdpKuSngSrQtsBArrbt+hZQ3qupilvYz4E+AWr9Ddvh92tWxnF5mNr
 C2aVIzMOeQLjx/puGu0IhsX4zOvh2pqckAn1Xx3z7q8C6aeinmVocjPlnx/cj0GJN1Ns
 qWRjFq/tNGJzvsoQifrmVJxMa8fe+1XgMIYjlSjGqAg/XIAGsuB6qNdIOHiFkZc/dXt1
 PoTA==
X-Gm-Message-State: AOAM5312fXeSzAp7d7HLFhPTYjbc+2lQnNcyPWYuajT5tzKVz//ODvW6
 W3DklBb+UJaTb+m84PGRcbB+BPfY0/vMWIomdStgokkXmCD576mMDqxMH7hDeZmLIrbp9Ztn7z6
 BAf8kuSLLyIp0HQY=
X-Received: by 2002:a17:906:bfcc:: with SMTP id
 us12mr14832950ejb.266.1615202201411; 
 Mon, 08 Mar 2021 03:16:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx66X/tQ1dGIRwdHFCT5vY4L2eJEe48TypuQh4T7gURZZ7dYsIjuhNRY3YDhm1koScOUMlb/w==
X-Received: by 2002:a17:906:bfcc:: with SMTP id
 us12mr14832930ejb.266.1615202201186; 
 Mon, 08 Mar 2021 03:16:41 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id e4sm6482509ejz.4.2021.03.08.03.16.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 03:16:40 -0800 (PST)
Subject: Re: RESEND [PATCH v2] bsd-user: Add new maintainers
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210307155654.993-1-imp@bsdimp.com>
 <f1045149-077f-e3cd-cad9-42eb3a2e2516@redhat.com>
 <CAFEAcA-kuUEYC7ovT4CELNDjGxnf_Y1scSb_dCmWQfvSeaOXjw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f6665ee9-e279-6a4d-687f-b94579d71b8d@redhat.com>
Date: Mon, 8 Mar 2021 12:16:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-kuUEYC7ovT4CELNDjGxnf_Y1scSb_dCmWQfvSeaOXjw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Kyle Evans <kevans@freebsd.org>, Ed Maste <emaste@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

+Markus/Paolo/Laurent/Richard

On 3/8/21 11:24 AM, Peter Maydell wrote:
> On Mon, 8 Mar 2021 at 10:09, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 07/03/2021 16.56, Warner Losh wrote:
>>> The FreeBSD project has a number of enhancements to bsd-user. Add myself
>>> as maintainer and Kyle Evans as a reviewer. Also add our github repo.
>>>
>>> Signed-off-by: Warner Losh <imp@bsdimp.com>
>>> Signed-off-by: Kyle Evans <kevans@freebsd.org>
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   MAINTAINERS | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 26c9454823..ec0e935038 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -2896,9 +2896,12 @@ F: thunk.c
>>>   F: accel/tcg/user-exec*.c
>>>
>>>   BSD user
>>> -S: Orphan
>>> +M: Warner Losh <imp@bsdimp.com>
>>> +R: Kyle Evans <kevans@freebsd.org>
>>> +S: Maintained
>>>   F: bsd-user/
>>>   F: default-configs/targets/*-bsd-user.mak
>>> +T: git https://github.com/qemu-bsd-user/qemu-bsd-user bsd-user-rebase-3.1
>>
>> BSD is not really my home turf, but since nobody else picked this up and I
>> plan to send a pull request for a bunch of patches anyway this week, I can
>> also put it into my queue.
> 
> Fine with me. (The v1 was in my to-review queue, but I'm currently
> running somewhat behind on processing patches.)

This is a patch for mainstream QEMU, I'm having hard time
understanding the point of it. This is some official way
to say that BSD-user is not maintained in mainstream but
has to be used in the referred fork which is way different
that mainstream...

I'd rather wait for more mainstream contributions from Warner
and Kyle, or blow the current orphan/dead code and import
bsd-user-rebase-3.1 adding the maintainer entries along, but
certainly not mark this dead code as maintained.

Please convince me why I'm wrong, because I'd prefer NAck this
patch...

Regards,

Phil.


