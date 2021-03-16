Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1C733E216
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:28:07 +0100 (CET)
Received: from localhost ([::1]:39692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMJ6b-0007Ik-S2
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJ5o-0006rf-Mm
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:27:16 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:33439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJ5n-0005Pg-B1
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:27:16 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so4587032wma.0
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 16:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iwv6lcNI29XN5b2V047hH89QjGS9Ioy/tSahh3+q+/Y=;
 b=hSyU4prb+kO17xvfuZloZFZrNwT6FybHQfhZLyMR4+9zmV7W3GfEOs+9A568y+dI5/
 bEh1SDvGyCrF34tcA/zp8oH+JXLyCK7ifr31sTvpawNCWzWiP1fFV15Ql5wKXtpKm92a
 Cl79cLrg/KxSnYL3awUgqiQRwc7lpLAK094IIJsQWAGErrlD4lwSpVBHY5f8Vj+DOMZ5
 KsvdTD90B1bVElCai6M6hY0aPRoybQTlS0El8c6zRiQ6/AtPYv4yCbwDgemUfZ2MQzyl
 2w6VoUVy29pDD71ZnvyjkxdlCKaBmgcGbAWfwUqb1xixYpQraLha89IIGrN0iRL5mfk8
 oehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iwv6lcNI29XN5b2V047hH89QjGS9Ioy/tSahh3+q+/Y=;
 b=jPxxXBdRtYeXlOyjwBkbc1pkCvxnZ9cZC/SfM5VtN0+eI71wFxCf4gV6EuNMRSvas9
 37SH97Usd6fR6Whr/+JsUjZnfld80rVcAQSo/VWV0Bfwj9Ae8RBfvVmmTUGHDRiXEGai
 2YOj5N+ZVkCFxhicON2eh888grUjiBB4rLRle8NOO1fcapR9yzAP6TvUMhRJl+XROup4
 lY+HySm90PmkoH8jz2cJC9bHL7JLICS/WCruG9DJbgMsuhiGC0JHifVII4ByBu6hl9n3
 8Eh+uDqltAR4csDz7ZLOJ2j8OzMfcA8r3H81akJdJxoX9hhBeLdMqRDvNNF+BbpODVh5
 Ud6Q==
X-Gm-Message-State: AOAM532Lwk15vpsg+gK0gcOP49qTt/iXaWpnz329j/62m/kYlYK4RRxj
 l/I0bKjgcC8MHVEKZXbdID4=
X-Google-Smtp-Source: ABdhPJwGDMyGbvq1jaJeMRiiIMO+BRdLTL8Q2YqY8rPrus59GsTwVu7sBYVcU+3q7Gz1mlU7yueUdQ==
X-Received: by 2002:a05:600c:4f44:: with SMTP id
 m4mr953187wmq.175.1615937233894; 
 Tue, 16 Mar 2021 16:27:13 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id f22sm687222wmc.33.2021.03.16.16.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 16:27:13 -0700 (PDT)
Subject: Re: [PATCH v5 31/57] tcg/tci: Split out tcg_out_op_rrr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-32-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <276105b6-4aa7-b586-e207-83b08abf3a70@amsat.org>
Date: Wed, 17 Mar 2021 00:27:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-32-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
>  tcg/tci/tcg-target.c.inc | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

