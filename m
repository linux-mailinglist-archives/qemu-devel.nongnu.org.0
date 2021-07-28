Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDD23D8F02
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 15:27:21 +0200 (CEST)
Received: from localhost ([::1]:49670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8jai-0007f6-Vw
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 09:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8jYi-0005sP-Er
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:25:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8jYc-0006sY-Sg
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:25:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627478707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T2QVUgSAbCZQgRX2hiiGLyxOUXhXDucaWcjRj1g48i8=;
 b=Kx9pYJSdSljpCA98i56/5X6SikohPrg0Me5P/whsulAg0xP3zmUT2nbCS5RIaRISvhhHMB
 8NjhnH9DsncNWCK0OFwyf53uekI4Kx+Qgf2iRDGbM6CMjLErckb52SbtB+/iVNWilI3hZs
 GO9b4L3/TiQcC8Z12qzdFmNIQsGDzgU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-CWDXcwxzNlaH0khiMlwyBQ-1; Wed, 28 Jul 2021 09:25:06 -0400
X-MC-Unique: CWDXcwxzNlaH0khiMlwyBQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 q188-20020a1ca7c50000b0290241f054d92aso224494wme.5
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 06:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T2QVUgSAbCZQgRX2hiiGLyxOUXhXDucaWcjRj1g48i8=;
 b=mvsojs0Vdxg5E8O4ommgVYWTjXZVt99AQSfV9JMlqwkYHI3FXIQDhhklftx+E7uWkz
 3hOV2STgUbG4bg60pKJ8h942Gl6e7b8+UYYD+YTawSKIlRzdAGypuqDprUssnsuGl2As
 l6Ht/n3DnhNcq7/0xqNS5WpJ13NF6dA6cThMasAh1k7+x1Ph29vFR9SwVq1Um88TUgch
 ufHmT3UrtkRwAM4sxoo0IigQnDjlhFIJbEPV7AmNbAVp4upAlpOQJfSPyI9ZbZo5fdtD
 pupoXcBaBWHcXIsJiag4IJc20eikzu5+V75kE4R7UgkfWHlEiArWciUekEiOn4xY0viG
 py/g==
X-Gm-Message-State: AOAM530fGmpsaqWNQomDXq+EgoAfY04E3AdUUKH+5mpyYCgXgDolldXH
 JlhI4N5sJrJPQKBNLe2fFWoGaw99sT0G+9pqRE65dHawNLwm2Q0pRfjYF1NazoLw6BruUBOSp9u
 bgshxw52BJGPIlqE=
X-Received: by 2002:a7b:ce10:: with SMTP id m16mr9081770wmc.75.1627478705177; 
 Wed, 28 Jul 2021 06:25:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrkK+x/0SUpP1RX01qa1UdRsqt6PGPUfl+Mv0QvXAc2I4j6RaXUCVx8xwN//SplTE8fpSQCA==
X-Received: by 2002:a7b:ce10:: with SMTP id m16mr9081752wmc.75.1627478704954; 
 Wed, 28 Jul 2021 06:25:04 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id q5sm6848793wrx.33.2021.07.28.06.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 06:25:04 -0700 (PDT)
Subject: Re: [PATCH-for-6.2 v12] qapi: introduce 'query-x86-cpuid' QMP command.
To: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>, qemu-devel@nongnu.org
References: <20210728125402.2496-1-valeriy.vdovin@virtuozzo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <718458b1-cae1-02d2-c605-e9a31d971af1@redhat.com>
Date: Wed, 28 Jul 2021 15:25:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728125402.2496-1-valeriy.vdovin@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Denis Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/28/21 2:54 PM, Valeriy Vdovin wrote:
> Introducing new QMP command 'query-x86-cpuid'. This command can be used to
> get virtualized cpu model info generated by QEMU during VM initialization in
> the form of cpuid representation.
> 
> Diving into more details about virtual CPU generation: QEMU first parses '-cpu'
> command line option. From there it takes the name of the model as the basis for
> feature set of the new virtual CPU. After that it uses trailing '-cpu' options,
> that state if additional cpu features should be present on the virtual CPU or
> excluded from it (tokens '+'/'-' or '=on'/'=off').
> After that QEMU checks if the host's cpu can actually support the derived
> feature set and applies host limitations to it.
> After this initialization procedure, virtual CPU has it's model and
> vendor names, and a working feature set and is ready for identification
> instructions such as CPUID.
> 
> To learn exactly how virtual CPU is presented to the guest machine via CPUID
> instruction, new QMP command can be used. By calling 'query-x86-cpuid'
> command, one can get a full listing of all CPUID leaves with subleaves which are
> supported by the initialized virtual CPU.
> 
> Other than debug, the command is useful in cases when we would like to
> utilize QEMU's virtual CPU initialization routines and put the retrieved
> values into kernel CPUID overriding mechanics for more precise control
> over how various processes perceive its underlying hardware with
> container processes as a good example.
> 
> The command is specific to x86. It is currenly only implemented for KVM acceleator.
> 
> Output format:
> The output is a plain list of leaf/subleaf argument combinations, that
> return 4 words in registers EAX, EBX, ECX, EDX.
> 
...

> +##
> +# @query-x86-cpuid:
> +#
> +# Returns raw data from the emulated CPUID table for the first VCPU.
> +# The emulated CPUID table defines the response to the CPUID
> +# instruction when executed by the guest operating system.
> +#
> +# Returns: a list of CpuidEntry
> +#
> +# Since: 6.1
> +##

Unfortunately too late for 6.1, so you'll have to update that to
"6.2" (also in @CpuidEntry).


