Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276FA30EA9E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 04:04:17 +0100 (CET)
Received: from localhost ([::1]:51306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UwK-00066U-5f
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 22:04:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7UHh-0005K4-Rz
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:22:17 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:44078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7UHa-0006Do-Mr
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:22:17 -0500
Received: by mail-pf1-x429.google.com with SMTP id t29so1104895pfg.11
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 18:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9NOKLS3s9exLmQHsZD3PAUO8XcRMJTvh7NwbSI9HB3Q=;
 b=F+/yCdstdB22xOojaG9sxO2RE2QiDoQsRU02mj3/iw8vg5CX7bkJn4FeB+cOn7C6dk
 Q0iybnTMxCjVW6iYAhm8sfOVElZ7CYQplxKX/9cHSFowwnwVgjAQw/N2G7EpnuleAHsx
 Wp6UlTNSEHTVW25V1sdMkFP64vzRtKGi5j/hAgxSX+bnXJoXQ837sCv+asjkFoIvioVI
 qup/CX61ZO6hNxa7//0LZLA7mXY/gI9fPCXwjEzz8FehIUzO/LP8xEmuYCxPys3gBVwn
 ktbmfIzljpLeo8m1li1FkCBuZSgxLMtLErkghDCIlFCxpje0BJVQvn2yMIxBV2LzHzyW
 AN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9NOKLS3s9exLmQHsZD3PAUO8XcRMJTvh7NwbSI9HB3Q=;
 b=kmWnxhOAiGdGsO5oWxT0oQDjmD1fPNnUmEE819d8hXMYGw6uNmLOxQHEz2g86EXZfQ
 us4DP6/R1mDM0s1PD6Sa0FHHjEOZfJsZrtGAe0rRvrwf/A+jipmvdvWyWJkHdLC1+D9t
 BUWyVjm0joXnPFKjT2mrwgfNS9vS5V/gr6Q+BZn8OjVKnYRtH41kIbGfCir3LwoTzoOK
 Jqbwe8TfhKo4DE2X24JQOZ8lBipkfSUFxZWt21SuZTS9OuRjQmw6MNaVPdnf0Sh/V/74
 CGnfrSMz5QXicPAlH2jgxN0LQzo1NZWPLjyCDrKpVaHxs7WC2VbDjmxmt5y9J8VtmR8o
 aorA==
X-Gm-Message-State: AOAM531QepjNgL030WdVfPNvw6rBYqkBb3K3W5N1A0+O6JRPAdnv+pe1
 29i7F/Gr/4UQoqSI7LtBQXqdpg==
X-Google-Smtp-Source: ABdhPJwrhnGZVzZP2ncwj7kN3Md76tbJEvByebtzoY2cO8UD+jqkGmbtr7dKZ+YlYfK6XdQjJjvsXA==
X-Received: by 2002:a05:6a00:22d1:b029:1b4:9bb5:724c with SMTP id
 f17-20020a056a0022d1b02901b49bb5724cmr6092287pfj.63.1612405328762; 
 Wed, 03 Feb 2021 18:22:08 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id o190sm4230894pgo.50.2021.02.03.18.22.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 18:22:07 -0800 (PST)
Subject: Re: [PULL 11/24] tcg/optimize: Use tcg_constant_internal with
 constant folding
To: "Richard W.M. Jones" <rjones@redhat.com>
References: <20210114021654.647242-1-richard.henderson@linaro.org>
 <20210114021654.647242-12-richard.henderson@linaro.org>
 <20210201204547.GD2673@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <28457ae1-7e9b-4428-cb10-3b79ebeac8d0@linaro.org>
Date: Wed, 3 Feb 2021 16:22:04 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210201204547.GD2673@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.178,
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
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/21 10:45 AM, Richard W.M. Jones wrote:
> This commit breaks running certain s390x binaries, at least
> the "mount" command (or a library it uses) breaks.
> 
> More details in this BZ:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1922248
> 
> Could we revert this change since it seems to have caused other
> problems as well?

Well, the other problems have been fixed (which were in fact latent, and could
have been produced by other means).  I would not like to sideline this patch
set indefinitely.

Could you give me some help extracting the relevant binaries?  "Begin with an
s390x host" is a non-starter.

FWIW, with qemu-system-s390x, booting debian, building qemu-s390x, and running
"/bin/mount -t proc proc /mnt" under double-emulation does not show the bug.

I suspect that's because debian targets a relatively old s390x cpu, and that
yours is using the relatively new vector instructions.  But I don't know.

What I do know is that current qemu doesn't seem to boot current fedora:

 $ ../bld/qemu-system-s390x -nographic -m 4G -cpu max -drive
file=Fedora-Server-netinst-s390x-33-1.2.iso,format=raw,if=virtio
 qemu-system-s390x: warning: 'msa5-base' requires 'kimd-sha-512'.
 qemu-system-s390x: warning: 'msa5-base' requires 'klmd-sha-512'.
 LOADPARM=[        ]
 Using virtio-blk.
 ISO boot image size verified

 KASLR disabled: CPU has no PRNG
 Linux version 5.8.15-301.fc33.s390x
(mockbuild@buildvm-s390x-07.s390.fedoraproject.org) 1 SMP Thu Oct 15 15:55:57
UTC 2020Kernel fault: interruption code 0005 ilc:2
 PSW : 0000200180000000 00000000000124c4
       R:0 T:0 IO:0 EX:0 Key:0 M:0 W:0 P:0 AS:0 CC:2 PM:0 RI:0 EA:3
 GPRS: 0000000000000000 0000000b806a2da6 7aa19c5cbb980703 95f62d65812b83ab
       d5e42882af203615 0000000b806a2da0 0000000000000000 0000000000000000
       00000000000230e8 0000000001438500 0000000001720320 0000000000000000
       0000000001442718 0000000000010070 0000000000012482 000000000000bf20

Which makes me thing that fedora 33 is now targeting a cpu that is too new and
not actually supported by tcg.


r~

