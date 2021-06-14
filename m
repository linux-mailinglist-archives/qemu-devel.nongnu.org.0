Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4C33A5E75
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:36:20 +0200 (CEST)
Received: from localhost ([::1]:59250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsi4x-0005b6-O0
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lsi2t-0002Z4-4x
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:34:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lsi2o-0000jX-LX
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:34:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623659645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yPH8LILCUtbuQVT4EPVqa3CTxPwc21DukcxI3a3Tfn4=;
 b=NUh6jimqbJNS39s7uN+RFoRnz7qgRMA6KJ31Sw8HnChaiAMKSAq/pMPnz/9j9Bz2Ve/GWA
 nLGY+RRqv56Dqc+qv59Y88CV849U9SwAlBll30Zweyjgj8j4cJrdFGk1n5LK5JZ5Q+NaRW
 ZF9BOY4t/soaSfeohuMMS46qYMhJJ0k=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-i2jjViBqNpK1FLsF_6A3UQ-1; Mon, 14 Jun 2021 04:34:04 -0400
X-MC-Unique: i2jjViBqNpK1FLsF_6A3UQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 y7-20020aa7ce870000b029038fd7cdcf3bso19798417edv.15
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yPH8LILCUtbuQVT4EPVqa3CTxPwc21DukcxI3a3Tfn4=;
 b=hncJTiqq+PYTPJ0rueRJTKRgKS48ijIlw6UfR+tx7s6rRaFUGB3oDlEqpYRrhLF+UD
 q/GNYOoQ3vPMvCeOEpyI6F4HJJsLYstkS2U7zVDObuQ/RKbOoAPloP3mFggkh4ZpSivd
 LrOcB7EOKK59kSY/OnUszcINVK1qnIfmugD+TPxjd8mqDKE/A9DGWlQlZ5p30kdgMaoA
 zTW3+nq6zf/wLVzptTUGtw8FKH+bHy4B8hD3W6RKiqXT/TPPd0xUuDIKMrrFqwgIdOKx
 CYnzW6ZhwO4/SXPztnoicf+4kkRR3skP+pFAaePlzG67+mSiWhsfqUhzf+GNOrO9VGpb
 OgjA==
X-Gm-Message-State: AOAM531W7GmsLaXjZx6mQax0mO+fifnZdlQ9mJ42Im9o8OIXqc8HoQaA
 MgB0zsRkJUKGMEpEAjOWXYPHDVX1PDlR0PPkhNlLPTBHCAXuyQmf8t0xV4287ISMi3yjGLEdt7v
 Bx8XSL3+YcR6qyr/iChktyB44QjbvUrBn7qj30mfr9FF7snCsFclILvNFYr8soK20DRY=
X-Received: by 2002:a17:906:4d04:: with SMTP id
 r4mr14305998eju.76.1623659642708; 
 Mon, 14 Jun 2021 01:34:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEoQRu/N1E7CNbos5/8KwqehJvQQX2nUXUENKpcLcKKxtewoZ8Z2Ylcen4x2mNK3I/Hl2APw==
X-Received: by 2002:a17:906:4d04:: with SMTP id
 r4mr14305984eju.76.1623659642493; 
 Mon, 14 Jun 2021 01:34:02 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u15sm8289175edy.29.2021.06.14.01.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 01:34:01 -0700 (PDT)
Subject: Re: [PATCH v2 03/18] modules: add qemu-modinfo utility
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <20210610055755.538119-4-kraxel@redhat.com>
 <20210610130424.fj6fsufnunccmhmx@sirius.home.kraxel.org>
 <YMIP/cKc570Ozvdh@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1636b96e-9073-b145-3fcc-3370fa2d7506@redhat.com>
Date: Mon, 14 Jun 2021 10:34:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMIP/cKc570Ozvdh@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.144, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/06/21 15:13, Daniel P. Berrangé wrote:
> On Thu, Jun 10, 2021 at 03:04:24PM +0200, Gerd Hoffmann wrote:
>>    Hi Paolo,
>>
>>> +if config_host.has_key('CONFIG_MODULES')
>>> +   qemu_modinfo = executable('qemu-modinfo', files('qemu-modinfo.c') + genh,
>>> +                             dependencies: [glib, qemuutil], install: have_tools)
>>> +   custom_target('modinfo.json',
>>> +                 input: [ softmmu_mods, block_mods ],
>>> +                 output: 'modinfo.json',
>>> +                 install: true,
>>> +                 install_dir: qemu_moddir,
>>> +                 command: [ qemu_modinfo, '.' ])
>>> +endif
>>
>> I have trouble with this one.  Tried to declaring the modules as "input"
>> to make sure meson will only run qemu-modinfo when it is done building
>> the module.  But now and then I get build errors because qemu-modinfo
>> runs in parallel to a module build and qemu-modinfo throws an read error
>> because of that.
> 
> softmmu_mods and block_mods are both lists already, so this sets a
> nested list and I wonder if it confuses meson  ? eg do you need
> 
>   input: softmmu_mods + block_mods

No, that should be fine.  Perhaps it's because the inputs are not part 
of the command?  You can check what the build.ninja rule for 
modinfo.json looks like.

Also:

- it would be better to support both directories and file names, so that 
stale modules are not included in modinfo.json

- modinfo.json needs to be disabled on non-ELF platforms (x86, Windows). 
  One alternative is to use libbfd instead of including an ELF parser.

- If modinfo.json has to be installed, you need to build modinfo for the 
build machine in order to support cross compiling.  That however would 
require a cross libbfd, which is a pain.  Do you really need to install 
it?  Can the functionality instead be included in the main QEMU binary 
with a query-modules command or something like that.

Paolo

> Alternatively there is option to do:
> 
>    'depends: softmmu_mods + block_mods
> 
> though the meson docs claim that's not required if they're
> already listed against 'input:'


