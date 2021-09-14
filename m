Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E7D40A69E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 08:18:05 +0200 (CEST)
Received: from localhost ([::1]:35416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ1lc-0000MI-DC
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 02:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQ1kK-00081r-Bb
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 02:16:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQ1kG-00014m-LQ
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 02:16:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631600199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p4JXQRUsH/P28tzjS7OZgL6JCMsp9uzJPZ1FnFSCzIE=;
 b=BQexCFn7A5AMOOPfv0oXhhG265fb2urndddZ0xcHn1zvhVh8UH04rZdNV/es/F9am8L9Y2
 PLxUjwDbn7NvSefqDip8pIgDsnl63goXgdy/NgTSC3b4qZu4M8X6PORhDlk6p6m/nOCpke
 slm2fU3uUKUZeqjS0GHyC0T2a70sMbM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-fQXyHdFDOTaaaJTC7ASTaQ-1; Tue, 14 Sep 2021 02:16:34 -0400
X-MC-Unique: fQXyHdFDOTaaaJTC7ASTaQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 z1-20020adfec81000000b0015b085dbde3so3535193wrn.14
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 23:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p4JXQRUsH/P28tzjS7OZgL6JCMsp9uzJPZ1FnFSCzIE=;
 b=hD67KAauHgj1muhKy5O8L6I6UoMg2y3S5DHHw8t3mkqP+kAlWAfbX1EkcOMWTrRG+S
 HK8MC4qbvoJSjdNNGk21DP2vMZFuo7tTHcImS5AbFeulZgb9rGEzjhVRw8hoH0n6HbeX
 n1xpx0TsiQO1ayHLWTbf4Hutp26S33cpq8ioDfUxHctTQxsq7utp9p49gv0vcyRIlpOw
 r/hanPKRXNH5T2BOk09q3mdx1vs/4v5+6AD4ZdNqlDNWqVlJ09laa309V+tILWWff/0B
 2TGoy3UfK2O8YBKa5ChZd0ESNkfP7B4VRNCpn5zRDjY72CWYn5Jy+CG/j0yAocOLL5kb
 5iaQ==
X-Gm-Message-State: AOAM531ZxYbcz2yTSW3i7NX49wD75ky4OGYboRBc3RIndlerYljC45YF
 jO3orqbOZylZCzdfFijwzurL5VeqetDI1aGuzkxvCccL6CbDSD+zUjb2sfQzS833uKNq1r1RX/q
 QhB7OWMMP6EQOnks=
X-Received: by 2002:adf:d193:: with SMTP id v19mr17105560wrc.377.1631600193621; 
 Mon, 13 Sep 2021 23:16:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz515N/Ub/XkFvNTLMsAQogReVelwy1qPMlQbWcCJ9EKQDjZp3xyNuQWCCOTPnGY2s3PYlPzw==
X-Received: by 2002:adf:d193:: with SMTP id v19mr17105539wrc.377.1631600193414; 
 Mon, 13 Sep 2021 23:16:33 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id j18sm9186695wro.1.2021.09.13.23.16.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 23:16:33 -0700 (PDT)
Subject: Re: [qemu-web RFC PATCH] Add Sponsors page
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20210913182512.1021618-1-philmd@redhat.com>
 <d57973da-49ac-f231-1652-cf78769e884a@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8ddc291a-0248-33ef-cc3e-fa3a568a2f00@redhat.com>
Date: Tue, 14 Sep 2021 08:16:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d57973da-49ac-f231-1652-cf78769e884a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 7:41 AM, Thomas Huth wrote:
> On 13/09/2021 20.25, Philippe Mathieu-Daudé wrote:
>> Add a page listing QEMU sponsors and displaying their logos.
>>
>> Logo sources:
>> - https://www.rackspace.com/es/newsroom/media-kit
>> - https://developer.arm.com/solutions/infrastructure/works-on-arm
>> - https://gitlab.com/fosshost/assets/logo
>> - https://www.linkedin.com/company/cip-united
>>
>> Resolves: https://gitlab.com/qemu-project/qemu-web/-/issues/2
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> There are probably more, but I'm not aware of them.
>>
>> Maybe we should list past sponsors, precising a year range?
> 
> I think we might have a hard time to compile a complete list, so I'd
> rather not start that job.
> 
>> ---
>>   _includes/nav.html      |   1 +
>>   sponsors.md             |  22 ++++++++++++++++++++++
>>   sponsors/cipunited.jpg  | Bin 0 -> 10607 bytes
>>   sponsors/fosshost.png   | Bin 0 -> 18251 bytes
>>   sponsors/rackspace.png  | Bin 0 -> 7363 bytes
>>   sponsors/worksonarm.png | Bin 0 -> 9965 bytes
>>   6 files changed, 23 insertions(+)
>>   create mode 100644 sponsors.md
>>   create mode 100644 sponsors/cipunited.jpg
>>   create mode 100644 sponsors/fosshost.png
>>   create mode 100644 sponsors/rackspace.png
>>   create mode 100644 sponsors/worksonarm.png
>>
>> diff --git a/_includes/nav.html b/_includes/nav.html
>> index 73b39b3..49ad4cd 100644
>> --- a/_includes/nav.html
>> +++ b/_includes/nav.html
>> @@ -8,6 +8,7 @@
>>               </li><li {% if current[1] == 'contribute'
>> %}class='current'{% endif %}><a href="{{ relative_root
>> }}/contribute">Contribute</a>
>>               </li><li {% if current[1] == 'documentation'
>> %}class='current'{% endif %}><a href="{{ relative_root
>> }}/documentation">Docs</a>
>>               </li><li><a href="https://wiki.qemu.org">Wiki</a>
>> +            </li><li {% if current[1] == 'sponsors'
>> %}class='current'{% endif %}><a href="{{ relative_root
>> }}/sponsors">Sponsors</a>
> 
> Not sure whether we need that link on every page (i.e. in the navigation
> menu)? Maybe it's enough to put the link somewhere on the home page?

