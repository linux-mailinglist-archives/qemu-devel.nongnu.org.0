Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1C72DB65D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 23:11:32 +0100 (CET)
Received: from localhost ([::1]:39110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpIXb-0000Ey-Kv
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 17:11:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpIVR-0005Kg-1t
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:09:17 -0500
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:44906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpIVO-00072I-B2
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:09:16 -0500
Received: by mail-oo1-xc44.google.com with SMTP id j21so2640228oou.11
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 14:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GqDzfDbHOwrXkzwGsmlr+rZY7Q89vdYMcmhR0g1hJ5c=;
 b=WhzDOfNzWRRm/ixQryAo2HR9MhhTHDmtzfCDtl0HCFAkhKoTm5rPVyA8vXCkTQSjEF
 Nc77xvKXE9TGWtgviUJKC84cxBC0k3G9bsaQKlDKpDESeWSmK1xlploPtVmSKcLTwoUB
 Y2lyvwf6qBdsIIA7pRb/1pl1pV9mUq/IjVOGICrIncSbg+Mru+tRfCqRgMpKulCwy4oN
 VdIYV/2li6BvbB/p7e9Bt/S/N/QZy+I9BMYVUm+Q2EAEgWgc+Wrr1f4VU6ricVNMTkYf
 TuM3fsVIM4rP5kaWBlCy2NZ62wK6KBCIx55BFsx5hlDWpejkl2p7sMKJhtVaWYmbLpVD
 15AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GqDzfDbHOwrXkzwGsmlr+rZY7Q89vdYMcmhR0g1hJ5c=;
 b=EcC6WK9FTZvS/vh5lift0b3A7u1Oy2E/TgBB0hZLVQgInJYOKeacAyNpcR4ldrx8O+
 Wn+yPFn3QEscEU+wok0QCT0/7OfaTTsm7vRroEG4nlVCLKXQNwQOGYxPK+xyIIkQk8FI
 I/bINR8X5KwiYdo5LJivJw+4zwMbEZHPggT/KZ4k0WIcNYj9aHQcd5rxHERLWLsoV4uz
 OfTUQEMqrV8v4gBt/bIrudQ/BF514gvIfqz0P7QhAee4XM/PZOtvxWo4HWXL763oG8FS
 5jfDI/pxyL+756DM0tmmDAIjCtXmqfqL9tP3+naS7CtXNg4uDVToVscy/3dx4qVFtTbS
 I/jA==
X-Gm-Message-State: AOAM5337vd87ZzhCTdvj6fv8w6j20+AGVvJq1qlv+RPJCWi8PqKN+yLp
 yD8juT+Bb5SnjF2FFWDwIyHF0Q==
X-Google-Smtp-Source: ABdhPJzHkqEgscmNdjTzpAFtxKv3psh3FRv3RDLz4LEz/w0bOIA8L3UM5+dlhBHoTLlPSbYaQZfTnw==
X-Received: by 2002:a4a:c293:: with SMTP id b19mr24044836ooq.74.1608070153193; 
 Tue, 15 Dec 2020 14:09:13 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id n13sm52176otk.58.2020.12.15.14.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 14:09:12 -0800 (PST)
Subject: Re: [PATCH v12 08/23] i386: tcg: remove inline from cpu_load_eflags
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201212155530.23098-1-cfontana@suse.de>
 <20201212155530.23098-9-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f03b9113-3867-ac13-2bf2-5741ad5f5aea@linaro.org>
Date: Tue, 15 Dec 2020 16:09:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201212155530.23098-9-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc44.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/12/20 9:55 AM, Claudio Fontana wrote:
> make it a regular function.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/i386/tcg/helper-tcg.h  | 15 ++-------------
>  target/i386/tcg/misc_helper.c | 13 +++++++++++++
>  2 files changed, 15 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

