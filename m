Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D09A42F3C2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 15:38:26 +0200 (CEST)
Received: from localhost ([::1]:49944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbNPk-0004pe-W0
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 09:38:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mbNNl-0003sZ-RC
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 09:36:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mbNNi-00063u-H9
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 09:36:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634304977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=luCF2cNPwYToouC1WEoSvdUytiFw7EfHbS0/EVxblFQ=;
 b=OsEeJPUyrc4IXHH0qBqMCc7vR6R+KEn7kzqWCcfQCuN+yvElagNPa3sQmsXYZUrq5r0NoU
 CldnwrlUYdrTU8wjwqp9nioT54WDTcQWfii2agUMJozJUwA9bcbjtsVFPQmrQdD/++OFRv
 wqrbuusAjEDxaQlT3bb2br/dtTbnvmU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-zKKNdOQZOguiJyxsnJGz_Q-1; Fri, 15 Oct 2021 09:36:15 -0400
X-MC-Unique: zKKNdOQZOguiJyxsnJGz_Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 t28-20020a508d5c000000b003dad7fc5caeso8229702edt.11
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 06:36:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=luCF2cNPwYToouC1WEoSvdUytiFw7EfHbS0/EVxblFQ=;
 b=47pc1QW15ap2QdFFWB6E9s9lGTFq1zZefzIDigU/0S5YYzBlxptD+aZC1WhV6nMnfe
 JrASOvprc7OIgG8HJLZBUwjZSChPHv8XDURRItrnKI5b3TIkrgKzkI1H0c/ZHanSdlDf
 E50R2LgXIyMwQ+Lg990QvjLNYg3Pd/E0gue7exW2h5eIXCqQ31ghwTwQ8Cihcibiilln
 TjbgZjQBHIPk8P3F6eDY7gxdFn+iugIdbIxGpKw2O3iNLyHgnag+XGjDBy6d8fzsMxAm
 8E376Ieax5QtHdxhhJdpXouPOS5hJbki0U2WlYTLd+v2OCQOdF1IncaT0u6KX8EUHuhL
 mwJA==
X-Gm-Message-State: AOAM533Lv/OjB3a0mgOihEhHqn8r1omGYmsdPjDb3eutVT8L0rpI6NVz
 s7EYFjxh+NhFQGD1oXM5sRNYbNX3IV+0t/HYdQrdkObIKvbvHbx9x3M85u5CreG0q1I+op4x7Lq
 XKusvvE9/WtGRw5I=
X-Received: by 2002:a17:906:2bd5:: with SMTP id
 n21mr6995565ejg.337.1634304973819; 
 Fri, 15 Oct 2021 06:36:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxU1/e7suB9pFiJDOa12XineRDx+f2WoZwyc1m5QqDiLd9HZzSPW6fIXIwFkzey7JsiEECekg==
X-Received: by 2002:a17:906:2bd5:: with SMTP id
 n21mr6995525ejg.337.1634304973555; 
 Fri, 15 Oct 2021 06:36:13 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z13sm1735110ejl.106.2021.10.15.06.36.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 06:36:13 -0700 (PDT)
Message-ID: <8d3c0b03-6967-952c-782d-13b0eb1aa6ab@redhat.com>
Date: Fri, 15 Oct 2021 15:36:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 4/4] configure: remove dead EXESUF variable
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211015100718.17828-1-pbonzini@redhat.com>
 <20211015100718.17828-5-pbonzini@redhat.com>
 <c352ccff-68aa-51c7-9261-de2e024dd16a@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <c352ccff-68aa-51c7-9261-de2e024dd16a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, thuth@redhat.com, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, hreitz@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/10/21 14:38, Philippe Mathieu-Daudé wrote:
> On 10/15/21 12:07, Paolo Bonzini wrote:
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   .gitlab-ci.d/crossbuild-template.yml | 2 +-
>>   configure                            | 3 ---
>>   2 files changed, 1 insertion(+), 4 deletions(-)
> 
> Maybe squash in patch #2 or place as #3 mentioning
> "the previous commit"?

Anywhere you place it it's wrong. :)  Squashing in #2 I dislike because 
of the functional change in .gilab-ci.d (in truth, the variable is 
*almost* dead!).  Having the change as #4 makes it survive one patch 
longer than it should, on the other hand having it as #3 separates 
similar changes to "check-block.sh".

What I will actually do in the final submission is not include the TAP 
patch and submit it separately.  Then for this one I can indeed add that 
it was used only in the implementation of check-block.

Paolo


