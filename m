Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6428E3FCB18
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 17:58:52 +0200 (CEST)
Received: from localhost ([::1]:56958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL69q-0002Yj-EJ
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 11:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mL68U-0000zb-O3; Tue, 31 Aug 2021 11:57:18 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mL68T-0008H8-93; Tue, 31 Aug 2021 11:57:18 -0400
Received: by mail-wr1-x430.google.com with SMTP id n5so28453381wro.12;
 Tue, 31 Aug 2021 08:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HWowmjO9oqnYlirU1HX7Z5qpQ87IyehJn3UgEGmWmp4=;
 b=dFgIfd1iYDcKdYbkyvcNEcjREElG0FEOfN+p0sm0qWtK6ULxpgS2JfpU1JonXv6Mpn
 4MtKyNGvK8MUGM4l4VoPzmCGPp+Ks9/svX6RCZwJPd/v+jaZv7MJd7iL86lVRSPD0t/D
 3PJURlLYmRxDoH7KYoaCv7bgd5/iOfhl+EwIx6d6hzAoGcV/rqqPdnE7VWTS9m0clGjQ
 YpL+hP+A4TjSbt9MfqDCCdZUmAod8l7JhUF1ROhP5L9oU8cWwt2qLGJ8Bonk7pfy7sQu
 tnRvabHMkDxT/5kHfk0m9wZ9DkjQDOjufLgmEBZ6IoSvbUxNxl57uFthRm5t00N/gWoq
 Dusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HWowmjO9oqnYlirU1HX7Z5qpQ87IyehJn3UgEGmWmp4=;
 b=KGih5FLYMEKw9kVvN+ShGs5Gxrva+SZhCHC/a6kpZzSxpFt+ZqJH7WTlpzvIbNkegL
 CU5c7PZiTfonBLNst6iTCrHEzHP/+EpUwlAF+ZdVQ5WKtZcffLW1p7KH/n8CuimAZ78/
 NhF1Gn5RgrG2kOCc4Qw1F0ulgf1RF6JBdhO+yLnsa6V+et6+9gnLr8kZ8c3Gtv9Wp+Um
 2xpShXTnRpGzf8dnDETtKPYip/p8v5kqCWe3Oc+U4EZJ7yZOKEmzXIAL4uXxTvP3mo1o
 cQG39bmVgB+FEJjEu4mwoO2vUvSl5qxNuiw2oNsfPDXoehCDINKBTKMnokUVO1JSlnpY
 voGw==
X-Gm-Message-State: AOAM533zR4u3AOYz+O6tAhuSqkXtA6jMKq3S22Sn8yFWRgvL43QSOM/u
 JdzY7kRN/Nc+BnwIRlTFfqTdHErtA6A=
X-Google-Smtp-Source: ABdhPJyWS5PxA3VMk3CM7f596fioaYrVgI4QbAZms90yOFyBhqOZo7YKS+PA98mWsPFgoT6rsUAUnA==
X-Received: by 2002:adf:b743:: with SMTP id n3mr32521812wre.243.1630425434552; 
 Tue, 31 Aug 2021 08:57:14 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id g1sm3093913wmk.2.2021.08.31.08.57.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 08:57:13 -0700 (PDT)
Subject: Re: [PATCH 2/5] hw/arm/aspeed: Select console UART from machine
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Peter Delevoryas <pdel@fb.com>
References: <20210827210417.4022054-1-pdel@fb.com>
 <20210827210417.4022054-3-pdel@fb.com>
 <7a53d5e9-52c2-a06b-1385-fd71a96d7486@kaod.org>
 <BYAPR15MB3032BA6C3556797AC2A3461CACC99@BYAPR15MB3032.namprd15.prod.outlook.com>
 <547b5f32-0858-1882-fb8b-c60056cdbfd4@kaod.org>
 <d3d43c7a-1f37-4489-a07b-bf561e4e36a1@www.fastmail.com>
 <a802ecb1-aa49-fd4c-5bd2-2bb19af56ac9@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <db657491-35df-8c35-3354-98a76492a4a0@amsat.org>
Date: Tue, 31 Aug 2021 17:57:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a802ecb1-aa49-fd4c-5bd2-2bb19af56ac9@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.932,
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Cameron Esfahani via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/31/21 3:34 PM, Cédric Le Goater wrote:
> On 8/31/21 1:23 PM, Andrew Jeffery wrote:
>> Hi Cédric, Peter,
>>
>> On Tue, 31 Aug 2021, at 20:09, Cédric Le Goater wrote:
>>> On 8/28/21 5:58 PM, Peter Delevoryas wrote:
>>>> I think I’m a little confused on this part. What I meant by “most machines just use UART5” was that most DTS’s use “stdout-path=&uart5”, but fuji uses “stdout-path=&uart1”. I /do/ see that SCU510 includes a bit related to UART, but it’s for disabling booting from UART1 and UART5. I just care about the console aspect, not booting.
>>>
>>> The UART can be switched with SCU70[29] on the AST2500, btw.
>>
>> If it helps, neither the AST2600's "Boot from UART" feature nor the 
>> AST2[456]00's "Debug UART" feature are related to which UART is used as 
>> the BMC console by u-boot and/or the kernel - the latter is entirely a 
>> software thing.
> 
> ok. 
> 
> I don't think we should initialize all 5 UARTs of SoC and let the user define 
> all the expected devices on the command. Unless we want to do something like
> 'macs_mask' ? but at the SoC level. It might be overkill for the need.

I'm not sure I'm following what you are suggesting. If we are talking
about QEMU device initialization, QEMU must initialize all devices
on the board, regardless the guest code uses them or not.

