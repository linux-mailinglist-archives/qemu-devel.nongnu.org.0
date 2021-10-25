Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2B44396A2
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 14:48:33 +0200 (CEST)
Received: from localhost ([::1]:58004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mezOx-0007Kl-2i
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 08:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mezGW-00032s-Ch
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:39:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mezGT-0008C5-TU
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:39:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635165583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=69yqbrO+MQyJlu4U/tlXBExt5WvhJSCUtB0zNb8Kzpc=;
 b=ZA/Z3i/EJg8EFLAbXbhBMhXvfQVDVF9isRst/bvZUFCKP6RiQ9/KcYAsHjFT3M3lKy6ee9
 JGwMLvoZwBe/5uCKGuWiludFYVXnjR82znNv7NC9r+6lWUUOK47y73GvZl06GgP7pSc+Iq
 er59hDHRQk+i21yij9QUt8HPJiZZv8A=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-xhkt9JYaO4yG1uIIVEKshQ-1; Mon, 25 Oct 2021 08:39:39 -0400
X-MC-Unique: xhkt9JYaO4yG1uIIVEKshQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 z20-20020a05640240d400b003dce046ab51so9711870edb.14
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 05:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=69yqbrO+MQyJlu4U/tlXBExt5WvhJSCUtB0zNb8Kzpc=;
 b=G0ZRxMeI0JEZX/UbehTt4JDeKNXwKkUmBPki1yiw2/8PNZTITmPL5LRaYKAECUnGg+
 MwdK2ZIW1o2lJ7orPJ03xPYOBslqRJbViht464ivf6fZ8BWrMZGAfOqDYb+fX/V6327n
 pTtQNrvoFTJn18vawz4RhUd2AlmHOeT64K186fKqUFOdsVvDwzTucgS3d77PjUmtwfF3
 X37XZCWTPT2azuig0kcm6A/lTJJYFl+BXKnnK0e+mVINxoBgF+I60Bc7QjM502I+Fouk
 7EmEK6lr9muMQsm1ZW/tP2J9ehSMicQl1e8oPI/Lta1BumS/AfpGxLNpAPcJhm0vUHb3
 ecdg==
X-Gm-Message-State: AOAM533tqXAW0B6r8sLr9uPUT32vlmKMn7/9hKpTLQlYkRkYhqsFGgSu
 MKvQpX9cCLLro4INgwH0Ib8fWwpb/Fft//+YpiDewLUwlw0fCoP1u1FYH/7UwGQi6Gi52Mof4nD
 xQ+xbk7Oplwjhiuu+3KypYIbuZ+VrhDIQXQPkMwLqZhQgOuCLDo1icN6kBsSZLqQ=
X-Received: by 2002:a05:6402:254e:: with SMTP id
 l14mr25815911edb.199.1635165578828; 
 Mon, 25 Oct 2021 05:39:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyh816L9A7kGhA9tQ1wucPEQAjRYQX7ZREVn1IKapn211ESNbMi4+jLQmijptn3W/y/mAUNlQ==
X-Received: by 2002:a05:6402:254e:: with SMTP id
 l14mr25815869edb.199.1635165578566; 
 Mon, 25 Oct 2021 05:39:38 -0700 (PDT)
Received: from thuth.remote.csb (tmo-096-150.customers.d1-online.com.
 [80.187.96.150])
 by smtp.gmail.com with ESMTPSA id w7sm9068558ede.8.2021.10.25.05.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 05:39:38 -0700 (PDT)
Subject: Re: gitlab/cirrus auth token failure
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <8257c433-f8fb-7766-dec3-a220e9bee84b@linaro.org>
 <f80220c1-84cd-e9c1-9542-40f4ea9aa419@redhat.com>
 <c713ff41-0546-ee6c-dafa-f83624437fc2@linaro.org>
 <YXZoBDndaM5nCpwU@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <623c3f60-d256-ea8f-0548-0e0b60a31e69@redhat.com>
Date: Mon, 25 Oct 2021 14:39:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YXZoBDndaM5nCpwU@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/10/2021 10.17, Daniel P. Berrangé wrote:
> On Sun, Oct 24, 2021 at 06:15:38PM -0700, Richard Henderson wrote:
>> On 10/24/21 12:42 AM, Paolo Bonzini wrote:
>>> On 22/10/21 20:31, Richard Henderson wrote:
>>>> Hi Daniel, you win the cookie because you committed cirrus.yml.
>>>>
>>>> I should have reported this before the weekend, but at some point
>>>> this week the auth tokens expired(?).  All of the cirrus-run tests
>>>> are now failing:
>>>>
>>>> cirrus_run.api.CirrusAPIError: API returned 1 error(s):
>>>> [ { 'extensions': {'classification': 'DataFetchingException'},
>>>>       'locations': [{'column': 13, 'line': 5}],
>>>>       'message': 'Exception while fetching data (/createBuild) : '
>>>>                  'AccessTokenAuthorization(token=[MASKED]) '
>>>>                  "doesn't have permissions to create builds for "
>>>>                  '5748266831446016!',
>>>>       'path': ['createBuild']}]
>>>
>>> It seems to have fixed itself for kvm-unit-tests, so maybe it was just a
>>> temporary issue within cirrus itself?
>>
>> It's still failing today.
> 
> It fixed itself for libvirt too, but obviously qemu still seems to be
> broken.
> 
> I'm wondering if it is as simple as having someone login to Cirrus CI
> whose account owns the QEMU project. eg they might have disabled tokens
> due to account inactivity.
> 
> If that doesn't work, then I'd suggest just re-creating the token.

FWIW, I recreated the tokens for my account last week when I saw it failing, 
and then it worked fine again, so recreating the tokens is likely one way to 
fix the issue.

  Thomas


