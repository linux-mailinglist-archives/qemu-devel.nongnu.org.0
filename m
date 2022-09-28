Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D043D5EE9D3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 01:03:30 +0200 (CEST)
Received: from localhost ([::1]:48998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odg5R-0007FO-C6
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 19:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odg1h-0004J7-0H
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 18:59:37 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:46698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odg1f-0005hO-8Z
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 18:59:36 -0400
Received: by mail-pl1-x62f.google.com with SMTP id jm5so12914308plb.13
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 15:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=LzVePVDEl8c+LsBgLZilGz7iWS885W7cGCNmVCz8Pf8=;
 b=lTGEavN9/0fK+xk3P0QsmRxxqn1/9TBdkZ6kRdHOvR+8V3u1lcPx+vdvRku6bVin9T
 UEVMhGSahfeoq7GPVLzvqlgtT4ItS5lrtmj3xKPL1/DeXDH5jVObeVwhc9P0L5Mv4eeh
 xuliwszuyYojSRgSFrIZj96AgNZSGUcyQAacdASO5zK67JBzJ/VA54dBUnyTHh+rbku1
 h8rhFj98o0wCszuS2OMCR4VkoO3VNiq4vAf99loPJHvKlqhnv0yR3rgqNYfKJ7IFOrv2
 7sNnGQ1CbYHO4t06yvKIeCY5eKoAPxqgCytmmD1dwqj/yquWiJXTY9SLW2aagDyadb0u
 pG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=LzVePVDEl8c+LsBgLZilGz7iWS885W7cGCNmVCz8Pf8=;
 b=iKvJp8t4UOG3XH/k5LTWoQGbHIErMxteddziHBvOIImV9zuIpsTZxe5xTg7o25ILYp
 T4X0UtYKIJllvi0fvLce1Ak06/r0P1bdUdoYR3KIrTA4A72gwLiCmtcM/85YnCYA3I9i
 wC7YiIJYFsNz6jlYW+zdrpUxuqVpKWsGHm93AeUvgWpp8BTt8PWX0CBrb+4skX/w8zS1
 5SPKwi9vfBkFUJQDdI96e3/qeIrEy+Vz5jVxzHibGyamMgRc1OKWnGO0Mfqp9zPAOsNp
 jaiky63Yn7wsiXvf/jkkQxENf/JiAWb30xjzk0y/Ki5Piw6eYU2TzlcU7uWmairvRwCm
 +qJA==
X-Gm-Message-State: ACrzQf1EV3/rbR0nTDe86y9C26CzQZW29hcIZ/+DYdwh1BSBoyw+1HSp
 9vogkk3AxJoOql/DghuqJXomOQ==
X-Google-Smtp-Source: AMsMyM7FExEKt6UEgIyyDXVJSddWODX8uyXUwvnsCm/qSHPLrlPBXrY3OphWvWStwpPTiiChUucrSA==
X-Received: by 2002:a17:902:7294:b0:178:a2be:ac18 with SMTP id
 d20-20020a170902729400b00178a2beac18mr286292pll.93.1664405973611; 
 Wed, 28 Sep 2022 15:59:33 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a62cd0d000000b0053e439c08c1sm4617735pfg.74.2022.09.28.15.59.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 15:59:32 -0700 (PDT)
Message-ID: <663a457d-d789-350b-7730-547a87cc1cf8@linaro.org>
Date: Wed, 28 Sep 2022 15:59:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 09/10] contrib/plugins: reset skip when matching in
 execlog
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Alexandre Iooss <erdnaxe@crans.org>
References: <20220921160801.1490125-1-alex.bennee@linaro.org>
 <20220921160801.1490125-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220921160801.1490125-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/21/22 09:08, Alex Bennée wrote:
> The purpose of the matches was to only track the execution of
> instructions we care about. Without resetting skip to the value at the
> start of the block we end up dumping all instructions after the match
> with the consequent load on the instrumentation.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Alexandre Iooss <erdnaxe@crans.org>
> ---
>   contrib/plugins/execlog.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
> index e659ac9cbb..b5360f2c8e 100644
> --- a/contrib/plugins/execlog.c
> +++ b/contrib/plugins/execlog.c
> @@ -147,6 +147,9 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
>               /* Register callback on instruction */
>               qemu_plugin_register_vcpu_insn_exec_cb(insn, vcpu_insn_exec,
>                                                      QEMU_PLUGIN_CB_NO_REGS, output);
> +
> +            /* reset skip */
> +            skip = (imatches || amatches) ? true : false;

Drop the redundant ?:.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

