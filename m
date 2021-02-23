Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4FF3230EC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:44:50 +0100 (CET)
Received: from localhost ([::1]:53706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEcfx-0006C8-2m
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:44:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEcf9-0005lT-Do
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:43:59 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEcf7-0006dr-VJ
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:43:59 -0500
Received: by mail-wr1-x433.google.com with SMTP id l12so23615372wry.2
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 10:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S9CDW9LtxHjRF9R6+K3xc7OXE6E+M4rQBKSr9rA650U=;
 b=L9KPMMx/QtHqb9E7zeL/qX7tkh3huH5D1n/WFGnpg+rznzeZpHMIE/WboRmfcirqzt
 uhNDar0tLMAXyFahWMqr5Y5vzVwcMSWa3pP+6khOkUnCJ3myvDMtiWVdCBHdA7RN6R3q
 5sNF4Yp6Bhoj+yK+UJ+bgv5lQBjUQaQfEG6w/G4eCdGFZ61oLqz6PpcwqK8Hsbf327hP
 shqeKQmSfN8MZKC0zWP5VCNcH9ZlCYDNKznPfLnsYDibH9rd88+ZLgjy/6S4fMFC8Hq0
 ABAAA4QXJTI3Bu8PsTDg0jO/zTrQDXhwvjo1/ewbtwC3OEdndUaTY9OCGAndUpJDmGdD
 XsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S9CDW9LtxHjRF9R6+K3xc7OXE6E+M4rQBKSr9rA650U=;
 b=pK/ksc50xGPYPEB8vkPgS2bfCL4WI3HyJvEEH6Vj5lK5jAVD4LUNWoRKnhHT2mY5gT
 zO9ft40aQraqq3ZJGRFqpVhXz7yZkhj3o8dNXfRLpdUivu8FogUHVNBhbUNhOE9zIcBd
 vnlGv+GX6hc7Qqc2RAzwMo0B4Xg+vsfIIf36E6jmdwLI/s6KXkzSspFy7+QFjbJLAFNl
 5CntjIbPxsjuctKOb5oZ0XGSOztLsBX6wh36QVr8tKkiPtUmkvFdAr0ajuf2qKNN8uVS
 xr3j1lSuyarTbI+0DRm+4iEf0TDoJZSFJQB2Uuk1WkgfAxLU4klZei6cfcQJSgfwCaY2
 YGqA==
X-Gm-Message-State: AOAM5313BFx86GXXYbVX/R0psFTHGIpLdcq1QxIByD2rxdENerQ4mFr9
 6+Una+4lYbq+v6qqsGj4Y2M=
X-Google-Smtp-Source: ABdhPJzcfajhsYQ3JWdKzy/9Dy3Q6G/AF0qySjbnq5cGSlj/6xb0k6uJkTBE9Q7pk2emIpFukdRfcA==
X-Received: by 2002:adf:eb8e:: with SMTP id t14mr27483235wrn.20.1614105834603; 
 Tue, 23 Feb 2021 10:43:54 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l7sm34262443wrn.11.2021.02.23.10.43.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 10:43:53 -0800 (PST)
Subject: Re: [PATCH v2 36/42] esp: add maxlen parameter to get_cmd()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-37-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <38a114a5-c1af-b799-f59a-6f8ecfa3ff6c@amsat.org>
Date: Tue, 23 Feb 2021 19:43:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-37-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 8:30 PM, Mark Cave-Ayland wrote:
> Some guests use a mixture of DMA and non-DMA transfers in combination with the
> SATN and stop command to transfer message out phase and command phase bytes to
> the target. Prepare for the next commit by adding a maxlen parameter to
> get_cmd() to allow partial transfers.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)

I dare to add:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

