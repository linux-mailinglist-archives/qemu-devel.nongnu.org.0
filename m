Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEAD4090AB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:55:26 +0200 (CEST)
Received: from localhost ([::1]:46600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmQf-0006Dv-Fb
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPlUc-0000oj-0D
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:55:26 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:45864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPlUZ-0002to-Ev
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:55:24 -0400
Received: by mail-pg1-x533.google.com with SMTP id n18so9337624pgm.12
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 05:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZYjjxt4VZfr46jwX7N9gQvTuc48NIbD6+TT7vCgYoss=;
 b=WU/cSf0+Ulq6ic5DMYFSDzIkcCP9urGdxpF8arQggqZx2IM3E5A51IQpvBu/2RODW2
 PIsxicZuZwxsRL90NFYxSEbA8temlSyRhYcKaGfUWb2AGlp6ydHMmpEk7r9UHZkKPwxC
 PusNs4yQ/5aizjDhkM8NTBJqMPATULMl8h3CHv0aISGSOhG114EdWSICtdDq88Ex7ekj
 TK9pARMOF8zOS2FN7gXzSv+Ie1ExzL7qxWOaNHhBgw0QaGsmPvQTpTGkaQnGbsox0kF4
 Z4EWFd4FQmhYPY9ymwlQ4a6LkOP3mUut2y+8s0/F+J3L8P0GzSX3vjvbVprHBzS348bv
 40fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZYjjxt4VZfr46jwX7N9gQvTuc48NIbD6+TT7vCgYoss=;
 b=gqatZFGtHRpRWA59tQ8DdAkzPcdM+1k7DeZCLfpmbvCtgQ6FVNvN7kGveP2qVUvocS
 DEeWSJWFSPgnG7chkTU+2Ze1/nzbOeek8jfyU+gNlpIPrPnsj/W1VMemzc49FbmiLZqI
 HSB9JyNGINrOTrwuZWLY/eFKmy+/sweckWCUrxwUzQ4t/k9H8OZTC05PNhuh4Zkt5+qv
 sRbxu1jsLYY4XTz+te5Ofwt32KV3XAIefGGzhd7AOuR/Qhyl6B+Wc8fuzQlCZiNPrOad
 9CZc+4W2YFf89q7yNbjOeLhe+BWz19upVfYRQJFOxkK4poFBxl78RX/u2tR7KIzmjpw7
 gayQ==
X-Gm-Message-State: AOAM531jdJ+KVKVmHFk6goWJmMRtjyqTaLpz8UfPlYs2VdTPjKGrPEfM
 HST6baSxQMiUmX5b3ouKIPepjg==
X-Google-Smtp-Source: ABdhPJwjx8B57YGU5Kc3DBS0NB4vANh3YxK5XvOe6+8wGvHPSDVny2kqEsNKFYxQ+F0ermD57wOEtA==
X-Received: by 2002:a05:6a00:1a03:b0:414:5c97:777a with SMTP id
 g3-20020a056a001a0300b004145c97777amr11276437pfv.58.1631537719467; 
 Mon, 13 Sep 2021 05:55:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z33sm7743547pga.20.2021.09.13.05.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 05:55:19 -0700 (PDT)
Subject: Re: [PATCH] accel/tcg: assert insn_idx will always be valid before
 plugin_inject_cb
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210903145938.1321571-1-alex.bennee@linaro.org>
 <36bc7691-c0d9-9e18-dade-4d95405dcd62@linaro.org> <871r5swztj.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a925ce89-7134-c26a-c967-942f98b71a29@linaro.org>
Date: Mon, 13 Sep 2021 05:55:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <871r5swztj.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/13/21 3:06 AM, Alex Bennée wrote:
>> Also, existing strageness in insn_idx being incremented for non-insns?
> 
> It shouldn't be - it's just using the presence of the memory
> instrumentation as a proxy for the start of a instruction and dealing
> with the slightly different start of block boundary.
> 
>> Should it be named something else?  I haven't looked at how it's
>> really used in the end.
> 
> We need the insn idx to find the registered callbacks for a given
> instruction later. We could maybe embed a metadata TCGOp that could
> track this for us but that might make TCG a bit more confusing as it
> doesn't really need that information?

We have a metadata op for marking instruction boundaries already: INDEX_op_insn_start.


r~


