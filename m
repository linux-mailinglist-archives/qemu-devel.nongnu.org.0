Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D724408726
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 10:38:16 +0200 (CEST)
Received: from localhost ([::1]:44522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPhTj-00053N-B7
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 04:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mPhS6-00048E-PF
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:36:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mPhS2-0002wR-Hz
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631522189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YStwBixGNiZmNcMwziFiXEx+4sBPNIkLcgABChyEO5c=;
 b=TwLwb3Bedpv9yzJG6VeNDZHVxi54xIwtJHJGtpo+vXBvSz4zUKVTb4ZZR1eO7rQzsRateQ
 0h/MHewGWeQYT7BRQ1ZspHNeg+xy1e9Edoc3pHANOvxwDiXTVTr41vA6jPbEemifJEfEB1
 R7vHatBoOn3YBCTRd8xkN0FmPf19/Fc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-mQBzIWZ6NFiysStJ9klufQ-1; Mon, 13 Sep 2021 04:36:27 -0400
X-MC-Unique: mQBzIWZ6NFiysStJ9klufQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 i16-20020adfded0000000b001572ebd528eso2381854wrn.19
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 01:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YStwBixGNiZmNcMwziFiXEx+4sBPNIkLcgABChyEO5c=;
 b=djY2972mfxqx7hezvF3ZQeXcc9rV7OZtMnvRSxdTpgK8UZKfINgNr9KRT7JM4voacZ
 z7zcg08BKL2XcMMRSg3uvt3WmhXp6ltfJyKTGK4XXoOVmINh+PjqfpkF+wT9Od4mwefN
 7suYQiVZ1tyS+YnjUyrG6kj06+t05aR9nT8N7VUEOgQywDqlJzxXt6bcld4jHcOFAG1G
 Mbqt1w/+3KqChvsQ/TjU2KYdC6Nbi+au5+NvAnYLyCfHX9q1mhTNYVLu+nnc7+cwdm5A
 hlX9cVw+Z6ohco7td8M2WKNbxV8AWtfUABAz6YvHSxxD9va3pM/Ww6C54DPfohdNLpUT
 3yaQ==
X-Gm-Message-State: AOAM532qZG/Nh7+nVIGEWUX/UfbpD4ZGZ8b/YI2OsVUoVYUxb3y/cSfi
 l3Az1XR1yp9oe3yU00xjXiQHfYc+xFpOKAxpldNYHyfvmnOryQWDWosivYDgXmkWcDpqeKC4n8s
 Zqnwuu/OGvK2o+HQ=
X-Received: by 2002:adf:eb4c:: with SMTP id u12mr11327211wrn.111.1631522185722; 
 Mon, 13 Sep 2021 01:36:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsBi94hrvpo7dQ5U53YR57HQhD6cfLaYYi6ZT21G2KP1gAxp/FKEg7Q1w3DwGgd1u6Rye3Kg==
X-Received: by 2002:adf:eb4c:: with SMTP id u12mr11327181wrn.111.1631522185445; 
 Mon, 13 Sep 2021 01:36:25 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-149-033.46.114.pool.telefonica.de. [46.114.149.33])
 by smtp.gmail.com with ESMTPSA id g3sm7243677wrh.94.2021.09.13.01.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 01:36:25 -0700 (PDT)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210913062126.16946-1-thuth@redhat.com>
 <CABLmASGBZs_pxFBx8cW3uVF_gaUuaLE7hMhAy71hN+OZZPqw2A@mail.gmail.com>
 <7548727b-222a-34ac-6fb1-1bc01837b9b2@redhat.com>
 <YT8Lqty7upJ/RTDA@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [qemu-web v2 PATCH] Update the information about the required
 version of macOS
Message-ID: <ba52ec23-34fe-2eda-f0eb-d36a880aeda9@redhat.com>
Date: Mon, 13 Sep 2021 10:36:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YT8Lqty7upJ/RTDA@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/09/2021 10.28, Daniel P. Berrangé wrote:
> On Mon, Sep 13, 2021 at 10:04:25AM +0200, Thomas Huth wrote:
>> On 13/09/2021 09.35, Howard Spoelstra wrote:
>>>
>>>
>>> On Mon, Sep 13, 2021 at 8:21 AM Thomas Huth <thuth@redhat.com
>>> <mailto:thuth@redhat.com>> wrote:
>>>
>>>      The versions that we specify for macOS are way too old already. Let's
>>>      rephrase this without specific version numbers, pointing the users
>>>      to the latest version instead.
>>>
>>>      Signed-off-by: Thomas Huth <thuth@redhat.com <mailto:thuth@redhat.com>>
>>>      ---
>>>        v2: Rephrased to be more in sync with docs/about/build-platforms.rst
>>>
>>>        _download/macos.md | 6 ++++--
>>>        1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>>      diff --git a/_download/macos.md b/_download/macos.md
>>>      index 06aa811..c55438a 100644
>>>      --- a/_download/macos.md
>>>      +++ b/_download/macos.md
>>>      @@ -6,5 +6,7 @@ QEMU can be installed from <strong>MacPorts</strong>:
>>>
>>>        <pre>sudo port install qemu</pre>
>>>
>>>      -QEMU requires Mac OS X 10.5 or later, but it is recommended
>>>      -to use Mac OS X 10.7 or later.
>>>      +QEMU requires the the most recent macOS version that is currently
>>>      available.
>>>      +Support for the previous version will be dropped two years after the
>>>      current
>>>      +version has been released or when Apple drops support for it, whatever
>>>      comes
>>>      +first.
>>>      --     2.27.0
>>>
>>>
>>> Hi,
>>>
>>> Nice to see this clarified.
>>> I guess a small typo crept in: "QEMU requires the the most recent macOS
>>> version that is currently available."
>>
>> Thanks, I'll drop one of the "the"s.
>>
>>> Also, is this statement correct when the 2 year previous version(s) are
>>> also supported?
>>
>> https://qemu-project.gitlab.io/qemu/about/build-platforms.html only talks
>> about "the previous major version" ... so that's a good question, what
>> happens if a vendor releases multiple major versions within two years?
>>
>> I guess the intention was that all previous versions are supported as long
>> as the two years haven't expired yet. We might need to update the
>> build-platforms text in that respect, too.
> 
> The intention was that we limit the scope of our support to at most
> 2 concurrent releases, even if the vendor has more still under support.
> The current major version at all times, and the previous major version
> for upto 2 years (unless vendor EOLs it before then).

Ok, then we should maybe talk about "the *last* previous major version" instead?

Also it seems like we have a similar situation with NetBSD:

  https://gitlab.com/qemu-project/qemu/-/issues/614

Version 9.0 has been released in 2020, i.e. it's not older than two years 
yet. Current version is 9.2 already, though, so there has been a previous 
major version (9.1) in between, right?

  Thomas


