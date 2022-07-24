Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AFE57F74B
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 00:12:25 +0200 (CEST)
Received: from localhost ([::1]:44168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFjpn-0003qL-9q
	for lists+qemu-devel@lfdr.de; Sun, 24 Jul 2022 18:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFjoB-0002On-DQ
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 18:10:43 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:54824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFjo9-00030Q-Mj
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 18:10:43 -0400
Received: by mail-pj1-x1033.google.com with SMTP id y1so603824pja.4
 for <qemu-devel@nongnu.org>; Sun, 24 Jul 2022 15:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zPk/CEZKxeIDyBsl13PQ161CL0NMTi0PJlA+TAM8IOk=;
 b=TOm7WcGap4uK97LpO9QcJVfCt2hyeCoqBmxFQI1JC2rmzW0s7b+0z44Aoao9t06gwH
 RVlPOUlzOgIeLQGtkI8xTD3qTfAbIOLE3HnkEBBL6PUn2a2rF4oi5JF+xBQu8PQJ4QE+
 CrjGdU522xPz1N+pj76EkDKwfj7m5RBTf+TRkU2dD5HEe+c+K+RDfjp9Gajgp5is0TiY
 iSXsMEY9/GQdtI9NrxHUrGE4OvZPFA5nADRXEp831CHr0MK96uuTmiQUaG2P0QtlGCfg
 YEzxwFtU4wm5tLikU8bQQHRNjl0JgoR8bSumgYZKA9xwMdILRfSKlUDxFe6tlr7lSWqZ
 Kg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zPk/CEZKxeIDyBsl13PQ161CL0NMTi0PJlA+TAM8IOk=;
 b=Ti1bOEai8Gr74FoXlCcsjGfqOm/S5dGzM6zDKMBzLRcjLRGApfxyyxbIf6K/drVuTk
 EH2ODUGB8cfANx1u2uu75kd27pmwA63+7YgJChrdyI2WJYaIibEAYR5mxxDfK7gFpYDn
 T5QD3c0VYM4ou8+yqUhXqIR5hdyFYxBzLYz6E8r05/AwT0hxn6ly585ko43Wh8Tbp2YB
 E8vweorrNf+Pi+eF/0zUkY4KABXnDW72coN3slOderdwES6j2mksqFYRcdo+yDjlPe7r
 SLH30BRK6+RrWbePDw6Ew5bWCXKMk+8SxBt3PkiIwpjNmfy30r3EvO6k9Sz3tXeBu4H3
 XSCw==
X-Gm-Message-State: AJIora+Zz8v67pO0vgK+EjzxMFxpckVm/n65isJifv9fqqH9MX4fZTjk
 aNwCEeNL4N/HCnkaxv7gyAdUhw==
X-Google-Smtp-Source: AGRyM1sm/YbV8ZeR5xkuckDleF3XRkqAQegqV2C8kNM27RfHWFGVZF6lSZ/QDUZ29HLV2fBjHUeWGw==
X-Received: by 2002:a17:90b:4c92:b0:1f0:1657:fd9c with SMTP id
 my18-20020a17090b4c9200b001f01657fd9cmr11372130pjb.230.1658700639993; 
 Sun, 24 Jul 2022 15:10:39 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:ef1e:c8e:be06:74d0?
 ([2602:ae:1549:801:ef1e:c8e:be06:74d0])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a170902e89100b0016d02acb57fsm7691880plg.217.2022.07.24.15.10.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 15:10:39 -0700 (PDT)
Message-ID: <c0f32ff4-aa40-619c-8b03-d966530d5fac@linaro.org>
Date: Sun, 24 Jul 2022 15:10:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/ppc: fix unreachable code in do_ldst_quad()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
References: <20220720135723.1391598-1-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220720135723.1391598-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 7/20/22 19:27, Daniel Henrique Barboza wrote:
> Coverity reports that commit fc34e81acd51 ("target/ppc: add macros to
> check privilege level") turned the following code unreachable:
> 
> if (!prefixed && !(ctx->insns_flags2 & PPC2_LSQ_ISA207)) {
>      /* lq and stq were privileged prior to V. 2.07 */
>      REQUIRE_SV(ctx);
> 
>>>>      CID 1490757:  Control flow issues  (UNREACHABLE)
>>>>      This code cannot be reached: "if (ctx->le_mode) {
>      if (ctx->le_mode) {
>          gen_align_no_le(ctx);
>          return true;
>      }
> }
> 
> This happens because the macro REQUIRE_SV(), in CONFIG_USER_MODE, will
> always result in a 'return true' statement.

I think adding ifdefs isn't fantastic.  This isn't actually fix a bug, so we *could* just 
mark this as ignore in Coverity.

If you wanted to clean this up, remove the implicit control flow from REQUIRE_* and turn 
the macros into pure predicates, so that you get

     if (REQUIRE_SV(ctx)) {
         return true;
     }
     if (ctx->le_mode) {
         ...
     }


r~

