Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097FC3B064C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 15:55:37 +0200 (CEST)
Received: from localhost ([::1]:60294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvgsJ-0002Mz-T0
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 09:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvgrX-0001fU-2v
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 09:54:47 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:44959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvgrU-00086I-7X
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 09:54:46 -0400
Received: by mail-pg1-x536.google.com with SMTP id t13so5350674pgu.11
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 06:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=lKPdHMELqW/KEowWo8nKD4yqCbXkzRSKuPY7QVYaR64=;
 b=stuLqtWQ3g9Nd8Ew99Hy/NTfV2BlBqprF8xcmcevUzSWTrm+2SdZ+P1K0U2xY/pY2H
 YIDKpgLRY1x6UrUAjZHHrH0rb59IvEWElQQqnGCHPsoj9tjxYZ0MT5r0RflCuF4jiAd7
 fVPdF5QdZJxexe86Fe6XarQKSTtZuoc+3Pot8OR0oX+45foQDUBXE+wvnFaNfGW6QHne
 x4vo5cXysorWKLRWs5E0g14fl3pL/Ey9FWRAi9e2/3jNU3XfUWCnez61GIgF7zLJlCjX
 /yghplf2GtJajMhPpp0me7xIq7x45q2zDeuZpz+gdtuqYyy1QfT0mc8Exj6ZZxz1BKvj
 hXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lKPdHMELqW/KEowWo8nKD4yqCbXkzRSKuPY7QVYaR64=;
 b=YDmhD7+SxcLqH1KP7IGEoLXFxu1mOiM1gThYazS7WtZ2sGF4endnxs+5qhJKUaM0mF
 2Q9NdXExnoysGweeTdyx7TMwLU4s1BKnNnRbhB+FQ5vkqwD0+/F1MK+8SWWolaCbY7uO
 W3OBsb4VvY/P9yCtMnCQjxZonTPzwoLu4tXgSwtKdIUb71c7WjPfL0CaT6M1YB3xBTl5
 4gUv0OzJIjmYMQbSehNZDPGWx8ceRxTUffmHStDPwLf+3UeyehmQRZlM7AOHY1tfRZzy
 EnAVuN+IbUrOeD4uDtKVwSl5FS+6nppYmLq2bnepN6H0Ock0H1JBkKuRIE5OIkLXx+4P
 HDVg==
X-Gm-Message-State: AOAM531TB4+5oDvZDRtbBXDD6YEweO6x53k4g9beH7Zlq7jz9QpZIkwD
 icG773w2wZJi/px2WgovevUsBfGWQXskqg==
X-Google-Smtp-Source: ABdhPJwyHxJZEBI5n/gyPmZNQiZwTEt76EPlh1xshDIaGFjTuCLoxS1IPkpBwzwCV7VkACy4SLzSOw==
X-Received: by 2002:a63:1b54:: with SMTP id b20mr3891858pgm.151.1624370082601; 
 Tue, 22 Jun 2021 06:54:42 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j13sm7021216pfh.145.2021.06.22.06.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 06:54:42 -0700 (PDT)
Subject: Re: [PATCH 13/28] tcg/mips: Support bswap flags in tcg_out_bswap16
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-14-richard.henderson@linaro.org>
 <a6a30b81-6ff5-fbab-46ef-961054f8d667@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1f6ad501-16be-475c-15d8-2e095d8d3c83@linaro.org>
Date: Tue, 22 Jun 2021 06:54:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a6a30b81-6ff5-fbab-46ef-961054f8d667@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 11:36 PM, Philippe Mathieu-Daudé wrote:
>                                                          /* src = abcd
> efgh */
>      if (use_mips32r2_instructions) {
>          tcg_out_opc_reg(s, OPC_WSBH, ret, 0, arg);      /* ret = cdab
> ghef */

badc -- bytes swapped in halfwords.  Also, this is a 32-bit insn, so 4 bytes is sufficient.

>          if (flags & TCG_BSWAP_OS) {
>              tcg_out_opc_reg(s, OPC_SEH, ret, 0, ret);   /* ret = ssss
> ghef */

(ssss)ssdc

Again, 32-bit insn, but implicitly sign-extending to 64-bits as per standard mips convention.

>          } else if ((flags & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) ==
> TCG_BSWAP_OZ) {
>              tcg_out_opc_imm(s, OPC_ANDI, ret, ret, 0xffff);
>                                                          /* ret = 0000
> ghef */

(0000)00dc.

>      tcg_out_opc_sa(s, OPC_SRL, TCG_TMP0, arg, 8);       /* t0  = ssab
> cdef */
>      if (!(flags & TCG_BSWAP_IZ)) {                      /* t0  = 0000
> 00ef */
>          tcg_out_opc_imm(s, OPC_ANDI, TCG_TMP0, TCG_TMP0, 0x00ff);
>      }
>      if (flags & TCG_BSWAP_OS) {
>          tcg_out_opc_sa(s, OPC_SLL, ret, arg, 24);       /* ret = gh..
> .... */
>          tcg_out_opc_sa(s, OPC_SRA, ret, ret, 16);       /* ret = ssss
> gh.. */
>      } else {
>          tcg_out_opc_sa(s, OPC_SLL, ret, arg, 8);        /* ret = cdef
> gh.. */
>          if (flags & TCG_BSWAP_OZ) {                     /* ret = 0000
> gh.. */
>              tcg_out_opc_imm(s, OPC_ANDI, ret, ret, 0xff00);
>          }
>      }
>      tcg_out_opc_reg(s, OPC_OR, ret, ret, TCG_TMP0); /* OZ: ret = 0000
> ghef */
>                                                      /* OS: ret = ssss
> ghef */

Something like that, yes.  I'll fix it up.


r~

