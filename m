Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8DC40A6BC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 08:33:28 +0200 (CEST)
Received: from localhost ([::1]:38714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ20V-0003LT-B6
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 02:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQ1yV-0002aG-Sm
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 02:31:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQ1yT-0005Gk-5m
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 02:31:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631601079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HPonPo6ZryCCadottQI+MAKoNbH640N075l5yzgf38A=;
 b=JH6VqrL2WUfUc37G/WdTg7p9vAg40S5f+nexQkmIR7umsu1OuYvGUWqYVZKYv1jWdY+0eI
 40S7oNJ57eULXvYuzKwQSKB2zoiciPXazUbyjGIbEyECR7xI1QLGePMI63UHuHmxaQTiS7
 7U+yZcEaMBi/XxDNSnZ3xSl4BRxM9jA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-S8tMWUYkNDeySN8juKYNIA-1; Tue, 14 Sep 2021 02:31:10 -0400
X-MC-Unique: S8tMWUYkNDeySN8juKYNIA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so3579003wrl.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 23:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HPonPo6ZryCCadottQI+MAKoNbH640N075l5yzgf38A=;
 b=5UjwctWlnBSOC4a5TERuwQZu4cTcw/bfH0EERbF02LSLfi6uvrx7b9PDos6oUaXAQZ
 v6cyrGsz56eT84bgVc8sO/nWYDsjXfqF12vJzubd8V6/7WxjosWvE2M8Umt5Z6vJXxhf
 qLFfmxLIs/g/GgZuDpBvoJihrAu8vmvuk4f5WHuscAnmYibLnxICcgNiZoq4rOVQlsix
 DOMxGGkFKsT0WBUNgcN0+B8JjsmYFzlcAxtDNKQOcAcZfI6DJyMMWbd9SmPCd8hFwP4h
 aTnUhYvYCVEvlfJzPWquefLwEGEDLfIBNXvZlxax4EBUedVW9Hjh1n2KyJpl0yndf0AJ
 CjRA==
X-Gm-Message-State: AOAM531xjQXAPQQ6wnl9t3YukkKImaHYU904//sYsngMK3a9tDjirLQr
 QTXgkWWW+hrKgBiz2ZCxeXWilIm4hTWYzC8OMMf8cPgjcbzg+SWBwboNcjoiZmDEHoQqiKNhvPJ
 oBb/r6/eOgQFS79o=
X-Received: by 2002:a7b:c18c:: with SMTP id y12mr293366wmi.3.1631601068993;
 Mon, 13 Sep 2021 23:31:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9l+gh1ziXPnIiw4OSdrSlW1f6stlKR/pFtaF9jjHdMxHSS9Spn4HiOwnoKy4VSIH9XLUNVg==
X-Received: by 2002:a7b:c18c:: with SMTP id y12mr293334wmi.3.1631601068747;
 Mon, 13 Sep 2021 23:31:08 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id v20sm9617232wra.73.2021.09.13.23.31.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 23:31:08 -0700 (PDT)
Subject: Re: [qemu-web PATCH] Gemfile: Add webrick bundle dependency
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>
References: <20210913182927.1022862-1-philmd@redhat.com>
 <9f52b00e-0189-8f44-96d4-cbb398c4514f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a7b13816-fa42-8371-333f-5ee0a19917e8@redhat.com>
Date: Tue, 14 Sep 2021 08:31:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9f52b00e-0189-8f44-96d4-cbb398c4514f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 7:17 AM, Thomas Huth wrote:
> On 13/09/2021 20.29, Philippe Mathieu-Daudé wrote:
>> Without the webrick bundle, jekyll fails to start:
>>
>>    $ bundle exec jekyll serve
>>    Ignoring ffi-1.11.1 because its extensions are not built. Try: gem
>> pristine ffi --version 1.11.1
>>    Configuration file: qemu-web/_config.yml
>>                Source: qemu-web
>>           Destination: qemu-web/_site
>>     Incremental build: disabled. Enable with --incremental
>>          Generating...
>>           Jekyll Feed: Generating feed for posts
>>                        done in 0.686 seconds.
>>     Auto-regeneration: enabled for 'qemu-web'
>>                        ------------------------------------------------
>>          Jekyll 4.0.1   Please append `--trace` to the `serve` command
>>                         for any additional information or backtrace.
>>                        ------------------------------------------------
>>   
>> qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve/servlet.rb:3:in
>> `require': cannot load such file -- webrick (LoadError)
>>            from
>> qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve/servlet.rb:3:in
>> `<top (required)>'
>>            from
>> qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve.rb:179:in
>> `require_relative'
>>            from
>> qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve.rb:179:in
>> `setup'
>>            from
>> qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve.rb:100:in
>> `process'
>>            from
>> qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/command.rb:89:in
>> `block in process_with_graceful_fail'
>>            from
>> qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/command.rb:89:in
>> `each'
>>            from
>> qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/command.rb:89:in
>> `process_with_graceful_fail'
>>            from
>> qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve.rb:86:in
>> `block (2 levels) in init_with_program'
>>            from
>> qemu-web/vendor/ruby/3.0.0/gems/mercenary-0.3.6/lib/mercenary/command.rb:220:in
>> `block in execute'
>>            from
>> qemu-web/vendor/ruby/3.0.0/gems/mercenary-0.3.6/lib/mercenary/command.rb:220:in
>> `each'
>>            from
>> qemu-web/vendor/ruby/3.0.0/gems/mercenary-0.3.6/lib/mercenary/command.rb:220:in
>> `execute'
>>            from
>> qemu-web/vendor/ruby/3.0.0/gems/mercenary-0.3.6/lib/mercenary/program.rb:42:in
>> `go'
>>            from
>> qemu-web/vendor/ruby/3.0.0/gems/mercenary-0.3.6/lib/mercenary.rb:19:in
>> `program'
>>            from
>> qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/exe/jekyll:15:in `<top
>> (required)>'
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   Gemfile | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Gemfile b/Gemfile
>> index 6a7852e..dc35cb7 100644
>> --- a/Gemfile
>> +++ b/Gemfile
>> @@ -25,3 +25,5 @@ end
>>     # for https://github.com/sass/sassc-ruby/issues/146
>>   gem "sassc", ">= 2.2.1"
>> +
>> +gem "webrick", "~> 1.7"
> 
> Daniel, is this fixing the jekyll problem for you, too?
> 
> I'm still on ruby 2.5.9 where this does not occur yet... might be good
> to mention that this is a new problem with ruby 3.0 in the cover letter.

I'll also mention I'm using Fedora 34.


