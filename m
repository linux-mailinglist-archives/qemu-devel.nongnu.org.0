Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9BE2B4441
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 14:02:47 +0100 (CET)
Received: from localhost ([::1]:39952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kee9e-0007yV-9F
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 08:02:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kee8a-00074a-Kg
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:01:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kee8X-0007wf-Af
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:01:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605531696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A1ECBJn7TUVD9ndMjT6+daWEG0AH2vG6Tn0DDXi9Tu8=;
 b=JSNAjmJBUnf8gf8ynMSvnHwiMOl2ewWh0qV8snkNhXl9PKmwBh3I5sjYMRzIBknR0SceFb
 431mP5ObNr2d8HM3hts/6xroERrdQ7IxqpWUnecNVc8aGuF7X4QyO5sz3x5Gi46Muba/bB
 TVzfJ2Yx+GRKm/DpzAzmzhzFQXaTRMc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-EN9fg0mdMfOd2e65VKcFFQ-1; Mon, 16 Nov 2020 08:01:34 -0500
X-MC-Unique: EN9fg0mdMfOd2e65VKcFFQ-1
Received: by mail-wm1-f72.google.com with SMTP id k128so10137420wme.7
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 05:01:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A1ECBJn7TUVD9ndMjT6+daWEG0AH2vG6Tn0DDXi9Tu8=;
 b=dCFQR8VZPATLvX93ZpOOPZ3ykS17+thbrPdbfVI08ThG/i3CZ2bGIoy47vkiVGlRrY
 fTreuZ8DpRVplw6QRmeMddANeRh2CGB0+63rv0VIi9B3ycPxao9xrOzcpBgzU5ZaOhQC
 s89FnC7NEcJVDet5NTkdPMsvyXbGuhXLY/l0M51Gcto06huGb3kihOC7Bsda5L4mdY3K
 lHquYM+bj8iagTxNbWur/6zfvsWLcHa4MSKQ1gcjVToqhkatRe9WpdS09YdJtJx51w4M
 y1s+vIdtM3SerPzkfuEoyffo7yVpDuGCtgRR7dOaJy+OEeeEOcNKgZT5rqoiIxTESeEJ
 cxhA==
X-Gm-Message-State: AOAM530Qqq+TQreDtSdggmkf/84k2uaHH9bebKxekxUUhgcq5K/o2d6b
 zhmsLWX+/wo+zT2yM32m/SmcDaqdFNv8Zpi7hsPKTlpWkc3d3nJ/B9j5UZ5li+BrTGX0fYgdmI6
 BwxWeXBrU+gjzR/A=
X-Received: by 2002:a5d:66cd:: with SMTP id k13mr19224841wrw.365.1605531692867; 
 Mon, 16 Nov 2020 05:01:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxe0t03qo80W6n2Vzy0D6j0z3+KTKKxEGbnrQmwmZ9nZG77E2nRtSJ/vJ87lgH+7U5V7/P/+A==
X-Received: by 2002:a5d:66cd:: with SMTP id k13mr19224801wrw.365.1605531692660; 
 Mon, 16 Nov 2020 05:01:32 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 6sm17046845wrn.72.2020.11.16.05.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 05:01:31 -0800 (PST)
Subject: Re: [PATCH v3 11/11] gitlab-ci: Move artifacts expiry rule to common
 'native_build_job'
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201108221925.2344515-1-philmd@redhat.com>
 <20201108221925.2344515-12-philmd@redhat.com>
 <51367eb8-ce2f-aca5-0648-8c526245d355@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a01c761f-6ce4-69b8-4837-4c7245d36f21@redhat.com>
Date: Mon, 16 Nov 2020 14:01:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <51367eb8-ce2f-aca5-0648-8c526245d355@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/20 10:59 AM, Thomas Huth wrote:
> On 08/11/2020 23.19, Philippe Mathieu-Daudé wrote:
>> Build jobs include the 'native_build_job' template. Move
>> the 'artifacts expiry' rule there. Now all build jobs benefit
>> from it.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  .gitlab-ci.yml | 24 ++++--------------------
>>  1 file changed, 4 insertions(+), 20 deletions(-)
>>
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index dd5f9a4c505..27a4cbc5171 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -79,6 +79,10 @@ include:
>>        then
>>          make -j"$JOBS" $MAKE_CHECK_ARGS ;
>>        fi
>> +  artifacts:
>> +    expire_in: 2 days
>> +    paths:
>> +      - build
> 
> Should we also keep artifacts for pipelines that do not need it to pass them
> from one job to the next? ... not sure ... considering that gitlab is
> thinking about cutting down CI minutes etc., we should maybe be more
> conservative and only keep artifacts where they are really needed?

As nothing is released from these jobs (except some roms/ and
documentation?) I'd not keep anything at this point. Later we
can be stricter and select the minimum we need.

(I don't think nobody ever downloaded a job artifact to test /
debug it).

> 
>  Thomas
> 


