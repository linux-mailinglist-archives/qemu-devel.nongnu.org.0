Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9FF3C823D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:58:35 +0200 (CEST)
Received: from localhost ([::1]:58000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bf0-0005Fr-9V
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3bP1-00036q-N1
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:42:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3bOx-0007k8-Ur
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:42:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626255718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YrNh1eUkoCf0NXrmoEZjP7f0YxJ7SXJ++2ZCJA3mnok=;
 b=UySFWeLr3eLgC022BoDgSziUQlroDIwxm0PiBQyQ5IUhaaPJRFcGPxwIhFbEMwbg3R8oXr
 meDx51801CG2mvEfPksi+h8M58kZRwFgYTY/EDa8eO8x7alaYGInpboFAZ1o0Oshoxzh9D
 U2hea40M6n6oBsLEkarZn/YQ0TjWoaI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-Zw1NCSqwPI64fr8rmgzB6A-1; Wed, 14 Jul 2021 05:41:55 -0400
X-MC-Unique: Zw1NCSqwPI64fr8rmgzB6A-1
Received: by mail-wr1-f69.google.com with SMTP id
 u13-20020a5d6dad0000b029012e76845945so1201258wrs.11
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YrNh1eUkoCf0NXrmoEZjP7f0YxJ7SXJ++2ZCJA3mnok=;
 b=mS7ZH3mI2oGAfOokvKPqgg4oESSKZNpev8QjLDdfibx6Vbgw/RytCoF1ghQCAQIkpJ
 Qjk1OZx+KV/P2eEyvpcPQPWK0Wc5qV5JxtKcWw984WOstkVrgALlxd8yXCXd1hHUqRiz
 MFXcq7Uirr6FvAbPlCsUjue4XYBRVAbcDjvNDKN9l/HFWQGrY5W9fQJSYSAcCXiVgnQf
 uV2xud1KD0IQuzHftu2F06O4JZwNGu1r9BTVDRTzOmI6W/ExNJJc68Q4oTVanaiyg3es
 ghNGZkkWA/Is1kQzipV6axc26Y0y84pvfEHWHPjU49MCJT6t9fSnu4e/ymjm3k6Lz8ri
 RLtQ==
X-Gm-Message-State: AOAM532rG8v5jWxic5AUXDbYcyhUah9cFZmX8feu97BYzYV2wZ8Oq+MZ
 bO+W1FNzrz5oWOXVeQ7jjePNWB0DlDatZ2yfPzYLkwcRWcK3QJfTAT939T+tLQPyYa/cx6QOihl
 XFkVZLBsd2lj90dw=
X-Received: by 2002:a1c:63d6:: with SMTP id x205mr10333565wmb.42.1626255714323; 
 Wed, 14 Jul 2021 02:41:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbdQa4Tsc4lubYeBiL//rXkW4THOiY5Bx6GgqyEJNeVlqt6j8IrOMGXuYEbaT0aQTeCdiQeA==
X-Received: by 2002:a1c:63d6:: with SMTP id x205mr10333546wmb.42.1626255714122; 
 Wed, 14 Jul 2021 02:41:54 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id m187sm1838226wmm.16.2021.07.14.02.41.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 02:41:53 -0700 (PDT)
Subject: Re: [PULL 0/4] OVMF patches for 2021-07-12
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210712145630.2857814-1-philmd@redhat.com>
 <CAFEAcA8Epk4WKPj6fjFEPyYrT7FQzMRK1A8rf7hN8Buex6Xmng@mail.gmail.com>
 <YO12C+UQKhAKOGEs@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <593b37f3-f053-5491-e862-f8a87b0b344a@redhat.com>
Date: Wed, 14 Jul 2021 11:41:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YO12C+UQKhAKOGEs@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Dov Murik <dovmurik@linux.ibm.com>, Laszlo Ersek <lersek@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 1:16 PM, Daniel P. Berrangé wrote:
> On Tue, Jul 13, 2021 at 11:25:21AM +0100, Peter Maydell wrote:
>> On Mon, 12 Jul 2021 at 16:02, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>
>>> The following changes since commit bd38ae26cea0d1d6a97f930248df149204c210a2:
>>>
>>>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210710' into staging (2021-07-12 11:02:39 +0100)
>>>
>>> are available in the Git repository at:
>>>
>>>   https://github.com/philmd/qemu.git tags/fw-edk2-20210712
>>>
>>> for you to fetch changes up to d1e79210457323b225c369fa00e97577e0d0da95:
>>>
>>>   MAINTAINERS: remove Laszlo Ersek's entries (2021-07-12 16:55:23 +0200)
>>>
>>> ----------------------------------------------------------------
>>> Patches related to EDK2/OVMF
>>>
>>> - MAINTAINERS: remove Laszlo Ersek's entries
>>> - Introduce X86_FW_OVMF Kconfig symbol
>>> - pc_system_ovmf_table_find: Assert that flash was parsed, document
>>>
>>> ----------------------------------------------------------------
>>
>> So, even though this pullreq doesn't seem to be changing gitlab CI
>> config, I get a "yaml invalid" failure in the pipeline:
>> https://gitlab.com/qemu-project/qemu/-/pipelines/335995843
>>
>> "'build-edk2' job needs 'docker-edk2' job but it was not added to the pipeline"
>>
>> Any ideas what that's about?
> 
> The rules for these two jobs are not compatible with the depedency
> declared between them.
> 
> The docker-edk2 job is set to exist only when edk2.yml or Dockerfile
> are changed:
> 
>  docker-edk2:
>    stage: containers
>    rules: # Only run this job when the Dockerfile is modified
>    - changes:
>      - .gitlab-ci.d/edk2.yml
>      - .gitlab-ci.d/edk2/Dockerfile
>      when: always
> 
> 
> The build-edk2 job is set to exist based on a wide variety of
> changes
> 
>  build-edk2:
>    stage: build
>    needs: ['docker-edk2']
>    rules: # Only run this job when ...
>    - changes: # ... roms/edk2/ is modified (submodule updated)
>      - roms/edk2/*
>      when: always
>    - if: '$CI_COMMIT_REF_NAME =~ /^edk2/' # or the branch/tag starts with 'edk2'
>      when: always
>    - if: '$CI_COMMIT_MESSAGE =~ /edk2/i' # or last commit description contains 'EDK2'
>      when: always
> 
> 
> If those jobs were independant those different sets of conditions
> would be ok.  The build-edk2 job, however, has a 'needs' clause
> adding a depdancy on 'docker-edk2'.
> 
> Given this dependancy, in *EVERY* scenario were 'build-edk2' job
> exists, the 'docker-edk2' job *MUST* also exist. This isn't the
> case, hence the failed pipeline.
> 
> This can be fixed by taking the 'rules' from 'build-edk2' and
> also applying them to 'docker-edk2'.

Thank you for figuring the problem and clearly explaining it!

Phil.