Daniel recently changed that, so Cc'ing him in case he has a preference.

>>               </li><li {% if current[1] == 'blog' %}class='current'{%
>> endif %}><a href="{{ relative_root }}/blog">Blog</a></li>
>>           </ul>
>>       </nav>
>> diff --git a/sponsors.md b/sponsors.md
>> new file mode 100644
>> index 0000000..da1bf19
>> --- /dev/null
>> +++ b/sponsors.md
>> @@ -0,0 +1,22 @@
>> +---
>> +title: QEMU sponsors
>> +permalink: /sponsors/
>> +---
>> +
>> +QEMU has sponsors!
>> +
>> +The website is hosted by [Rackspace
>> Technology](https://www.rackspace.com/).
>> +
>> +For continuous integration and testing, hardware is provided by:
>> +- Arm and Equinix Metal via the [Works on Arm
>> program](https://www.worksonarm.com/)
>> +- [Fosshost](https://fosshost.org/)
>> +- [CIP United](https://www.cipunited.com/)
>> +
>> +
>> +![Rackspace Technology](rackspace.png)
>> +
>> +![Works on Arm](worksonarm.png)
>> +
>> +![Fosshost](fosshost.png)
>> +
>> +![CIP United](cipunited.jpg)
> 
> Some remarks:
> 
> 1) Could you please use the original URLs as source for the pictures
> instead of copying them over into our website? Some folks don't like it
> when their images are copied...

OK but then it might bitrot.

> 2) Could we have a short description about what the CI hardware is used
> for? I can figure out  that worksonarm likely provides the hardware for
> the aarch64 gitlab runner, but what are the others good for?

OK.

> 3) What about the s390x gitlab runner?

I don't have that information, who can I contact/ask for this?

Should I split this patch as a series with one sponsor per patch
and better document each patch?

> 4) Shouldn't we mention gitlab.com here, too? They did not actively
> offer hardware to us, but we're using their free gitlab infrastructure a
> lot, so I think we should provide a link to them here, too.

OK but then also cirrus-ci.

BTW is the mailing list somehow sponsored?

Thanks,

Phil.


