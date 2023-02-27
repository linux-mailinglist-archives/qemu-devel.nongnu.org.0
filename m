Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B68C6A4C2C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 21:23:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWjzy-0006Pr-RR; Mon, 27 Feb 2023 15:21:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWjzw-0006PZ-RL
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 15:21:24 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWjzv-0005ko-7k
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 15:21:24 -0500
Received: by mail-pj1-x1036.google.com with SMTP id y2so7455127pjg.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 12:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wskDLqCCVfxDrvu5Vcz06wMz/jzQoFbqV3jXEJeYoyI=;
 b=eq570Uk7nUf0H+E1ibMnyXd+duQPVSIXFSVpO8tz2fL005OZ44CTxh56oXPJ6AbnWr
 tcx8DpYLJ3za6vqFmAvo+mTVedTOqzojcNep+S6SRdN7XHn/ZTqV4dYVdMxuk3af/zCB
 ZzdM1h2KCMoR7P5PwOLwnxWpCCaFOPFUoJHKbbHSCRrMTH2XRDow4S8ousW6L3VujFm/
 zTSoaAKkyRJC7Qe3cqgdcgfwJ7+R6tE6DXk/+St4jhIDHext8GlpJTMXfh+8H792pEBs
 3eK7uwdqAlvh4GlFPSKnuuv0zO3PJHbVMbJnznxqcg9LPjgjdY0QlMG9NzMIK5a43Fq3
 imLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wskDLqCCVfxDrvu5Vcz06wMz/jzQoFbqV3jXEJeYoyI=;
 b=xYlRZkymqPJdRve/ef/TeWVaUtqhMkiQEpsYQGh65DOeqGJ7NtoPtp4V7axMY1cq2+
 EyBI3dVkkrwpDz3LFVjdQqmnlBqIanO28LzrzjfNVRd+RIsJ9gRCRth/4zFXH1fuLNLi
 YIq7t62AxMQnyLdgb3WdcKXxaEMBwALTX53yM973YnDhZdVkMov96yk6+0HZ1WXuB6zJ
 3dP5+s288omvQwGNDiletNsF7jjCqtA6MF23QLPndJxz5LJXSK6rQTo9ggmFrF6iKBsG
 5xQ3aRcUI5eNNO69y9updtw6f1iNE3BhOVcuXmBS+n6HGZNqZSt3Hq6ucx5rPU0xTagm
 UYLA==
X-Gm-Message-State: AO0yUKUwNHJDTD+1nwS83JFEokj1qNLFSNuYM4bG/TheqyqjISW4XdDs
 XAhV1IpvLSwHmasPlWYTGLeDUA==
X-Google-Smtp-Source: AK7set8ikfBIt7vwSk8VIe8f/SB+uBUUEM7nzc8hrLDES0Uq//JkcsqoknN07S6lfqP3UuhLjdVoFQ==
X-Received: by 2002:a17:902:c401:b0:19d:297:f30b with SMTP id
 k1-20020a170902c40100b0019d0297f30bmr245159plk.19.1677529281526; 
 Mon, 27 Feb 2023 12:21:21 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 ik14-20020a170902ab0e00b0019ab3308554sm5011860plb.85.2023.02.27.12.21.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 12:21:20 -0800 (PST)
Message-ID: <d1151c34-c2e3-50aa-b12e-f6c5cafed5d3@linaro.org>
Date: Mon, 27 Feb 2023 10:21:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230227150858-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/27/23 10:12, Michael S. Tsirkin wrote:
> On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
>> I feel like we should have separate deprecation entries for the
>> i686 host support, and for qemu-system-i386 emulator binary, as
>> although they're related they are independant features with
>> differing impact. eg removing qemu-system-i386 affects all
>> host architectures, not merely 32-bit x86 host, so I think we
>> can explain the impact more clearly if we separate them.
> 
> Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
> a superset.
> 
> Removing support for building on 32 bit systems seems like a pity - it's
> one of a small number of ways to run 64 bit binaries on 32 bit systems,
> and the maintainance overhead is quite small.

It's not that small.  It only works for single-threaded system mode.  It silently does not 
honor atomicity for user-only mode, which is perhaps worse not working at all.


r~

