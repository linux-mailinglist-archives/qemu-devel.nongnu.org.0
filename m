Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7670433E1BF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:54:08 +0100 (CET)
Received: from localhost ([::1]:46874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMIZj-0002lh-II
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIYr-0002LO-KD
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:53:13 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIYq-0006y7-8H
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:53:13 -0400
Received: by mail-wr1-x436.google.com with SMTP id a18so11298357wrc.13
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 15:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3e0R+siF4ZkudQr1iFVsx9qqDdA5GsU5RscHGJUV0rc=;
 b=VurQJVw4yXGl8Qz6+Uy7PyiwM/oXVg/fN5k4bj3OZxdHXSmdpn6My20LGd0W1jkzNF
 I5cfXrge4K/4aGVJpDxoaPo9ICbOjs/WddBUflw0V4DM9fMeBC0/CQ9OgGjpIGfnIPkQ
 1p4C/VJ8AvwImlgPCHN6XlgQhDTae18b/Peq23TbpQZH+XhNjRsWOwbutDU+bUV8UXPe
 UZbEGAztU+Zc20zAubxO7tBcrqacY8A9BCR33NPx9pjp65U9/30sYr/4yRlpyCHZcS4H
 2V5S0dd2vwWuNCJ9rlPYC/X0NndGZsbv51I0LsDKMkeKZruPKLKP6JkbgibsoCcXQCll
 Mp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3e0R+siF4ZkudQr1iFVsx9qqDdA5GsU5RscHGJUV0rc=;
 b=kcT/OGyfw+y86EVsTkdTTlHhmO+/B5fW5FIvANMAXJi0zp+0VX1D71jmyLq2/BRb2r
 SVyUmvnhZBzZl60PVi+40ubd2fhFzdnC+hQbxS5p2wDcSQmUzljtRJSBbd9jt8PTPweZ
 B+e2uwgOeFxKxe6ftstX33YXEJLZ6Sp8n++QqRDvRqlVKSQCJHCQEBm5CWFgjpbC010g
 Wk3OLcWiGCg79Jtkm63AYUTrwjEaTxBptf2ewOMgqWcMrFWMBriFr9OxPaEBeqm3JBtf
 SrnPGIoR5KBqYFfjoz7owjsbazTGNh08nREosM8JTFRPwTrgglxqww9zog5tT90FOuAq
 diDA==
X-Gm-Message-State: AOAM533Mfn9mcpvWdGlFgNEP0nOoA7Y5mGMLObrGEm1KV+pElUtWv3Km
 pw7SwWJFoD/Od0j0Vl84KKk=
X-Google-Smtp-Source: ABdhPJzplALG7oBSsoY3nGrgdaRIFw05pSgNUJe3djNoPl74vw+03G/qwbeCNUimo3WFL1nQl/fdwA==
X-Received: by 2002:a5d:4cc7:: with SMTP id c7mr1304420wrt.164.1615935190965; 
 Tue, 16 Mar 2021 15:53:10 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u63sm675399wmg.24.2021.03.16.15.53.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 15:53:10 -0700 (PDT)
Subject: Re: [PATCH v5 05/57] tcg/tci: Split out tci_args_rrr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <977a40d4-b874-0fef-be5b-3e0b86cbd843@amsat.org>
Date: Tue, 16 Mar 2021 23:53:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
>  tcg/tci.c | 154 ++++++++++++++++++++----------------------------------
>  1 file changed, 57 insertions(+), 97 deletions(-)

Out of curiosity, did you do that manually or coccinelle?

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

