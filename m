Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A586369CE5C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 14:59:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU6gG-0006Qp-Bn; Mon, 20 Feb 2023 08:58:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pU6gA-0006QS-9B
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 08:58:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pU6g8-0007a4-HQ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 08:58:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676901483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A8CRaqn1YTWPlCCHXKIMK/OG7qYRODylXafWAjbZ2PM=;
 b=GAcBfxDo3eqDJAqoVy4FTJCHcYMvaHS2z49RIedx8BGPml02JDLREh70rjUICcMhgIx9Oj
 48ENRk/3cUyZCe6Gco69rjleH1QmXabxA/ajXfw9o9g7Keh7hPumWGbCminlhgAADfD/tR
 m74FNOlF0+rpfYJsetMV3e/6F0LbNAQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-336-wcepiMhSPBeaIFf4ma4uIw-1; Mon, 20 Feb 2023 08:58:01 -0500
X-MC-Unique: wcepiMhSPBeaIFf4ma4uIw-1
Received: by mail-ed1-f72.google.com with SMTP id
 g24-20020a056402321800b004ace77022ebso1928612eda.8
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 05:58:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A8CRaqn1YTWPlCCHXKIMK/OG7qYRODylXafWAjbZ2PM=;
 b=kjA/LmzEo6OY4/QlDd56hfThO3naFa3QqEIbmbL1fFMjsSEycdXfyuXfAZGXGwAMYE
 0mGWQSzO4YqB2dkju6ETTvpgr4G2FUyb07ypj5f2qQqIIWQk8iIEzN7oC7MFupHi1QuX
 5O+J0h8Q4OBzZcH1JXaYiivedqSMToAxVxGFJUChFKMTwYBtmgmuEkEsz1UntqWNr2La
 GSw/X/suGFi4Mb2kgLc2SttAVm0K0ijPro6cUoH5OH9i3w5Ro+LHgZd+oBKfqp+TA8Zx
 KqXfDGAnYyJFKemW2sdU3OVZFsUHwhstkCmP70z8GeGM+i4KUxNEoh7M65VZuk3gS3W4
 r8TQ==
X-Gm-Message-State: AO0yUKWNbi4vDoVtev8yZ43cZio0vsjntLV6cs4SLvBSg3DnzKU99raL
 1RVePxSz7s1G/QXQZJE4pG2K/W1sBddcAd2XnDKS7wCORMWLEMOdTB7R+bbn/LDsCG0Ygzy81Us
 uZB0elPoW+mmB5cY=
X-Received: by 2002:a17:906:34da:b0:8b1:3a91:73ec with SMTP id
 h26-20020a17090634da00b008b13a9173ecmr9396088ejb.68.1676901480505; 
 Mon, 20 Feb 2023 05:58:00 -0800 (PST)
X-Google-Smtp-Source: AK7set9bzzQKA0qrGBF5ubG7UG/h2UKreq5m6D+OjL8TZuHQcdmVNiQ9vfVQVCakzjN5msxsT1mBfQ==
X-Received: by 2002:a17:906:34da:b0:8b1:3a91:73ec with SMTP id
 h26-20020a17090634da00b008b13a9173ecmr9396068ejb.68.1676901480215; 
 Mon, 20 Feb 2023 05:58:00 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5?
 ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.googlemail.com with ESMTPSA id
 hz21-20020a1709072cf500b008d71e08c78dsm894996ejc.81.2023.02.20.05.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 05:57:59 -0800 (PST)
Message-ID: <5790f0bb-64ef-adcf-5f7b-4c11a109fcc5@redhat.com>
Date: Mon, 20 Feb 2023 14:57:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] docs: build-platforms: refine requirements on Python
 build dependencies
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20230217124150.205012-1-pbonzini@redhat.com>
 <Y++dVjax+6GdtEr1@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y++dVjax+6GdtEr1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/17/23 16:29, Daniel P. Berrangé wrote:
>> * it introduces different support periods for*native*  vs.*non-native*
>>    dependencies.  Non-native dependencies are currently Python ones only,
>>    and for simplicity the policy only mentions Python; however, the concept
>>    generalizes to other languages with a well-known upstream package
>>    manager, that users of older distributions can fetch dependencies from;
>
> I guess this would mean its applicable to perl/ruby/etc, but really
> we should be exclusively using Python for our scripting needs, except
> for legacy stuff we already have. So in practice non-native == python.

Yeah, we used to have some Perl but it was always pretty basic in terms 
of dependencies.

> Potentially if we want to use Rust, we'd want vendoring of deps needed
> by Rust code, and that's native deps arguably, rather than non-native.

Indeed I was thinking more of Rust/Go than Perl or Ruby.  Distros 
generally don't try to include all possible Rust and Go dependencies or 
to build all Rust/Go packages with a single version of a dependency. 
LWN has had plenty of articles over the years about Debian and Fedora's 
failed attempts to do so.

So I considered those to be non-native dependencies in the sense of 
dependencies that can be fetched by a "non-native" package manager, i.e. 
one that is not rpm- or deb-based.

I'm not sure whether we would vendor the dependencies or download them 
at configure time, but anyway they would probably be vendored in the 
release tarball only, similar to submodules.

Paolo


