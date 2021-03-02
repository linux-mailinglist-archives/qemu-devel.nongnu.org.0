Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5515D32A6C9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 17:58:04 +0100 (CET)
Received: from localhost ([::1]:37632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH8LS-0007h5-3O
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 11:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH8K0-0007BP-A0
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 11:56:32 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:35298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH8Jx-0005d3-5w
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 11:56:31 -0500
Received: by mail-pj1-x102f.google.com with SMTP id e9so2426976pjj.0
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 08:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IJ/pMye/WX/XrPFBKvJJgwi44ozFN6bYzyWNqFjK42I=;
 b=h5IhgCpI1EJEircAKq2EYQ81JDlh48G7qfCjEi54iaacz/2oqHIDgjPD8Hmu46gwEJ
 pvvC+9EmgaDwns3a9PJDJhNdODxySNQUiNNqnnPwQmDzIIKxzJr4QGh2b+RYvftXcmYw
 DownPjP9ohdt+3OvTeO/iSg2sT8J7lAe0i2HVY0kXG1jciKYPGeTSarnu3uET/blqOzq
 kttfqyRaSeR7dUgQOcXDBh68ztZYZQWvPYDE8hQD2qCExbQ3/ct/fbk9HvpiBmEU94kX
 pN+QkDAL2sQnCc4b3RaBqlhKQdmVHOYN0VW8VU09usVpI0rluNwePfRKMs/v4Kw2Uq4f
 CpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IJ/pMye/WX/XrPFBKvJJgwi44ozFN6bYzyWNqFjK42I=;
 b=Aew4QSBfitozX2pMreIJuKOg4LuijGHMwkdbedY317HApnkH7xuRQTgRqV9Okx94cI
 vetmmJh49MA0pcqUf0gR85e/XzMr5HcC4Ze3k3zsK7PJNP6dJFc3r7dZrGFxe0/tnfQr
 5qz3WFVuFuaAMbod9YRlR2qJ0sQASkM5FMOY6wj8IkFzcjQMC3wOAzurcO2BBIqM/lmO
 NF6FCaxw7ML8Fzl6FdvYYjyrTu2EcPT8T+JYg94SLrydOVR2zQbfntN57i3btkVcOWrS
 emNo1+clcgWU1cCcB4gQKwBTh1kCns9VaFtkatw4KvngLzDEBukKnNDykqzrSguuKKua
 o50w==
X-Gm-Message-State: AOAM533jMn0vqkq2EEN3hHwVi8scw4ivoEoR//2NTTJ8TKBvtN4lQzPg
 JCenTBxxRxhcdQ1HRfZp6tNvzaUP9KV/gg==
X-Google-Smtp-Source: ABdhPJxiCf3dGcw0py0uOm1xd/b/UZkdmfH5NACfXmCEIcBoR2UZWm7aeKNAnstKD9oJhFSj2p5qDA==
X-Received: by 2002:a17:90b:e18:: with SMTP id
 ge24mr5385992pjb.199.1614704187531; 
 Tue, 02 Mar 2021 08:56:27 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d75sm18827630pfd.20.2021.03.02.08.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 08:56:27 -0800 (PST)
Subject: Re: [RFC v2 21/24] target/arm: cpu64: wrap TCG-only parts of
 aarch64_cpu_dump_state
To: Claudio Fontana <cfontana@suse.de>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-22-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6d8ff697-aff9-0f56-6f68-1deb428e0ee5@linaro.org>
Date: Tue, 2 Mar 2021 08:56:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210301164936.19446-22-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

On 3/1/21 8:49 AM, Claudio Fontana wrote:
> -    if (cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {
> +    if (tcg_enabled() &&
> +        cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {

There's nothing tcg-only about this -- kvm supports sve.

r~

