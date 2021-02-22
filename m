Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602013210B5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 07:08:31 +0100 (CET)
Received: from localhost ([::1]:34686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE4OU-0000EU-FB
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 01:08:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4ML-0007Fw-5e
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:06:17 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:42605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4MJ-0000LJ-Ky
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:06:16 -0500
Received: by mail-pg1-x535.google.com with SMTP id o38so9584033pgm.9
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 22:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CZ2VbwBhMliKl4CVyi8bx5FV6suW3VNjtL6S/dJ0h0E=;
 b=sC8yYBpENsEHEBT84GTkS5CNZYKlHRjGyZJeH5Q1n+aYdlVWriR9YgAFFcI60uXHhC
 qy66g01CKQY0XCf4uZhVznBrIXKSAeLGge1YM5om+ys5T7/ZXKNFsomwihNlH5oolUBQ
 SE+3MXbFfya2XGIbx6gZ2dqx9H3baE7ohHBAD43eqBBHM3tTp24rbHMV5SIPsj0Ny9dr
 Pv5JpEZC4RQvdh6EuMlTC13bEJ/Ixpu6TyPcfMjQDKlCVqX7sj/zU4yqKJhxwJwaIhct
 5wKokYcsmVJgDXHL2r8fVVtHK9CNjNyRRpd2Gi4TmB71A8hdjrOP/1CiyZvBBmRacUMp
 6TVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CZ2VbwBhMliKl4CVyi8bx5FV6suW3VNjtL6S/dJ0h0E=;
 b=bphdp1oCLpXJUQgAkQBHYwcWtBa0eaC6eB4e9Nv13AmURXv2N5BPqLX6MlX4/rpci5
 /Pn1iEEIDCqmaMTKinKSEk+GaTm48//QeYOFlhcPK4U4+3g0xKq42BzH3+svoTdSc3sG
 XBWsDxv5g6k1Tfv/p6HcN4y2n0n3JbgaYcEGXwxk2TdZpAsX4Mzba2szOdV2dohHcbjz
 eEjolYuJc8RMDLe+MMxzdDR/nuchfa76YUuZnklBavQNfLEs+/SbnKsfLDsuWQzstOnM
 gjdwI1aEdxR8kT3mc59yI92z17ENH2jVft2mrkFfy7gSXx9CMautFFgJIVQ9qkLvOJPJ
 r3LQ==
X-Gm-Message-State: AOAM533PpPRMDLaFPUGG217sqe74iTqwcTCI4K+qQqRTGmyuUSA4Zz54
 hKtvRY+x2jOlhv81uWmQjIcspdalj5mAHw==
X-Google-Smtp-Source: ABdhPJz7wt69Y/7rT4VNuR7IAUZXwudj7aUpycP1tWRJ9dHBl1P1iQZIm3HeBOz8cgchnJOXRva9ag==
X-Received: by 2002:aa7:96a4:0:b029:1ed:94a3:2cf5 with SMTP id
 g4-20020aa796a40000b02901ed94a32cf5mr5401454pfk.68.1613973974095; 
 Sun, 21 Feb 2021 22:06:14 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id i18sm2017441pfo.16.2021.02.21.22.06.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 22:06:13 -0800 (PST)
Subject: Re: [RFC v1 27/38] target/arm: move sve_zcr_len_for_el to common_cpu
To: Claudio Fontana <cfontana@suse.de>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-28-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <15668067-2537-07c9-bb76-a429c9af4a08@linaro.org>
Date: Sun, 21 Feb 2021 22:06:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210221092449.7545-28-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 1:24 AM, Claudio Fontana wrote:
> From: Claudio Fontana <cfontana@centriq4.arch.suse.de>
> 
> it is needed for KVM too.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/arm/cpu-common.c | 33 +++++++++++++++++++++++++++++++++
>  target/arm/tcg/helper.c | 33 ---------------------------------
>  2 files changed, 33 insertions(+), 33 deletions(-)

This is related to rebuild_hflags, I assume.
Fix that and this isn't needed.


r~

