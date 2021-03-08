Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B773316F6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 20:09:13 +0100 (CET)
Received: from localhost ([::1]:45706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJLFf-0004wb-V5
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 14:09:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJKnf-000608-1z
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 13:40:16 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:38564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJKnZ-00028X-8Q
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 13:40:10 -0500
Received: by mail-ej1-x62c.google.com with SMTP id mj10so22393161ejb.5
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 10:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BUO2Bt8ngI8mjlSCVhNORk9MbJ/qqJ/2Ns5M6rACZhA=;
 b=jmEVwJt/QluE7vEajXquxBeWSwasZEFptyPnhSQj/wUy6l/qoSEU1Hj7Ze0xKshYJw
 bKtApko85KSFhkYyQjHb9X9xdsSv7x1vJeDH8XiVAmU3lwrlwSdK+tbo7t4F1L8HHSh5
 f2YFm5YJuD6taDjd1iMY5zgEM05ixIRdvVZsp3MX8IjXUVehzHjWAY9z8A/JujBf4qUM
 gXOSm4eVqHmtugkG4qFmeHpfprw5HOs7ViGpDXcmcUplPfds0stsP2l4oXuxTCejyeOU
 4VwpwesFJdDqrMHs+51u12yI/mf6wfZx2p8N3ljHD/in3zcCgIZ0scdHTlHFC/Vi8waE
 GBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BUO2Bt8ngI8mjlSCVhNORk9MbJ/qqJ/2Ns5M6rACZhA=;
 b=bXpxJZBleP2E/FhmV1oKEup/ovgZZW1iFbp7rNXkOdonRjUk5pxsAHkWSo/S41Piag
 Lnxt8r9vX+9WZMvKepOFMqIt5heVvcTySYxcQN1FI/TR+s/q1KUMB2qyTBTPZ1wO+Vv8
 po/37877bNhiw6IfpbivR+tTDVlEKElD7aKranAOYWyvfioGL8OlaIZGxl5kYz+RZQd0
 eOQas8I7omoC/DFZ1ZHwO8GpzPks9MeBvGTNdP6bTvxfCPeYPsQFVSUkpy7b0DwSDyBR
 m4ygEhMZO7IT6baY0JJhvC4p2baS5hVd7yXi+MJbl0EaMI8mGMy3nLkpGjyDQHw5UBKm
 i6mQ==
X-Gm-Message-State: AOAM533FVEFnw5b5E71X0giNKvft0ohgyZf3/XVeAVTVWagI3voMhO/Y
 iWUnKvFWHLMRiVlHzkKmLxU=
X-Google-Smtp-Source: ABdhPJyJ6ecNmlFyeQsX5PTX7Ac1QS3Ji4wMtwiUaaKjssPvAdjBikhHv6sftEpvckXnqUdTPPLv1g==
X-Received: by 2002:a17:906:1dc2:: with SMTP id
 v2mr16703445ejh.350.1615228807587; 
 Mon, 08 Mar 2021 10:40:07 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a3sm6985505ejv.40.2021.03.08.10.40.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 10:40:06 -0800 (PST)
Subject: Re: [RFC PATCH 17/42] target/mips/tx79: Introduce PEXTUW (Parallel
 Extend Upper from Word)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-18-f4bug@amsat.org>
 <da28d921-ac5a-28d7-af0f-e6e5d23986fc@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <59f20d76-ccfd-5023-9269-45c8c1dbb4bc@amsat.org>
Date: Mon, 8 Mar 2021 19:40:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <da28d921-ac5a-28d7-af0f-e6e5d23986fc@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 5:44 PM, Richard Henderson wrote:
> On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
>> +    tcg_gen_deposit_i64(cpu_gpr[a->rd], bx, ax, 32, 32);
>> +    tcg_gen_shri_i64(bx, bx, 32);
>> +    tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], ax, bx, 0, 32);
> 
> I think you should pull this out as a helper:
> 
> void gen_pextw(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 a, TCGv_i64 b);
> 
> since you'll re-use this for PEXTLW.

Indeed, thanks :)

