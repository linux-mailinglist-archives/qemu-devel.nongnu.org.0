Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FE23A052C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 22:34:09 +0200 (CEST)
Received: from localhost ([::1]:35972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqiQK-0001oI-IX
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 16:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lqiPJ-0000xa-Af
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:33:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lqiPG-0005Bl-1c
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:33:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623184381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X9b8RHD4rLJPvBGFSVM0ch0pv6SNaVC+CpkgJ3h7cOI=;
 b=g0QXVCzBKSgKDySs+XYaezFnsW/QW0QYilzd0mmO00vfMoObVjjOIVM6+rqa03+pI8kP2p
 1nBmSVLG9DRCw0PJzPIoOqucRM9PG2OYLBCB0jmM4OPlS2HWaV4I3Mx7I20YV1yYZWoyih
 hMfZa4IuJPOlzaKOzTHIfK9H/INYajA=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-HtXM_NnlO-6wqqBEpzX1jw-1; Tue, 08 Jun 2021 16:32:57 -0400
X-MC-Unique: HtXM_NnlO-6wqqBEpzX1jw-1
Received: by mail-ot1-f72.google.com with SMTP id
 w1-20020a0568304101b02902fc17224cf5so14748598ott.3
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 13:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X9b8RHD4rLJPvBGFSVM0ch0pv6SNaVC+CpkgJ3h7cOI=;
 b=XnzmIXKQV8cQ4eHMLE69oN3db3P5zKg9YupEw/ognLrE+Zk9k6WBvsEWjdxDIavcc2
 /iAo8kthedcXAJlq+bwqbjkDC7onp445ifFnTFO1IT1Glvum7uGOcwBC03SkBMjHbg2I
 HzaaSZSgdx5gfQnz9j10q8Y+NWr31dT92dkx436XHbNQCpnK/08uwyilDytpwGDik3yd
 wB7qVQZD3UYxho38wLoqFi8vB9u7IXRCUr7OBl6bMs2+ScFDjc0UiTgkG1CUTN6vi42A
 llnZbSFa2+RxHB0PDA7F+rEbDRr70I+K9e9jZUh6PIYnXOMkCHgSV56VwbHSdpYUO2HG
 65rA==
X-Gm-Message-State: AOAM532dESqz+n/rZ3jrXZDDeKu7wT20wOW+U7ixYpjTO6Wdv0Xma4ZE
 pQavQ8hbB0rcS5BFaHJdv/LCq0kDz7309vBoFpQoiT453yKn3odEtNmiQIi4ztnk5Do45VxF+El
 RchI5eVmwFppehlE=
X-Received: by 2002:a05:6830:1f51:: with SMTP id
 u17mr19838175oth.25.1623184376668; 
 Tue, 08 Jun 2021 13:32:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPRcPbgAAY9Y+XvQKrpkDsxLrg0JZ5lX86IKW8t5mXlo2A59KF0hKDYLnXuyl+UBfo91/+GA==
X-Received: by 2002:a05:6830:1f51:: with SMTP id
 u17mr19838155oth.25.1623184376370; 
 Tue, 08 Jun 2021 13:32:56 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-99.ks.ok.cox.net. [68.102.25.99])
 by smtp.gmail.com with ESMTPSA id
 p10sm1764028otf.45.2021.06.08.13.32.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 13:32:55 -0700 (PDT)
Subject: Re: [PATCH] Add Connor Kuehl as reviewer for AMD SEV
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210608192537.103584-1-ckuehl@redhat.com>
 <YL/Ouxk9LcVzE28D@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <d01cae3a-eee4-1488-6f74-6b0beef38c6c@redhat.com>
Date: Tue, 8 Jun 2021 15:32:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YL/Ouxk9LcVzE28D@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 3:10 PM, Daniel P. Berrangé wrote:
> On Tue, Jun 08, 2021 at 02:25:37PM -0500, Connor Kuehl wrote:
>> It may not be appropriate for me to take over as a maintainer at this time,
>> but I would consider myself familiar with AMD SEV and what this code is
>> meant to be doing as part of a VMM for launching SEV-protected guests.
>>
>> To that end, I would be happy to volunteer as a reviewer for SEV-related
>> changes so that I am CC'd on them and can help share the review burden with
>> whoever does maintain this code.
>>
>> Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
>> ---
>> Note: because there's no maintainer entry, when running
>> ./scripts/get_maintainers.pl on target/i386/sev.c, my name and the qemu
>> mailing list is the only thing that shows up... it doesn't even show
>> previous committers (as it would before applying this patch). Which is
>> probably not great considering I do not make pull requests to QEMU.
>>
>> Is the way forward to get someone to sign up as a maintainer before
>> applying a patch like this?
> 
> There's no requirement to have a maintainer before having a reviewer.
> If any of the existing committers shown do send pull requests, it is
> probably co-incidental since they're not listed as official maintainers,
> and being listed as Reviewer doesn't commit you to doing pull requests.
> 
> That said if you're the only nominated reviewer and actually do useful
> reviews, you will probably quickly find yourself the defacto maintainer
> in 12 months time and end up doing pull requests... 

Right, I am just worried that if I am the only person that shows up in
the get_maintainer.pl output, the submitter will have to know some other
way who a relevant maintainer is that can take the patches otherwise
they won't be CC'd. Or we'll have to hope a relevant maintainer sees
them on the list. Or I'll have to chase down a maintainer myself
assuming the reviews all check out. :-)

Connor


