Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D248F33E26D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:53:56 +0100 (CET)
Received: from localhost ([::1]:59054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMJVb-0002s5-Ru
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJUd-0002LV-Vx
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:52:56 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:43537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJUc-0000JQ-J9
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:52:55 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 u5-20020a7bcb050000b029010e9316b9d5so306106wmj.2
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 16:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KXJan1yZ53EccNGGzKVegImaw0Kn3PbWOZtdWMz1GVw=;
 b=AC2j86rDyRzufpqTttrJwYyRWLTHQDk5hDUdHU/7fCVtv/CBerjbnATbGyI6/xnqlw
 wbbJhlKGKDk/9J/S3HSHlFsvSSoqcu9bElw+tpDPsAnlHzxcgCDz+LCpvPiG3fyLWf6I
 7+KHC+PRaIzYimAmgMhr28srv8d/bzOwgbQMSBBQ06qQVzENqFadZWi2HdqWXCisW4Cy
 St8j6xSMiO0rQDIADfDLMHtH5IubUeOVG2OJIcOo0tkTshCol0Pky8cvrtotoRbFPk3f
 6DIoSU4h41VWDyoet67+X8zby0SgMECffaYHT8S0kCGcSdMH2ryPoC9J8jnp6YEjNVNE
 1XFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KXJan1yZ53EccNGGzKVegImaw0Kn3PbWOZtdWMz1GVw=;
 b=d9fsxJFfkKBPqrBj6meZTYfzaywA2NL0qVm/mcknaiM+pZ239QPxs3UPSoeg9kwKKv
 SUQw2nkv7qapiqbFGis49bkACYvWbSwNdCsGuVRETBtDBviWLC3vJd7F92jJsuPuhk/0
 4ggjq18C+K0X9OYd3SYyeKSfBKMkKeQdnOvDQHSPSZOH+vzujZ7l8aHvW1FxAu3CA7ZN
 JynhrHHl7UqUP66DHcw//ucL3+/a2BJEWpXpLBczk/pHdg1Y/CwYYjdkpzxMj8H4Gm20
 8mqVluoUQuJcR7HRcNwICsExLQ9hGNYX+ZlkdDLbIRPc77BwJ6n0pZRaNCVwFDh62HDr
 acIg==
X-Gm-Message-State: AOAM532inVba6PsJlwoGgupn1iraoghQyrzw5PgY+cpZ4o8ZiV0yMGS+
 83Ku3CGG2ULhxCHb99WKBzw=
X-Google-Smtp-Source: ABdhPJy3qIBJi+ptYB0oMOcZ2hGYANowo6QgewXhUdR7uFsI8dJBBm9GRxEkroavadFGmhTOYNeC4A==
X-Received: by 2002:a05:600c:4fc2:: with SMTP id
 o2mr1025007wmq.25.1615938772596; 
 Tue, 16 Mar 2021 16:52:52 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h8sm12911003wrt.94.2021.03.16.16.52.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 16:52:52 -0700 (PDT)
Subject: Re: [PATCH v5 10/57] tcg/tci: Split out tci_args_ri and tci_args_rI
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0444d4b2-f81d-3cee-3db0-9a61712efea3@amsat.org>
Date: Wed, 17 Mar 2021 00:52:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
>  tcg/tci.c | 38 ++++++++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

