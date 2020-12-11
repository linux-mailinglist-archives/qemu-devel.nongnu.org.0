Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6221D2D82DE
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 00:47:57 +0100 (CET)
Received: from localhost ([::1]:56636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kns8h-0004FG-Sd
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 18:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kns4V-0003dj-7Q
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 18:43:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kns4N-0003c1-HI
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 18:43:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607730205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7WFpxRDK71uNiSZW1kLjriFM96vjRy+KL78AcMwRReA=;
 b=DVCbWPVx70cEYTDCHE9Lu6KCvHHNowMlEJDIdvn2hpZs5gMobHUEf7o9AircpLwu5i7kPM
 XrEVY1BgH1nYMexLMnaWLWurJcs4aHnu2r1P0rEVlnFr6S3cYvfjqYeG7rrvB61QV4c4ZY
 /8K7hBFVgmuKKdIGcqbxaLkUx/osNUA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-D9NIkS5JNrCxP2pFYTPS3g-1; Fri, 11 Dec 2020 18:43:24 -0500
X-MC-Unique: D9NIkS5JNrCxP2pFYTPS3g-1
Received: by mail-ej1-f69.google.com with SMTP id m4so3312416ejc.14
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 15:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7WFpxRDK71uNiSZW1kLjriFM96vjRy+KL78AcMwRReA=;
 b=nqxjRXUsWUFF5Uu9BgNoepfNMqrZ1AzPZG81xCNRNsPfUlPAbSNm61qns21x6ETN5o
 cQlUo+k7ETGB36HW/aV5Cszw4wg/7wPl8GwXSS1jYAfmbHyc/6n4EFL/pLaK1fNVd2O2
 SVAr5uD58mVAFVVrm/lc25hY+xpFiGUw64xZuX/W4GeV5AYoMI8ms4seRTYdjoPh2M+G
 KgvZGtmPUki/mfx/rmzImJ9NDt5mD7OcREmZHZxe8KXa+QUCK9qAFI21BrpcLyTowEwC
 HQC8uwCKmuDBJSwG+Dt77Kgd03V2u5XzmB9WnckreVVKAR0o7o1WEimkj88EoFLTdJW/
 ycCw==
X-Gm-Message-State: AOAM533YcEzIeZPr6aPRVe6GuXbsWvRGJyXNtJUDxGxQmySNbiEb2eUD
 LrpPGuAWueYh57tVuftxcl8knIK38BpBcqvnAhnS8FG9IJyUZuQzXnVgGJo30VoOmHhCveP581v
 5l9kSdMUl4REU8xw=
X-Received: by 2002:a50:e68a:: with SMTP id z10mr14090846edm.28.1607730202887; 
 Fri, 11 Dec 2020 15:43:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWX5kN2Xb/TqJ96GK6WfHrL8lUox7lTFnuOLN/f6C1xZLxFkHupwYqo8O1xa4Y9+tFWtsAUA==
X-Received: by 2002:a50:e68a:: with SMTP id z10mr14090839edm.28.1607730202740; 
 Fri, 11 Dec 2020 15:43:22 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id lz17sm7794301ejb.19.2020.12.11.15.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 15:43:21 -0800 (PST)
Subject: Re: [PATCH v2] hw/core: Restrict 'fw-path-provider.c' to system mode
 emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201207220709.4017938-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9814e56e-d370-9eb0-0298-1ec904c39e5c@redhat.com>
Date: Sat, 12 Dec 2020 00:43:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207220709.4017938-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/12/20 23:07, Philippe Mathieu-Daudé wrote:
> fw-path-provider.c is only consumed by qdev-fw.c, which itself
> is in softmmu_ss[], so we can restrict fw-path-provider.c to
> softmmu too.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v2: Fix author email.
> ---
>   hw/core/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/core/meson.build b/hw/core/meson.build
> index 4a744f3b5e7..032576f5717 100644
> --- a/hw/core/meson.build
> +++ b/hw/core/meson.build
> @@ -1,7 +1,6 @@
>   # core qdev-related obj files, also used by *-user and unit tests
>   hwcore_files = files(
>     'bus.c',
> -  'fw-path-provider.c',
>     'hotplug.c',
>     'qdev-properties.c',
>     'qdev.c',
> @@ -25,6 +24,7 @@
>   common_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
>   
>   softmmu_ss.add(files(
> +  'fw-path-provider.c',
>     'loader.c',
>     'machine-hmp-cmds.c',
>     'machine.c',
> 

Queued, thanks.

paolo


