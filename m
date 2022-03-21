Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4254E22ED
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 10:07:20 +0100 (CET)
Received: from localhost ([::1]:57316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWE0U-0000sH-Mu
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 05:07:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWDzU-00080Z-KE
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:06:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWDzR-0002ny-Hn
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:06:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647853571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=byjJCLbU26CnwtNE/tR0IWymCe11e7g0pJ0hQ/E8vOs=;
 b=ZNbszNpMOI4Vi/LGnwy8h41JAYlrB4ks3FX7gRriyTHTyYePPVlVdFvCg9pOWP/b9kFJOC
 RjmSOvI7n2WTvHhM5hqRl6G4xDMVVxvsz2ufaN+CypV46H5OBRxMYGVth18vQU0Eal6Son
 YR2Kl3uFxuokJwbowRO0yGBKaCQUPY4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-CdGk9GP3N-mBPbhgYsWSQA-1; Mon, 21 Mar 2022 05:06:07 -0400
X-MC-Unique: CdGk9GP3N-mBPbhgYsWSQA-1
Received: by mail-ej1-f69.google.com with SMTP id
 my15-20020a1709065a4f00b006dfd2b16e6cso1920776ejc.1
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 02:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=byjJCLbU26CnwtNE/tR0IWymCe11e7g0pJ0hQ/E8vOs=;
 b=WX3G7h7p3j9qwDBy09WHycopfGnUDTIra99b8GCY69g16Dpt7xvwUD4Za4i/R/R5hc
 a0sPFttCypE2J3zAGOEUTp/XSmt+GuyxSZMInL5KuQtwf1XxxqcBCsM8tipJ87/kUvDy
 3MyyJa4ZXza0kd3/J+mDXwJWyaxb/7yrpGv4Mjh9uOaMwVZfu1VDVCafjSvMQdWdU2CH
 ZELrzTdcqSuhFlrG7650uq+MqZJWw1ENFs/KQjv2NIN95LU/KfkdPZb6zboQ8ONkc6XW
 odW05OXJMdmKLNE3crAHG3pfyipzd9zZ8gM7C6dhYtNir6K8xmVTjH1Chv8hDhN1U9nd
 AQ8A==
X-Gm-Message-State: AOAM5312a4nbco+uZLrZA4gtTB1OiIy2VzUcZiK3HNrSHoOkMplyqnfp
 eAPN7zZjvRR/a/Os7vylq0d4vUXIdZGCl/o1fdb4Vtm/S6t7w63LfjSpLAEinMtkuqIHTRG4xz7
 TJQwbkWwsmME9FeU=
X-Received: by 2002:a17:906:b6c7:b0:6db:2e14:875 with SMTP id
 ec7-20020a170906b6c700b006db2e140875mr19852892ejb.737.1647853566718; 
 Mon, 21 Mar 2022 02:06:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrXxcsvM5tNi9k7ruHS9lLAwQqF0+Y9LCBxhRDr+PNdvrUs3B4Nm7zX3FdhcZa9wN7YKG+Ig==
X-Received: by 2002:a17:906:b6c7:b0:6db:2e14:875 with SMTP id
 ec7-20020a170906b6c700b006db2e140875mr19852867ejb.737.1647853566396; 
 Mon, 21 Mar 2022 02:06:06 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a170906780400b006ce69ff6050sm6606438ejm.69.2022.03.21.02.06.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 02:06:05 -0700 (PDT)
Message-ID: <ed1c97e8-8a70-8808-cbeb-e6b4f6d1dccf@redhat.com>
Date: Mon, 21 Mar 2022 10:06:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4] tests: Do not treat the iotests as separate meson test
 target anymore
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220310075048.2303495-1-thuth@redhat.com>
 <2a2dadb8-24ba-50c4-617e-ab6d08166e83@redhat.com>
 <d59847b7-98cb-9e9c-0c42-74576f152737@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <d59847b7-98cb-9e9c-0c42-74576f152737@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.03.22 18:36, Thomas Huth wrote:
> On 18/03/2022 18.04, Hanna Reitz wrote:
>> On 10.03.22 08:50, Thomas Huth wrote:
>>> If there is a failing iotest, the output is currently not logged to
>>> the console anymore. To get this working again, we need to run the
>>> meson test runner with "--print-errorlogs" (and without "--verbose"
>>> due to a current meson bug that will be fixed here:
>>> https://github.com/mesonbuild/meson/commit/c3f145ca2b9f5.patch ).
>>> We could update the "meson test" call in tests/Makefile.include,
>>> but actually it's nicer and easier if we simply do not treat the
>>> iotests as separate test target anymore and integrate them along
>>> with the other test suites. This has the disadvantage of not getting
>>> the detailed progress indication there anymore, but since that was
>>> only working right in single-threaded "make -j1" mode anyway, it's
>>> not a huge loss right now.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   v4: updated commit description
>>>
>>>   meson.build            | 6 +++---
>>>   scripts/mtest2make.py  | 4 ----
>>>   tests/Makefile.include | 9 +--------
>>>   3 files changed, 4 insertions(+), 15 deletions(-)
>>
>> I can’t really say I understand what’s going on in this patch and 
>> around it, but I can confirm that it before this patch, fail diffs 
>> aren’t printed; but afterwards, they are
>
> It's a bug in Meson. It will be fixed in 0.61.3 and later (so this 
> patch won't be needed there anymore), but the update to meson 0.61.3 
> caused other problems so we also can't do that right now... so I'm not 
> sure whether we now want to have this patch here included, wait for a 
> better version of meson, or even rather want to revert the TAP support 
> / meson integration again for 7.0 ... ?

I don’t have anything against this patch, I just don’t fully understand 
what it does, and how it works.

So as far as I understand, check-block was its own target and used 
--verbose so that the progress indication would work (with -j1). Now 
that causes problems because of a bug in meson, and so this patch drops 
that special-casing again.  The only disadvantage is that the progress 
indication (which only worked with -j1) no longer ever works.

(Is that right?)

I personally don’t mind that disadvantage, because on CI systems it 
doesn’t really matter anyway; and on developers’ systems, I would assume 
`make check` to always be run with -jX anyway.

Hanna


