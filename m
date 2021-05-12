Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC0737B44E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 04:54:38 +0200 (CEST)
Received: from localhost ([::1]:45290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgf1B-0000zY-Ks
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 22:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lgf02-0000Iu-MG
 for qemu-devel@nongnu.org; Tue, 11 May 2021 22:53:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lgezz-0002gX-0u
 for qemu-devel@nongnu.org; Tue, 11 May 2021 22:53:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620788001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iq+vwPEtDaDziLc4DJlJzP5WjwBlRn4dJpM2jc9iPvA=;
 b=QfxVf554XYzJaxNcjuzFjBuPnh3RnfEJSoVNFnCdw+jFdyFohb/YiD9CpSQ+WDhEmAqlRh
 9XAI3kOPTKotVnrUfF1kPvXBVNVVP7C3/yhuq4kFnba8vLoYNz+3uazbCZ/Ccb/tMz8QLm
 +Dcqks+X7bbDy2SJOFcclKCCcp34FRE=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-uP9YkW2UMt-qjfKoCrt-9Q-1; Tue, 11 May 2021 22:53:18 -0400
X-MC-Unique: uP9YkW2UMt-qjfKoCrt-9Q-1
Received: by mail-pg1-f199.google.com with SMTP id
 k9-20020a63d1090000b029021091ebb84cso12830018pgg.3
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 19:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Iq+vwPEtDaDziLc4DJlJzP5WjwBlRn4dJpM2jc9iPvA=;
 b=mzLozBkBJntjhFLHiBZG7dht/5zbBV2WQ/eJDMiD7ZYWSuXs29uBo3wM+ToCu/32wL
 O9sDWMaW3aGSUPyoZQyBvwzqGvqAxrJPG1DfmjV1cno5yMFNhCBLMl9SmTq1QNWEp/H8
 /Nr1HmNsRpfUQImoPP328Tex6GaauayEnj/5S/8yto2eBRL4Mi20gqbcSqfFfkHCPOg3
 NLQZxTRjXWvkyEUihnYA+ufEIKzhQ3HKVJyRN+9qmZC7+QJh0SJwp9Cl6I10f+TUyJtK
 2nnGCa/BY9bJ3/dnVAm/htbhEcRQolmTXx9SsT9AayWe7NT4+79ML4QTwb1k+Oo8qlsW
 r65Q==
X-Gm-Message-State: AOAM530296+nVP1JKtxsAH8W2LZXSzgJSgnMWjDHqi+XqB+Ig+YbhEyD
 IZAQIuz9dx4D/tiPXUREdI7T4yWP7rvikozr6groy3aipF4Gy/WzuwViXkYA15YoIEgr50ZLqeC
 PvqrFYNiPp58MlmU=
X-Received: by 2002:a17:902:ed06:b029:ed:4436:1e0f with SMTP id
 b6-20020a170902ed06b02900ed44361e0fmr32175291pld.47.1620787997407; 
 Tue, 11 May 2021 19:53:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiKS+gnXTAOouOeCoWGEHQmzKHmkcrves8YVCxcqAVu3qlDJRrS7+EXPPpO1vmClWHw67aeg==
X-Received: by 2002:a17:902:ed06:b029:ed:4436:1e0f with SMTP id
 b6-20020a170902ed06b02900ed44361e0fmr32175279pld.47.1620787997122; 
 Tue, 11 May 2021 19:53:17 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id v2sm5628560pfv.97.2021.05.11.19.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 19:53:16 -0700 (PDT)
Subject: Re: [PULL 00/10] Net patches
To: Peter Maydell <peter.maydell@linaro.org>
References: <1620458319-5670-1-git-send-email-jasowang@redhat.com>
 <CAFEAcA9uVxbnJt_kcuy5RE3n2sDYk4y3bsEQCPFchvqbpmUMxQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <867fa7c4-be5d-d219-8a44-028808440f66@redhat.com>
Date: Wed, 12 May 2021 10:53:08 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9uVxbnJt_kcuy5RE3n2sDYk4y3bsEQCPFchvqbpmUMxQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Andrew Melnychenko <andrew@daynix.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/5/12 上午4:20, Peter Maydell 写道:
> On Sat, 8 May 2021 at 08:18, Jason Wang <jasowang@redhat.com> wrote:
>> The following changes since commit d90f154867ec0ec22fd719164b88716e8fd48672:
>>
>>    Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-20210504' into staging (2021-05-05 20:29:14 +0100)
>>
>> are available in the git repository at:
>>
>>    https://github.com/jasowang/qemu.git tags/net-pull-request
>>
>> for you to fetch changes up to 2bdeb0c2564c36b218ac73e21d7a6f6accb49091:
>>
>>    tap-bsd: Remove special casing for older OpenBSD releases (2021-05-08 13:59:12 +0800)
>>
>> ----------------------------------------------------------------
>>
>> ---------------------------------------------------------------
> This causes meson to emit a warning on one of my build machines:
>
> Run-time dependency libkeyutils found: NO (tried pkgconfig)
> Checking for function "gettid" : NO (cached)
> Run-time dependency fuse3 found: NO (tried pkgconfig)
> Found CMake: /usr/bin/cmake (2.8.12.2)
> WARNING: The version of CMake /usr/bin/cmake is 2.8.12.2 but version
>> =3.4 is required
> Run-time dependency libbpf found: NO (tried pkgconfig and cmake)
> Has header "linux/btrfs.h" : YES (cached)
> Has header "libdrm/drm.h" : YES (cached)
>
>
> We shouldn't be looking for cmake at all.
>
> thanks
> -- PMM


Right, the reason is method is not specified when detecting libbpf so 
meson may try cmake:

libbpf = dependency('libbpf', required: get_option('bpf'),)

Andrew, want to repost the series (with possible style warnings)?

Thanks



