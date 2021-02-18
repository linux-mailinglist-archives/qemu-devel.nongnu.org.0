Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B57C31F0D9
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 21:13:40 +0100 (CET)
Received: from localhost ([::1]:35300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCpgB-0001wf-Gm
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 15:13:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCpS6-0007Em-DM
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:59:06 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCpS4-0000iJ-Oq
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:59:06 -0500
Received: by mail-wr1-x42e.google.com with SMTP id a4so2085105wro.8
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 11:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ReaXyCDsLFklAVTzRUTxvU+uhu3sfzVmraPfUaFcI98=;
 b=Q69o6asNyQZpeUnWaL6hE6oOc/y+DESEdFygYb1YFQWGNOezqXoWTj7gaMwRykjSpO
 00xE+hbMUtCZT9uQZwngg9pqrgyMWIJDyHt1xY01YqV1LepxTHZkI189l4PxImLFyGAX
 OR8L79QN+NPWXb2DT5yxFS/0kbI9vXWNd+j7anK7VVxllBjzGm+jhrJj+otFqHnqy/TU
 soUT2dx+bMyW1doBnY0izEpM5hMOloFUpMuScJPgrZ8WdNZatjO7Ex8qLIoR3M1msn51
 5qHOdFbk3xYOomh8p/3KZjCc59dpSsVGSmZhDPAOWoiHd5RvinOxCLeq3fmpMIygSftO
 OwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ReaXyCDsLFklAVTzRUTxvU+uhu3sfzVmraPfUaFcI98=;
 b=Lm9N8nmPI3SdWAXSLu1n8Q7KGjxpw+GDW6Ys8tf1yGCnW9Mob1M8NcERVD5VJEvNxY
 8iuj6MpN6AQPM8rniE64L7khCKr0Drdfwtd3RPa3mfkR6AFVAQ6O2jI1hAB469OYZTVv
 wZhXfC2cBg8seSuIymhxraQnqmvuXLOQ+nBhR8m6ibZXXLPyqlV4C/MWCTUhbeVNjL0v
 wvbkFQ9LJeHJ9zZL3Sw0UNrhfCcgCkJBbWwvaWyyV8S9avFz4YNJWTLuBwsCzqZIa4OG
 4n4PZiV0aSG/v3WTBeDl6Q7DSUY8WVwabQmha/mv1ZvdEwLDegPye82cD9MEcV9TFxe7
 XDww==
X-Gm-Message-State: AOAM530NOLZDLf5ATczWqFRNqb4P2pnPfamXcHQrUR9zymfrCDsM2eds
 +a+bxGwpPsbGHEx/rSLLhLHEoWdcJgs=
X-Google-Smtp-Source: ABdhPJwOctNBwheaXkK4g51yT7p2XI7rOsEF2ZE18cIvAhZrWFtDbX+lgfxVy/42AnkBU2X3SiYQzQ==
X-Received: by 2002:adf:9bd7:: with SMTP id e23mr5789405wrc.48.1613678343011; 
 Thu, 18 Feb 2021 11:59:03 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z2sm8898772wml.30.2021.02.18.11.59.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 11:59:02 -0800 (PST)
Subject: Re: [PATCH v2] Correct CRIS TCG register lifetime management
To: =?UTF-8?Q?Stefan_Sandstr=c3=b6m?= <stefans@axis.com>
References: <20210218184302.34984-1-stefans@axis.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2fe233c0-dfa8-763d-b122-fdef8145ea06@amsat.org>
Date: Thu, 18 Feb 2021 20:59:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210218184302.34984-1-stefans@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On 2/18/21 7:43 PM, Stefan Sandström wrote:
> From: Stefan Sandstrom <stefans@axis.com>
> 
> Add and fix deallocation of temporary TCG registers in CRIS code
> generation.

What did you run to figure this out?

> Change-Id: I17fce5d95bdc4418337ba885d53ba97afb1bafcc
> Signed-off-by: Stefan Sandstrom <stefans@axis.com>
> ---
>  target/cris/translate.c         | 132 ++++++++++++++++++++++++++++------------
>  target/cris/translate_v10.c.inc |  70 ++++++++++++++-------
>  2 files changed, 141 insertions(+), 61 deletions(-)

