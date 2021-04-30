Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4681D36F6B6
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 09:49:33 +0200 (CEST)
Received: from localhost ([::1]:57024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcNu0-0001Bb-DQ
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 03:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lcNsz-0000jV-TE
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:48:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lcNsy-0004YD-2O
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619768907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GG4OGcm0twqy73p2BJYX5RQhPNBs0cL3JDKxw/IFTDo=;
 b=PYoCQgtbrkR8YawvBxDU+atmFghyvIQS35HsGgJ9Xoz0Px13ZmoARzdrubEf3V0gycPFAV
 ivncQXR21RsdUJArIieqFXF6LZ7UHPHCGY2gci/ZfSbDsb7LJqjjfS6IrssqIgbxA23ugT
 RE08d31DJwweK2sAzcVwO2iqKp+eoHE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-_yfg0LQ0ORqOktv5GUL5yA-1; Fri, 30 Apr 2021 03:48:25 -0400
X-MC-Unique: _yfg0LQ0ORqOktv5GUL5yA-1
Received: by mail-ej1-f71.google.com with SMTP id
 z6-20020a17090665c6b02903700252d1ccso14557113ejn.10
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 00:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GG4OGcm0twqy73p2BJYX5RQhPNBs0cL3JDKxw/IFTDo=;
 b=MqdaJIJkaVNaJQJ3Z+YeRwTHm3Sf7kCTbfmJtQwRRRlZUXVmfpEg8bA6aDbbEt40cH
 14eFstRowLTNGTpcqqhuTsIkqPabsiTi0gekjYGDQ+9+v7EFJLXv0KXx2QodYZ3vkmcc
 7SiR8W5tL74ZMyc23TYGDT9ttcIbY7z4SZCo8U8j/V4gId1tS0tE2tD/KkEvpb+V/LCG
 SonAlawVW/5If4Ubcn5f95GhpTCrSY2l49Q+3MpCzxNGjyDaTe71tzV6nZAQAqZR7Lek
 xoXu7Zz1NR+T6PGacmY7wn7JZSueGUWhEApwjLaWeORMyedX5ODoJMMLu36pdrgfqReH
 O5RA==
X-Gm-Message-State: AOAM531xZ+hQzk+KYH+RDVQVjsSPoczyJ2luViHw4BNqvIk0A6fOoRS3
 UTToRC7caJGdJr6dKyuQ0yoE+aDNYCwIFySdokcGh+wHJdqwS6MxsB/381fNW50ZwdEksrGzVni
 xPNHIDslYpM5Yzcs=
X-Received: by 2002:a17:907:3589:: with SMTP id
 ao9mr2729237ejc.171.1619768904119; 
 Fri, 30 Apr 2021 00:48:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUL9tnP14ObMWIc7kU6Y1r5YpQpbZRirfCLkC/tlT7PaPSm9F2B3/ZJ/IKTpuOmAMUXi/2cQ==
X-Received: by 2002:a17:907:3589:: with SMTP id
 ao9mr2729226ejc.171.1619768903961; 
 Fri, 30 Apr 2021 00:48:23 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g11sm656635edw.37.2021.04.30.00.48.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 00:48:23 -0700 (PDT)
Subject: Re: [PATCH] meson: Set implicit_include_directories to false
To: Katsuhiro Ueno <uenobk@gmail.com>, qemu-devel@nongnu.org
References: <CA+pCdY09+OQfXq3YmRNuQE59ACOq7Py2q4hqOwgq4PnepCXhTA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2571b8c3-3e2b-f90e-6077-05232a52c711@redhat.com>
Date: Fri, 30 Apr 2021 09:48:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CA+pCdY09+OQfXq3YmRNuQE59ACOq7Py2q4hqOwgq4PnepCXhTA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/04/21 04:43, Katsuhiro Ueno wrote:
> Without this, libvixl cannot be compiled with macOS 11.3 SDK due to
> include file name conflict (usr/include/c++/v1/version conflicts with
> VERSION).
> 
> Signed-off-by: Katsuhiro Ueno <uenobk@gmail.com>
> ---
>   meson.build | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meson.build b/meson.build
> index c6f4b0cf5e..d007bff8c3 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2129,6 +2129,7 @@ common_all = common_ss.apply(config_all, strict: false)
>   common_all = static_library('common',
>                               build_by_default: false,
>                               sources: common_all.sources() + genh,
> +                            implicit_include_directories: false,
>                               dependencies: common_all.dependencies(),
>                               name_suffix: 'fa')
> 

Can you include the difference in the include paths (the -I and -iquote 
arguments)?  There are many cases in which we rely on having the current 
source directory in the build path, for example all inclusions of "trace.h".

Paolo


