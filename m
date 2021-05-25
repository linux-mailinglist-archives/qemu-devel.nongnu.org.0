Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C26333907D9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:35:57 +0200 (CEST)
Received: from localhost ([::1]:57750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llayC-00072S-Pc
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llawD-0004i9-Vy
 for qemu-devel@nongnu.org; Tue, 25 May 2021 13:33:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llawB-00081r-4B
 for qemu-devel@nongnu.org; Tue, 25 May 2021 13:33:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621964029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1t80rBcC/LdCkJ4xdHH34G1J0mh/jwKaoFrJZQDUF70=;
 b=Ac/8+Wdk80D0rb7JIYUJ2ivxF5J6IZCII/OgDD4pL/LCQ2NLtpLEL46VcgKvYrPfqBrpQc
 93QhyrvnsnvceCKviFjvq1B5TWFAqMkHGuuXramMD2peXU42qa0/ShPsp0PJusWFaJV8zC
 76ER3TQ2tmdF3qWdm4MdYqJWmSFGOA4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-b2y1oZ61MpywHNiMXSnr_g-1; Tue, 25 May 2021 13:33:47 -0400
X-MC-Unique: b2y1oZ61MpywHNiMXSnr_g-1
Received: by mail-wm1-f70.google.com with SMTP id
 u203-20020a1cddd40000b029016dbb86d796so6159141wmg.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 10:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1t80rBcC/LdCkJ4xdHH34G1J0mh/jwKaoFrJZQDUF70=;
 b=qDwz5i3rHr8IP6kHFBmRU8Z0zDafSO7PLmrByjaAkTVuu+GCAeGO6zVegmim7X5YZm
 NuCgfbHvHyffQf7Z8m9VgpC0WatHlgD/mXuB0cl+q9/u4PpTv5Sf1FLVlF2TgYzSVpvp
 coVvO8S6FfqLZGc73pn30aljaHWSVGnX1+/9gd0KICOZpv4STXFgU6cVp6zJLs7WrN28
 NsSuSSLl436dHdkFOtf8fCZhYvKVZn4L1QA1eCWftd4ekhQPTKlWk7ueJSlO9vdYa6nQ
 FWuioRp4+BscAEZMOzFOH0gkEQ0nPGZbPShoEX6PLuCi9AcVXJjZakCtsGJ71B5lUhVp
 p+dw==
X-Gm-Message-State: AOAM530kb8aet9oEzbk5+Ozh9W+HVU5Y/reEQP2YYppDScmrrwqxBZ1A
 13m2B7dnp7TBXSuipNn9ABLBSJu3+COS+z+UFqhvqKS9IY0W2EFT/OL3UWMk5zx2WyOlKwq1oBJ
 DMY5ZjpngtQgRckI=
X-Received: by 2002:a05:600c:414b:: with SMTP id
 h11mr25520366wmm.139.1621964026422; 
 Tue, 25 May 2021 10:33:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnT3Nm0O3z2/DmsrMM1BdwRF31o24EVQcva9TGlcqybw3IL8bKPgW1hvQfjr7LSL9kAa/jSA==
X-Received: by 2002:a05:600c:414b:: with SMTP id
 h11mr25520345wmm.139.1621964026194; 
 Tue, 25 May 2021 10:33:46 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id z6sm11958992wml.29.2021.05.25.10.33.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 10:33:45 -0700 (PDT)
Subject: Re: [PATCH] gitlab-ci: Be ready for new default 'main' branch name
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210525153826.4174157-1-philmd@redhat.com>
 <YK0hFyf17lNKHqek@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c6584c90-4780-4182-e795-d92b5b3d48d6@redhat.com>
Date: Tue, 25 May 2021 19:33:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YK0hFyf17lNKHqek@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Savitoj Singh <savsingh@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 6:08 PM, Daniel P. Berrangé wrote:
> On Tue, May 25, 2021 at 05:38:25PM +0200, Philippe Mathieu-Daudé wrote:
>> In order to be ready for the GitLab changes in using inclusive
>> terminology (replacing the 'master' branch name by the 'main'
>> branch name), rename our use of 'master' by the $CI_DEFAULT_BRANCH
>> environment variable, so new forks won't be facing any issue.
> 
> I've no objection to the actual config change, but the description is
> little inaccurate IMHO. GitLab is not forcing a branch name change
> into any existing repositories. It is entirely upto QEMU to decide
> when to change our branch names. Forks of QEMU also won't get a new
> branch name, because any branches in forks are inherited from what
> exists in repository being forked and not arbitrarily renamed.

Oh, then I misunderstood the overall change. Thanks for correcting me.

> So, AFAICT, only brand new (ie empty) repositories will get 'main'
> as the new default branch name.
> 
> IOW, I'd describe this as
> 
>   "We want to skip the checkpatch and DCO signoff jobs when
>    pushing to the default branch. Currently this branch is
>    called 'master', but we don't need to hardcode this in
>    the CI configuration, because the $CI_DEFAULT_BRANCH
>    env variable exposes it."

OK, I'll respin, thanks!

>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index f718b61fa78..db4e8490483 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -784,7 +784,7 @@ check-patch:
>>    script: .gitlab-ci.d/check-patch.py
>>    except:
>>      variables:
>> -      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
>> +      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH
>>    variables:
>>      GIT_DEPTH: 1000
>>    allow_failure: true
>> @@ -797,7 +797,7 @@ check-dco:
>>    script: .gitlab-ci.d/check-dco.py
>>    except:
>>      variables:
>> -      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
>> +      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH
>>    variables:
>>      GIT_DEPTH: 1000
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> 
> Regards,
> Daniel
> 


