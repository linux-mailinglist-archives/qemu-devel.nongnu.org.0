Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAF83F742B
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 13:14:05 +0200 (CEST)
Received: from localhost ([::1]:59878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqr6-0003tN-PN
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 07:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIqUg-0004ip-4Z
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:50:54 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIqUe-0006bR-OA
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:50:53 -0400
Received: by mail-wm1-x32a.google.com with SMTP id g135so5395087wme.5
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/66nA9DYgPawFEy9wMqrIh/UtF2fZ2WuYrhXUCDDdKQ=;
 b=OyyXynwdFLPXBLWeHKM+ABHoRXARt8LrW0gaGj+aqewDo+cQYz/e549X6UBu21adRC
 x3aT6P3iJaZcgEX5p79x/l6DafjqNyThnd+ev6TGyTMBo0mkZuq+Icq/joLZ4jziDJua
 wp0n8w8cD+0a/YIo2jzU8nBi/uL1EroV4nbu3If0LoPeWjQnrAZX6Q8A8aHl40XfPFep
 cx5wNpxz8c/l17dHKe6o7WFEtqhImw0MBqsirBNXXu4a4LxB2davWW+aA+0+7v7e3Ps/
 3b4/q2U/ONvisaAtfPM3+JilPRMTJFEoiF2W4e2GmOH0z81uGHy1k7ql65tIH2aYd8K+
 tENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/66nA9DYgPawFEy9wMqrIh/UtF2fZ2WuYrhXUCDDdKQ=;
 b=SI65R7R1lp/fEwvs/3AZfpy4rqW8+fXZ8Cg2ztKni44UKYeXO0vgBrAQI7nfW+aqiX
 UUfwtfSgSAE1oGYXQi0tDj23viNXDKQLvs7qn6HGHcR2HpA/hLZLaeiN5os4vzloIMSr
 Mt/XaYcLwPgTT57OBhYCYwndWA7idaLsmQ9QEpbtDpMGNFCxEAz+fRrXSjpJ5r64mzH/
 iaNutqVVFx2YZLZC3ziBrojZGp8RPWZempo6R0AUckDlytMI2EtjtapBlqk0uJYdKsYj
 ptxCW4h63KoP86GwUHmaSPi1+aSoW3AAVgtVabNNx0pi9Baks9vl4UuKuKqx37GToQ9n
 YkfQ==
X-Gm-Message-State: AOAM531Tz0MTCXUtfateN1y5Wi/r53vtXfxYUUJ29amCWnlH2sOHrn3P
 L7RIdbhvbjupGcnqxYYL5Go=
X-Google-Smtp-Source: ABdhPJx9xxJcIJ1Vot48h27mQqkDRcBdeakApR+JSdgTxshhchN82tMlhnB7YlgZcdlUv7kAtF2VMA==
X-Received: by 2002:a05:600c:5102:: with SMTP id
 o2mr8704125wms.99.1629888651268; 
 Wed, 25 Aug 2021 03:50:51 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id w9sm4820951wmc.19.2021.08.25.03.50.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 03:50:50 -0700 (PDT)
Subject: Re: [PATCH 0/2] target/mips: Allow Loongson 3A1000 to use up to
 48-bit VAddr
To: qemu-devel@nongnu.org
References: <20210813110149.1432692-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <85c58d4c-877f-07cb-50a2-7889a091afc9@amsat.org>
Date: Wed, 25 Aug 2021 12:50:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813110149.1432692-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.24,
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
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/13/21 1:01 PM, Philippe Mathieu-Daudé wrote:
> Raise Loongson-3A1000 SEGBITS from 40 to 48.
> 
> Philippe Mathieu-Daudé (2):
>   target/mips: Document Loongson-3A CPU definitions
>   target/mips: Allow Loongson 3A1000 to use up to 48-bit VAddr

Thanks, applied to mips-next.


