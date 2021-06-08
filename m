Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E9139F64B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 14:20:01 +0200 (CEST)
Received: from localhost ([::1]:35194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqai8-0003OU-PA
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 08:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqafh-0007Ip-7g
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:17:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqafe-0007Ah-Rb
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:17:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623154646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vsziJqNhbSAAhP+dF4EIaYbL8DjPw+XU6ZIvTedHIRM=;
 b=b6arhhjBqFwezUr0u5h2SCBcP/rAZlqd4vglr+cLGP8kVh+FKvtbYLRfs3JcAn6WbbQ1lq
 04LvZ7k6vgc7hyFh5O4DP8vDISLy/ymP67roY+5Daxy1EnOPt1HhHeBS5gIQ6UyJ8Dgmq0
 yn7ibnZurPn4R70iCMbIxuqwR5zXNwU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-VgUfSy1iOEqPMQCqFuT3Fg-1; Tue, 08 Jun 2021 08:17:24 -0400
X-MC-Unique: VgUfSy1iOEqPMQCqFuT3Fg-1
Received: by mail-wm1-f72.google.com with SMTP id
 j6-20020a05600c1906b029019e9c982271so1191962wmq.0
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 05:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vsziJqNhbSAAhP+dF4EIaYbL8DjPw+XU6ZIvTedHIRM=;
 b=RQQXesh761R0g9jb/WTHBlIl20ir3+9AfgvlQA+xbv3AEPFYfpn7B5e2Q0JNZhSgVG
 xwsMSKPcvtYbnHf/J2CkmAcbbVev4a4Rv6QGlH3ictGjvQt/+Zf1E2tK+33V8T98Ox3z
 i2TK9XlXz6Pqdj1m5hvJn18ec//2+EpSp8P/YwkcxY4+42S7DhUcegjbovIX8BygDul8
 7P0NJe04Q8VVAGAVdimJtFMGzCXBX2CpGZTFP3bpNF99XhXFwsc8iRXVPFiUDiNEKw5R
 J8/PbUFJkMc9YtEybqnhcsz2VS/2jZpBDze6kIOkxUXEzc+PpRaw5bpUDW8bSp79iCLs
 YfaA==
X-Gm-Message-State: AOAM533+h3kf05Y3hUxWVoz90TzELUKJvWh3NfxTLv62bVKo96dK+r1C
 7qBsVK8WeVnYwG9ivk4c58kaODIiGGmlSkD9oop5UnARZkUs3lpmLYZCzir2CKOErcIYmF8VJgO
 N8NmqI+kbDN43lrjeI9USeuzwyIetzlre5FAtuOrSbOSG32W0yigrFlKyJpPvCICF
X-Received: by 2002:a5d:64af:: with SMTP id m15mr4927386wrp.364.1623154643073; 
 Tue, 08 Jun 2021 05:17:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkRV83I+o7xyRk2njsXKbForvltPx9IA/5mml9HTd6kArJB8vB2csgxu0uN+twLmu7O6n7Rw==
X-Received: by 2002:a5d:64af:: with SMTP id m15mr4927375wrp.364.1623154642945; 
 Tue, 08 Jun 2021 05:17:22 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id 89sm20991965wri.94.2021.06.08.05.17.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 05:17:22 -0700 (PDT)
Subject: Re: [PATCH 23/26] configure: convert CONFIG_STATIC_ASSERT tests to
 meson
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210608112301.402434-1-pbonzini@redhat.com>
 <20210608112301.402434-24-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <95a736f9-20e8-f5ca-7a01-ae0a1fe8710d@redhat.com>
Date: Tue, 8 Jun 2021 14:17:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608112301.402434-24-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 1:22 PM, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure   | 18 ------------------
>  meson.build |  6 ++++++
>  2 files changed, 6 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


