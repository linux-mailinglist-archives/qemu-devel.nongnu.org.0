Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 050C051FE03
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:20:57 +0200 (CEST)
Received: from localhost ([::1]:34580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3Jj-00085i-3Y
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1no2oo-0001I5-MY
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:48:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1no2om-0001vU-9O
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652100531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zi4a1NgXwf9Ly1axRIvqprJyE3v4WAAgGzOC5piWzuk=;
 b=Ebr87+WyNjqcLHW2GFZkPGuRMQoyG9ecQopxWmzlIukQ9Q+MQwe3gaVslG8GKBBX8NaYJq
 sJvaZdoFx0wEkWG8HzuyuXKZtXtL7cJxOBcT1ATdbZkyxpB2KblTF8I9Hoe0RFSFj9wLMO
 8D/H0lJaYiwPYcySdKOaeu/udBWRsy0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-MGn1OhYIPHOj7d9RnCMp1g-1; Mon, 09 May 2022 08:48:49 -0400
X-MC-Unique: MGn1OhYIPHOj7d9RnCMp1g-1
Received: by mail-wm1-f69.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so4236121wmr.0
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 05:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zi4a1NgXwf9Ly1axRIvqprJyE3v4WAAgGzOC5piWzuk=;
 b=gaKb0/5yz80mQwbdY1whacjzWHWvrLtzKBaHpQaGQh730ePnxosQOgWNhxh+ZlHRG6
 ekbKwILQ+hLoXRD9NC22E+OwvkuoVxhzF37SWIKHk5fP1bqIHKo4ojBT/k9Zp7lpazuG
 2gbjDoT/HmmsqS08SHhO7tUhp8zDaBz2qCnnhsVEWxOtG2B14CYjCizStsZMzvNndbpB
 vnF5iPeG9Yx0Q3BJPUFQ1ljZLlEgJCCNyVfoJDNvsoJouOzqwSrsyGaG9sRhlRMzieLD
 OK9zMtPIhDXXi1jHBYFpooh1arsgWi17ucGi2k4VBhDzu6kZtV+UU+es/SdAAcrSbE59
 +vvQ==
X-Gm-Message-State: AOAM530kuM1OwV30XGmsYZ9Y3v7tca1Xfnrza6xCIkZIqPFro0HOa+zq
 VLOAjIGjxqm6tBroNBkP2+WG2pE/S+moAPgiO7/RdjRzZOZGaiIqVlh4c+5W7az3GCUQzCOcx5S
 hcEJFUv5L8IcN6z8=
X-Received: by 2002:adf:dd0e:0:b0:20a:d00a:fcf0 with SMTP id
 a14-20020adfdd0e000000b0020ad00afcf0mr13448316wrm.239.1652100528726; 
 Mon, 09 May 2022 05:48:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxM5ZfrujZYduJB9k9oq0fL3zYEYwQS5J2vLwaafdoahBqBMwh73CcIig3EwgEpa0uoUyQF9A==
X-Received: by 2002:adf:dd0e:0:b0:20a:d00a:fcf0 with SMTP id
 a14-20020adfdd0e000000b0020ad00afcf0mr13448290wrm.239.1652100528430; 
 Mon, 09 May 2022 05:48:48 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 k37-20020a05600c1ca500b003942a244f53sm14541596wms.44.2022.05.09.05.48.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 05:48:47 -0700 (PDT)
Message-ID: <afa7d433-bdd4-8628-58be-15795682297f@redhat.com>
Date: Mon, 9 May 2022 14:48:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/2] tests/qemu-iotests: print intent to run a test in TAP
 mode
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20220509124134.867431-1-berrange@redhat.com>
 <20220509124134.867431-2-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220509124134.867431-2-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/05/2022 14.41, Daniel P. Berrangé wrote:
> When running I/O tests using TAP output mode, we get a single TAP test
> with a sub-test reported for each I/O test that is run. The output looks
> something like this:
> 
>   1..123
>   ok qcow2 011
>   ok qcow2 012
>   ok qcow2 013
>   ok qcow2 217
>   ...
> 
> If everything runs or fails normally this is fine, but periodically we
> have been seeing the test harness abort early before all 123 tests have
> been run, just leaving a fairly useless message like
> 
>    TAP parsing error: Too few tests run (expected 123, got 107)
> 
> we have no idea which tests were running at the time the test harness
> abruptly exited. This change causes us to print a message about our
> intent to run each test, so we have a record of what is active at the
> time the harness exits abnormally.
> 
>   1..123
>   # running qcow2 011
>   ok qcow2 011
>   # running qcow2 012
>   ok qcow2 012
>   # running qcow2 013
>   ok qcow2 013
>   # running qcow2 217
>   ok qcow2 217
>   ...
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qemu-iotests/testrunner.py | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
> index aae70a8341..dc871b7caf 100644
> --- a/tests/qemu-iotests/testrunner.py
> +++ b/tests/qemu-iotests/testrunner.py
> @@ -361,6 +361,9 @@ def run_test(self, test: str,
>                                        starttime=start,
>                                        lasttime=last_el,
>                                        end = '\n' if mp else '\r')
> +        else:
> +            testname = os.path.basename(test)
> +            print(f'# running {self.env.imgfmt} {testname}')
>   
>           res = self.do_run_test(test, mp)
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>

I wonder whether we should flush stdout, too?


