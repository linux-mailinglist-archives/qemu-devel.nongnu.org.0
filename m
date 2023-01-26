Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B6F67D3F3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 19:19:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL6p2-0002Sq-NZ; Thu, 26 Jan 2023 13:18:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pL6p0-0002Se-Is
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:18:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pL6oy-0000wj-VU
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:18:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674757079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bqeWiA/2mjc7e+Uif7NtnDLsq6DYZfU6Lx3voRjhnn8=;
 b=iI4DNVdkt5W3HQxrg0NMlYdsR2Bg57VJqkVo4EoaR0q/DUBFKI3VbRmwKMh/IULQNLc+OM
 hFwSoJjIjX8mok/RTn2FiQ5Ha/a0UK/dR2k9NVusRuAf1G6WSGJoVWb5FpmHc2M304W+Dt
 K0zEDtHy5e+OmqCgwvJZYnJ+5ln8wto=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-368-C1c6wb2oN6uKmc--Kcoo0A-1; Thu, 26 Jan 2023 13:17:58 -0500
X-MC-Unique: C1c6wb2oN6uKmc--Kcoo0A-1
Received: by mail-yb1-f199.google.com with SMTP id
 n194-20020a2540cb000000b008038647d9ebso2719427yba.5
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 10:17:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bqeWiA/2mjc7e+Uif7NtnDLsq6DYZfU6Lx3voRjhnn8=;
 b=dJ2aPsvm0UsG+2JZnGu0w0bMZwjiuMo+CMVB9iUSTh3WxxqM6Js37N/TN+YJVoFt52
 c051wgvepETgd6yJz9B2MORwjSjj41T/43ZH6IKzNJkoVNKX7IPYLEYN0XNAylUYEB6u
 vT3iGiR2BhICVeEnOcxMD/MFb5s/SMywGM4I5Kpk2VEhAXbacSAaRih675qMOxX6RTmx
 3P5BBgJqd3kUVeSAZh7SNnhFk2243kVQFN6ZmmwzfJpHnd0tYhTL3kZbSyrpqOyJoe8y
 6VfAzRcj+0Wz/KP+XK8oGxS5vuMgTsaFpg8fbWxXuYVvjm7WPyseeF0k4920+1MKdEj1
 QwpQ==
X-Gm-Message-State: AFqh2krQxFXC6uYA9l19gKi5HSy9wx4R9A9bGS4qzyNqvciYaQFnlINO
 oGDoBGGYAipfr5IbD4y+rvHRVtcI/sG9HFBkk0rhsxEyYcVtZd0VSy9KvQt4nlLkK7OYgAQhtlP
 3Ug7br6/pbBS07vk=
X-Received: by 2002:a0d:fd86:0:b0:4d4:a86c:e820 with SMTP id
 n128-20020a0dfd86000000b004d4a86ce820mr26763600ywf.28.1674757077747; 
 Thu, 26 Jan 2023 10:17:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvQT5xNqddYkEJgEeDh/g+dmKpVWcKUS0SbU1PYKoKDljZRM7SlAdxapChomlJkGC67PGEqNg==
X-Received: by 2002:a0d:fd86:0:b0:4d4:a86c:e820 with SMTP id
 n128-20020a0dfd86000000b004d4a86ce820mr26763577ywf.28.1674757077490; 
 Thu, 26 Jan 2023 10:17:57 -0800 (PST)
Received: from [192.168.8.105] (tmo-064-101.customers.d1-online.com.
 [80.187.64.101]) by smtp.gmail.com with ESMTPSA id
 dt3-20020a05620a478300b00706a1551428sm1373071qkb.6.2023.01.26.10.17.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 10:17:56 -0800 (PST)
Message-ID: <088a1c95-5332-d120-8917-1aa52c929da9@redhat.com>
Date: Thu, 26 Jan 2023 19:17:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
 <87pmb1pfas.fsf@linaro.org> <Y9KPuOT3NEAjN740@redhat.com>
 <CAFEAcA95Vtn5smOmVTX+WbS9O1Z4WX4H_p6j5iFh338o=Xcp5Q@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: no more pullreq processing til February
In-Reply-To: <CAFEAcA95Vtn5smOmVTX+WbS9O1Z4WX4H_p6j5iFh338o=Xcp5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.15, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 26/01/2023 15.41, Peter Maydell wrote:
> On Thu, 26 Jan 2023 at 14:35, Daniel P. Berrangé <berrange@redhat.com> wrote:
>> I'm confident we can rationalize our jobs, especially the cross
>> compilation ones.
>>
>> For each non-x86 arch we've got two sets of jobs, one for system
>> emulators and one for user emulators.
>>
>> IMHO the most interesting part of non-x86 testing is the TCG
>> host target. We don't need 2 jobs to cover that, either system
>> or user emulators would cover TCG build / test. Most of the rest
>> of code is not heavily host arch dependant.
> 
> I'm not super enthusiastic about cutting this down.
> I find the non-x86 testing is the most interesting part
> of the CI -- most patch submitters and system submaintainers
> have already done local compile-and-build with the common
> x86_64 recent-distro target, so those parts pretty much
> always succeed. The benefit of the auto CI is in keeping
> the platforms that aren't so widely used by developers
> working (both different-host-arch and different-OS).

I mostly agree. Question is whether we really need all of them, e.g. do we 
really need both, the *-armel and the *-armhf jobs for both, the -user and 
the -system part? Or would it be still ok to e.g. only have a -armel-user 
and a -armhf-system job and drop the other two?

I think there are also other possibilities where we could cut down CI 
minutes, e.g.:

- Avoid that some of the -softmmu targets get build multiple
   times

- Re-arrange the Avocodo jobs: We should maybe rather sort them
   by target system instead of host distro to avoid that some
   targets get tested twice here.

- Do we really need Linux-based clang jobs if we test Clang
   compilation with macOS and FreeBSD, too?

- Would it be OK to merge the merge the build-without-default-
   devices and build-without-default-features jobs?

And after all, I'd like to raise one question again: Could we finally stop 
supporting 32-bit hosts? ... that would really help to get rid of both, some 
CI minutes and some maintainer burden.

  Thomas


