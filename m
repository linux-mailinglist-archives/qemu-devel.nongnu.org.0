Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9222D4652
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 17:06:46 +0100 (CET)
Received: from localhost ([::1]:38276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn1zJ-0000c3-9Y
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 11:06:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn1wQ-0007vX-LF
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:03:46 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn1wI-0004mB-9J
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:03:45 -0500
Received: by mail-ot1-x341.google.com with SMTP id b18so1839814ots.0
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 08:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xrrXmL6DhBPWYqcqCoOLGGRbhRQf0Nz0mTDUdbUup/A=;
 b=nqQuDA8A42ndkgiXaJDmbrIeVs6E9xErZ2NSbFehAMAYJth9MK+sKqF76ojxgYsezW
 5kJMJoAqUkSxyIEuQZSa2YpG3cAEVJAc/8zOK1JLc0Jv8Ju0BTCnBr5MEghVjsbTTnsH
 E1n/BOIq4Txkdr0yxME+b4VoPvxW++yQvLS3mjiir6poq9mlzwYmHAt9NnT+89BGKAhZ
 JGd2nKJwsxtwO2QIz5+pTRWxPCHvPTHSbD1m4YQFUPNKeH6jH/lOPDycUzrzapFPmkhj
 G3kggpS0NQ0DIA0hC89maxJtvgWluCQaQ6RWJsh5e/bXnKe/cr5qx68fpgxrqo/G9M04
 UfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xrrXmL6DhBPWYqcqCoOLGGRbhRQf0Nz0mTDUdbUup/A=;
 b=YdS4Ov0lBQ/h1mCUGlDObnrptz0Z5w+4x75b3tRiJatz1s/oulBELUg3vN9nz8M0Xf
 noOiTnhWNbrUHrnMWznBpKaHzGs1+ez/GnCksOIlOLx9+3QQvnacQ93mhm1SrB15t64i
 Fkf8pmZA4BNWLhr2XpLdzaQLe5wz1tk7IJGdJfwI0q4GIlJwivuKxmL4vzQ77oJCuOtT
 50gO94y0XRhU6RwJCS+dtPmQeWxm5G0dPkGbPaLjqtUht0iVc/LMB/tNeYaclMy0nsN1
 VtRtE0DmpXx88o/XceVUeeL7wBXeKzFdsAoux2N06DBO93notrSAihMyTsxtfxMpmXu6
 UTrQ==
X-Gm-Message-State: AOAM532dVEdM8L+qRVHYyZeDddGdCUOiPVOJB7oa3F+03UtS+NzfRmsq
 fLfWPVbGo+BBqYWJlKyjAFWZAQ==
X-Google-Smtp-Source: ABdhPJxEVmsHLUWqjftT2I5sV8Lv1ClMnHJ90mVBZXjg4/gwSrxT2xSTjethzN3+pBABzWpBeeGnPA==
X-Received: by 2002:a05:6830:1352:: with SMTP id
 r18mr2269045otq.73.1607529815572; 
 Wed, 09 Dec 2020 08:03:35 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id h7sm463602otq.21.2020.12.09.08.03.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 08:03:34 -0800 (PST)
Subject: Re: [PATCH v2 12/15] target/riscv: cpu: Remove compile time XLEN
 checks
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1607467819.git.alistair.francis@wdc.com>
 <eb21fe949282cdc06e07fa7347eb5e4f26b08eb4.1607467819.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3b79ced8-09ec-19f9-48ed-80183c43c9ac@linaro.org>
Date: Wed, 9 Dec 2020 10:03:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <eb21fe949282cdc06e07fa7347eb5e4f26b08eb4.1607467819.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 4:56 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bin.meng@windriver.com>
> ---
>  target/riscv/cpu.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

