Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34621251EFF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 20:28:01 +0200 (CEST)
Received: from localhost ([::1]:40454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAdfs-0004Xs-Aj
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 14:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdd7-0002Ev-5z
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 14:25:09 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:39107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdd4-0007Ia-K8
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 14:25:08 -0400
Received: by mail-pj1-x1041.google.com with SMTP id j13so1657115pjd.4
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 11:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=2pg996UxnJwvHSI4cSWU3b6jP5lrCuCVV3lrz7uIv2I=;
 b=hEbchXKFcHvSIAD7/mivSGnYE/tJUnH/1citf2ZACpCySEMI2G4eauATTDpAkW8mFl
 fPROLvuixhLDBksYxxmgpdTAJ52K2vwYmHxYfE724heKUccVPd2iwcUGfjxyBVYWSCkf
 O8DJkCcgtb0EcqOxJtheP5HuUffm6o51kq+Y4ucsE+tA+h6gso1rVFk7MtB+f/9C/GDk
 m++DLYyONuZDekQC3b3Bg4ZM7PwOOc0cRq/u/8A9cHbuiCWLHb01V9xmbwAMAYLqDqVn
 SOsX7mHXNm8I6cPItUu7or33ulRdjTCARczKVXLIPt5x60E1wskys/b7REAT2Y4i8j+W
 nu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2pg996UxnJwvHSI4cSWU3b6jP5lrCuCVV3lrz7uIv2I=;
 b=dowZcUBax5Z2yRQWItYNrIL9vkHx8zRkoyq4EWJspvze5osjmGIIWgwZLckUJNbiQJ
 nA8ahYqyON9jsTFBccXBQ5gDDiTQc0HvGwe2qPtmrOgjNzJDwwdBWjEcpcSAJAOsuoPV
 EC7Gyi5vLlDrZ9HT3Zak97mMZgSEpkxg8lyuzIzCY/bXFITv4xJ44DnI6UNxgYAUI7sy
 /c9CQAhBFuNTxAB/AWMYDWEOfZ/Yo7Epcnl3ymbk4mYdKuT0PUT0yes1Wl7nhGEFRnSb
 o4ZNcY+ajLhLA6S15zR463v2hBlFGR0HRijKR1V5Eg4jticp5XQrVcNRYKLHmWHpPMIG
 WOng==
X-Gm-Message-State: AOAM532xuULn1xM8+HAR3nG4auxhHmv1s71Pg2ajKVxi/PsTIBHrrS9F
 dd+/6rwwFYELxXO3xTa9TAgbRlX/MDuNHw==
X-Google-Smtp-Source: ABdhPJyai/1JfVGt/kt0y9QiFiHBDfnyrKzG8uaZBGiScXgsupN4v03GeLqLtS15OHmF6Fjjwf9jMQ==
X-Received: by 2002:a17:90a:850b:: with SMTP id
 l11mr2517599pjn.25.1598379904894; 
 Tue, 25 Aug 2020 11:25:04 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id q34sm77449pgl.28.2020.08.25.11.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 11:25:04 -0700 (PDT)
Subject: Re: [PATCH 09/22] target/arm: Implement VFP fp16 for VMOV immediate
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <836670c7-f14c-30e4-6078-5d450e42b828@linaro.org>
Date: Tue, 25 Aug 2020 11:25:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142934.20850-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/20 7:29 AM, Peter Maydell wrote:
> Implement VFP fp16 support for the VMOV immediate insn.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/vfp.decode          |  2 ++
>  target/arm/translate-vfp.c.inc | 22 ++++++++++++++++++++++
>  2 files changed, 24 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

