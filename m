Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1DD2FEEE4
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 16:33:19 +0100 (CET)
Received: from localhost ([::1]:53136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2bxW-0005ud-KE
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 10:33:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2bw3-0005Lr-Tm
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 10:31:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2bvz-0008P1-RX
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 10:31:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611243100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eyqN164cF2X5RbMs5VGyTm5bxTQjsOCL5BD2pQm77xU=;
 b=W+39D2sobVJVRvAOYLfp3IL3u5QfENPXPjkpM/wnjTbvU5X4e8LYkzBaaUmzLKE18GL/T2
 n5Fzb1rvu1Samew9xjS7iIAc9j2L5ZslHcWzLf6bXl0ItbM/D9P7G8ONTbuwfcaKS/ikep
 2UHnjizfsJh40l0FbdBDqJxFWAsd/Ak=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-tBq6voX-MKmYxHCh4LcPpw-1; Thu, 21 Jan 2021 10:31:38 -0500
X-MC-Unique: tBq6voX-MKmYxHCh4LcPpw-1
Received: by mail-wr1-f70.google.com with SMTP id x12so1291375wrw.21
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 07:31:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eyqN164cF2X5RbMs5VGyTm5bxTQjsOCL5BD2pQm77xU=;
 b=JjEEz7vzqknGOx3MLp6ZN4/5/TpGaiRIETjteORN91ITy4oND1SRCfnM11bQdUhRVK
 vKqEA1nR7jvvKAgiIxRrLx9Rm6oCzYRK8sLxyz18k5DvD78h4HuZ33qW8yv0QC4Uns/W
 rt7z19OKB/VfJZ/lo1Ayi4K4hJGSLPT/mkw7uUpBwJz+365SLesM4XyMRR3/v1yqSmnO
 pkm9PwAWNqOYbvrHeG5BpFa28SPU+MK7hHvywwN9sH6lNEWhXLhcP7qQPRgy6kIOAGqX
 bAx0kA2i/HHlIuL3/N8jLchDdyQNlHnrLsvlGMcg4Fxja7HGH3vWTOb/Txj1755OOESy
 /klQ==
X-Gm-Message-State: AOAM531MeFsqBoM/xHchIG+7NHuNZWRosWQY/SpLzu0S2HEZOu7w4OS3
 +5iiEDQxD6lPZDXGb1LbIgoLUaVsalCv8tcA0TzV+vuhpugT1IhgHuq6SVyBWp3PoZIgZdtU3tO
 crZwFwJOKNgB1nDw=
X-Received: by 2002:a1c:2288:: with SMTP id i130mr9557277wmi.181.1611243096972; 
 Thu, 21 Jan 2021 07:31:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyz00KgZ+rNpRTm3e49vKTwOUydi0/VUoI0/vy25HIMArUWA87ONt7fixcxHxUkD3UPMyDnIw==
X-Received: by 2002:a1c:2288:: with SMTP id i130mr9557260wmi.181.1611243096799; 
 Thu, 21 Jan 2021 07:31:36 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id x128sm8956717wmb.29.2021.01.21.07.31.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 07:31:35 -0800 (PST)
Subject: Re: changing tests/qtest/meson.build causes unnecessary rebuilding
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA8mBK9932CLZ9uFtEa0rSycK6Sp9UDjSJnbJpg2hx8idg@mail.gmail.com>
 <17698af4-537b-3e8e-67c8-4ed45a922def@redhat.com>
 <7faca1b9-afa8-493d-e07a-8856832bc051@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6e73c3f0-2349-1f9a-1668-2929d35d8691@redhat.com>
Date: Thu, 21 Jan 2021 16:31:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <7faca1b9-afa8-493d-e07a-8856832bc051@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 21/01/21 15:29, Thomas Huth wrote:
> 
> Not sure if it is related, but I noticed that we are also rebuilding a 
> lot of files in the gitlab-CI that we did not before the meson 
> conversion, especially in the check-system-* jobs, e.g:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/977344949#L366
> 
> The check-system-* jobs should normally take the artifacts from the 
> build-system-* jobs and thus hardly recompile anything at all.
> 
> A part of the problem seems to be that we check out the submodules 
> again, I can get rid of the superfluous reconfiguration step by adding 
> something like:

Yes, there's a

[0/1] Regenerating build files.
/usr/bin/python3: can't open file 
'/builds/qemu-project/qemu/meson/meson.py': [Errno 2] No such file or 
directory

because the submodules have not been checked out, and that causes meson 
to run again.

> diff -u a/.gitlab-ci.yml b/.gitlab-ci.yml
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -39,6 +39,8 @@ include:
>     image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>     script:
>       - cd build
> +    - touch *
> +    - make git-submodule-update
>       - find . -type f -exec touch {} +
>       - make $MAKE_CHECK_ARGS
> 
> ... but still, the jobs then recompile almost all files afterwards... 
> could that be related to that meson problem, too?

No, I think it's just that, after the new checkout, the source files' 
timestamps should be quite new and cause everything to be rebuilt.

Paolo


