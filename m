Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 054A03BA7E8
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 10:49:20 +0200 (CEST)
Received: from localhost ([::1]:50604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzbKw-0006Np-Od
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 04:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzbJt-0005jB-KW
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 04:48:13 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzbJs-0003sd-5c
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 04:48:13 -0400
Received: by mail-wr1-x434.google.com with SMTP id t15so12102464wry.11
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 01:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F8H3F+XSTiImVumwvmAuDbL5fkYEqRYzkQqfRRnqq0I=;
 b=ZwlOzQDHCwRoY2Xqeey6wi1SvqDzIo6qSNY+rTCqhKcyvCx2DeVOkI+3ttFe0KtAPk
 d+wyECY8jhbGHdBl98Kjg1ohAKbcQJqqH8twjrcSt3U9SIgAUWMCpXwvTuumlOMHxZI2
 oQBoUYz9dsZdFsxBGyT50+WNKsMxyz+v5oYwSxTSfMJZqLVBgJD9GzW5rRv/bImte6s5
 XGXTGq6xnqHnPEDd4gA7T+Mba16880KQI7rcXw0fcSu1vPe6otduq4kfgmnzh4xQTbVP
 QWAZ8rJhx2oCU/9/XCiw3e+F04CGmfUlZYYWN/XA6ts4n6mglfgx5zbK8nXr/l6Qytoy
 JEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F8H3F+XSTiImVumwvmAuDbL5fkYEqRYzkQqfRRnqq0I=;
 b=XTlFI/zibJP+awfc9Sdi27uT9+OaScE507caB+f4NIupt+pDFNi3YNfNJBfLNWWGNI
 VB8CYSfFePKgXuJf+gIX8g8BrZsPirxsCk4zJsx2MzCHHoGDrWR0o7vTzxZPWhu51X49
 xg/afwdVRbtD67LPV1XjvCKb2oNHG/6t670S8b3kJQomof2WPSuLipsDcSrs/Cy3/Mn0
 o/X+phYbLEpH4/NwqPvDP0Jvl5wi1Vh5xPCsXQ296mdPhvEO20BsSoP2UBlrpMSWPnky
 HDq7HO3+zCob/QP+4BwrYlEY9zLPR1H9aw218CMv+4y3E3rKDfqAZOtGArXQVfa86S4G
 123g==
X-Gm-Message-State: AOAM530hlli6SRN97Z3MedtEDJEhr+zeHuB72UuSXqMBwP1L5pL7kmFR
 tACopKZmxc/GaS/RXsaRTNw=
X-Google-Smtp-Source: ABdhPJxI22fBzB0H05Td7vXYdKZ0xExhJRfO2rk01Di+oyqGqZju4PLXHKhjuOSScTv/aUcBg6D05A==
X-Received: by 2002:a5d:498d:: with SMTP id r13mr4121722wrq.379.1625302088997; 
 Sat, 03 Jul 2021 01:48:08 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-110-177.mobile.abo.orange.fr.
 [92.184.110.177])
 by smtp.gmail.com with ESMTPSA id p18sm1706561wrt.18.2021.07.03.01.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jul 2021 01:48:08 -0700 (PDT)
Subject: Re: [PATCH v2 00/10] dp8393x: fixes for MacOS toolbox ROM
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, jasowang@redhat.com, fthain@telegraphics.com.au,
 laurent@vivier.eu
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
 <b4487676-d04e-14a4-2cdf-5c3aaa78212d@amsat.org>
 <70ea194a-af86-454e-d9cc-494805d953eb@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <71bfbd7d-cd35-4d54-f4a4-1b08a927c2a9@amsat.org>
Date: Sat, 3 Jul 2021 10:48:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <70ea194a-af86-454e-d9cc-494805d953eb@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/21 8:32 AM, Mark Cave-Ayland wrote:
> On 02/07/2021 14:03, Philippe Mathieu-Daudé wrote:

> What was the issue with patch 9 "dp8393x: fix CAM descriptor entry
> index"? That patch ensures that the CAM index is read from the
> descriptor, and not taken from the for() loop i.e. it is unrelated to
> register access size.

No issue, simply nobody reviewed it and I was not confident enough.

> See section 4.1.1 "The Load CAM Command" in the
> DP83932C datasheet for more information.

I'll have a look. The patch could go via Jason's tree or Trivial
then.

