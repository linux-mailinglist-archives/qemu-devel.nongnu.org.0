Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213004FB457
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 09:02:18 +0200 (CEST)
Received: from localhost ([::1]:43076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndo41-0008Ru-3Y
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 03:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ndnxS-0005jN-RI
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 02:55:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ndnxP-0006g0-K2
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 02:55:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649660126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h0iaVbHHMrJFSMjYdcxhhBFLR0KdSr09To1bIQk+Zw8=;
 b=L7s7LcydzsoImKmVtePpk3kKtib3oGHo+yASnp4X8AvNwZAPkjBZufln2iLu8gnSWh7wIJ
 S84i5BIAPI5ZZetkRumVsI+CLPsv4ywg42R1e3zs2p7es2/G1efl1Hlw5JiuATPQvO1rh2
 WHIpNZkpIGeIA9W/4J2pWHdN54ELyv0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-6oOYOza3OsOPG7jaQmeksg-1; Mon, 11 Apr 2022 02:55:25 -0400
X-MC-Unique: 6oOYOza3OsOPG7jaQmeksg-1
Received: by mail-wr1-f72.google.com with SMTP id
 j67-20020adf9149000000b00203e6b7d151so3094683wrj.13
 for <qemu-devel@nongnu.org>; Sun, 10 Apr 2022 23:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=h0iaVbHHMrJFSMjYdcxhhBFLR0KdSr09To1bIQk+Zw8=;
 b=Ahhoa/Z3tYH+P0C+RxQP3tFiE5wutM+7JD/BipI/9eZ71GwyehvkuNubYsoqr/g8qI
 KUTvS9CI/rYjWtFmcqG/BG2rchC4jrSM0kcAU5hzd1AvSGMmnxcR6lQXJ/CirVySXYO8
 KnLCo0Gy0FS7AFMjcSA9rxPiO7ume66wwjbnHZxwqBmyVcSgH8QZ4a319wNI/TPSz1eS
 kzC8lAHQ1eX3q12OoDGUDbSEfQpcbjpZywXBGiqReEjOOYdvLgo5RFQ1pEYXAsOWbJgB
 T9sEdxQwJgGdVy+57Ffda3T3kJPOXEima08HCypZFqg2wFaVUn5L08LnWrxgSZdfMCwI
 yIIg==
X-Gm-Message-State: AOAM532g7jldJgSqxCtViJyqQqYCPAZlmcfxi6tIuXJRLRemW2xDxX75
 9JXPR7M888rrZnw54pw09OGqne6PEttE0Nq8U7eYmGiCGCKqFV40TQ0aMZoCJJLzgd+HJp9yt0M
 lQqMBqzahkgNrntA=
X-Received: by 2002:adf:fb50:0:b0:206:d26:c20a with SMTP id
 c16-20020adffb50000000b002060d26c20amr24200924wrs.446.1649660124313; 
 Sun, 10 Apr 2022 23:55:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzv7xE/S07PkiW36XY6nwrc8NKNsKif4x6TVlPZcefzzN/NldV5RpWj+PtcMhWlm4UOrs4KsA==
X-Received: by 2002:adf:fb50:0:b0:206:d26:c20a with SMTP id
 c16-20020adffb50000000b002060d26c20amr24200910wrs.446.1649660124102; 
 Sun, 10 Apr 2022 23:55:24 -0700 (PDT)
Received: from [192.168.42.76]
 (dynamic-046-114-150-203.46.114.pool.telefonica.de. [46.114.150.203])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm17506096wmn.16.2022.04.10.23.55.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 23:55:23 -0700 (PDT)
Message-ID: <07a2ce65-41b9-7313-d7cc-51c2edb8cfd3@redhat.com>
Date: Mon, 11 Apr 2022 08:55:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH for-7.1] Remove the slirp submodule (and only compile
 with an external libslirp)
To: Brad Smith <brad@comstyle.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20220408164749.534758-1-thuth@redhat.com>
 <72fe734a-8bf6-adc6-474a-47f2006c2f6d@comstyle.com>
 <CAFEAcA-NdeN8S0JXqfrpTiDoUmfZHBXUtdAuRAdDRooTpnYipA@mail.gmail.com>
 <b701aa9f-4dff-4a67-92a5-529fd07a7f1d@comstyle.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <b701aa9f-4dff-4a67-92a5-529fd07a7f1d@comstyle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/04/2022 01.50, Brad Smith wrote:
> On 4/10/2022 5:06 AM, Peter Maydell wrote:
>> On Sun, 10 Apr 2022 at 05:51, Brad Smith <brad@comstyle.com> wrote:
>>> On 4/8/2022 12:47 PM, Thomas Huth wrote:
>>>> QEMU 7.1 won't support Ubuntu 18.04 anymore, so the last big important
>>>> distro that did not have a pre-packaged libslirp has been dismissed.
>>>> All other major distros seem to have a libslirp package in their
>>>> distribution already - according to repology.org:
>>>>
>>>>             Fedora 34: 4.4.0
>>>>     CentOS 8 (RHEL-8): 4.4.0
>>>>         Debian Buster: 4.3.1 (in buster-backports)
>>>>    OpenSUSE Leap 15.3: 4.3.1
>>>>      Ubuntu LTS 20.04: 4.1.0
>>>>         FreeBSD Ports: 4.6.1
>>>>         NetBSD pkgsrc: 4.3.1
>>>>              Homebrew: 4.6.1
>>>>           MSYS2 mingw: 4.6.1
>>>>
>>>> The only one that still seems to be missing a libslirp package is
>>>> OpenBSD - but I assume that they can add it to their ports system
>>>> quickly if required.
>>> I wish I had seen this earlier as our 7.1 release was just tagged.
>>>
>>> I have whipped up a port of 4.6.1 for OpenBSD as it was pretty simple. I
>>> will
>>> see about submitting it in a number of days when the tree opens.
>> How awkward would it be for an end-user who's on OpenBSD 7.1 to
>> build a QEMU that doesn't have libslirp? (That is, is it easy
>> and common for an end user to pull in a port of libslirp that only
>> came along in a later OpenBSD, or would they instead have to
>> manually compile libslirp themselves from the upstream sources?)
>>
>> (I'm asking here because if it's painful, then we should perhaps
>> defer dropping our submodule copy of libslirp a little longer.)
>>
>> thanks
>> -- PMM
> 
> They would have to pull down a -current ports tree and build it. No package
> would exist for the release. It is possible, but not "supported". I have not 
> looked
> at the CI bits to see how difficult that would be.
> 
> Our release cycles are 6 months and the next release will be in the middle
> of October.

OK, thanks for the update, Brad ... so I guess we should defer this patch to 
QEMU 7.2 (to be released in december) instead?
(which would be fine for me - I just wanted to get the discussion started, 
that's also why I've marked this patch as RFC)

  Thomas


