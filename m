Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926782D75B9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 13:37:42 +0100 (CET)
Received: from localhost ([::1]:45334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knhg5-0005YZ-Jp
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 07:37:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knhe6-0004MZ-A4
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:35:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knhe2-0003vV-BI
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:35:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607690133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ibCwdhKXuZljXdCm+jK5+hnYc44cRm151f2l+hjKuAA=;
 b=QpWLbowpza79JL6LBHG8evotnToAzoZ8iPNY17WMui4njx0kEtldMDNwVlWsW10/UcBjOp
 sdb8DLvUa5uZCQNS8yTutOzRPl1M2OH8orzzyLMKUW90OswaDWCoC1Il3OPfCAo33gMEFl
 MPqNUB7+UTObu/KAdkENITNAKgkxSRI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-wZzM3xR0PfqUzL7W8QZAfQ-1; Fri, 11 Dec 2020 07:35:29 -0500
X-MC-Unique: wZzM3xR0PfqUzL7W8QZAfQ-1
Received: by mail-ed1-f71.google.com with SMTP id ca7so3888166edb.12
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 04:35:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ibCwdhKXuZljXdCm+jK5+hnYc44cRm151f2l+hjKuAA=;
 b=V3mrx5EnnqvSPVcUA/O2fy3MvZkh3vdKrwffzn8I2MFQ2TK6rgvga4ZP2/hVNy49j3
 wyEh46LBzbDLHLTCp+Kbh1O5Tp94cnBJe2PHrQSU/eXJFph6qRRouzUe65XDMY0M/DG5
 KZproDFgWYKtjY5K3CGuhzQBT0GCEX7vNFSgSJvIvCAs62cYKzmlMl3kHIIL1GTZseDc
 g5GjfJdebymO0HsWZhvqRoTt9ogK9H2l5UigKQJk2K96L/cwgBhppABOzRgqmqauSTCq
 CJ7RM0167wY2DrZeDkVM1f+7JvhTNPSkxDRsFPF9kzvbTjioAdN9UC9azLtQFYm6/iAk
 zOgg==
X-Gm-Message-State: AOAM531GtuKb/kDZ8raBWw4jCqT4NiTwSD79yqPpe7q3Fewl5AZnTsqA
 dRiO9Mv+oSU3ESYYFbD1ziSAJ9Zr6TQlZj8iFXbvrw6bTthpfnBRbNbuaJwYLO2HD8xfcmi09ae
 isQ9IM6yb5jKq2v0=
X-Received: by 2002:a17:906:5841:: with SMTP id
 h1mr10607757ejs.77.1607690128307; 
 Fri, 11 Dec 2020 04:35:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFB5B0nkfKYxWDUNXscB8Os2Ji9wKRa9LRVghZSKizlCnwGzbRjIqg9NqsCiyHQDKS2M+c/w==
X-Received: by 2002:a17:906:5841:: with SMTP id
 h1mr10607726ejs.77.1607690127954; 
 Fri, 11 Dec 2020 04:35:27 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id ng1sm6729250ejb.112.2020.12.11.04.35.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 04:35:27 -0800 (PST)
Subject: Re: [PULL 00/30] ppc-for-6.0 queue 20201211
To: David Gibson <david@gibson.dropbear.id.au>, peter.maydell@linaro.org,
 Giuseppe Musacchio <thatlemon@gmail.com>
References: <20201211041507.425378-1-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <442b503f-1bd5-4fef-254d-d57c5d7b57be@redhat.com>
Date: Fri, 11 Dec 2020 13:35:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201211041507.425378-1-david@gibson.dropbear.id.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 5:14 AM, David Gibson wrote:
> The following changes since commit 2ecfc0657afa5d29a373271b342f704a1a3c6737:
> 
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2020-12-10' into staging (2020-12-10 17:01:05 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.0-20201211
> 
> for you to fetch changes up to 7728c7ef126468a3e982b03b427196b1cccfa2c8:
> 
>   spapr.c: set a 'kvm-type' default value instead of relying on NULL (2020-12-11 12:02:10 +1100)
> 
> ----------------------------------------------------------------
> ppc patch queue 2020-12-11
> 
> Here's my first pull request for qemu-6.0, with a bunch of things
> queued over the freeze.  Highlights are:
>  * A bunch of cleanups to hotplug error paths from Greg Kurz
>  * A number of TCG fixes from new contributor LemonBoy
>  * Added Greg Kurz as co-maintainer
>  * Assorted other bugfixes and cleanups
> 
> ----------------------------------------------------------------
...
> 
> LemonBoy (5):
>       ppc/translate: Fix unordered f64/f128 comparisons
>       ppc/translate: Turn the helper macros into functions
>       ppc/translate: Delay NaN checking after comparison
>       ppc/translate: Raise exceptions after setting the cc
>       ppc/translate: Rewrite gen_lxvdsx to use gvec primitives

I was surprised by that author and went to check the wiki
https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_Signed-off-by:_line

  Please use your real name to sign a patch (not an alias or acronym).
  If you wrote the patch, make sure your "From:" and "Signed-off-by:"
  lines use the same spelling.

The patches are signed with Giuseppe real name, so this is OK.
Author can be fixed up later in .mailmap.


