Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C3E4507EA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 16:10:42 +0100 (CET)
Received: from localhost ([::1]:38998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdd3-0002ND-F0
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 10:10:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdTz-0002ZC-Ns
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 10:01:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdTw-0000KJ-7t
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 10:01:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636988475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jqfAsHCWK9n2PSwrSeEI9kwcNYNiTTFNLqv+J7M8LUI=;
 b=C2u/FEpTLWZbQdivZQzh0g9j8t4xwqwmvuuk+6My21a3/5NdkI/Eb1DD2gOj0AL2GKuwPy
 2eVrwVgKWjxcjlrpaWowav5Ofer3wwP69RzgImdP/PlVDTMfL+HRsXR0l95jm+6HlaDE1O
 2yyMTRh0s4JE0965g/B3sqJtDMFTqi0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-I59JnNyzNd6y_85wi47gmg-1; Mon, 15 Nov 2021 10:01:13 -0500
X-MC-Unique: I59JnNyzNd6y_85wi47gmg-1
Received: by mail-wm1-f70.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso9755727wms.4
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 07:01:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jqfAsHCWK9n2PSwrSeEI9kwcNYNiTTFNLqv+J7M8LUI=;
 b=sgbpPa1zqzMGtGm4rAs/8uuMtqio6onDGhYtHyHjFpUmh0S7cTW6J/u/dVETJV/084
 dRYfTlHCjir6Bs+GvJEsuXE2lfqOwsHnQE3IPx73Jbi4h2QYJUkE4ATpdJMKpTTVlI02
 1slC2h2LMzJ1HCD2d743gtmyyTbFI0rkeE5LlDNti0vzRc9E9D6rqECidp9Go2W6cte2
 34LkROGqR8LFIkqbGiZksyoRfwhp7U9DD4WL0PtXx2aKni+PTtPtTErxbvHLjUgxXGbZ
 YZhdhnqesDk4Y6l7EKzQz5ZqnEhJqC155mUDowztl1k8hlskwg6tAFK7wWIf1OlOZifG
 Z0Rg==
X-Gm-Message-State: AOAM530auzJ7B0waj6II7K2uqSbfnN5iPswLTIrfX1MYWpumjibhvtMf
 mlkIEmBa/eiMmsUIeeqPuJVng88+twIyDSDTgz+jAIFrTqM4xlHYWrQd/1xKOqPdY4DbIrV/lcI
 dz7cDR4jN4LtEG5A=
X-Received: by 2002:adf:9bcd:: with SMTP id e13mr47767191wrc.165.1636988471773; 
 Mon, 15 Nov 2021 07:01:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuBvOnDg/FTlTot3MF5y/buo54Gzx4uMv08EnR2bEasaVDgcc2jX7t9LaY7oshAmQ6LWqnzg==
X-Received: by 2002:adf:9bcd:: with SMTP id e13mr47767153wrc.165.1636988471586; 
 Mon, 15 Nov 2021 07:01:11 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id c6sm24599849wmq.46.2021.11.15.07.01.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 07:01:11 -0800 (PST)
Message-ID: <e89ee030-6739-97c3-d228-e4b8fea399c0@redhat.com>
Date: Mon, 15 Nov 2021 16:01:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] gitlab-ci: Split custom-runners.yml in one file per runner
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211115095608.2436223-1-philmd@redhat.com>
 <7fb209d4-0d3c-af8f-f08d-d051d3b73e09@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <7fb209d4-0d3c-af8f-f08d-d051d3b73e09@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.278, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/21 15:33, Thomas Huth wrote:
> On 15/11/2021 10.56, Philippe Mathieu-Daudé wrote:
>> To ease maintenance, add the custom-runners/ directory and
>> split custom-runners.yml in 3 files, all included by the
>> current custom-runners.yml:
>>   - ubuntu-18.04-s390x.yml
>>   - ubuntu-20.04-aarch64.yml
>>   - centos-stream-8-x86_64.yml
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Based-on: <20211111160501.862396-1-crosa@redhat.com>
>> https://gitlab.com/stsquad/qemu/-/tree/for-6.2/misc-fixes
>> ---
>>   .gitlab-ci.d/custom-runners.yml               | 268 +-----------------
>>   .../custom-runners/centos-stream-8-x86_64.yml |  28 ++
>>   .../custom-runners/ubuntu-18.04-s390x.yml     | 118 ++++++++
>>   .../custom-runners/ubuntu-20.04-aarch64.yml   | 118 ++++++++
>>   4 files changed, 268 insertions(+), 264 deletions(-)
>>   create mode 100644
>> .gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
>>   create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml
>>   create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
> 
> Should there maybe be entries in MAINTAINERS for these new files, so
> that it is clear who takes care of the external runners?

Yes, this is the principal motivation behind this series.

I expect each maintainer to send their patch.


