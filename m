Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780C43FB9CF
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 18:08:38 +0200 (CEST)
Received: from localhost ([::1]:33386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKjpt-00061a-GW
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 12:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mKjk2-0006mq-Os
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 12:02:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mKjjy-00034l-Lf
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 12:02:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630339349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Py37IJokhrUD0plN0RlD6lkH9QFw0w7KCILmJNxhWX4=;
 b=EsXGfuHt7LzYpJR6ef9nWNz3l5IvuPbak8RguMs/DYObP5hw6NIIi34dNBerr8Ux0sShUq
 TGcK1y0K1teNRLS6EutlNcuPftpWScsStxJMPWvVVEW5/EB9HR8TW7YKU8rNWmR4YKRHG3
 CSnwHOBiQuJyh+IWtm8VSfoF/5pF3w4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-QscUf7Z-MouNg-_feAeFrQ-1; Mon, 30 Aug 2021 12:02:26 -0400
X-MC-Unique: QscUf7Z-MouNg-_feAeFrQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 d10-20020adffbca000000b00157bc86d94eso535373wrs.20
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 09:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Py37IJokhrUD0plN0RlD6lkH9QFw0w7KCILmJNxhWX4=;
 b=kBluw5uNH8jJizlfg3dfzTGUReztV5mTKyJVSvkto3sKIJhM9gSdBEZ5D6Pwd/NxQI
 K59sozc3oxf6dqnGNP4cg6n1gxX9Mr4nEhIjZQFJDlDVl6piXUOv944OQV2s2HrKqHdz
 VjDMCbMyCB5B1TY2D8vybft25jz7JGiSSXpufjY+s+lHhS/H+guLIzci1VZ2W72JA+ou
 dxY/VDcY62LSujcrxHylFWG3jir9wkgjhKNlmTsZYqilQrV5ynOhjHnvMdsUKBsDiiix
 +TIql9DR4TnVTWWHXG147eu7nNgEAutENF+IkhqqQGCJZdr0jFy8Ac0fvqw8if6a09Z+
 mr6w==
X-Gm-Message-State: AOAM533ftKP8UVrbrAr2alPMt49DeDnCGaLlE87JMvcZ/m4ZkuygNLEg
 xMzkuxpgRcWHzu9yZucK7rFjkSK8qcJJFE2L3z+uDLl7En53jcSnAvEr9dpJMb+0ik0XyFWyL4A
 afrvWAgwBlnvOxUw=
X-Received: by 2002:adf:b7c7:: with SMTP id t7mr9140533wre.259.1630339345440; 
 Mon, 30 Aug 2021 09:02:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTlbwtRa6XqPa1RughY8qRZgbVjEII+hlddozkW3cspJ7gldF/+bE0/aYwM2/+B5RxzLM9mA==
X-Received: by 2002:adf:b7c7:: with SMTP id t7mr9140501wre.259.1630339345191; 
 Mon, 30 Aug 2021 09:02:25 -0700 (PDT)
Received: from thuth.remote.csb (pd9e830c4.dip0.t-ipconnect.de.
 [217.232.48.196])
 by smtp.gmail.com with ESMTPSA id q13sm15656558wrv.79.2021.08.30.09.02.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 09:02:24 -0700 (PDT)
Subject: Re: [PULL 5/6] docs: split the CI docs into two files
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20210825110018.100913-1-thuth@redhat.com>
 <20210825110018.100913-6-thuth@redhat.com>
 <224f739e-96c6-0e14-e53d-d64a8ade64ca@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f09c711a-3d74-ca4f-05e4-0d6ebf380e5e@redhat.com>
Date: Mon, 30 Aug 2021 18:02:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <224f739e-96c6-0e14-e53d-d64a8ade64ca@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/08/2021 15.33, Philippe Mathieu-Daudé wrote:
> Hi Thomas,
> 
> On 8/25/21 1:00 PM, Thomas Huth wrote:
>> From: Daniel P. Berrangé <berrange@redhat.com>
>>
>> This splits the CI docs into one file talking about job setup and usage
>> and another file describing provisioning of custom runners.
>>
>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>> Message-Id: <20210812180403.4129067-2-berrange@redhat.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   docs/devel/ci-jobs.rst    |  40 ++++++++++
>>   docs/devel/ci-runners.rst | 117 ++++++++++++++++++++++++++++
>>   docs/devel/ci.rst         | 159 +-------------------------------------
>>   3 files changed, 159 insertions(+), 157 deletions(-)
>>   create mode 100644 docs/devel/ci-jobs.rst
>>   create mode 100644 docs/devel/ci-runners.rst
> 
> You took this one but not the following "docs: add definitions of
> terms for CI/testing", is there something missing there?
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg830839.html

I took the patch from Daniel's series here:

  https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg02102.html

The second patch there did not apply anymore.

Sorry for missing Willian's patch, I can put it in my next PR if nobody 
beats me to it.

  Thomas


