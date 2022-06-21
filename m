Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1493A553EBB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 00:51:59 +0200 (CEST)
Received: from localhost ([::1]:37326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3miz-0003v6-LW
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 18:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3mhk-0003AL-GK
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 18:50:40 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:44437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3mhi-0001kU-S8
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 18:50:40 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 h34-20020a17090a29a500b001eb01527d9eso14096394pjd.3
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 15:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:content-language:to:from
 :subject:cc:content-transfer-encoding;
 bh=9OXQxKxSsbuqTA5DmRZNpnE7Dg/0GlPYbhONesZzzuk=;
 b=TGmsavQ07PNfb99huVtgUoP3gDTSVGbLGeq2q8SNXozeHN/Bt1LWk63wVuN7O7+xeu
 n1dCpNOxrjhsQrbrJwpuV0PzjWRtXQCYON6c0CAiers77otnwgqiPk2vWDYFIo0QwKRz
 GKkWJVM93pmU9RXYmBaeNP3VWYpL9449+yAWK85RFhIeAQkEvvbTJCoDT2LdVOsXNScT
 Jn9vvKuKE09UAr6v8d9aJ5dvTSGCbphXuWxBbR04bmDtNbbdcHxvZ6F6LkcKMpIlF9WP
 miWgwd6GQrArxl6dETxdxidMJrx/kNzJANYLs9T1miZ3nI5y05Bg8T5C0lDmJCO7J21r
 I7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:subject:cc:content-transfer-encoding;
 bh=9OXQxKxSsbuqTA5DmRZNpnE7Dg/0GlPYbhONesZzzuk=;
 b=y1RyTnNKFqwq8QWPbkmRdSe1a54Rz+7qPbtY14yf0rSjcuc2/CIucvt0Lm68aKm5xj
 KVFXahb2x1WenO3NoMfatoiJV4xyw9Bas3u4jB4HdTLppPW45gA0bAUcIU9EmTx6xVpN
 suIsZ9SoWuqnNwQ7d5nuMfVxRs2BdZNcCddWb92WotTLGjlbTFWiH4ekhwV1fM/CJ8bc
 +tWQ6kKnm95iEvCVGwrUdMUQzp3RmstlZjgF1rl+xK6uWsaChcd7H+9NfC7U84vxhgUJ
 kK6U1Ek3bqB57mNVCWwoiWMAeFiTQnG3nB+/XuntIpxk66AZjtPPpl3FoLeqlEDxRRrM
 ftsA==
X-Gm-Message-State: AJIora9H9dxWte0cj39Yh/6uxvJkkYJFx+W8tR7NGmpKJOag4JfWWobG
 SZlFSuW+8ZLEqI9H8D8Ov3P00w==
X-Google-Smtp-Source: AGRyM1t/WPROtsGdgxW567TQcN2qDMS4FR/zzfqD1U0cesHaeZN22zlFNmlfEm6enTvRMsZARvyDGA==
X-Received: by 2002:a17:902:7204:b0:16a:22f1:f87 with SMTP id
 ba4-20020a170902720400b0016a22f10f87mr13432268plb.3.1655851837134; 
 Tue, 21 Jun 2022 15:50:37 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:8adc:a144:6ec2:4d71?
 ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 jh20-20020a170903329400b00168b113f222sm5804230plb.173.2022.06.21.15.50.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 15:50:36 -0700 (PDT)
Message-ID: <dbf7e57b-a57e-8ed8-67b9-6d43c534a317@linaro.org>
Date: Tue, 21 Jun 2022 15:50:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Luis Machado <luis.machado@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Subject: [RESOLVED] aarch64 edk2 + linux kernel crash with gicv4
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Hi Luis,

Cc'ing qemu-devel just in case someone else runs into this problem:

The symptom is an early-ish crash booting the linux kernel -- without earlycon there is no 
output at all.  Reproducing it requires both -bios QEMU_EFI.fd and -kernel Image.gz. 
Using only one of the two options works.

I tracked the crash to the qemu commit that enabled GICv4.  So I tried using -M 
gic-version=3, and that works.

I wondered if the problem is that the edk2 image from Ubuntu 20.04 is too old and can't 
properly handle GICv4, leaving the device in an inconsistent state for the kernel.  So I 
tried an image from https://retrage.github.io/edk2-nightly/ with gic-version=max, and that 
works.

So... solved.


r~

