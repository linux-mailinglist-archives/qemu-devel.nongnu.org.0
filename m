Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCB953A209
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 12:10:53 +0200 (CEST)
Received: from localhost ([::1]:60288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwLJU-0001fG-Qw
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 06:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nwLFS-0005gy-8A
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 06:06:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nwLFP-0005V9-RG
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 06:06:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654077998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/w3OTdFlDVowYcQrxywutBj6TGrRYeedZd1nx4cLYY=;
 b=fH4ZcaJ3js7m/WmoJoxSpGhsLe1LVLyMR8bdv5tFnJvvKDTqaEoHVRaf/1aSnDapN+/mbq
 d9GCSqPBTHf67uuP1/HMs8x5/jA8D9Ktn8xRDCt6oeZT6z0p0ZwEzAmVjxxUbUYLhb7VwW
 AM4GcJxzRWwQkqPFthDDOeoUkur8Zrk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-J5Q5b-87ONO0og6osc3-HQ-1; Wed, 01 Jun 2022 06:06:37 -0400
X-MC-Unique: J5Q5b-87ONO0og6osc3-HQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 t5-20020a056402524500b0042deddb84c2so937684edd.5
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 03:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8/w3OTdFlDVowYcQrxywutBj6TGrRYeedZd1nx4cLYY=;
 b=7DexcitijrbGyGDgA0ThH2tmUI3diUVFp8TKA2Y+TbTlY09afEuAFIrCIeGS6klZt/
 LNzDNTb3wstDX0uGZo/AoErpkGXoEWQRofguHk+gEoRzLcHig+LQKWUTbizmTePs6zyD
 j2ieFC51pn4JWwetuUjHAnBk5roka7jVBaHESN2T5pdDptWkO6jiyQmI07zebaTTpEHC
 mzjikqFgLsMf+cZMOCM/0oF7onTs6Aaov8xaZyY95TmiDcta+oXmhBtUGGUL2gFp0I/P
 v0cyyEmWUUh5eqnP50bHtVYSPACtMhLsu2i19XpfzLiL4jv/wg4CNb6yoCIn+s5nye2z
 EUlQ==
X-Gm-Message-State: AOAM530Xz/VlLPNxGVSxKcBIS6Vhy1rEVJUJ4dBw8QZrAGRweFIVMuGd
 wkCJb+uwW3wY3Sf2tqhOpZetu6u0joqNkvL39roBk3Y6SPNg5yeKRS2SFcKV6Ju9sDeykfK2yxw
 xkho15EwlB/Aj6zc=
X-Received: by 2002:a17:906:99c5:b0:6ff:4c8f:6376 with SMTP id
 s5-20020a17090699c500b006ff4c8f6376mr18233446ejn.328.1654077996009; 
 Wed, 01 Jun 2022 03:06:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnN8HfOJMcEo8QoKqP1vGYg02hGfGL6qocbpPC9iLfBBrPJJpvrJQcCI3OvwxITU4Tz8iI3Q==
X-Received: by 2002:a17:906:99c5:b0:6ff:4c8f:6376 with SMTP id
 s5-20020a17090699c500b006ff4c8f6376mr18233427ejn.328.1654077995751; 
 Wed, 01 Jun 2022 03:06:35 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 f12-20020a17090631cc00b006fee961b9e0sm517730ejf.195.2022.06.01.03.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 03:06:35 -0700 (PDT)
Message-ID: <16e6c284-949f-d778-8829-e6c50e533272@redhat.com>
Date: Wed, 1 Jun 2022 12:06:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/9] tests, python: prepare to expand usage of test venv
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20220526000921.1581503-1-jsnow@redhat.com>
 <CAFn=p-bdvwdJY=cKZk9Q_N6CYj+Suetworw2Xa+3kc4bf_4Fug@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFn=p-bdvwdJY=cKZk9Q_N6CYj+Suetworw2Xa+3kc4bf_4Fug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 5/26/22 16:34, John Snow wrote:
> (1) If check is engaged without running check-venv first and iotests 
> creates its own venv, the python binary it uses will be whichever one is 
> your system default, not necessarily the one you configured your build with.
> 
> This is reasonable behavior IMO, but if you later run "make check", 
> there's no guarantee that Make will re-make the venv with the correct 
> python binary  That's a subtle landmine.

Yup, that's also a reason to make initial venv creation part of 
configure.  I consider that on the same level as running Meson and 
setting up git submodules.

> (2) Similarly, if the venv requirements.txt (or python/setup.cfg) 
> change, iotests doesn't have the logic to notice it ought to re-make the 
> venv. Only the makefile does. However, at least in this case, the 
> makefile is guaranteed to notice if/when we run "check block" again. The 
> odds of these files changing for most people who aren't *me* are pretty 
> low, so it may not really come up much. Still, it's not bullet-proof.

Yeah, this is fine.  Compare it with e.g. running clang-query: it needs 
a "make" first to rebuild compile_commands.json.

Paolo

> (Bonus not-at-all-subtle problem) I need to remove iotest 297, otherwise 
> iotests under a venv that doesn't install mypy/pylint will never run. I 
> discussed this upstream recently w/ Kevin, but my series to address it 
> isn't ready yet. (Just pre-emptively pointing it out to say I'm aware of 
> it!)


