Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF2E2F4670
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 09:28:14 +0100 (CET)
Received: from localhost ([::1]:48558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzbVl-0006rF-Cd
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 03:28:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzbUZ-0006PX-9c
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 03:26:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzbUW-0005Wq-Rj
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 03:26:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610526416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xf9QZwZA2I9y8THgR87K46IfPxgbKfX6drRbWS7LBwA=;
 b=RsebtAgGyH5DjVnwplFeqPREu/p/IW0nVVL969MGrTmpOT3WCtA7pLQuKEoH8g+CToUOaA
 +P4KbpBWRtFJLcNWFk/q9tCeyYOuw+00SmRlce+e10xBElNwnuFnelmG7ZQn5bHVhgblP3
 RlZNeeYjRNSZEMVZTZcQhufYrCuxG3c=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-9R9wL7v3PIuixiXbGq6anQ-1; Wed, 13 Jan 2021 03:26:53 -0500
X-MC-Unique: 9R9wL7v3PIuixiXbGq6anQ-1
Received: by mail-ej1-f69.google.com with SMTP id x22so597249ejb.10
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 00:26:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xf9QZwZA2I9y8THgR87K46IfPxgbKfX6drRbWS7LBwA=;
 b=DrsYMDXpJN3koyTKU3BTdy6UmxmuL4bpd+K4lmCNhRBIqvuemoSC6r2187K6+zPhE0
 1HcfvAwFEYzPucqgeVL0pFxtCWWEfu2earTu+0q/v2UMj0W7UugcMynBFPSWssnuE6KS
 u9veKqdJ+AR4QL8JUFMIq/pug800TtNEgZBsD88kuFfILL4Zoc0pqPu2shIknFoHiKxi
 X4N+/bvalr4oFmofRDQ42Ukof5nDBpO/bacD+G7wav4WKwN0AkJT51GR0A3bh0WXF5Ut
 o2og7i60R/UkXytU/08xHsc8y5EWyLiY93cvotgfYg7SQrVrzPErvgDz0ckMtECE80Iz
 y4Eg==
X-Gm-Message-State: AOAM530vkAJnCOqdxbHaw3I13NMC+CJ3G1zm12Hz0mFN2JWXFq/+fY16
 PxHaD/nLyOo3iqE1evIJv/yfaIT922wUnOs2nI6qI+lSYNchwrMLOqwknuH601S3NR6HYXU2PIH
 4tS8ZJr8WppbaQ8M=
X-Received: by 2002:a17:907:4332:: with SMTP id
 ni2mr758783ejb.422.1610526411846; 
 Wed, 13 Jan 2021 00:26:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2yyTG2oQK0qOhHHqfpTHkuJI0871KgsqCyDYSRB8TObcCRPpepHjArYPBaxfm3fi7xjj6sQ==
X-Received: by 2002:a17:907:4332:: with SMTP id
 ni2mr758774ejb.422.1610526411672; 
 Wed, 13 Jan 2021 00:26:51 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l22sm409210ejk.14.2021.01.13.00.26.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 00:26:50 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <a2f5077b-ae74-2b39-4fb8-70d29dd549eb@redhat.com>
 <a56f2df6-867e-2542-734c-95c1ae3acf88@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: minimal "zero conf" build dockerfiles for fedora:latest and
 alpine:latest
Message-ID: <6a08e9f5-7cd7-c2c8-4b61-5466a4ffb2ec@redhat.com>
Date: Wed, 13 Jan 2021 09:26:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <a56f2df6-867e-2542-734c-95c1ae3acf88@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/01/21 07:48, Thomas Huth wrote:
>>
>> [254/8314] Generating texture-blit-frag.h with a meson_exe.py custom 
>> command
>> FAILED: ui/shader/texture-blit-frag.h
>> /usr/bin/python3 /qemu-5.2.0/meson/meson.py --internal exe --capture 
>> ui/shader/texture-blit-frag.h -- /usr/bin/env perl 
>> /qemu-5.2.0/scripts/shaderinclude.pl ../ui/shader/texture-blit.frag
>> /usr/bin/env: ‘perl’: No such file or directory
> 
> shaderinclude.pl seems to be pretty small, maybe it could be rewritten 
> in python?

Probably, but "make check" also requires Perl for the TAP driver.  I do 
have plans for using "meson test" instead, *however* there's also the 
other idea I've floated of parsing the command line with Perl:

https://patchew.org/QEMU/20210107140039.467969-1-pbonzini@redhat.com/20210107140039.467969-9-pbonzini@redhat.com/

(reviews welcome by the way).

I don't like Perl really, but there's a chicken-and-egg problem between 
detecting Python and using it to print the configure help script.  For 
configure-time tasks, Perl has the advantage that "#! /usr/bin/env perl" 
just works.

>> - bash has to be installed explicitly. configure/meson do not check 
>> for it, but the build will fail if they aren't present.
> 
> IIRC we were able to compile without bash before the meson conversion, 
> just some parts like the iotests needed the bash (at least that's why we 
> have a check for bash in tests/check-block.sh for example). Where is it 
> failing now?

It's failing due to

SHELL = /usr/bin/env bash -o pipefail

introduced in 5.2 (but not related to the Meson conversion)

     commit 3bf4583580ab705de1beff6222e934239c3a0356
     Author: Paolo Bonzini <pbonzini@redhat.com>
     Date:   Wed Oct 14 07:35:13 2020 -0400

     make: run shell with pipefail

     Without pipefail, it is possible to miss failures if the recipes
     include pipes.

     Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


