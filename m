Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0235A2B0A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:23:25 +0200 (CEST)
Received: from localhost ([::1]:55812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbB5-0001C0-Q4
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRb1f-00087s-60
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 11:13:39 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:39544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRb1b-0005Rs-9L
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 11:13:36 -0400
Received: by mail-pf1-x435.google.com with SMTP id t129so1821059pfb.6
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 08:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=EDWV/SDQrb0vKblmc0LmmET27hBi44mJvMWfHIBFEyc=;
 b=ad00GW8HXO2ej0xgZNgHkR7UsnoSS8gsj7vimESvXPmTm5A8Smv2+ChkO/nXo9xx9Z
 XWBVZta6TQvLzpBjLHLJKSDi8LNqzxgzbPPBou23zx896MMGq/OQlxAsg3tbneJafeXf
 rRZpNIYOnmvkJldKXJa7YvZ8j/OQ8nW4Yj/ySigB+ybiqshuhyWqPc/9P57C5tubawog
 hSysxevtrqx6pY6Z2Cxu6N5RbjIMhs/0U0TFTRLyDiYFvlI4PKHrzdr+f6enyRxw/mFo
 IiDdp8GvEsJAAHKAf1+u8R0ISRtWkl8XFWWLhUqhg+To0dyJfSHbLh+AjzDqEFCub431
 SX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=EDWV/SDQrb0vKblmc0LmmET27hBi44mJvMWfHIBFEyc=;
 b=ZTrgaM+tfXNTzQe7rb0TvNkoYsYDLV2X4WEucHS5jDrfSAVz0TRsz4fA9RGauUsGeX
 2QNcUQ68S7Guf+L0qqc2BFlHBdZ8rQFZSlwBIJidhS1SyksZBeMJzsBU5mXnHJK3teX1
 qPfQZI54bWN8v7J7mKTcCSmaqoLwR+J0exqZyDvPG1CwSPh2lDUtXUaPKPReE7Oe+JXl
 RELF1b91/Xt9YzfWXBJsNzgHIVjKvltki6YOMy4GcRClhLTJdcb6eeVQ6yGJy91poRrr
 gZ8WG4PpOk4xb2Z/rqiUW3fmWsFhR2JsxDWyF7qajenWh4lU7hWOeLKsy++tHm2+E7b/
 qe6Q==
X-Gm-Message-State: ACgBeo3KhzMKoYVZhcPl2u+vbIqZO6C6dFoUqmkzdMAf6aVdCgdDmf42
 WamQWKWkq0KZ9QsBjuh3OO5nQQ==
X-Google-Smtp-Source: AA6agR5s+DKpsLokrOn4rVLjsZbFp/iSIGnMKB1Ykg2Trr83P8p7yfb7qp796SUdApbgOtNGfEcOLg==
X-Received: by 2002:aa7:9692:0:b0:537:2562:85ff with SMTP id
 f18-20020aa79692000000b00537256285ffmr4273343pfk.35.1661526813912; 
 Fri, 26 Aug 2022 08:13:33 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f?
 ([2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b0016dafeda062sm927937plg.232.2022.08.26.08.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 08:13:33 -0700 (PDT)
Message-ID: <1bc23874-9ba5-52a9-e05b-b9773c171067@linaro.org>
Date: Fri, 26 Aug 2022 08:13:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 01/13] linux-user: Add missing signals in strace output
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
References: <20220826141853.419564-1-deller@gmx.de>
 <20220826141853.419564-2-deller@gmx.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220826141853.419564-2-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

On 8/26/22 07:18, Helge Deller wrote:
> +static const char *target_signal_to_host_signal_table[_NSIG] = {

(1) static const char * const
(2) target_signal_name -- there's no "host" about this.


r~

