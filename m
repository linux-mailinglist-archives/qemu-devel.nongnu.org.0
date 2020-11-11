Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330B82AF6B6
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 17:41:32 +0100 (CET)
Received: from localhost ([::1]:38536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kctBa-0006Jb-P7
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 11:41:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kct9N-0004cB-4E
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 11:39:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kct9L-0006aL-2Y
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 11:39:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605112750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VSeONmXX3wBq+VcxdGxD/5blYmlSZw6a2gOPQ+EJKpI=;
 b=L5XlhhUNGXqA+I5MF6IUGivc/A4xvXhDNw5zQ3GqeG74TJ3p0nJk7btmTVHTG1IYVKMs/E
 3PlZzq8HvRJC2U/AopUvMheeYVGYhKMTroZzLeN7jGSaxFQO+3FW+lDd106ZlBTWjbZlDh
 eDM43x6BbsLhqJ0Vs4qBfuh58hGPNHs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-LiIuYZ4kObW39o3Wl6XbxA-1; Wed, 11 Nov 2020 11:39:08 -0500
X-MC-Unique: LiIuYZ4kObW39o3Wl6XbxA-1
Received: by mail-wm1-f70.google.com with SMTP id z62so2639528wmb.1
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 08:39:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VSeONmXX3wBq+VcxdGxD/5blYmlSZw6a2gOPQ+EJKpI=;
 b=tmVEH2BgU/y85uu/YrJndO2yzCl6RD2rcV4BjCZfiJnwfTb6fIAwVRwrK8PTHfMSff
 tO6CVR/4u+Smk6IgotF3OVfPiOEQzMLuGc2rXQBQSrWjhIEnZU5QURDcT0prUS+OWXQI
 Sx0b7HLRvTSwbXvPb+ZgDHasUFsZ3w8PltQRoH5kG7ly9yM+fNUn99N2pDaMBGShe+kj
 tGQKTPST0c/3Z7O1okL/jaaRcN+yA3TXN47YNnhz51lPxbDjNNM4bSni1QPfRIZVls89
 5mWC4kx/XaB7L6Ysu8clCTyfscZqtKptENJqNqGBY4IfsoP00PXQHcVyL8JGxfSE4V4n
 oV0w==
X-Gm-Message-State: AOAM532s5QGj+GlBzMa1NKD14DkGnKnpb8MFueFiKVeoOCeN+FG/feZd
 AQJcm+yxodiz5mip0dELd1aDSpuqOCSQIxeGhALsL85iG9FcQr6Nj560uDyG3v4fu5lOBR8MNcD
 cmMIiy0at8sBKfQw=
X-Received: by 2002:a1c:3c44:: with SMTP id j65mr5290911wma.13.1605112746947; 
 Wed, 11 Nov 2020 08:39:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwh+aYfI8ekhTlZdLwvd98ifUWX39rSiaXb/AF5OED/W+gC7QAKHflyBfQUrs8b4hOHPLMQcQ==
X-Received: by 2002:a1c:3c44:: with SMTP id j65mr5290892wma.13.1605112746727; 
 Wed, 11 Nov 2020 08:39:06 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h81sm3200300wmf.44.2020.11.11.08.39.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 08:39:05 -0800 (PST)
To: Kevin Wolf <kwolf@redhat.com>
References: <20201111092423.GA3898@merkur.fritz.box>
 <20201111101407.GD906488@redhat.com> <20201111103550.GB3898@merkur.fritz.box>
 <30bdf162-5b29-6725-f5a5-fb5dcc85abee@redhat.com>
 <20201111125307.GC3898@merkur.fritz.box>
 <0471d35c-6fbc-c3e8-a2c3-b627a1ec2ece@redhat.com>
 <20201111152923.GD3898@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Command line QAPIfication and -readconfig
Message-ID: <2bc3b857-f197-a03d-efb3-c7ecb1058b81@redhat.com>
Date: Wed, 11 Nov 2020 17:39:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111152923.GD3898@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: jsnow@redhat.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/20 16:29, Kevin Wolf wrote:
> Yes, no question this is doable, it just requires some extra code for
> each option instead of reusing something existing. But it's not too bad
> as QDicts are at least slightly more natural for a QAPI based interface
> than QemuOpts.

Yeah, see the series I posted earlier.  There's some extra code but it's 
fairly well confined.

>> 2) converting to strings is not entirely trivial due to e.g.
>> different spelling between the "-boot" command line option and the
>> "boot-opts" group.
> 
> Hm, where is the difference between both? The QEMU_OPTION_boot case
> seems to just directly parse optarg into "boot-opts" with
> qemu_opts_parse_noisily(), which should be the same as -readconfig does
> with its input, no?

I mean that you could not easily turn

[boot-opts]
	order = "c"

into "-boot order=c" because the "boot-opts" -> "-boot" mapping is not 
written anywhere (except in code of course).

> Even if we queue the -readconfig deprecation only for 6.0, that's still
> fine. I just don't want to discuss one year from now how we should have
> deprecated it long ago.

As usual, the choice will be:

1) deprecate and give a firm removal date, knowing that there won't be a 
replacement ready in time

2) deprecate with no plan to remove; use deprecation to justify breaking 
whatever is too complicated to maintain

3) refactor to keep the code at least readable and as simple as 
possible, desugaring to something completely new and more maintainable

For -set I'm leaning towards (2), keeping only "-set device" working as 
it does have users.  For the rest of vl.c I'm betting on building (3) 
around a core consisting of -blockdev, -netdev, -machine, -object, 
-accel and -device.

Paolo


