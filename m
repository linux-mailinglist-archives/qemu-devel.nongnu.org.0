Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A7A308DCB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 20:56:53 +0100 (CET)
Received: from localhost ([::1]:44612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Zsy-0005Tb-QC
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 14:56:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5ZrK-00052f-Mr
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:55:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5ZrG-0001OH-RG
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:55:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611950105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wQj//Tmap0qDkr/q8Fq5UTsZj3Q9p2k+8bDSCzA7e/I=;
 b=Te+dZV9Jkzu+D5tl/GdVkIKpshtEfLlnDzH8QpkZdr2QqBf5hFE3U4KdpqLwzZnV6kan4V
 oGD2abtETalLoFCKtPg4lnJBGo+ZEP00nCUTOsfW+VJm7yuL6PxCwS1N4+voKOdb5GJI6X
 lHw/qwg6BqkDmPXgnzuYuXvGZX13b7I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-V32cz9HnNXyY9uOPtq_8zg-1; Fri, 29 Jan 2021 14:55:03 -0500
X-MC-Unique: V32cz9HnNXyY9uOPtq_8zg-1
Received: by mail-wr1-f71.google.com with SMTP id j8so5786742wrx.17
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 11:55:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wQj//Tmap0qDkr/q8Fq5UTsZj3Q9p2k+8bDSCzA7e/I=;
 b=NvPsHhjbBjlrR1f96F2vvsUk9J7W5ZfjGt3ELK6a8CrjN5rIkcrJiEaBfYZ5GwW5vw
 5spQtZWj8QLMxsw8T85vWeIporkVaUVWt0Wp3SQCd3MDE4Qun+s0PqsdlOS0OjRH3owC
 hclK4mRNFHHENkQHdr/bkjlVzvgaIou2tpjrtHnj3VBP2XhP082bdxVyeqXAeEdam0xQ
 4rRSyCc+q2g6NqpX7SPJ7jb6RZOjCAloCYd56Nwkn2tZNkuFcvXkPLfPGbHDhluV8493
 PDNchiudczbQhI6eT+GVjoHIP2HZVIvj120mX3JrTVgxvJd7Hv6NphDbTuD68/fCkt+B
 CV6Q==
X-Gm-Message-State: AOAM533+aufIkkI1UBC5ikZA7ik7RBRcknvJKtGX/P+Lwh5OaL7VWkug
 AA4gR5+j7yvDd6Dy0YcgkMc+ybBzcMr+cVHlc+C0MAcdRYTE26FwlootsOjIpEOapO30lmgb2qI
 I+T1pvSK1HwjtvnMjXocpaotHQC4uE7vZ86WW/gVOEMNW9m5uZ0VS1BhtiAhzNWFRyYU=
X-Received: by 2002:a1c:6005:: with SMTP id u5mr5370456wmb.122.1611950102178; 
 Fri, 29 Jan 2021 11:55:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzE8E9BalIe03E59T9DeeAr8B+OcnlXu2JgAGi9IC/8ayGSKdgzeRJA2n1PzE0msPcHyhtBkA==
X-Received: by 2002:a1c:6005:: with SMTP id u5mr5370439wmb.122.1611950101918; 
 Fri, 29 Jan 2021 11:55:01 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id c11sm13424487wrs.28.2021.01.29.11.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 11:55:00 -0800 (PST)
Subject: Re: [PULL 00/36] Misc patches (buildsys, i386, fuzzing) for 2021-01-29
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210129111814.566629-1-pbonzini@redhat.com>
 <CAFEAcA-CPcVyo2fzUX3sSdMoS6xJbxn7V4AwRFFSB+mU9bGGYQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <48eb40fc-8c5f-e2c8-3f51-9a45dc1ee128@redhat.com>
Date: Fri, 29 Jan 2021 20:54:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-CPcVyo2fzUX3sSdMoS6xJbxn7V4AwRFFSB+mU9bGGYQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/01/21 20:49, Peter Maydell wrote:
> On Fri, 29 Jan 2021 at 11:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> The following changes since commit 0bcd12fb1513bad44f05f2d3a8eef2a99b3077b6:
>>
>>    Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-01-28 12:30:30 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
>>
>> for you to fetch changes up to 6c52f4644c9c8a18b8495e169e539632a897f135:
>>
>>    accel/kvm/kvm-all: Fix wrong return code handling in dirty log code (2021-01-29 10:38:38 +0100)
>>
>> ----------------------------------------------------------------
> 
> Fails to build, OSX:
> 
> ../../subprojects/libslirp/src/slirp.c:131:17: error: unused variable
> 'old_stat' [-Werror,-Wunused-variable]
>      struct stat old_stat;
>                  ^
> ../../subprojects/libslirp/src/slirp.c:143:10: error: unused variable
> 'buff' [-Werror,-Wunused-variable]
>      char buff[512];
>           ^

Hmm this is the same slirp failure that in theory should have been fixed 
by Marc-André.  I'll check again on Monday.

Paolo


