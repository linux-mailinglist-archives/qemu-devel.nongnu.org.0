Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5280131A4A6
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:41:16 +0100 (CET)
Received: from localhost ([::1]:51086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdNT-0000wy-Bg
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:41:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdHc-0004en-GY; Fri, 12 Feb 2021 13:35:12 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:55139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdHZ-0001gb-03; Fri, 12 Feb 2021 13:35:11 -0500
Received: by mail-wm1-x32f.google.com with SMTP id w4so496043wmi.4;
 Fri, 12 Feb 2021 10:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fhISf5E/3tG969JzR34Wi9PgqupQmebwLrVrVppj7nI=;
 b=SSZr7zSXJLoI5Ep6lnIFlxhTBWGoCy33vl7bznPFakKI7l0T7/SI/jVMk9T8ddNwR6
 dGWPBzjay31kBUzR0Xmek5UpSomi6DuRkI8vCJgcJtKsVZrujxyI7Moqnn/eQuAUSZHm
 /7ScpbLbFUpfRn9b1yndXDJe8j0LwGP83Pog9JHuPIYdTMWkEhJD9bKA1YomymP/9Yvh
 l61AHd5wP+FvTs0FfnuJG7JipSLfeR4+y3CxqfeB7adhPxk1Esh0RVHZz0Qw1s0qYmyN
 gsumjMUq/uqy7jijg92VgCK64Jn/Q/cDNnAXor/LTcWzL9KP9YkhAP8pLPwzEmlTgx1s
 IqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fhISf5E/3tG969JzR34Wi9PgqupQmebwLrVrVppj7nI=;
 b=bQPf7mV9ydRnyB6TPYOmNjGsrmMpwtxC5C+ENuNffx47PupY1nnAnaFP9xEVB913sm
 AL7eBgbRJB5iRVDFeFTT7os9ljyT7whCtqxX9vCKC2OZf8XqSEyhwJrYI/Cv1p1d7kpM
 O6PQrfcO5LcVCgPkgVCKph5j7qOBQzqM++9DjWneuVH9TTYwyCxm8v40rZ5UAbKhaZKs
 ZP8cLh2tD1u5iG4CFAYk4vbn/YliF3BkgEh0vPK5W8o2rZaA2iW40OAkd9dKiQE8IV8c
 q0zOmEUhAy6j0vfXxVO/kzVu7pyvy65tHTuXVVk+9dtjfpl7njegQ9XfW2RLQp/NGcEo
 F4Xw==
X-Gm-Message-State: AOAM5307wcFZTmA7PVk0qhYKm0+6M0xQgHYWEcosTCYSyUdIfhTXCFih
 4fQzp19vrOoSbJIcNdatCi2yhlMeLsI=
X-Google-Smtp-Source: ABdhPJx1YJaNNDhPkRBUk2kn1pbRDcVOWXuyHo2pSa4BqxXLcpxn/0M5OPPegky+ItQk1XA52rdl9A==
X-Received: by 2002:a05:600c:22c8:: with SMTP id
 8mr3828819wmg.108.1613154904728; 
 Fri, 12 Feb 2021 10:35:04 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i8sm13211022wry.90.2021.02.12.10.35.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 10:35:04 -0800 (PST)
Subject: Re: [PATCH 22/24] hw/arm/mps2-tz: Provide PL031 RTC on mps3-an524
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-23-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ad5385e7-4b8c-c9b4-3d47-0b90f43079ae@amsat.org>
Date: Fri, 12 Feb 2021 19:35:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205170019.25319-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
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

On 2/5/21 6:00 PM, Peter Maydell wrote:
> The AN524 has a PL031 RTC, which we have a model of; provide it
> rather than an unimplemented-device stub.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

