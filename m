Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D436301786
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 19:15:34 +0100 (CET)
Received: from localhost ([::1]:54772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3NRd-0000oP-40
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 13:15:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3NNg-0006pg-HQ
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:11:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3NNY-0007AW-UK
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:11:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611425480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=noCsfy/B2HCRcxSvEITmxK207ytynIpTqurWT9kTs5k=;
 b=bq0v7hxjchbJnIUdFdleo71mq7EH7Jfj4+DPP77QUErMRCm7dCm/Gz3oPqOpbkDoG6gPgH
 7vssRYW8FsK8jE26YzElz7Og9CNatn7WULHr3NRWaXvrGujfmVeobZ1/rUzjALInZ6b3xK
 0QJWpdE2nbkgDilKbsra0TEwbcRE/Pg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-4bq5yp9jOgizZQykeo4Ecw-1; Sat, 23 Jan 2021 13:11:17 -0500
X-MC-Unique: 4bq5yp9jOgizZQykeo4Ecw-1
Received: by mail-ed1-f69.google.com with SMTP id 32so4814816edy.22
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 10:11:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=noCsfy/B2HCRcxSvEITmxK207ytynIpTqurWT9kTs5k=;
 b=qeDT9u4fSnCc46K7ZVleyDwRqToevus+wUycVXDDTaCCONeXVb5oTBodaHQFYHAefL
 OIzhXaFqxDPxuz0wV5tBngYn20QCjQwlE+nKmIa5Bgvme4ImL+EfvbGHK8DO5IRS4grh
 bBaGRcocgmjziOvMGmL6zvy1jUm0UUmAyuVWl4YbNHyVmdQvl7xVwtlgzhA3EKTxbxDy
 0AJpNGkfF0M/CF+5DsCd6bN+MUaoJSUfr97Alvxj8ICUvGjaEokUXqPURN8LADGXHhKD
 VS4cQLyhzUfw2utD+qw8hSE/7+4kJyCwKxCx9SZgidi+eYexfIWMdjRTG9fGiLxIHxL3
 Zq5g==
X-Gm-Message-State: AOAM531l5JGXLEVP0PhRejP/rC4j0IV2Vbu7xwBYPtAHg8KkLOOuTPd8
 kLr6QUYKnHzhaifXaiwTOOGroskJH5gW6sVnAY3o11axylA0o7/N8qD5eqXUjkqWEdrq1srtJ2F
 pWwVHqoCd56rScqA=
X-Received: by 2002:a50:9dc9:: with SMTP id l9mr7696594edk.377.1611425476180; 
 Sat, 23 Jan 2021 10:11:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYfLQmmdnGVLNRLQ7UmhQ+haj8046AQ2/7qtxreh6eBgbfGDgWXJR1TH9oJyfZb+JfQqNN/g==
X-Received: by 2002:a50:9dc9:: with SMTP id l9mr7696582edk.377.1611425476056; 
 Sat, 23 Jan 2021 10:11:16 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id q20sm6073632eju.1.2021.01.23.10.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jan 2021 10:11:15 -0800 (PST)
Subject: Re: [PATCH v2 00/12] buildsys: Do not build various objects if not
 necessary
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210122204441.2145197-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3fac2926-f308-c012-5f1b-e23a2084d8ef@redhat.com>
Date: Sat, 23 Jan 2021 19:11:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122204441.2145197-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/01/21 21:44, Philippe Mathieu-Daudé wrote:
> In this series we deselect a bunch of features when they
> not required, so less objects are built.
> 
> While this reduce pressure on CI and slow systems, this is
> particularly helpful for developers regularly testing multiple
> build configurations.
> 
> All CI tests pass:
> https://gitlab.com/philmd/qemu/-/pipelines/245654160
> 
> Supersedes: <20210120151916.1167448-1-philmd@redhat.com>
> 
> Philippe Mathieu-Daudé (12):
>    configure: Only check for audio drivers if system-mode is selected
>    tests/meson: Only build softfloat objects if TCG is selected
>    pc-bios/meson: Only install EDK2 blob firmwares with system emulation
>    meson: Do not build optional libraries by default
>    meson: Restrict block subsystem processing
>    meson: Merge trace_events_subdirs array
>    meson: Restrict some trace event directories to user/system emulation
>    meson: Restrict emulation code
>    qapi/meson: Restrict qdev code to system-mode emulation
>    qapi/meson: Remove QMP from user-mode emulation
>    qapi/meson: Restrict system-mode specific modules
>    qapi/meson: Restrict UI module to system emulation and tools
> 
>   configure           |  6 +++++
>   meson.build         | 55 ++++++++++++++++++++++++++-------------------
>   stubs/qdev.c        | 23 +++++++++++++++++++
>   MAINTAINERS         |  1 +
>   pc-bios/meson.build |  1 +
>   qapi/meson.build    | 34 +++++++++++++++++++---------
>   stubs/meson.build   |  2 ++
>   tests/meson.build   | 11 +++++++--
>   8 files changed, 97 insertions(+), 36 deletions(-)
>   create mode 100644 stubs/qdev.c
> 

Except for patch 8,

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


