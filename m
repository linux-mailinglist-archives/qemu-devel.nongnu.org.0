Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 004A52D7AB2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 17:19:31 +0100 (CET)
Received: from localhost ([::1]:58426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knl8l-0002Sb-2B
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 11:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knl2r-000608-Nv
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:13:25 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:44881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knl2q-0006sX-3y
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:13:25 -0500
Received: by mail-ot1-x343.google.com with SMTP id f16so8644223otl.11
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 08:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tw6AOKoIcXoWgLww4hGqoxVQJQ5ly2H2D/u3QnClgRg=;
 b=cb+2Gp/R/qKNfYw5t9HwgjC5sSTmDkxCQ0BrgzFxjV1FFjlXLXVGkwDlItYRRa8rhe
 eeuY2iUNLO+CKiU8LsnpxaFZfSSML1ft5KyB+9SzAkuoHpCDwKYXNWKTrFQ2HViXNGT4
 g3oq0hwqaT3nK28ezilCHcsa+XDjU6zONoCtfD4E87EtS+mEFxCpvxP6JKT2AQ9SiqSv
 LGXPDNzqjhsVIgYpw/hg66Amzd6WMa6+aGa4VXUI5yz2mDizC8fHv0lKJ7VzvHwwfEtP
 UQ8lZGYXLB3JObYaYOPilglB9xZpUm7zm2pvtkqb7KPpSQG+F/xBbbpTwmP1co31Vu5Q
 w5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tw6AOKoIcXoWgLww4hGqoxVQJQ5ly2H2D/u3QnClgRg=;
 b=lqhIVwAwx3i69FF/QytFF6o+s3VuIgdsZsGahsuXz1T6nD5ribTaKlKuyKuNMttkBv
 mU1Gil8jd0LL7bID9Vb6KJGc6HAGkbV0fK1M1cCuy/1lCwaiyU/NVEzYLMb16E6beYms
 NUoZaHKM4aJwPBO/5iTI/GQdLf1SMkZmqRIpfIleo23/Q0f6sNMusif0TkxF6G0ZRaRk
 50qjGDoMQ5wqq91ZfXhHU8/Nwe8Y+QLuBqVAOjhgumvOfyfeNlK6CD2CBNh4hhdr5Oub
 xmkA3qiQhV04OKYa0ViiOlqOtkq2csAEtIsHFjyX3rf4H88Suzf4P8fOd5TWEG+fL0iA
 bN3w==
X-Gm-Message-State: AOAM531/u++LhHtMfV+qBkSwKzA2sPzDpjhbcMYC79rz+6D7fkKh+r/h
 fCxGMC6WgYvcaB4p0R/1JuWlcQ==
X-Google-Smtp-Source: ABdhPJzJ/GfLdZtzF8sGYk5Mh6DNlJaXhXGw65Cp7uaH3CAh1/OImJ8MACcyBABVgiY3trfkow8ZmQ==
X-Received: by 2002:a05:6830:1e16:: with SMTP id
 s22mr10066046otr.110.1607703202857; 
 Fri, 11 Dec 2020 08:13:22 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id n13sm1908396otk.58.2020.12.11.08.13.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 08:13:22 -0800 (PST)
Subject: Re: [PATCH v11 09/25] i386: move cpu dump out of helper.c into
 cpu-dump.c
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-10-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3e759d43-8864-fe25-4168-8e11538b9bb2@linaro.org>
Date: Fri, 11 Dec 2020 10:13:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211083143.14350-10-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
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
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 2:31 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/i386/cpu.h       |   1 +
>  target/i386/cpu-dump.c  | 537 ++++++++++++++++++++++++++++++++++++++++
>  target/i386/helper.c    | 514 --------------------------------------
>  target/i386/meson.build |   1 +
>  4 files changed, 539 insertions(+), 514 deletions(-)
>  create mode 100644 target/i386/cpu-dump.c

There are a fair few "static const char * array[]" that should be "static const
char * const array[]", but is an existing error and this patch is pure code
movement.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


