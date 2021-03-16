Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4E933E202
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:20:25 +0100 (CET)
Received: from localhost ([::1]:58394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMIzA-000311-Sy
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIxH-0001MM-2H
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:18:27 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIxF-0001Ml-Ll
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:18:26 -0400
Received: by mail-wr1-x434.google.com with SMTP id b9so8292730wrt.8
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 16:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p2+vNCaSzsq2H8mztn37s58Kmy/CVh8wxYY0yuCy42Y=;
 b=aFwW78Cs8WKDi8PkmOBPbC+HrzoxFd2zVpHEDOrdLtZAWrchP2grCOsZGuBrPAq5UT
 y6KV7DAIPZXLzLv7w7v22UvvQM3EkNMVym/kJT3F2QWD0pbjoQL85ZIqGj2ufNOMy8Mw
 G9Dqxi2mg5v8JZtF5B5oRrGMBenIuOXwBBcNMKIy39+ejbZBErNdqTfQtRqmHNR9FtB1
 to7xN8gJSFVHOKoCATqOroMoPU5DmjJj0TsHeiyK126O/u8mzG92jc2aiPyYU3gLr/4P
 vEX8T0O5Gp8S300EZp/J8cQX3CBrhu3Wnvj/HrKxv2LeftDgp+wOSgyk1CmUNe3hAOtU
 ugnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p2+vNCaSzsq2H8mztn37s58Kmy/CVh8wxYY0yuCy42Y=;
 b=Grw0MhpBh1l8WqgrMKyVzxtkJiNqoyGYB2u/H1A7fsyRqUfuGezWr7lqlcmKD/O5Za
 Q4Prh9i+dUoONIVo+nAt4y6AWqdPHYj4uqBd4pWWF+XkLpWRoFVyN+n3DA7iY6W4dUPG
 UH084MaX2AiUavOsLHvxbk/lGXG8AgpvjhMYJ88XpfxbRuE1Tjsol+eAWAlQ22X2dHhD
 uWXXBrmKxA8WU0A5+Yuwxj5cFMiFIGgFfHYVMOCdl/fiHBUeeBKM/f3z1+0nGE/QtEp+
 JRonLH6MT/NCG+sd8git3tE9PeytSURUyv+jXQcdTteg/OLZmHgRdi8UFD8bMMqCIOJO
 3rxA==
X-Gm-Message-State: AOAM530WYKDJB2TLpGM+ZwfYOpqQHTLV6A/NDfDJWyqlDNgh+tLH2/B/
 RUTBCOdytH1HqgCDFkOn8Hw=
X-Google-Smtp-Source: ABdhPJx4adDIPWh4fiMJIq+fh944dJMnUiUFttZAyYk2CTUzLLzXuAMN/Ik9ziIrqX0TjX/8n1dOsA==
X-Received: by 2002:a5d:534b:: with SMTP id t11mr1317535wrv.186.1615936704470; 
 Tue, 16 Mar 2021 16:18:24 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c26sm24783064wrb.87.2021.03.16.16.18.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 16:18:23 -0700 (PDT)
Subject: Re: [PATCH v5 29/57] tcg/tci: Split out tcg_out_op_p
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-30-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <644559cd-0c65-98bc-a9e4-647fa14d32c6@amsat.org>
Date: Wed, 17 Mar 2021 00:18:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-30-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 3:39 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.c.inc | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

