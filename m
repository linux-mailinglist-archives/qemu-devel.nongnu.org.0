Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9D55A27BE
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 14:24:24 +0200 (CEST)
Received: from localhost ([::1]:48136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRYNr-00063d-7Q
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 08:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oRXrO-0006fd-2n
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 07:50:57 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:39494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oRXrK-0003Vm-5d
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 07:50:48 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A12C9223A9;
 Fri, 26 Aug 2022 11:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1661514640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tds8wkEu3bicaJC/N4cO1LPKM5r7KMN1dnE9q7ZKXRA=;
 b=aCzcz+jo/ZW1zCi6IhCZ93tCC58l6pjDMWI9PVn2TR4jJMmxXc6fXMTpbHZ70xEVbKQELw
 TNgfdJJp4BLmcO9Zb7xckakGpfIOezbB1T8yz+P45M+PL3HfHwP6N1gaqfsPzMGqfv8xXV
 wJsRjboiidFiHnLwN/ELZ8qWd54NJFY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1661514640;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tds8wkEu3bicaJC/N4cO1LPKM5r7KMN1dnE9q7ZKXRA=;
 b=LwHIkfqcp/rhySvOguOa4vPSCrmMyegmD/HmJOMcFFupY4yIR6l8jf58YBO9hzy8ODKD8A
 MPtAq5OPJiH6tAAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7645513421;
 Fri, 26 Aug 2022 11:50:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id c2t5G5CzCGPTAQAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 26 Aug 2022 11:50:40 +0000
Message-ID: <1c0c72f5-6a4c-1fb3-3fa7-9c78e8ec8c7a@suse.de>
Date: Fri, 26 Aug 2022 13:50:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] linux-user: use 'max' instead of 'qemu32' / 'qemu64' by
 defualt
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220826113900.794046-1-berrange@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20220826113900.794046-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/26/22 13:39, Daniel P. Berrangé wrote:
> The 'qemu64' CPU model implements the least featureful x86_64 CPU that's
> possible. Historically this hasn't been an issue since it was rare for
> OS distros to build with a higher mandatory CPU baseline.
> 
> With RHEL-9, however, the entire distro is built for the x86_64-v2 ABI
> baseline:
> 
>   https://developers.redhat.com/blog/2021/01/05/building-red-hat-enterprise-linux-9-for-the-x86-64-v2-microarchitecture-level
> 
> It is likely that other distros may take similar steps in the not too
> distant future. For example, it has been suggested for Fedora on a
> number of occassions.
> 
> This new baseline is not compatible with the qemu64 CPU model though.
> While it is possible to pass a '-cpu xxx' flag to qemu-x86_64, the
> usage of QEMU doesn't always allow for this. For example, the args
> are typically controlled via binfmt rules that the user has no ability
> to change. This impacts users who are trying to use podman on aarch64
> platforms, to run containers with x86_64 content. There's no arg to
> podman that can be used to change the qemu-x86_64 args, and a non-root
> user of podman can not change binfmt rules without elevating privileges:
> 
>   https://github.com/containers/podman/issues/15456#issuecomment-1228210973
> 
> Changing to the 'max' CPU model gives 'qemu-x86_64' maximum
> compatibility with binaries it is likely to encounter in the wild,
> and not likely to have a significant downside for existing usage.

How do we know for sure? Do we have a base of binaries to test across qemu versions?

> 
> Most other architectures already use an 'any' CPU model, which is
> often mapped to 'max' (or similar) already, rather than the oldest
> possible CPU model.
> 
> For the sake of consistency the 'i386' architecture is also changed
> from using 'qemu32' to 'max'.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  linux-user/i386/target_elf.h   | 2 +-
>  linux-user/x86_64/target_elf.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/i386/target_elf.h b/linux-user/i386/target_elf.h
> index 1c6142e7da..238a9aba73 100644
> --- a/linux-user/i386/target_elf.h
> +++ b/linux-user/i386/target_elf.h
> @@ -9,6 +9,6 @@
>  #define I386_TARGET_ELF_H
>  static inline const char *cpu_get_model(uint32_t eflags)
>  {
> -    return "qemu32";
> +    return "max";
>  }
>  #endif
> diff --git a/linux-user/x86_64/target_elf.h b/linux-user/x86_64/target_elf.h
> index 7b76a90de8..3f628f8d66 100644
> --- a/linux-user/x86_64/target_elf.h
> +++ b/linux-user/x86_64/target_elf.h
> @@ -9,6 +9,6 @@
>  #define X86_64_TARGET_ELF_H
>  static inline const char *cpu_get_model(uint32_t eflags)
>  {
> -    return "qemu64";
> +    return "max";
>  }
>  #endif

Just seems an abrupt change to me if we don't have a mechanism in place to ensure we don't break existing workloads.

C



