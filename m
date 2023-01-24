Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0709067A361
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 20:50:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKPIf-0004Fp-4a; Tue, 24 Jan 2023 14:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKPIa-0004FQ-OU
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 14:49:42 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKPIZ-0000pq-7A
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 14:49:40 -0500
Received: by mail-pl1-x632.google.com with SMTP id be8so2915652plb.7
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 11:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nly7U5wfW0JNpTDdwNzhUZITfd0CBi4nq8hC5tdUzdY=;
 b=c4NjLk1ZpPERLEYKIY/gAxjhDKqwVVLbo0fMsl6X4F9o/xPNHsjpEe6JNdaHNV6cTb
 OfHy6pM0Sngg85CSZ9l/s5/ThxVvoUzdnbZcC8ixRB8qihxG49usu2aYa+5AG//dytS5
 XVlEDaO0EBHgpsy3i7M8V0OZlxSDQVv9C8kMjw35eNS34XYEOWb7+JcCl3kblRUWxkJF
 eDeaukswvCU6nQEK5uSD5Fb3ELbHWkklACgm9+L9FHM3zf6y6FWpi/6xGRm29m1xpVlh
 yj+GIo+vdmwttS+s5s5Mryh4iPEj8eT/AZ/rf3d+upNGtLR2/jcXLgxSo58QHWQZMVw0
 KHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nly7U5wfW0JNpTDdwNzhUZITfd0CBi4nq8hC5tdUzdY=;
 b=BSjSrcNU1USKkqxDahvPa2mUkualmVIe0gL0rlG9veV0oS5TPYMoPEDSuZRqM+0ji1
 YA1wyO3X3I55dXZBdE6+8LOImU/whBxu3TGNuVDKnKsrkYiPQvwsoEw1rgil1z8v0cK3
 UIlzasmx8nzhOlo22jEcUa0LfaAZ2QKXk+eq10WAvDT3516fJiTD3bKqQxqL65SDBPZ0
 W84L1ExiW0pDScirceK2VWDfeyOmN1nYN5vwMo56HiozPIHCW+l9GnCal0jkJ9zcovHH
 i9cWfvQFVX2myVR7dTs7WVlXuy7BdhSzo8WN1a/v9UmKpBR/cp66p61s0I29iFFZFuUn
 A4xA==
X-Gm-Message-State: AFqh2kpGE5gvnSdYBXWDwFOr2k9EMS1ykot0bdZc9pef+EJFrMfCj+aF
 3ThpSK7XZ860si6LwzQKTR8juw==
X-Google-Smtp-Source: AMrXdXsvr9E8ftNSn6rDMQt+tnluyCvN0uTS7TsjOnflhcUixfFXBQnaLVldhhzCqZ4ssxj062EZww==
X-Received: by 2002:a17:90b:1a88:b0:22a:be:a92f with SMTP id
 ng8-20020a17090b1a8800b0022a00bea92fmr19581024pjb.14.1674589777458; 
 Tue, 24 Jan 2023 11:49:37 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 o1-20020a17090a55c100b00218cd71781csm1924709pjm.51.2023.01.24.11.49.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 11:49:36 -0800 (PST)
Message-ID: <1c7f7bb0-8a7b-40ae-a4fc-b8156b957bee@linaro.org>
Date: Tue, 24 Jan 2023 09:49:34 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 01/35] scripts/ci: update gitlab-runner playbook to use
 latest runner
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230124180127.1881110-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/24/23 08:00, Alex Bennée wrote:
> We were using quite and old runner on our machines and running into
> issues with stalling jobs. Gitlab in the meantime now reliably provide
> the latest packaged versions of the runner under a stable URL. This
> update:
> 
>    - creates a per-arch subdir for builds
>    - switches from binary tarballs to deb packages
>    - re-uses the same binary for the secondary runner
>    - updates distro check for second to 22.04
> 
> Note this script isn't fully idempotent as we end up accumulating
> runners especially during testing. However we also want to be able to
> run twice with different GitLab keys (e.g. project and personal) so I
> think we just have to be mindful of that during testing.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> 
> ---
> v2
>    - only register aarch32 runner, move service start post both registers
>    - tested on s390x
> ---
>   scripts/ci/setup/gitlab-runner.yml | 56 +++++++-----------------------
>   scripts/ci/setup/vars.yml.template |  2 --
>   2 files changed, 13 insertions(+), 45 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

