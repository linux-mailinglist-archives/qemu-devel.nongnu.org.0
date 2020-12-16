Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FDF2DC322
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:30:17 +0100 (CET)
Received: from localhost ([::1]:55430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYkq-0000f1-OC
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:30:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpYgo-0006kz-35
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:26:06 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:35205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpYgj-00077P-Kp
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:26:05 -0500
Received: by mail-oi1-x22d.google.com with SMTP id s2so27881613oij.2
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 07:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EBiJLFbCoGaT5KSrVznC/DIBoyJXIdpSOQsDldGdams=;
 b=ifATdx7nqBMKPo2KSvxlghEjymbVFPmMgdYzAp8m/wEoPf9L3Vq+E+4OsaO6SQo0Qq
 I9E05FUk/pZnm7LsYaYhHU/GiMcDCTLyaYLGJN/jS9UHIfTM1phDoWeli/561C554qNM
 +r4NvgNF+w6KLxHNEALi0vevV/P4RnlAGCVJmxG7KxOrex5RNHX20F5dZrjrOPkQxHC9
 vMNZP2b5Q4Wu1pJAcSNdYWjG643njSeXmcOem5Ld7aOLq9ImwmiKFOWinsQtV2mkU97z
 fpEUuFIO68U05C0q5pGrH69TcTee7vdxiA8jzwL5LQ4o9OYvuoc4tvqO2lT4P7NYWHJp
 UVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EBiJLFbCoGaT5KSrVznC/DIBoyJXIdpSOQsDldGdams=;
 b=ofvMDuLn6e3SLVDL30FXWBMKj6bTlWEOZTZRkr+EoJWNOfK9XxPiqX42nXL0vJ91qy
 uKaNZxBz2NHA1EGnrS5W854EX+HDJAbDKT7RqKTkf8r2WAuCOarumcny5UZblALg1MHW
 hIsSmWWNhyf5z+pE2ia2+Gd8nltFMzuQU5oispZu+B/k/5VepdtiNFjHF5EzdVuitoq9
 tc7HsVcDJn/AGC00+awd3C6F36yynQ+WsDrsN6YfPwF0bgPHKaQ+Jl5GSFu1cN9C/4c4
 UgYgrvhv190rbkAVTpL6ZKvGuSBzGtHYS2zQg7Oksm4JqixraFzeN5E9xR1ZAzYGf2SG
 e5KA==
X-Gm-Message-State: AOAM532Yq4Ump9HzArRN1PU1uPEN12b4jrk6KpEGIIh/AFErZ5kvzkif
 k4UOOvEse2VGVLarfULqx1oxWg==
X-Google-Smtp-Source: ABdhPJwHG4/HaDrPKlDLJX8nrwNX3DFGmb7GRvHfDZUJHhzWJYYxjG279ov5WlRfkIt0JyeDBdyIjw==
X-Received: by 2002:aca:ec13:: with SMTP id k19mr2310751oih.97.1608132360448; 
 Wed, 16 Dec 2020 07:26:00 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id s23sm598074oot.0.2020.12.16.07.25.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 07:25:59 -0800 (PST)
Subject: Re: [PATCH 3/3] trace: do not include TCG helper tracepoints in
 no-TCG builds
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201216135529.265165-1-pbonzini@redhat.com>
 <20201216135529.265165-4-pbonzini@redhat.com>
 <98e787e4-884b-61c5-bf52-b041f57747c3@linaro.org>
 <a4974b10-ba71-8bd7-e5a9-6eef7543cee4@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <476adc2f-fbff-48a9-78fa-ce64cc3e5f80@linaro.org>
Date: Wed, 16 Dec 2020 09:25:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a4974b10-ba71-8bd7-e5a9-6eef7543cee4@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 9:22 AM, Paolo Bonzini wrote:
> On 16/12/20 16:13, Richard Henderson wrote:
>>> @@ -71,7 +71,7 @@ foreach d : [
>>>                   input: meson.project_source_root() / 'trace-events',
>>>                   command: [ tracetool, '--group=root',
>>> '--format=@0@'.format(d[1]), '@INPUT@' ],
>>>                   capture: true)
>>> -  specific_ss.add(gen)
>>> +  specific_ss.add(when: 'CONFIG_TCG', if_true: gen)
>>>   endforeach
>>
>> Sure, unless it makes more sense to conditionalize the entire loop, so that
>> those targets aren't even created?
> 
> The targets exist but the files won't be created (the rules will be in
> build.ninja but they'll be orphan).

Yes, I get that.  So... is there a reason for them to be there, when it seems
just as easy for them not to be?


r~

