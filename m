Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC62244F46
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 22:46:10 +0200 (CEST)
Received: from localhost ([::1]:38998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6gaX-0000iI-IZ
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 16:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6gZV-0000BZ-AC
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 16:45:05 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:55625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6gZT-0004r7-BV
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 16:45:05 -0400
Received: by mail-pj1-x1043.google.com with SMTP id 2so4952047pjx.5
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 13:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A2VC/vS5WvkOPqsFTNxkQQ2o/FoZ1/cffuRrBSP1oDM=;
 b=NaKiAXselbuQovjVPjaIr/7Tc53PmX3RWC5k/wD97pQdwP5dHqTWDyDThIBLhmWe/0
 azvvL7551S0CNrWOjaqIdklGPcYnzaxgf/ORqX0V4mLjoAax+Kdh/fsMCAdP+Tog6Yvs
 BWdqJ/ciOYV5bwA9qmMJyiNYPo1iT33tImEvmsuRTZALaX4Y8e+yuii2bxiTpLQ+FXhk
 W3ad5ZFKaUS4eSjm6Bx8UtqStudZ2QYbtOVCPH/c+IG85KSLKG3Xr2Lpi550wFYHACXL
 6TShu7zPIdQrv43hnWTLSwjPt4F6P0nf+Tdy+6eq2Kw0JEyzNaa9WrKDDKIn8dCWkSpg
 1eMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A2VC/vS5WvkOPqsFTNxkQQ2o/FoZ1/cffuRrBSP1oDM=;
 b=h/Nefvu/O8VQdLOsLvnDI7rGxNGL9Njx57Uh82YMoMLXpKHiOAHYefCEkMBrqP276K
 xq86K/IniFM7qcVpotynWrpaLvNYrLWvsanpu0wba4mR1SGLdBy+zgd3xei5wlp7+S3W
 HIzHzY8vOSo5FwqfA67O7i3bxDeu68aMOXPT30peWaw8M9hGeqkgswXAZ6m9tv11ha6M
 P8mSa/E/Syy0sgUMOcyIYJQN3Slk5XEw65XjjgJRQNWzDLywhG+yhZH8fq3IC64BYo9k
 QnhW8x84CPgem3R4vfoxcKHe/ZyLsZEZAftgY1fEnnHG5o+2kjZXHvuCGITm79dcY7Dr
 8THg==
X-Gm-Message-State: AOAM532cnsPh5QoPMlcIl8257BhWuUqSHAwXpmNoNqPG8sLgAExapX3h
 bKFvdxcBbebMTdg71WLQC8RJmQ==
X-Google-Smtp-Source: ABdhPJyVSW/Q00HRezMM5ErtZyvNwUJGvOND/x7veBx6HOEUJ7xuLeBw0QjKGtq/geF6Ezu8xzf6hg==
X-Received: by 2002:a17:902:9a82:: with SMTP id
 w2mr3167767plp.308.1597437901347; 
 Fri, 14 Aug 2020 13:45:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id y1sm9940680pfl.136.2020.08.14.13.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 13:45:00 -0700 (PDT)
Subject: Re: [PATCH v5 05/14] cpus: extract out kvm-specific code to accel/kvm
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
References: <20200812183250.9221-1-cfontana@suse.de>
 <20200812183250.9221-6-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5f9c2202-3f33-64b4-62aa-5f1acebab6a9@linaro.org>
Date: Fri, 14 Aug 2020 13:44:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812183250.9221-6-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>, Wenchao Wang <wenchao.wang@intel.com>,
 haxm-team@intel.com, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Richard Henderson <rth@twiddle.net>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/12/20 11:32 AM, Claudio Fontana wrote:
> +
> +CpusAccel kvm_cpus = {
> +    .create_vcpu_thread = kvm_start_vcpu_thread,
> +
> +    .synchronize_post_reset = kvm_cpu_synchronize_post_reset,
> +    .synchronize_post_init = kvm_cpu_synchronize_post_init,
> +    .synchronize_state = kvm_cpu_synchronize_state,
> +    .synchronize_pre_loadvm = kvm_cpu_synchronize_pre_loadvm,
> +};

const.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

