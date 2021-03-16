Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BB233E23F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:39:50 +0100 (CET)
Received: from localhost ([::1]:41472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMJHx-00039v-NF
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJ9p-0002jf-C0
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:31:26 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJ9n-0007Of-QI
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:31:25 -0400
Received: by mail-wm1-x329.google.com with SMTP id p19so444876wmq.1
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 16:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G8XQmFINXjY+Rf09bPwsimI/ESsroTxnO6BJnDShlZo=;
 b=NgzJAt9xYfVRxzS/LcbnzmzYA2k6q/8lphZfuzGkymc/j7Qncv3BmBxCCPlQx6p1/x
 NbfaVn0LP1DaYCrvrwVLQ6AQ/LTkvVPCaJM5B1BRn9PjsYNGuWMXen/LAfIg/tvGuE8O
 IeWTHurSqv+oLn5unCqioIkI8JOKLt3yMUIpBDAhLUwLYRImK/p+oDhRWoy99f/2r8Gv
 zPPFwFg3n29TkTgnz4QuidoZMFtOouizlEQWoNwFp9W0l1AHYzZplbXv3to9OzgGUir7
 kvi4/uCLocGT071Metxqb91VQLd1mp6ydp7mtnRIQWTHmoFMEqfrF3Lz82a7nnWsYGn1
 +f9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G8XQmFINXjY+Rf09bPwsimI/ESsroTxnO6BJnDShlZo=;
 b=j8zgIRxFQxv/7cyHE0XYMBbnr3lsvQr+VBAOMPrmIQH5LzJ6bevtVz4VUoeJpMYKfn
 accmLnWqu05RthQxSSEWqhsGEUP/PN3MShO3zXS/qJ3Cp3HfZXBLz1/FguSeiE4X148X
 6+cAkiJXmlOvCGcitSU+cJTWE1XfrIgnYjLPOm27+YJrNZNkKdcq7Gu4NEIQ3E7v9eWN
 OHtZlfMPdjK/Ow7zQ3RVUZBSQnBkKFSDLF11dIl577kxxh0tqWDM5959oWoJUjI++vAj
 s028QCbdN06ntD0TlYRWNVqL6IHk5WKWnUZ+7O5b9upF0GXfHMxCSk5WnHz9MuZEUgPA
 JTOw==
X-Gm-Message-State: AOAM531wz9v6aEGMjGXB3dapLiKTTrcJbLOzhfgz+wF0HpWv2Px4Xg4K
 gYjoN/Fdmd3HBOyr0EX9FndHw+zwJumrSA==
X-Google-Smtp-Source: ABdhPJxKy/nA46r9G0jU3XCgHGFQHmJLDbGYWqPr7teUrYkSxYys73zfiZkgnxcqLAfisPUU53Zdug==
X-Received: by 2002:a1c:de05:: with SMTP id v5mr996398wmg.25.1615937482428;
 Tue, 16 Mar 2021 16:31:22 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j6sm694842wmq.16.2021.03.16.16.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 16:31:21 -0700 (PDT)
Subject: Re: [PATCH v5 37/57] tcg/tci: Split out tcg_out_op_rrrr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-38-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <73d7f8dc-2543-eaa7-d727-56b8482dca3e@amsat.org>
Date: Wed, 17 Mar 2021 00:31:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-38-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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
>  tcg/tci/tcg-target.c.inc | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

