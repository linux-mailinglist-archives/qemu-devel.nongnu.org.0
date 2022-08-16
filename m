Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0983D596276
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 20:27:46 +0200 (CEST)
Received: from localhost ([::1]:49610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO1I0-0007Ri-JQ
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 14:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO1FV-00054T-14
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 14:25:09 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:41593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO1FT-0001j8-Aa
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 14:25:08 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 bk13-20020a056830368d00b0063723999f31so7956939otb.8
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 11:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=74duGn8GkG+ZaK6L4/Wg4i1OHu+9n698g7vFMLHuRxU=;
 b=k5TYDpl6vpd++Re2KvtkgyIjOExU4qqLTkBMbntU5iDuKyS6ngYk2RKZJUMtIrx1OO
 YT5bH5PGiZWRBFlDdJojfsyDZ2t4SUYHepfg7TL1NXy5T2ufgTuIiHIwI1xTAmTquONK
 ePkVvKUkk4qQVsGMKL6I+LPloZIqR7c/rMSTkMiX2dQTzz2/am9UxlSn/ew8XXWd9Faz
 tnt51gJ1ZC0ScemdEo/MAVBWIxbzy5BbxT/nms5gf74h6MjsNPZt/KhChRlX2Aspo51J
 Q73mtTdKNkRl6oTgDTYV8FEhXSPMgdk8QPlQ1IiSNGusdNVFOXTImidm/zof6pATWh/f
 c5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=74duGn8GkG+ZaK6L4/Wg4i1OHu+9n698g7vFMLHuRxU=;
 b=6X3xowYQHbz/7ZrsMrKrTalSW/fIaoD4WUzINDyeSO7lPM5XXNxfq4CxKOLMXoNzjN
 n/Q8/V0kfKesnU+SIapjJUUOJfChJ73LtlwKxhHplTT7vfzvuStO6dJ7DW0EqrL4dlUb
 rp2PFPjTzlL0IWUaqlyDqBkl94Yjsij+FBCKAkhzWxJb+FrNaUP6SGGjUfRy8KSpSE1j
 MQHxpUxujXfE4jTeSzAxbs7FvRUet2VTLobtvdlO6q29Jf7egegylobIOPLgKICpG7oG
 Ossfy2fPE4V0PfryAK/DS+G8o/Rc58xdk+Qq94fry+pBhzCEeZLy4n/srKclJlxvlUC7
 9VWA==
X-Gm-Message-State: ACgBeo1nbpyFTOCTELGksHOJrOYBu0/U+atokgEZxQd/4Ey4Dk8xGJU0
 p1x4afplpTfdTdHrhhDoWmprrA==
X-Google-Smtp-Source: AA6agR5TvFn61R/sNWPHFjAZqbIG+peg5a9sxKBsbZre/2XGDjI7aue40sHLRAicsP/yIKH10JpCrQ==
X-Received: by 2002:a05:6830:2325:b0:638:9962:8cb7 with SMTP id
 q5-20020a056830232500b0063899628cb7mr4720167otg.67.1660674305902; 
 Tue, 16 Aug 2022 11:25:05 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80f1:2110:a4dd:9176:6d98:8dab?
 ([2605:ef80:80f1:2110:a4dd:9176:6d98:8dab])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a056870558100b0010c3655967csm2179940oao.40.2022.08.16.11.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 11:25:05 -0700 (PDT)
Message-ID: <25bf7686-f9a3-543e-f2ea-d75e4751d8a6@linaro.org>
Date: Tue, 16 Aug 2022 13:25:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/2] Two small fixes for QEMU 7.1-rc3
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220816095849.211139-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220816095849.211139-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/16/22 04:58, Thomas Huth wrote:
>   Hi Richard!
> 
> Two minor fixes for rc3. If this is too late for rc3, please feel free
> to ignore, I think they are not severe enough to justify an rc4 later.
> 
> The following changes since commit d102b8162a1e5fe8288d4d5c01801ce6536ac2d1:
> 
>    Merge tag 'pull-la-20220814' of https://gitlab.com/rth7680/qemu into staging (2022-08-14 08:48:11 -0500)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git tags/pull-request-2022-08-16
> 
> for you to fetch changes up to effaf5a240e03020f4ae953e10b764622c3e87cc:
> 
>    hw/usb/hcd-xhci: Fix unbounded loop in xhci_ring_chain_length() (CVE-2020-14394) (2022-08-16 11:37:19 +0200)
> 
> ----------------------------------------------------------------
> * Fix a possible endless loop in USB XHCI code
> * Minor fixes for the new readconfig test

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Daniel P. Berrangé (1):
>        tests/qtest: misc tweaks to readconfig
> 
> Thomas Huth (1):
>        hw/usb/hcd-xhci: Fix unbounded loop in xhci_ring_chain_length() (CVE-2020-14394)
> 
>   hw/usb/hcd-xhci.c             | 23 +++++++++++++++++++----
>   tests/qtest/readconfig-test.c | 12 ++++++------
>   2 files changed, 25 insertions(+), 10 deletions(-)
> 


