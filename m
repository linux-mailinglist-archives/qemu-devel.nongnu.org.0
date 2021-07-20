Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0433CFB3A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:53:03 +0200 (CEST)
Received: from localhost ([::1]:35218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5qBB-0002uy-Tm
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5qAQ-0002Ga-E0
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:52:14 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5qAO-0007pM-P7
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:52:14 -0400
Received: by mail-wr1-x433.google.com with SMTP id c15so2506785wrs.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 06:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BFck9jeKDhtSpQhOW6ck/6dI6Uw4LUCk1uN0JU4sxW8=;
 b=d9bAWSyzNAPxaGbSSsnJ73ZSm+LpPCS6T8kKyiEeDNRqDCrzyTILpCExKKG6mFTlCw
 US82+0x7lrFNXUoTQtNP8CsTwHEvBST2MZz00ZB90sXVk7cKHusSca1/KmHVU8mC00k6
 s+W7he220x78lzIfvROwFtybndzS45VVZB4XAyo6Lj7JHekh2WNlzY1+qc3YUM9d6YRw
 M0kLOZsGriDLWDoIEVoVqXQpC4nOU4CzgnS+uYWWEaQU8kb3STq18g0pCGFJ3Owea3BZ
 U9yHxcsqEOpXbuA0eqssifyWjyHzD1vQEKWIkHMATf+NzCr8HwIK6FE6zFCfIHpMqWFn
 r/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BFck9jeKDhtSpQhOW6ck/6dI6Uw4LUCk1uN0JU4sxW8=;
 b=Q387XusLPC8GLWDDCIVUz9dmrdDzi+iR7eOtKMaiytp66t7AlUCo1vN64A2gpqzZ9E
 QEDlHCYlHTFaSbBoUwnwRYazYOQvK5r4wEHqLlV3OdhY+MLEFRoIUbEe+V+iXGs4846l
 T2t5pYFTNSEh9xBJI7AcBljiR6wRwsenzxmR8nui1lAB0DzLhuP/eoESEb0qiEpEK4s7
 BRwyTllx0OkQQvopZwGEth25+8Ykh4cigVd7LAeU7KsPW+xXCCDLFUnup9zRZ0+pykqv
 UtBOXq/Yo6AcOxWQM+fjCI8EJ6Rb+Z0NtepLp8ZIVPxr078R/ISMyrQ+0JYjz5xOm59j
 u1uA==
X-Gm-Message-State: AOAM531gjNF3C5EltvhjHv6aIHSjYfd/nfAeRakL2Ksis2sPpsU0pAe9
 0NmbAC+nX0QRT/rHF2lKE8c=
X-Google-Smtp-Source: ABdhPJwBQ2M76BSw+v5g3GtoK8nf22K6g8w3e+iWqIS6b7lMB61qFAo/5/vbaYbHeiZMSVMw4y+ffA==
X-Received: by 2002:adf:8b1d:: with SMTP id n29mr36714097wra.291.1626789131415; 
 Tue, 20 Jul 2021 06:52:11 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id l14sm22649884wrs.22.2021.07.20.06.52.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 06:52:10 -0700 (PDT)
Subject: Re: [PATCH] mips/tlb_helper: Add support for 'info tlb' cmd
To: Peter Maydell <peter.maydell@linaro.org>, Arkadiy <arkaisp2021@gmail.com>
References: <20210720120820.48427-1-arkaisp2021@gmail.com>
 <CAFEAcA_VC_gac8zqx7K7Do=fL3uWi-0ZwyPN0AESYHusuoby1A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <43e52764-bd8e-2a14-bb5a-cb74c462de86@amsat.org>
Date: Tue, 20 Jul 2021 15:52:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_VC_gac8zqx7K7Do=fL3uWi-0ZwyPN0AESYHusuoby1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Pavel Dovgaluk <pavel.dovgaluk@ispras.ru>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 3:29 PM, Peter Maydell wrote:
> On Tue, 20 Jul 2021 at 13:10, Arkadiy <arkaisp2021@gmail.com> wrote:
>>
>> From: NDNF <arkaisp2021@gmail.com>
>>
>> This adds hmp 'info tlb' command support for the mips platform.
>> 1k pages are not supported.
>>
>> Signed-off-by: NDNF <arkaisp2021@gmail.com>
> 
> Hi; for QEMU contributions we request that the signed-off-by
> line is your real name, not a pseudonym; we follow basically
> the Linux kernel policy on this:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297

This is probably an incorrect email setup due to problems with
UTF-8 encoding and the list. Ivanov Arkasha already contributed
to QEMU (see commit 56b90e60c40: "target/avr: Fix interrupt execution")
Previous patches sent from аркадий иванов ("block: increased maximum
size of vvfat devices") were rejected by the list.

