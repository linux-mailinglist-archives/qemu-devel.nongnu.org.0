Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05263408614
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 10:06:49 +0200 (CEST)
Received: from localhost ([::1]:37610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPgzH-0005Xs-Qn
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 04:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mPgxA-0003Zo-U3
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:04:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mPgx7-0000x4-UZ
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:04:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631520272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E0Gg/37sB7LNf6SRHmI027L7FQmT0q2Zw18sQgSIe7o=;
 b=ih+dHLhgGlZrMCJl6tqpWsZA6GUUjfx66h12J+6vxLvpiU3PW2iU+6rdA9Uk07KbKI8F65
 ctDchoIf9u+lj/4811oL8UC4euegLLJQQs72M02efQcLArbdJe1XAyaOMADghHv3rsOnfU
 zh6AewtduZLOtaShxQ7/1c9iJGoKguk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-Eb1vQ2xnNEeUuzIb7kPviQ-1; Mon, 13 Sep 2021 04:04:29 -0400
X-MC-Unique: Eb1vQ2xnNEeUuzIb7kPviQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 d10-20020adffbca000000b00157bc86d94eso2347102wrs.20
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 01:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E0Gg/37sB7LNf6SRHmI027L7FQmT0q2Zw18sQgSIe7o=;
 b=gPovLs18OfU9DavU2fhsPkSk7YW3UkdJkYU9RNepoelOS0NyKpVQKVHZLjRXPUAJ9i
 As5SLI0oLkxhkh4qFXTv8EG7mm5B1DnL0zK0neu3rK31EcC+e8XJE8wuZn1yAeEOUmAy
 qhUKAujgbdYkO9QC7gWBgeBdW/+0NIk4wAw6aBHlzyb7QUeQ6hVSp+zze4XrD8VFAlnn
 TAhoNgzr7ZmlEupEOb6Q6AVSiaEBw6dMqWwCUK4czsyhihskt9p+cLU/q1pO2xPwhI/L
 VOxvtImbxa1T69Vl0eMd78e0mPqwNjMmVUwLfKCUmIsDmMRGjqXQ8YCxEKmoHmVXeT1A
 yi8w==
X-Gm-Message-State: AOAM532QY3eosb9oXD1RfbBxGWNj9dLnh7BGQQFCXi/55w7uI8F9Y2nE
 qdfl1Y6i+bY08jCOJ+jsq4CQMsMx5W7nnEFY9SKXSz3TH5zQcBXPe2XZHhxafq7jPccLCEBf2ko
 S0Hkd4twdKxPjYxo=
X-Received: by 2002:adf:c144:: with SMTP id w4mr11241961wre.398.1631520268039; 
 Mon, 13 Sep 2021 01:04:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYE2D6M2DzD91/fJLlFSEEjnvcIAoDkzL1J6vJjMxJasybdcCmQRHLTle87/m3I46IyVm2fA==
X-Received: by 2002:adf:c144:: with SMTP id w4mr11241937wre.398.1631520267826; 
 Mon, 13 Sep 2021 01:04:27 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-149-033.46.114.pool.telefonica.de. [46.114.149.33])
 by smtp.gmail.com with ESMTPSA id l15sm5313542wme.42.2021.09.13.01.04.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 01:04:27 -0700 (PDT)
To: Howard Spoelstra <hsp.cat7@gmail.com>
References: <20210913062126.16946-1-thuth@redhat.com>
 <CABLmASGBZs_pxFBx8cW3uVF_gaUuaLE7hMhAy71hN+OZZPqw2A@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [qemu-web v2 PATCH] Update the information about the required
 version of macOS
Message-ID: <7548727b-222a-34ac-6fb1-1bc01837b9b2@redhat.com>
Date: Mon, 13 Sep 2021 10:04:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CABLmASGBZs_pxFBx8cW3uVF_gaUuaLE7hMhAy71hN+OZZPqw2A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.584, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/09/2021 09.35, Howard Spoelstra wrote:
> 
> 
> On Mon, Sep 13, 2021 at 8:21 AM Thomas Huth <thuth@redhat.com 
> <mailto:thuth@redhat.com>> wrote:
> 
>     The versions that we specify for macOS are way too old already. Let's
>     rephrase this without specific version numbers, pointing the users
>     to the latest version instead.
> 
>     Signed-off-by: Thomas Huth <thuth@redhat.com <mailto:thuth@redhat.com>>
>     ---
>       v2: Rephrased to be more in sync with docs/about/build-platforms.rst
> 
>       _download/macos.md | 6 ++++--
>       1 file changed, 4 insertions(+), 2 deletions(-)
> 
>     diff --git a/_download/macos.md b/_download/macos.md
>     index 06aa811..c55438a 100644
>     --- a/_download/macos.md
>     +++ b/_download/macos.md
>     @@ -6,5 +6,7 @@ QEMU can be installed from <strong>MacPorts</strong>:
> 
>       <pre>sudo port install qemu</pre>
> 
>     -QEMU requires Mac OS X 10.5 or later, but it is recommended
>     -to use Mac OS X 10.7 or later.
>     +QEMU requires the the most recent macOS version that is currently
>     available.
>     +Support for the previous version will be dropped two years after the
>     current
>     +version has been released or when Apple drops support for it, whatever
>     comes
>     +first.
>     -- 
>     2.27.0
> 
> 
> Hi,
> 
> Nice to see this clarified.
> I guess a small typo crept in: "QEMU requires the the most recent macOS 
> version that is currently available."

Thanks, I'll drop one of the "the"s.

> Also, is this statement correct when the 2 year previous version(s) are also 
> supported?

https://qemu-project.gitlab.io/qemu/about/build-platforms.html only talks 
about "the previous major version" ... so that's a good question, what 
happens if a vendor releases multiple major versions within two years?

I guess the intention was that all previous versions are supported as long 
as the two years haven't expired yet. We might need to update the 
build-platforms text in that respect, too.

> Might I also suggest "version(s)" instead of "version"?

Unlike I've got the intention wrong, that seems to be a good, idea, yes.

  Thomas


