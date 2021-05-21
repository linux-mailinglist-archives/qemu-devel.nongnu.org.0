Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B631A38C715
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 14:51:24 +0200 (CEST)
Received: from localhost ([::1]:59848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk4cd-0001W2-QS
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 08:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lk4aq-0008Hs-Of
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:49:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lk4ao-0007Fa-Vc
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:49:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621601370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FEpsemIRGu5oOuQUZUwUiVUxbSGPmrzNuO7HnUiioZE=;
 b=G19A7poLKEXqbchH2ZLlQuL3VQE+UbgPhU+vmBLqKkUCUM7YVhLie9iLyHIrFQA5BJlLZp
 3iEyRm+Yxwgt6oWQpCIX1YIX32Y62yuluwGrj3K19g5KA1jCZ+HGKu1bb70PX+NmR6WOaT
 004VkO+o0MuYMwDBcG5HVjmO6hYA6Iw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13--RcaCAovNxGxe0xGQ_tkoQ-1; Fri, 21 May 2021 08:49:26 -0400
X-MC-Unique: -RcaCAovNxGxe0xGQ_tkoQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l185-20020a1c25c20000b029014b0624775eso3776252wml.6
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 05:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FEpsemIRGu5oOuQUZUwUiVUxbSGPmrzNuO7HnUiioZE=;
 b=f6ZEAE0s49ddyNVFz/th4Wv4KNyl4xN7b7Oxputnrb8IEfSz655P/2pNmjcVvTTMXU
 eQwPo/SAY/9knvgOAn3fDyhJDsvEusf0DJqJenvxS8sIxPUQ/c9dYMX0ZocvskzFpe/B
 fb6bxJe1ScAB7+SdE06uhncsPIAgHQ7L1X/t425uMboMJC5d2qNvSKMlEqGs3YjqZ9fn
 wlEP1JK2sjT1pc4SifUSzz690YYlxtnEzNAuyzofG7VOYqdY7Ftk+1lwLzJrkWJkqzKz
 HOIw2GINElphPMNkTdIEFcciY+odSqWuCcLTWQjosQ4eup70C9OwbAqhiK0uYh04U/s3
 /Xkg==
X-Gm-Message-State: AOAM533OBC30N72I30AtKobYoQw05lFwJpT0YWRdvXWdJXzTSJ/fRuog
 dgSxK8CuEKPZIN/FMm3RDuQLE7+jpwe9zpaitGc15+aLO0q7hIpL260ZBjSSqT8a3i2zqcccL+Q
 DAzWwm80ttvap5ZU=
X-Received: by 2002:adf:eb82:: with SMTP id t2mr9464096wrn.337.1621601365875; 
 Fri, 21 May 2021 05:49:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw73pAFTOSndpcd8E3sbpG2oAHoeGXpWLGEU356+4L0WWV9IP9DroFeowKVGzzVsIKhTUprBA==
X-Received: by 2002:adf:eb82:: with SMTP id t2mr9464082wrn.337.1621601365750; 
 Fri, 21 May 2021 05:49:25 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id m6sm10672246wml.3.2021.05.21.05.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 05:49:25 -0700 (PDT)
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: Thomas Huth <thuth@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
 <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <82f5ed3f-3047-bfa3-c7b2-d91300f393f8@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0b970add-1804-f841-819d-e77a64d616e8@redhat.com>
Date: Fri, 21 May 2021 14:49:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <82f5ed3f-3047-bfa3-c7b2-d91300f393f8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/21 2:42 PM, Thomas Huth wrote:
> On 21/05/2021 14.28, Willian Rampazzo wrote:
>> On Fri, May 21, 2021 at 4:16 AM Thomas Huth <thuth@redhat.com> wrote:
> [...]
>>> Alternatively, what about renaming the "acceptance" tests to
>>> "validation"
>>> instead? That word does not have a duplicated definition in the
>>> context of
>>> QEMU yet, so I think it would be less confusing.
>>
>> While at the beginning of your reply, I started thinking if
>> "validation" would cause less confusion for the QEMU project. Although
>> validation testing is a broader concept inside the Verification &
>> Validation process, encompassing unit testing, functional testing,
>> integration testing, system testing, and acceptance testing, it may be
>> an option for the QEMU project.
>>
>> While system testing would be the correct terminology to use, if it
>> causes more confusion, using a less strict terminology, like
>> validation testing, is valid, in my opinion.
> 
> <semi-homorous-friday-bikeshedding>
> Or we could come up with a new, artificial name instead (like "qtests").
> It certainly need a "q" in the name. For example what about:
> 
> - avoqado

+1 for 'make check-avoqado' :)


