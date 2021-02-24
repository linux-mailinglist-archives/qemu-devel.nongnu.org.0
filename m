Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF3D32355B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 02:36:49 +0100 (CET)
Received: from localhost ([::1]:50484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEj6e-0000oq-1z
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 20:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEj4R-0000B4-Ph
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 20:34:31 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:45384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEj4P-0006DO-8o
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 20:34:31 -0500
Received: by mail-pl1-x632.google.com with SMTP id w18so155988plc.12
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 17:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jnQ7WfIWLbWYKXQ7EzAIPA6IiAFWb+pq6jES7CRKEUI=;
 b=xUNRIJdOFSrs522gg/YxuLsEzIeNYbJd5accho1yeEwBUJTgPeYbyBVMR1jIiWmhep
 z4tV7uoI5A1zZtL9LM15h+xz0BiK04jqcngJd9S3sNrATB2SwwTVeg+cpW9BF4meS66z
 BqVASqic8ErpzIYkDksW2RkI4asT+VnDfffhrR88BRU7GusTSUXyIiROGrj5uaHcHh9s
 qRiBFPWDc10qCdQhF0l/jT7xiR9j78v/UAec+6wm3s+FBVQPOWsNX7TuAT0NIM5MHg/b
 15BzqOSbj5tQQgfV0/2pmO9Ox4U7t/QoLdZosyg7VXepSauVyLHu172j0pgtN3ZHjpjq
 yg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jnQ7WfIWLbWYKXQ7EzAIPA6IiAFWb+pq6jES7CRKEUI=;
 b=UaVQm6HIOxCxwcksRlMRRBqY0BbuigLyMqpBfo6KIE36I5GMJgXYpR2uDByathXsyT
 TvBpO5l4tT788/1P36KTMmUSPrlRHEb8cOwNlaWWWtyJDN0cNTLy751dfBNv4iv/mXor
 JpYuxgOsGaFRVylBKWpIg39AuQHgcAmnOWJZ39JezUJ9Adxsh+w0AumS6aBcLKaFE3Tb
 cKEsqrEOYkSx+4t8xkDeJnZ+Y0fhYW9cKOBSsNidUuEyQVOo/dSNuhrqLUDgY20+Eus+
 up8DDn1GUEa6Tg0IhlMxqUhSjLN/FUpYrJHb2/OVJSAiNOs6U34IFBl6+aUn8x4X/iLI
 Y2sA==
X-Gm-Message-State: AOAM5339GXZNSZbLsMoFaX7nQ/BYX2asgmdJMA4mZirumlj8N+5Hl1hX
 MQsN7nLH3hdQ0OYAt9v8ou44KA==
X-Google-Smtp-Source: ABdhPJzIywGUWPD7KjfGHuok3im69HEcB3+N0v90bQxaCxzsMd6WeD9aISoUgrm4JqxIgrD5NZUmBQ==
X-Received: by 2002:a17:902:d898:b029:e4:3021:ac92 with SMTP id
 b24-20020a170902d898b02900e43021ac92mr1495490plz.26.1614130467458; 
 Tue, 23 Feb 2021 17:34:27 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id ne9sm365185pjb.2.2021.02.23.17.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 17:34:26 -0800 (PST)
Subject: Re: [PATCH v3 06/10] target/mips: Use OPC_MUL instead of OPC__MXU_MUL
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210222223901.2792336-1-f4bug@amsat.org>
 <20210222223901.2792336-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <73bed4b7-6bb0-425d-533d-fc6551bd2563@linaro.org>
Date: Tue, 23 Feb 2021 17:34:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210222223901.2792336-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 2:38 PM, Philippe Mathieu-Daudé wrote:
> We already have a macro and definition to extract / check
> the Special2 MUL opcode. Use it instead of the unnecessary
> OPC__MXU_MUL macro.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


