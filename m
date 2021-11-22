Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEC6459000
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 15:11:31 +0100 (CET)
Received: from localhost ([::1]:54050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpA2c-0003FC-21
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 09:11:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mp9u0-0001tR-Kn
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:02:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mp9tr-0006GB-SP
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:02:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637589747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sOPiyfu4mzdzmD3WmRswvJ9qEpYAy2d1/NYqqEQsCtM=;
 b=eJX4x6AjWnZx7f2Ki6/qgkItQoAnx0WuFhdnb5ZnOYU1gwKlKAnoshZ8pNTBchbY7va/fM
 mUYODOBpVGsvkhYhjO81+rOyPmj//AjwBLeDNFiQuLZSuL5O+Rw93a6TqZC9HSVQvV48Cw
 zPzq1rhfwYOBObiBWNcjwOJiOiRrnNY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-62xEwzXNPN6Cjx3A-MfwXw-1; Mon, 22 Nov 2021 09:02:24 -0500
X-MC-Unique: 62xEwzXNPN6Cjx3A-MfwXw-1
Received: by mail-qv1-f69.google.com with SMTP id
 fn12-20020ad45d6c000000b003bd9c921c0eso16334038qvb.21
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 06:02:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sOPiyfu4mzdzmD3WmRswvJ9qEpYAy2d1/NYqqEQsCtM=;
 b=EhwC2BD7jH+YNd4RxD3xCpodHOurVjdZtcLzMJqnYPaPZH2XTDD50LYRtBjJVaBjQ/
 hyLVUfhvB49Hag3xS0OavWpuI2TYT8zpDXAjvclcuDs4ek/Kk55Wri+eT+e2muD108ZP
 IK9fg2p72Z/IpWgmy1IkOA6wlqIpGr4R7sqtt/xHCXujIf6AoYAjTUqFl8CjlqDOdwr7
 6mJD7UqyhSfqiUroLEt51Nk3HTkAIrjv3mYnzBZxRSdDelsLE4l55qHsyClxd/uB7oCC
 bheXBFyGjjbYn4bgTNLkNlDbpv8IDMh161O7qB9Q9yidnMYkLKDhKXNNVtw26DY1wH58
 BJ4g==
X-Gm-Message-State: AOAM533eHx7pu39TBVWMfme9RDj4rhRpfVdL8hr5nqM7o8hX2SZyYXMA
 4fBO61RlikoF3iFuA48ZSa98vHB4jUJwkrc3+PvnEqx/LLqP5y5Z+xKvymMCL4CssfM24lMG8yQ
 KA2oDuIHcLa88RFk=
X-Received: by 2002:a05:622a:5cf:: with SMTP id
 d15mr31661488qtb.388.1637589744421; 
 Mon, 22 Nov 2021 06:02:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkY3804MedfYONtgj326XdCshD/3WigzFnI1dSvXn0MdnHMr3rtkSI0bnyD/5EDJtoRzku0g==
X-Received: by 2002:a05:622a:5cf:: with SMTP id
 d15mr31661452qtb.388.1637589744191; 
 Mon, 22 Nov 2021 06:02:24 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id o17sm4549597qtv.30.2021.11.22.06.02.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 06:02:23 -0800 (PST)
Message-ID: <a2087e9c-82cb-8cc6-e580-9cc27891c196@redhat.com>
Date: Mon, 22 Nov 2021 15:01:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] docs: Fix botched rST conversion of
 'submitting-a-patch.rst'
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211119193118.949698-1-kchamart@redhat.com>
 <20211119193118.949698-2-kchamart@redhat.com>
 <56026d2a-0b9e-ff83-d953-a284a810a8ed@redhat.com> <YZtu59t8DoZZ15nQ@paraplu>
 <b03ffb0c-0c4f-b792-f6c1-55014a0ae003@redhat.com> <YZuK09xP0I28dvMr@paraplu>
 <c591c571-f922-28a5-e8be-75e6cccb261a@redhat.com>
 <CAFEAcA8QuSsazUZU23DJgXHhU=ez948wQFJkHZGRYWxhiXbuDg@mail.gmail.com>
 <ef4ff222-1053-904a-77c2-39adc9dd929a@redhat.com>
 <CAFEAcA-+38PB3aOypgbAmeJN-X3P2gzB5K+CTAveXdt7jmF3mw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA-+38PB3aOypgbAmeJN-X3P2gzB5K+CTAveXdt7jmF3mw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Laurent Vivier <Laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/11/2021 14.53, Peter Maydell wrote:
> On Mon, 22 Nov 2021 at 13:30, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 22/11/2021 14.25, Peter Maydell wrote:
>>> On Mon, 22 Nov 2021 at 12:37, Thomas Huth <thuth@redhat.com> wrote:
>>>> What about simply replacing it with a new sentence below the bullet list,
>>>> saying:
>>>>
>>>> "Please also use a spell checker like `codespell
>>>> https://github.com/codespell-project/codespell` with your patches"
>>>
>>> How many regular contributors actually do that?
>>
>> Considering the typos that we have in the code, not enough ;-)
>>
>> Anyway, it's just a polite recommendation here, not a must-do, so mentioning
>> codespell here doesn't really hurt, does it?
> 
> I don't think we should be recommending to new contributors that
> they do things that established contributors generally do not do.
> The document has enough "things you should do or think about" already.
> My preference would be for simply not mentioning spelling-checking.
> 
> (If we do want to come up with some process for dealing with
> spelling issues in the codebase, then we either need to put it
> into CI so it's run automatically, or we need to have something
> that works on the individual patch level.)

Ok ... In any case - seems like this needs more discussion, so I'll drop it 
from the patch for now. We can still add some wording or CI magic later, but 
that's certainly something that we rather want to do after version 6.2 has 
been released...

  Thomas


