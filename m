Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF613301D4F
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 16:51:08 +0100 (CET)
Received: from localhost ([::1]:36162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3hfP-0004Md-8t
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 10:51:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l3heT-0003uW-3h
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 10:50:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l3heQ-00023d-06
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 10:50:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611503403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IS4BUxACdjnOwLLL4rpG+R3vMr63YTUw27ZKFkqcEAE=;
 b=AOYAW8xfOcH1lqBGBk+g3EREGT9CxFG+QYzJRvs3qV0MaIe1Dp91FccAnKEoK2ZoIfUk5Y
 PkREaZ3mnnXmplrpWsvKXwUbIQMtemy0DzHRZFNBlxoES7dNsgCWq+S8s1AZuzt8o8zv+v
 LxEzH3w3HILxERZNyckNyB8iBqrrkFg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-Qnu3MPRlN5ey8K3Lm8yR5A-1; Sun, 24 Jan 2021 10:50:01 -0500
X-MC-Unique: Qnu3MPRlN5ey8K3Lm8yR5A-1
Received: by mail-wr1-f71.google.com with SMTP id d7so6037793wri.23
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 07:50:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IS4BUxACdjnOwLLL4rpG+R3vMr63YTUw27ZKFkqcEAE=;
 b=MjfrmzOoLJjCpF/AiyCS35tVEWCQsFsvFE3aRtnO8DPo5OfZ52y0LRZuyh8UKgrQTT
 tUUQZCooAyNtWUbSDgjhlfaGaJ9DoNGChfox9Gnp6ZGV5efcv+KYIhP53jLpIck3q4+S
 G6Cgc1YL+IyRWwTGSQphp2sj2tzFyLQ+kR8vQGUc5iBdeZ0w0halvx3AFI3/r46IZ5wJ
 0ALgThHTo6n+vpUuBRcon63xfk5xf/0YXuqp/wZUMUsKuNho5kOrYWI/pTv7wD8/9uBP
 Shu+be4+eqzmm7VQrobaOfwxwC19+4xw3t+geymCPrRGGAzmCInu6qaSDqclAM/BHrcW
 +jrQ==
X-Gm-Message-State: AOAM531P7r1qtIg78YQY6epqb1a0mGRQNEYw/LjIMEp75U5Md+b4k8Im
 gEQ2MffRxY2Skk/TcJ3/nJeDG4BmzTNIuwWuT0V9uQmf3OuAM5EBWL4CmLBGL98JX7d2T3jJrh3
 HtjRfXHp7UV8xLJY=
X-Received: by 2002:a5d:6191:: with SMTP id j17mr13167064wru.281.1611503400142; 
 Sun, 24 Jan 2021 07:50:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwC2JI3cnwXLZRTmDILRpGYyb3i5jCUTIAWI4YeTvzn2A/07AF1n03xJAyQyGYMy2+ZfEoyYg==
X-Received: by 2002:a5d:6191:: with SMTP id j17mr13167052wru.281.1611503399946; 
 Sun, 24 Jan 2021 07:49:59 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g187sm18698599wmf.1.2021.01.24.07.49.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 07:49:59 -0800 (PST)
Subject: Re: [PATCH v3 4/4] configure: Reword --enable-tcg-interpreter as
 --disable-native-tcg
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210122133004.1913923-1-philmd@redhat.com>
 <20210122133004.1913923-5-philmd@redhat.com>
 <c92fdd54-d67c-adfe-66a3-24206b8f4108@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <15d52e3f-618a-3ad0-baed-0ae35da94b90@redhat.com>
Date: Sun, 24 Jan 2021 16:49:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <c92fdd54-d67c-adfe-66a3-24206b8f4108@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/21 7:13 PM, Paolo Bonzini wrote:
> On 22/01/21 14:30, Philippe Mathieu-Daudé wrote:
>> Users might want to enable all features, without realizing some
>> features have negative effect. Rename '--enable-tcg-interpreter'
>> as '--disable-native-tcg' to avoid user selecting this feature
>> without understanding it. '--enable-tcg-interpreter' is kept in
>> for backward compability with scripts.
>>
>> Suggested-by: Thomas Huth <thuth@redhat.com>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   configure | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/configure b/configure
>> index 48bd6f48d7a..5e5ff779a69 100755
>> --- a/configure
>> +++ b/configure
>> @@ -1121,7 +1121,8 @@ for opt do
>>     ;;
>>     --disable-tcg-interpreter) tcg_interpreter="no"
>>     ;;
>> -  --enable-tcg-interpreter) tcg_interpreter="yes"
>> +  --enable-tcg-interpreter) # backward compatibility
> 
> Do you really want to break the old option?

I am not breaking it, I'm keeping it, but not listed
in the help. Maybe you meant "not break the old option",
in that case you suggest me to add a warning such "this
option is deprecated and has been replaced by
--disable-native-tcg"?

> 
>> +  --disable-native-tcg) tcg_interpreter="yes"
>>     ;;
>>     --disable-cap-ng)  cap_ng="disabled"
>>     ;;
>> @@ -1753,7 +1754,7 @@ Advanced options (experts only):
>>     --with-trace-file=NAME   Full PATH,NAME of file to store traces
>>                              Default:trace-<pid>
>>     --disable-slirp          disable SLIRP userspace network connectivity
>> -  --enable-tcg-interpreter enable TCI (TCG with bytecode interpreter,
>> experimental and slow)
>> +  --disable-native-tcg     enable TCI (TCG with bytecode interpreter,
>> experimental and slow)
>>     --enable-malloc-trim     enable libc malloc_trim() for memory
>> optimization
>>     --oss-lib                path to OSS library
>>     --cpu=CPU                Build for host CPU [$cpu]
>>
> 
> The problem here is that for some CPUs there is no native TCG...  I
> mean, what's unclear in "exprimental and slow"?

OK, we can skip this patch then.

> 
> Paolo
> 


