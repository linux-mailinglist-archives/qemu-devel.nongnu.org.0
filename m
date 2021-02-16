Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCB531C6B1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 08:07:02 +0100 (CET)
Received: from localhost ([::1]:59508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBuRp-0002XM-G8
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 02:07:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBuQ8-000240-Jj
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:05:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBuQ6-0007mR-Q1
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:05:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613459113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3xkHX1wps+78oPSurbaivXzZsmjmyFs6632OmOnrZTA=;
 b=DDBgD2rfhOkP1V81zW0LdHTaHm2Bosj81Wc7n5z1eCHVsYptJNcOpCqaT+f4D0ApY4J3WD
 brFsCxBM0A5X/i3D9rWY9mhSv7ilP4j7w7hnQ22PmgLf8JV0PGARevvio5MH58z2uZ+P/T
 5tTLl8cu6nKUwC3tcAGjU9AGhPsexcE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-mPYp-kioMvWhCWltBGBCWw-1; Tue, 16 Feb 2021 02:05:12 -0500
X-MC-Unique: mPYp-kioMvWhCWltBGBCWw-1
Received: by mail-wr1-f70.google.com with SMTP id w16so12794852wrl.15
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 23:05:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3xkHX1wps+78oPSurbaivXzZsmjmyFs6632OmOnrZTA=;
 b=I7yzjpR9EPrekwdEspVhNPizMs1jADNpE5lUC63f6wxV36a1cjnutrOc9Aoiu1En+O
 EJT0ovjUfU/j8gr2TjvpbMOmzExR8o5fJfqBS+oM7Xi+Fu/aT8+7tzRVSmtdHnO0TBB7
 6W/DcEznB8/puIB9o6vqa0TDr4CMfAX+JTFmZGuQ9LK07wN4t0gcu5KEh+DvBWEdMjeZ
 9eaRkOqvFeiKT4nZGRT14EwYk5Y0z96uG5tJGHwnmEsvebg8G0pvMOFrX/Hvg2h+PwGN
 9eIMAbk5/M7bAFh2RyjyftW6qkef0ZRELuwJVHwrj6rEMIkY/QPTE/yu+lzLJA6+r1Ym
 u54Q==
X-Gm-Message-State: AOAM532hGM6y3zyDg7WwdY3rPMdynHWg6aClN+fEJoKE0KNla6c9AVYp
 SkgnTQooDCRHoHoHzZCdvQcHCh+IxMv7ZlV38HnhM+eLc8+K4osp4c0C3/wz7LX+izAtKsUl6lj
 hCl3I89Rg7vm3BrU=
X-Received: by 2002:a1c:2783:: with SMTP id n125mr1937305wmn.74.1613459111050; 
 Mon, 15 Feb 2021 23:05:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDj6awYa/kfeM8HJw7UpDlbzUJt564SwYIrA3nwVrudWrPpTU4lyxaDW+wgDBV/hOQtrFTIA==
X-Received: by 2002:a1c:2783:: with SMTP id n125mr1937285wmn.74.1613459110887; 
 Mon, 15 Feb 2021 23:05:10 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d5sm18127570wrp.39.2021.02.15.23.05.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 23:05:10 -0800 (PST)
Subject: Re: [PATCH] gitlab-ci: Only push Docker 'latest' image when building
 default branch
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210215192814.989441-1-philmd@redhat.com>
 <97878d0a-5c47-c50c-c4ef-f6d69a52a7d0@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b09a8758-4cb5-b0bb-4c4a-334ea2d52b29@redhat.com>
Date: Tue, 16 Feb 2021 08:05:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <97878d0a-5c47-c50c-c4ef-f6d69a52a7d0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 7:55 AM, Thomas Huth wrote:
> On 15/02/2021 20.28, Philippe Mathieu-Daudé wrote:
>> While we are interested in building docker images in different
>> branches, it only makes sense to push 'latest' to the registry
>> when this is the project default branch (usually 'master').
>>
>> Else when pushing different branches concurrently we might have
>> inconsistent image state between branches.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   .gitlab-ci.d/containers.yml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
>> index 90fac85ce46..52a915f4141 100644
>> --- a/.gitlab-ci.d/containers.yml
>> +++ b/.gitlab-ci.d/containers.yml
>> @@ -17,7 +17,7 @@
>>             -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
>>             -r $CI_REGISTRY_IMAGE
>>       - docker tag "qemu/$NAME" "$TAG"
>> -    - docker push "$TAG"
>> +    - test "$CI_COMMIT_BRANCH" = "$CI_DEFAULT_BRANCH" && docker push
>> "$TAG"
> 
> So does that mean that the following stages in the CI (i.e. build, test)
> are only always (i.e. also for the non-master branches) going to use
> containers that have been build on the master branch?

Hmm good point. Should we use "$CI_COMMIT_BRANCH" instead of "latest"?


