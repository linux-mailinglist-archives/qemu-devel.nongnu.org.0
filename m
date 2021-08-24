Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D12FA3F5C2F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:33:17 +0200 (CEST)
Received: from localhost ([::1]:55662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mITk4-0000bI-JQ
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mITg6-00025Z-CJ; Tue, 24 Aug 2021 06:29:11 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:45627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mITg4-0005sJ-Oh; Tue, 24 Aug 2021 06:29:10 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so1943628wms.4; 
 Tue, 24 Aug 2021 03:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kCUjY6YLR4sNccXnHWSm8bfYEhBny9Z9HaOw4VG83hw=;
 b=T8iBBEKXNRCNg34pNa9+JFRqUwMyG1jO5HrPk63TxXbgAsdJsiAPddlIGOz7OtymUp
 8RFTlkWSrzLNIHrVt4GuxwAEN4piVQHfD9eGpJsMf/lGNe2Ar77c7uGvse/NWJq7/vMe
 r8r8CVQ9K2P6Qi1guNziSREur2KTm20e72dvNIjWUVAW7WH7lnov/jXWBzTlkHuq1sgK
 a3cgV3OYrXKInckiKwipylqrOVewdG3WX0bWESTilV7mnJWSGhVq4qPK7ycfxHnlbtJn
 0DvyWJS/+ZcmMQsoV1gy4Zp6kspebHTmD2t9Zl+j4b3c/xJC7kNWG2V0B7xXqt0ukUTg
 egog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kCUjY6YLR4sNccXnHWSm8bfYEhBny9Z9HaOw4VG83hw=;
 b=B5pY0JflJKWLiiMJ/mHXTmtjTIy8CvcZo/S/dxE2HNdpz1vPJxHDGBZUhxIXOpggDB
 nRljuebrpgpo5JwX1IpiBd0NLM35KK1Vh5c7QXTB4e2t1o8ZPntGbfYOzVEIS6DZp7p1
 GZFLhPGkeUbGgmZ3ScxWoaA7S+BpJrckMhc5fdIivXCpUqvUsgGvtEdW+kAyXoSji5p3
 36q1Wu7JHw1a1ckHv++cxKmwbyi9sbMtRm5kwgHrlJzVDxeWMc3suTzbf/+CmfieZjwE
 6d51IZwK3o7/MOTRgTQt2fCgiZ++t3zpyzHCDumqD/NTFIUfLvb3Xn7Obl4uLJkLb3f3
 m94g==
X-Gm-Message-State: AOAM532piz51zo4PNOQ0wUpQDkbAeD6qS8TDK9q07ibPz0ozdcrLJIPJ
 eHghG7w3d8DuRdl5nvjpXD1SGcNDswQ=
X-Google-Smtp-Source: ABdhPJwNjB2acTJIy03H5iY7GrkOfm69DiuEOrR7Vy+/r1d+e338snAOQC360tVj9cpOpv3OExSWJQ==
X-Received: by 2002:a05:600c:3641:: with SMTP id
 y1mr3294025wmq.43.1629800946975; 
 Tue, 24 Aug 2021 03:29:06 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id j7sm1910172wmi.37.2021.08.24.03.29.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 03:29:06 -0700 (PDT)
Subject: Re: [RFC 02/10] hw/mos6522: Remove get_counter_value() methods and
 functions
To: Finn Thain <fthain@linux-m68k.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <0f0fe91d4b1878000260bea3bb44bcb61525ae13.1629799776.git.fthain@linux-m68k.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4b8550dc-42bb-4e7f-6fbb-8cd0632f26dd@amsat.org>
Date: Tue, 24 Aug 2021 12:29:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0f0fe91d4b1878000260bea3bb44bcb61525ae13.1629799776.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.023,
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
Cc: qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/21 12:09 PM, Finn Thain wrote:
> This code appears to be unnecessary.
> 
> Also, these routines don't return the counter value but a time interval
> between counter values, so they are misnamed.
> 
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
>  hw/misc/mos6522.c | 22 ++--------------------
>  1 file changed, 2 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

