Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2953466E11C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 15:43:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHn9m-0004jo-G5; Tue, 17 Jan 2023 09:41:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pHn9i-0004j0-6w
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:41:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pHn9f-0005Ut-4K
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673966497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KjUrAaT1HOOp6nQOFRTBUX4/8WGOMp9L6nnXk9+Jf0M=;
 b=WwqXXnyirYx0FqJoW6FJxgacX2wPmQGal/lY89GFKe/M9XKnPPbTmUUnPX1av0C/ksOBSX
 cVg+Q2+/nG+vdX2TMqGTbAcR22VaNeJtzTl5UfvIQwc9nMMw8alvNeT6sgu4Mxfzo8F+Mk
 2afXB5UGmJNytzii4Xfa0pPCBNyCt8M=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-_mmx2AvwPYK5n8GQBEnxYQ-1; Tue, 17 Jan 2023 09:41:35 -0500
X-MC-Unique: _mmx2AvwPYK5n8GQBEnxYQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 nh4-20020a056214390400b004e36a91ecffso16038551qvb.19
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 06:41:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KjUrAaT1HOOp6nQOFRTBUX4/8WGOMp9L6nnXk9+Jf0M=;
 b=1VTn10hb36mgb6C/28l0NeJV8gLocEixtwl/s6Sa5HBBVqWoR4UQPNvKXcU/o4v+CY
 mO6IGSrzievVEvc02nt0+eHDXrBByT6CFMf6FJClKWZOo8e/w5TYvfoERimVFVlqt+n5
 yQQE+oOmgHBJ/yMdyYwbPKogzFTzm6P/h9rPmuLIm7+pmmaOK+QmGSyQDO6YZMf0PWsG
 afdtRLZK5oSER/DUG58iIN7Bgnk/SwJmcH7fL2AGUmgQLqk8hhwo+DqVzs3TVjY/wYax
 5vf6EKOdO+d1sZxMdtqih81+P8iBnL0xywAjCQzWc+E7fi+iOMWotrWLIJiYNUwno/m3
 WZFQ==
X-Gm-Message-State: AFqh2koI1J+u4uA2Y2S/DjPfm/2Sl+ds3arJoKckVWNSXhYBWO5k7DmW
 dFhO2nnN8fwa6g3ykhU83NuhnjAD//Ub7KzylUuyQXi0Zq+Cfc1s4EXW1SoOHuQWpGks/c0qynt
 O1scE8rMOcoBF2K8=
X-Received: by 2002:ac8:7283:0:b0:3b0:3b56:58cb with SMTP id
 v3-20020ac87283000000b003b03b5658cbmr4007792qto.59.1673966493446; 
 Tue, 17 Jan 2023 06:41:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtdVnlavrOjZLnwxB90etKihd3WmeLAeIwPjHZzhld1eHn6SQevaL3wOvg5xfQ1tu0OCSnIYg==
X-Received: by 2002:ac8:7283:0:b0:3b0:3b56:58cb with SMTP id
 v3-20020ac87283000000b003b03b5658cbmr4007758qto.59.1673966493088; 
 Tue, 17 Jan 2023 06:41:33 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 d8-20020ac84e28000000b0039c7b9522ecsm16078310qtw.35.2023.01.17.06.41.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 06:41:32 -0800 (PST)
Message-ID: <b24cbd41-6190-8642-4673-01a6c4b50659@redhat.com>
Date: Tue, 17 Jan 2023 15:41:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/3] configure: Enable -Wthread-safety if present
Content-Language: de-CH
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230117135203.3049709-1-eesposit@redhat.com>
 <20230117135203.3049709-4-eesposit@redhat.com> <Y8aqii6iBsdd5rl6@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Y8aqii6iBsdd5rl6@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 17/01/2023 um 15:02 schrieb Daniel P. Berrangé:
> On Tue, Jan 17, 2023 at 08:52:03AM -0500, Emanuele Giuseppe Esposito wrote:
>> From: Kevin Wolf <kwolf@redhat.com>
>>
>> This enables clang's thread safety analysis (TSA), which we'll use to
>> statically check the block graph locking.
>>
>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> Message-Id: <20221207131838.239125-9-kwolf@redhat.com>
>> Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> ---
>>  configure | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/configure b/configure
>> index 2281892657..14668e6269 100755
>> --- a/configure
>> +++ b/configure
>> @@ -1183,6 +1183,7 @@ add_to warn_flags -Wnested-externs
>>  add_to warn_flags -Wendif-labels
>>  add_to warn_flags -Wexpansion-to-defined
>>  add_to warn_flags -Wimplicit-fallthrough=2
>> +add_to warn_flags -Wthread-safety
> 
> Does this thread safety analysis have any kind of measurable
> impact on compilation speed ?
> 
> Our CI jobs are quite sensitive to any increase in build
> time.

From a quick run in my machine (Dell PowerEdge R440 with Intel(R)
Xeon(R) Gold 5120 CPU @ 2.20GHz, 28 cpus):

without clang:
real    2m46.729s
user    19m24.122s
sys     2m58.643s

with clang:
real    2m45.204s
user    19m52.096s
sys     2m9.036s

So there should be no significative impact.

I also forgot to mention that this serie fixes the CI failure seen in:

https://gitlab.com/qemu-project/qemu/-/jobs/3479763741
https://gitlab.com/qemu-project/qemu/-/jobs/3479763746

Thank you,
Emanuele
> 
> 
> With regards,
> Daniel


