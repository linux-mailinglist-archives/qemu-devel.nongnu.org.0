Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 206902705F5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 22:08:15 +0200 (CEST)
Received: from localhost ([::1]:46228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJMg2-0007ol-6C
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 16:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kJLcg-0006yI-Gg
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 15:00:43 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:33279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kJLcZ-0001XK-VQ
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 15:00:41 -0400
Received: by mail-pl1-x644.google.com with SMTP id d19so3477194pld.0
 for <qemu-devel@nongnu.org>; Fri, 18 Sep 2020 12:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fqh6VGf/wM6lICUERuOk8wcgmre+kvtwDANu+VLducw=;
 b=NacBqVJj7rTj0Ydpuj4EohxLdDl9CdZ6HS8OLqZpHD8wwzKOeDYQ/HKe4em712xPQL
 w4dfgyqyk3TqamIyhV5yaCT8nCNL/+Cr0lCkvC8m6C3ZHCIy9BhbSNSrUv6EdChdfRal
 +mxZqqQYEF5aae6EgXtrvSTtXlR1FwfdwYa6W6pJ7R3kCwegmmHRuKGyHhnxuuU+1FHf
 lHH9oWFEKGFxoLIIUD6gsAe4PRkq7PPscmirwBRvf+eRRxxhjTQPntpLKnHZuigyUnoK
 qJHBpxr3KSAqS2VXP7AtITnVAS0BQ2svTncrU3YtVW7e/V0MyOGOMrNNaoUmKhfRJqIY
 1Ngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fqh6VGf/wM6lICUERuOk8wcgmre+kvtwDANu+VLducw=;
 b=oXr+FjxsBuLDGE7xddDuPRC/rYV8vElzpKbBWlnZwQUGSmLd75S9B1De7lNpDqnly2
 1INeQVzCfg46MtizP0L4+1vJfqbwg0EhSFnyqU872O576uC4Sz/kwpFMruqXWwlGu3Ao
 RQwVcLs5wLB4o6SPWR1UU509GA+H81QztAKCfSfi7Svo51gpZHUDHLAF6urC+wInu47d
 Ce5wMbsKi02U6zaWtuntJ7zZ41w2BN0w35i0D8tYRsae76kx2gysW8PP96kTATxgiIh1
 VPYc0vddbKvoOK95/DSPrv/uA0S8mRewB4jtAH/rm6NrK0EoVLNhfSWmX5K28YTR/nw4
 pGGw==
X-Gm-Message-State: AOAM532NaIa2ZOV+FvREqsUJKpnE4TgKrBP+ViO7P2L6vvroZSJNjhBt
 aWiYXdOh+pWHftTWWb3W8pNANw==
X-Google-Smtp-Source: ABdhPJw9g2unZzLz96cTgmJSmmpKQ5F8FaUO4mcE81dZt2XH1KDGx6mmo4J6GfR/YVPu3EYquu9O4A==
X-Received: by 2002:a17:90a:1425:: with SMTP id
 j34mr13959364pja.106.1600455634303; 
 Fri, 18 Sep 2020 12:00:34 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id i1sm4099685pfk.21.2020.09.18.12.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2020 12:00:33 -0700 (PDT)
Subject: Re: [PATCH v8 00/17] QEMU cpus.c refactoring part2
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
References: <20200916142004.27429-1-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0bb4af9-55a1-b332-af6f-7601dfb10db7@linaro.org>
Date: Fri, 18 Sep 2020 12:00:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916142004.27429-1-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.869,
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
 Alberto Garcia <berto@igalia.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Pavel Dovgalyuk <dovgaluk@ispras.ru>,
 Colin Xu <colin.xu@intel.com>, haxm-team@intel.com,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/20 7:19 AM, Claudio Fontana wrote:
> Motivation and higher level steps:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg04628.html
> 
> Current state is mostly all reviewed, but I include here a few resolutions
> of rebasing conflicts and a new patch to use current_machine instead of
> qdev_get_machine in softmmu context.
> 
> It's minor, but if additional reviewing is necessary, here is the whole series again.
> 
> CI is all green, and also available at https://github.com/hw-claudio/qemu.git "cpus-refactoring"
> 
> The following changes since commit 5a77bbb53b087f95dbba7ce30b02ac2d7b147a3a:
> 
>   iotests: Work around failing readlink -f (2020-09-15 18:19:26 +0200)
> 
> are available in the Git repository at:
> 
>   https://github.com/hw-claudio/qemu.git 
> 
> for you to fetch changes up to f9ec667595537400a6bc0aaf094a5ca6bbaacf44:
> 
>   accel/tcg: use current_machine as it is always set for softmmu (2020-09-15 18:19:27 +0200)

Queuing this to tcg-next, with Phil's suggested change to current_machine in
the final patch.


r~

