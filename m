Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB50C241B53
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Aug 2020 15:01:55 +0200 (CEST)
Received: from localhost ([::1]:51858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5Tuc-0007Dm-R5
	for lists+qemu-devel@lfdr.de; Tue, 11 Aug 2020 09:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5Tsx-0006fi-LE
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 09:00:11 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:22855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5Tsv-0000Te-Je
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 09:00:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597150808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yeQXqMYNX5Z6l8jQYo/JOGJEr0otjWcf+HN4halDI34=;
 b=T76em+AminGCW8wcWCC6nnZb0fJZz3OBMl8FU5ROmO8nu3zMD/aenLh6+ArMx2iWiFsKFl
 9pl+4KZQmySUZCNszovFtGS3b6yZVbiINkavN0fg+S0AG2sSyN6Y8x5t2czLH+ssXCncp/
 saJSNgjzELabtJS6Z1vTDsFA+azEGp4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-7RTmgtASOhuYO3tvcnaeAA-1; Tue, 11 Aug 2020 08:59:57 -0400
X-MC-Unique: 7RTmgtASOhuYO3tvcnaeAA-1
Received: by mail-wr1-f72.google.com with SMTP id w7so5557511wre.11
 for <qemu-devel@nongnu.org>; Tue, 11 Aug 2020 05:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yeQXqMYNX5Z6l8jQYo/JOGJEr0otjWcf+HN4halDI34=;
 b=pJ2ne+6fHhp9x3dyFBdejREV1MT7RmVJ6Oa/p3Dz5wmdd0wQkyWEaZmljnZHhIevjm
 M02uq9H1w4yvIWTuScnZ88uy9fWCbrc6eOOqp+BeTquZ0TJ6oHVpBexnUiIAkPDyOiR3
 hjOsO4XNRnGjtKJInuKr181H1xynj2Ajn0UKuKjMTVxQCmXjJ6FiyvcMerFftZKLbF3N
 Xpu6M9D0Y6Lplijpo7FAPKNoFOaf7pQ1UHr4E7occn2vN1CS3h4rAYDKrkjg+AzLsqbj
 qqrkLBf+SXUJ2lmOfdMaKCt7TiJNJLjswBcDfk3YWOvf/tYbaWPir6w48ILgQDjipJAw
 Rq5Q==
X-Gm-Message-State: AOAM531YAsaE/0WvjvVLGFqyOLwsRLr3D8gjgx+CN7NeNsOPB3ozDua9
 6Zhn2cnYaLAKZnxjRBg4vwW4DMu+LhutDkx1COFUTmgliY04Lz11gJyhd9rsW/qffierzurRQyN
 c4m/96SljrL0dbkU=
X-Received: by 2002:adf:b602:: with SMTP id f2mr28032971wre.186.1597150795753; 
 Tue, 11 Aug 2020 05:59:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6uT9eajNvZE8LS3Uu7hli3sfl59FamFtYeBPjV2BzEaqpmtTKyvYSCxgrH+qTPGbnLaaUzA==
X-Received: by 2002:adf:b602:: with SMTP id f2mr28032947wre.186.1597150795502; 
 Tue, 11 Aug 2020 05:59:55 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.12.249])
 by smtp.gmail.com with ESMTPSA id n12sm4480365wrq.63.2020.08.11.05.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Aug 2020 05:59:54 -0700 (PDT)
Subject: Re: [PATCH 000/147] Meson integration for 5.2
To: Roman Bolshakov <r.bolshakov@yadro.com>
References: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
 <20200811120442.GA86269@SPB-NB-133.local>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3afa2a9a-8da7-0838-ad96-06703bb4d815@redhat.com>
Date: Tue, 11 Aug 2020 14:59:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200811120442.GA86269@SPB-NB-133.local>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 06:40:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, berrange@redhat.com,
 philmd@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 alex.bennee@linaro.org, alxndr@bu.edu, stefanha@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/08/20 14:04, Roman Bolshakov wrote:
> 
> The line in configure assumes that meson is a python program rather than
> a wrapper:
> 
>   meson="$python $meson"

Hmm, that means we will have to use the embedded meson if the user
specifies --python.  But it's probably a good idea anyway, and not
problematic since Meson does not have any dependencies outside the
Python standard library.

> Compilation seems to partially succeed but linking of QEMU binary fails:
> 
> [3691/5594] Linking target qemu-system-aarch64
> FAILED: qemu-system-aarch64
> ...snip...
> ld: warning: directory not found for option '-L/Users/r.bolshakov/dev/qemu/build/dtc/libfdt'
> ld: warning: directory not found for option '-L/Users/r.bolshakov/dev/qemu/build/dtc/libfdt'
> ld: library not found for -lcapstone
> clang: error: linker command failed with exit code 1 (use -v to see invocation)

Can you include your config-host.mak?  Does it help if you do "make
dtc/all capstone/all" and then retry?

Paolo


