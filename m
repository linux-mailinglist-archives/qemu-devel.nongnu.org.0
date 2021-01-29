Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889D13086F8
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 09:24:10 +0100 (CET)
Received: from localhost ([::1]:54132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5P4b-00016q-JZ
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 03:24:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5P3M-0000i0-Sq
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:22:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5P3J-0006Lj-49
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:22:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611908567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uxQ9f44uTEXyiGHYOkoXcEUZqG9RHbwjBR1i8OyEPCg=;
 b=EDKTATdQ48j35E9ZhqpHVa+2tfS8wyS4T1FVcZ0u/9MYH1XHDv1K6smxV/MsLidkGVkdtw
 +dBklGhp1PB2qTQxEvOudAQ79wHJBO5wlf/FSOyYk+eViLKiLPNky8pxfErP4Gbyi/4JGq
 DSdw6OwhAiUftVgbHG2z8bdyOpc2p+c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-WnZPq74XO4S6xvrqTwusdg-1; Fri, 29 Jan 2021 03:22:45 -0500
X-MC-Unique: WnZPq74XO4S6xvrqTwusdg-1
Received: by mail-wr1-f72.google.com with SMTP id j8so4620344wrx.17
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 00:22:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uxQ9f44uTEXyiGHYOkoXcEUZqG9RHbwjBR1i8OyEPCg=;
 b=jTAtYQENYDlzVDh5Ie6kB3wl5BBYXOoDR0ORqYZw/1HDp/TEhjqG494rt8iX9HKYGu
 wTIxHUH5e0OGJQugdHx4LEymI5yXmPMWi7D5yeGk3scgTUMRMgRpDQcXgaYRqv4KAY2K
 K3OIEpjzE0g95Odi9dROwnRhePO4xkKoYYnzpogINivd2EWfJirtHOM5w5ZUeh2iMX1C
 QR6BpQgsI46JFHLR3qwaPEsw5C/KaZjcTRZQAuvfPR6DxNsyHNzVGn+GyE4iM8iVkISH
 OzgK3p5qqOIJkTGRvwzENXk3x7X6Z50U/gbUYZbv7xuTWDKIEEEA7K5rW/GeIX7pj813
 +ZQg==
X-Gm-Message-State: AOAM531t4P1IMj6lQcdBIhdwhVcWVbXcmSBTH2MAdUCJUANfQFh+vVKT
 AK9tKHxiqW7ljFq8WsNqUw+ET+srWi+Vqv6ikM/+LwRBkEQ5Vd91ue4O9oMPm0kbrPhjxXysrys
 oelhRzXATRquDbzw=
X-Received: by 2002:a05:600c:354c:: with SMTP id
 i12mr2683158wmq.51.1611908564525; 
 Fri, 29 Jan 2021 00:22:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxN2f1CFTnEHhOFycBuwVznOUnrgyZdwRT47S+XkojAc+wghD1AJRecZQzHFkpvva7VmeOYbw==
X-Received: by 2002:a05:600c:354c:: with SMTP id
 i12mr2683140wmq.51.1611908564356; 
 Fri, 29 Jan 2021 00:22:44 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q4sm11740601wrg.22.2021.01.29.00.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 00:22:43 -0800 (PST)
Subject: Re: [PATCH v2 00/12] buildsys: Do not build various objects if not
 necessary
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210122204441.2145197-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1c5b50c3-c094-6ad2-3836-479a1ff2cf6f@redhat.com>
Date: Fri, 29 Jan 2021 09:22:41 +0100
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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

Queued, thanks.

Paolo


