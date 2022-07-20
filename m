Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FF557BB1B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 18:09:32 +0200 (CEST)
Received: from localhost ([::1]:57302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oECGR-0000Yl-IG
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 12:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oEC8l-000059-Kn
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 12:01:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oEC8b-0003WW-7h
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 12:01:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658332883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5bYHKdVkG120cwPCEyD/Io80FAjPhcTmSlC09JYBusM=;
 b=C8gROerTxfSz8K0UCyRd7SRNY/XAORapbI4J/6gzZcvrcocge9KNhAhzdEupTKbIzuVJSR
 aPB6QMoI+4S1Q5Sx+r1auomCE/nDDxmtJp8yR2FBgKj0Y+RhQ/BG197N36nzrWbGTFjwN3
 eDBe5O/EiVUlkcxkRQUifpE8nrcv7B0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-iEqcjcSMPMyyRrOwPRKpgQ-1; Wed, 20 Jul 2022 12:01:22 -0400
X-MC-Unique: iEqcjcSMPMyyRrOwPRKpgQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 r10-20020a05600c284a00b003a2ff6c9d6aso1441268wmb.4
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 09:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5bYHKdVkG120cwPCEyD/Io80FAjPhcTmSlC09JYBusM=;
 b=lOyN6kDjMvCkGfA9ux+Ud1BVuFLjFQADVS1u8PdbUCuxPd7FYJ0fJkWuRMV9jyWEXY
 /LJjgNmEQADEbP+X/4anYGZ2/PvkMIqgEZmvpMUxcfKc64Ffun/fCojl2V5YLqZ9f/Od
 EwRDH77qzC6t4jWp+vMXHRYrYmN6TzrxApsP8QyLvPkXcrGrvCU95mWseHGJ+GxnbBrG
 P5snLMVXAL4/9Btf6WTiy51MoGF2ao+30coUGLschwh6bW5K5GhydNovc9oWP9SYrDE0
 klGOzvxWRjVDVSEvirWMyFot4e4llhKpl/LqEwAShYieMqIOUwH1e3A28REgAiZQu7qX
 i91g==
X-Gm-Message-State: AJIora/ORU9kMm/+kQ5Nn8KGcrgAg0m+5rR55EwWv24Gop/PtUIYxBPA
 f4t+5k9P1aoriFAIHHYVvsfw1JDg78lSGsWJmhoOdvuDv+0fyhwW1D30QQ0fiIUA0jmHS+L1Fe/
 Ux7rF9JrhB3JhSMg=
X-Received: by 2002:a5d:47ab:0:b0:21d:b2b1:59b1 with SMTP id
 11-20020a5d47ab000000b0021db2b159b1mr30548349wrb.99.1658332880946; 
 Wed, 20 Jul 2022 09:01:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v9wZ36tlTfOXPK2OFaMeOzsEUd0jHGdCE7NYq1kFHh0v0KEGpeWQ+xjY3n/8tpsdbEdhq2eg==
X-Received: by 2002:a5d:47ab:0:b0:21d:b2b1:59b1 with SMTP id
 11-20020a5d47ab000000b0021db2b159b1mr30548335wrb.99.1658332880714; 
 Wed, 20 Jul 2022 09:01:20 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 n5-20020a1c2705000000b003a1980d55c4sm2816595wmn.47.2022.07.20.09.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 09:01:20 -0700 (PDT)
Date: Wed, 20 Jul 2022 17:01:18 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/5] configure: Add missing POSIX-required space
Message-ID: <YtgmzvxiKJyVfhOh@work-vm>
References: <20220720152631.450903-1-peter.maydell@linaro.org>
 <20220720152631.450903-2-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720152631.450903-2-peter.maydell@linaro.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> In commit 7d7dbf9dc15be6e1 we added a line to the configure script
> which is not valid POSIX shell syntax, because it is missing a space
> after a '!' character. shellcheck diagnoses this:
> 
> if !(GIT="$git" "$source_path/scripts/git-submodule.sh" "$git_submodules_action" "$git_submodules"); then
>     ^-- SC1035: You are missing a required space after the !.
> 
> and the OpenBSD shell will not correctly handle this without the space.
> 
> Fixes: 7d7dbf9dc15be6e1 ("configure: replace --enable/disable-git-update with --with-git-submodules")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> David Gilbert noted the OpenBSD issue on IRC -- I have not tested
> this fix there myself.

Fixed it for me, so

Tested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 35e0b281985..dec6f030346 100755
> --- a/configure
> +++ b/configure
> @@ -2425,7 +2425,7 @@ else
>      cxx=
>  fi
>  
> -if !(GIT="$git" "$source_path/scripts/git-submodule.sh" "$git_submodules_action" "$git_submodules"); then
> +if ! (GIT="$git" "$source_path/scripts/git-submodule.sh" "$git_submodules_action" "$git_submodules"); then
>      exit 1
>  fi
>  
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


