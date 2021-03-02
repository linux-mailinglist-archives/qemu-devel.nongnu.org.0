Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569C032991D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 11:04:25 +0100 (CET)
Received: from localhost ([::1]:52776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH1t9-00080o-Tr
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 05:04:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lH1r8-0006sM-Se
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:02:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lH1r4-0001Ok-F5
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:02:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614679332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ku0sCnR9sHGafE2IYswIlMl4Hm0+S17xpwm93R2M/xw=;
 b=OY9FVxABbtP2tOa4urUeynMquLTdzfDL11BLWAT0Bf5I2HebsjMVORw338y5tMu2fi5xra
 PWcPV791EZUtPf+EES35JRaayE8pqS+Aj74ImK9w7O8seAmZjFFjX+GRzzwBmmuDWddhRZ
 Pgc4Q+YJ0ySxKPB4gIIx/+SCRJMKjak=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-fZUonFXGM0SScFNnJvEHkQ-1; Tue, 02 Mar 2021 05:02:09 -0500
X-MC-Unique: fZUonFXGM0SScFNnJvEHkQ-1
Received: by mail-ed1-f69.google.com with SMTP id u2so10081487edj.20
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 02:02:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ku0sCnR9sHGafE2IYswIlMl4Hm0+S17xpwm93R2M/xw=;
 b=m5zKSmHeHcrtL0NWA7a5UgqdEyIfZwn52zeuPn/+8qccaTKiRwOaV8ynHvlvbB6g7E
 H9+4bD30VCdagl8iJD5Mo15hmlXWCmL/g0/6FGheDl8inCGhGtKCD8zChBmd+q+BM5fZ
 pGYzJhvGTRlwcOw0w9qyfw528V4M+832XvIqkD5fwW1kvzwvwNveuQuEEyeWnTHoXR+0
 FxThBCwYgCA2Yye2OmzUF+v+aktFZGEJZhIKwXa/6fKMvY4ip6k7wprvfZF+ULR9khYR
 LcHvWrTFQCxiuwVy0+3pD3mNNC2dwTAc0dpOdgc7RtnVQhWdoijJF5qzCVD8lhlW6b4P
 R41A==
X-Gm-Message-State: AOAM533KIHQ+vIpDmiCqgoiArmBkpXh0hY7/7EjFbiaTDcioWScuwQFC
 Wc86bqcmEic0QwQrupnT4c+y7Tb+Y6AmlyX8NxxwM4k9ZPCH+1SHNk9teYMeMoRSJbkUiwqUvzB
 70pcDoy8kWhiVi5elIXHXXkfhVUbOZYDfuVlYIPRTtZ3cM7aFYYfMBUJyEVTLBzDd
X-Received: by 2002:a17:906:4c99:: with SMTP id
 q25mr20697975eju.111.1614679328002; 
 Tue, 02 Mar 2021 02:02:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzU7sLEhtLShODYhn4gfCNqtVX45I6bJT3+JgjYpGauz/L529nfvCyItMwEsnEM9n+21AAA6g==
X-Received: by 2002:a17:906:4c99:: with SMTP id
 q25mr20697934eju.111.1614679327593; 
 Tue, 02 Mar 2021 02:02:07 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o4sm17517742ejj.45.2021.03.02.02.02.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 02:02:07 -0800 (PST)
Subject: Re: ninja install on ubuntu 16.04 for qemu-5.2.0 build
To: ckim@etri.re.kr, 'qemu-discuss' <qemu-discuss@nongnu.org>
References: <009801d70f44$a75be810$f613b830$@etri.re.kr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0db71960-2a24-5c64-6e2b-42ecdd02b9d6@redhat.com>
Date: Tue, 2 Mar 2021 11:02:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <009801d70f44$a75be810$f613b830$@etri.re.kr>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 10:15 AM, ckim@etri.re.kr wrote:
> Hello,
> 
> qemu-5.2.0 now internally uses mesa for building qemu.
> 
> Isn’t there any guideline for this new build method on qemu document
> page?( I couldn’t find one).
> 
> I was met with this ‘couldn’t find Ninja 1.7 or newer’ and tried
> installing ninja with apt-get but the version is too low.(it seems it’s 1.5)

1.7.1 is available, maybe try running "apt-get update" first?

Package: ninja-build
Architecture: amd64
Version: 1.7.1-1~ubuntu16.04.1
Priority: optional
Section: universe/devel
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Original-Maintainer: Felix Geyer <fgeyer@debian.org>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 286
Depends: libc6 (>= 2.15), libstdc++6 (>= 5.2)
Conflicts: ninja
Filename:
pool/universe/n/ninja-build/ninja-build_1.7.1-1~ubuntu16.04.1_amd64.deb
Size: 91424
MD5sum: 6384d9c31ca18803e90b7bf3f5c3ab28
SHA1: ab64ea16c36a39bbfd6929351fff8e2d5768e801
SHA256: 8f8ba3ccb7873cb264bd648437eb8e7d7abd4093254135f6830e368a25512b9f
SHA512:
222de7f1dc96979a9d1487f090cd138397b0f6cc935acf99166a5b6d8ba951529d93039e6d431b85fa9abaf4285961e643a97dce747e41f76f4b874e1932c25e
Homepage: https://ninja-build.org/
Description: small build system closest in spirit to Make
Description-md5: 5ef1371c63de86fcf36c1ddc875d2f26

> 
> I guess because I’m using ubuntu 16.04 - somewhat old version, I’ll have
> to download the ninja and mesa.
> 
> Can someone give me an advice on which is the best way to solve this?

An alternative when you can't update the system packages is to use a
Docker container (you might need to ask the machine administrator to
install it).

Regards,

Phil.


