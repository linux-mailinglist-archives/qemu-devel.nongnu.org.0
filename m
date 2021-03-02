Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1E6329B46
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 12:09:46 +0100 (CET)
Received: from localhost ([::1]:53390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH2uP-0004nO-5h
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 06:09:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lH2tD-0004LP-P1
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 06:08:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lH2tC-0006zS-4y
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 06:08:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614683308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AAMtj+sR2ob+m/QoqYSs0xF3Sx5qfO8EzY+TBz0v/BM=;
 b=J1GoDTDhCytBrshcKDV/J+vz008tDzN9O2GWCPcAc4aEou2kOA6QkoExUykHjjPLc91Qqx
 rBUmz4HetvWAwHLOAlFrCltffPrjgE5Dp8eEsdfXnb/tL8c4J7ckMjH2ZND2j4luOjxcFb
 44xU+azz7q0//dRIpqI+BzS5dyc+wHg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-c1X4tG9XNPeYbMv0n22wng-1; Tue, 02 Mar 2021 06:08:24 -0500
X-MC-Unique: c1X4tG9XNPeYbMv0n22wng-1
Received: by mail-wm1-f69.google.com with SMTP id n17so306145wmi.2
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 03:08:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AAMtj+sR2ob+m/QoqYSs0xF3Sx5qfO8EzY+TBz0v/BM=;
 b=DQiSGNjNazQRmhKmYnQVljfctrv02iF/q/s06+orkGtlNEQJsV8GoSu0QOMFAHitIl
 x43c9ShXv2CJN9zj5Iz3p5mybjk1tB+zc8CLAA3iO973jClFiFeangw2Zcy0Zb3cVJma
 j1lWxxep1YvdeMLQ6/RxZIAafFd2OaXG4VAc0/d6NqUGFoP/qcoAaCfEQMvsUcr3mJKT
 zg5R4P+6wJeWI+B6hR//1K59LO3MhWywjJnQMxb677njV+rjNWi0RQX2YT0tTAiM7kJQ
 GO9w/ENDDnywhDS/jIU/pjKfGFvxl1gnGT6LpBZz6lwUS8QluTfXPzNhIxzCJXBK2LKd
 r22A==
X-Gm-Message-State: AOAM532qXBiHhVDrXR13C1UkdmZ6E5oNN855Ffdbb8WcFOH1xQYEoGAR
 R7Bijd0dEP1ASslifnaFo0eyo9q0rNiHQgxhEDEoLBrr4Y1M2oZaICHRAgDbfRWp5ayIsyKE+gR
 4mvJwtJhXRrpCLzGp06oTFGWFehGcSqGAlWkjnHMAY+dpmRxn1Uw6sBss6ZR1F8GYuPI=
X-Received: by 2002:a7b:cb99:: with SMTP id m25mr3539294wmi.64.1614683302866; 
 Tue, 02 Mar 2021 03:08:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBsWT70arEpCMFP8aQfNgbE/C4Tw2ncW4tKt4MdzPIXdGp4Lq7ZvP+Z0a/oOPQAbUacDPOlg==
X-Received: by 2002:a7b:cb99:: with SMTP id m25mr3539280wmi.64.1614683302679; 
 Tue, 02 Mar 2021 03:08:22 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h10sm26713616wrp.22.2021.03.02.03.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 03:08:22 -0800 (PST)
Subject: Re: [PATCH] meson: add tests option
To: Thomas Huth <thuth@redhat.com>, Romain Naour <romain.naour@gmail.com>,
 qemu-devel@nongnu.org
References: <20210226220715.3103110-1-romain.naour@gmail.com>
 <eabd866e-71c5-3ac3-7688-0318fc758f94@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <14d34883-5e97-972d-87d1-49b47324cac5@redhat.com>
Date: Tue, 2 Mar 2021 12:08:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <eabd866e-71c5-3ac3-7688-0318fc758f94@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On 02/03/21 11:22, Thomas Huth wrote:
> On 26/02/2021 23.07, Romain Naour wrote:
>> tests/fp/fp-bench.c use fenv.h that is not always provided
>> by the libc (uClibc).
> 
> For such  problem it might be better to check for the availability of 
> the header and then to only disable the single test that depends on it 
> if the header is not available.
> 
> Anyway, a switch to disable the tests completely could still be handy in 
> some cases, so FWIW:
> 
> Acked-by: Thomas Huth <thuth@redhat.com>

I disagree, without a use case the right thing to do is to check for 
fenv.h.  It's as easy as this:

diff --git a/tests/meson.build b/tests/meson.build
index 0c939f89f7..3b9b2f0483 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -281,7 +281,7 @@ test('decodetree', sh,
       workdir: meson.current_source_dir() / 'decode',
       suite: 'decodetree')

-if 'CONFIG_TCG' in config_all
+if 'CONFIG_TCG' in config_all and cc.has_header('fenv.h')
    subdir('fp')
  endif

Thanks,

Paolo


