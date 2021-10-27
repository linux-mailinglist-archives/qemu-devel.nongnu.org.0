Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7989043C769
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 12:12:06 +0200 (CEST)
Received: from localhost ([::1]:39106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mffuf-00018P-K2
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 06:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mffsU-0000I6-LY
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 06:09:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mffsR-0006bD-Pu
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 06:09:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635329385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3r/WzvGS6i/IA1OSbu0quHBo6Ht/zZ2EVaMkUCU/t4=;
 b=N4a2Ci+D1KQE6j/yp3ez1lu5epT1UfqP09wzKW1cXuzmROO6koFt06OKHkdA4a5VST7Amq
 aGGAsWwBx8ftXPWumuvvEuK99DMK4a24/l4SfMFWcA1sh3BvGRucujXfg6aRG1/Hcnwyei
 5QpY4HiCybUSKL/3mpBxsUz7/7iWhwY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257--gpzKsLwNbCDQn9jZH3CLg-1; Wed, 27 Oct 2021 06:09:42 -0400
X-MC-Unique: -gpzKsLwNbCDQn9jZH3CLg-1
Received: by mail-wr1-f69.google.com with SMTP id
 p1-20020adfa201000000b001669acb9bcdso469728wra.13
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 03:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q3r/WzvGS6i/IA1OSbu0quHBo6Ht/zZ2EVaMkUCU/t4=;
 b=Qup9Ad4wYudAknssM6DLTCOAH2HQduDgHztN+Ta6/Zmh8xK9zq/17U177zz3bBum+A
 RBMTsct93dy4yJe8pbtttsFvkGbPTPBpqEPvljVoSxqHHsqlzLsoYwHeTgfB6qY+FR2+
 eJk0PyVdSrCvA/5qjBOPbem9KITwKnxHYcgpdIIuqfFFAKw6OlxGe/h6OE8kv+vv9joX
 /H4W+QVfiYUCsgW1IDy5jBNnQ9NTGAgJnaKABapYBhGpxyrMDkv14l0eC9FQN/LBHLU9
 tXcom0d2APh03ifpIp5e98SEsNwGH6l2xY+FMY5xA07JYLFLDSANeRrIDoSiVhnFRiBW
 Bp+Q==
X-Gm-Message-State: AOAM530xvcX/0aAAdotQ924SCFTuBCJ/5xtOdw2d1Dwd9FrV3ZOD/jk/
 qM9x6iNcDbO/0NzOeudo2Ofl4syFo8hUbztj30Kn2+oMapHv/NaukHLa+lXV0zlqgQcbh1k6W59
 Gf19tMKWaB46VnVo=
X-Received: by 2002:a05:600c:35cb:: with SMTP id
 r11mr4756323wmq.76.1635329381481; 
 Wed, 27 Oct 2021 03:09:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMz304Caq1Zd7gS7fsn8QdeT+D0rB+hcrA3Prf5AVOFcB+/ic9+dyoC+F2GeLpyDR9YVK00A==
X-Received: by 2002:a05:600c:35cb:: with SMTP id
 r11mr4756307wmq.76.1635329381241; 
 Wed, 27 Oct 2021 03:09:41 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id p4sm10342292wre.29.2021.10.27.03.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 03:09:40 -0700 (PDT)
Message-ID: <6a9cfd05-e2fd-0091-44c8-25f7229d5877@redhat.com>
Date: Wed, 27 Oct 2021 12:09:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.0.1 0/2] gitlab-ci: Only push docker images to
 mainstream registry from /master
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211027052656.1275436-1-philmd@redhat.com>
 <YXkSm13RTFCWyWxR@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YXkSm13RTFCWyWxR@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Richard/Peter

On 10/27/21 10:49, Daniel P. Berrangé wrote:
> On Wed, Oct 27, 2021 at 07:26:54AM +0200, Philippe Mathieu-Daudé wrote:
>> Hi Michael,
>>
>> 2 more patches to avoid gitlab-ci mayhem when you push the
>> stable tags. See this cover for more info:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg846861.html
> 
> Please don't push this to stable - Thomas points out that it is broken
> when any changes to dockerfiles are made.

But we still don't want to update the registry with these old
images...

What is the plan then, hold the stable tag until we figure out
the best fix?

Otherwise Michael can use 'git-push --push-option=ci.skip' to
not trigger a CI pipeline when pushing stable tags (running
CI pipelines previously in his own gitlab namespace).

>> Based-on: <20211019140944.152419-1-michael.roth@amd.com>
>> "Patch Round-up for stable 6.0.1, freeze on 2021-10-26"
>>
>> Daniel P. Berrangé (1):
>>   gitlab: only let pages be published from default branch
>>
>> Philippe Mathieu-Daudé (1):
>>   gitlab-ci: Only push docker images to registry from /master branch
>>
>>  .gitlab-ci.d/containers.yml | 11 ++++++++++-
>>  .gitlab-ci.d/edk2.yml       | 11 ++++++++++-
>>  .gitlab-ci.d/opensbi.yml    | 11 ++++++++++-
>>  .gitlab-ci.yml              | 18 ++++++++++++++++++
>>  4 files changed, 48 insertions(+), 3 deletions(-)
>>
>> -- 
>> 2.31.1
>>
>>
>>
> 
> Regards,
> Daniel
> 


