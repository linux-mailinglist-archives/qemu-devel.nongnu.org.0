Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CA3702AD9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 12:45:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyVhY-0006Nv-9h; Mon, 15 May 2023 06:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyVhW-0006Ni-69; Mon, 15 May 2023 06:45:10 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyVhU-0001hg-Mk; Mon, 15 May 2023 06:45:09 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1ab13da70a3so121958855ad.1; 
 Mon, 15 May 2023 03:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684147506; x=1686739506;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jqg1RGiKbpP3R+iNYcbW3SgRGLomNE6MLEk+mXnIKZQ=;
 b=YONluRBb+sihrLsK8jZpGnAjkSqf0D9O8f4xTNzJSkPdIqnPdwemZDXC/Qj7DEa8DS
 K+DxdTVqfyKTqQrhlTzN2GiZN1VawhIHwYZYHhRxqlETrBhGL5WdLOg72KlTZUUTZ94V
 IyJ0efSyPJjiLT7xPTwH2Tx1Ljj09PlFoqgoPy2sUAPw8ncEdbeFZEGi/7r9CqwaqI6B
 XAlx/uzxpUKhwZM39xXmcl6A7DPexjBRq26tjSGu0zkxb63DxykVoRGnwT4zasfYHQQr
 oBKvRSwLFNB4zwft0JFc1f6lVgZrrKz9LWDU8S2G9hl707KhJLzG8HcDby+dN2mtBq0j
 dl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684147506; x=1686739506;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jqg1RGiKbpP3R+iNYcbW3SgRGLomNE6MLEk+mXnIKZQ=;
 b=b4G3gh2cVW3qr61j+Qa5l56ExpwSge3TYbWf6xcAYfAwRjQ+Zfq4oJuhjJC+qN50EC
 k1Rm4WX0JqGdTnmKPTNL0d2zXDB3J0nrpR9oLMRVJyRRCJbOdCc3mSAcFfFzweHO7T2W
 jxRkSzfx52QT0oGTmhtBcYJ9ue/1+FW47hnuB4C6nALxecAHX3mKea2obdPLwdMJcbC4
 h40YEVhMMJ33F0UBGQQhCYGtzmQYR68N1bvBWQaEuu73dHThiSJjq3hRCvn7RvmrkJcS
 3LUOILuyXJdEzWX7ZX3SfuaAgyHiQHpdhFiAUEuq2NLIXirCAAWKUR364HWUwOgGGqP/
 N3qg==
X-Gm-Message-State: AC+VfDx0QW0LsoANOHQW9+BpaNgXMPOTy2+VsyT3uGPTsphChM9fOu28
 9vZG0C4XDFuBszwNfoCl9Rk=
X-Google-Smtp-Source: ACHHUZ4oQw50ca3/1bG39RINO53yPUPUKW+4balMsGuyHAUqMa2LflU4pVufhNHZ+Zyrnan8viJGAw==
X-Received: by 2002:a17:903:10a:b0:1ab:11c8:777a with SMTP id
 y10-20020a170903010a00b001ab11c8777amr31776687plc.13.1684147506633; 
 Mon, 15 May 2023 03:45:06 -0700 (PDT)
Received: from localhost ([202.168.30.146]) by smtp.gmail.com with ESMTPSA id
 a9-20020a170902ee8900b001a9293597efsm13164955pld.246.2023.05.15.03.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 03:45:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 May 2023 20:45:01 +1000
Message-Id: <CSMSGPCJPT00.3T2WYV13GBGT3@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Harsh Prateek Bora" <harshpb@linux.ibm.com>
Cc: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH 6/6] target/ppc: Implement HEIR SPR
X-Mailer: aerc 0.14.0
References: <20230323022237.1807512-1-npiggin@gmail.com>
 <20230323022237.1807512-6-npiggin@gmail.com>
 <ZFoXjN/PUyDhMDG1@li-1901474c-32f3-11b2-a85c-fc5ff2c001f3.ibm.com>
 <CSMPI9KZ5TT5.GAWG3D1ZUQ3H@wheely>
 <67fcac44-675b-67b3-ba7b-61730c356f50@linux.ibm.com>
 <9d7d3ca6-85d2-ec00-148f-963a12bbc0ad@linux.ibm.com>
In-Reply-To: <9d7d3ca6-85d2-ec00-148f-963a12bbc0ad@linux.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon May 15, 2023 at 7:32 PM AEST, Harsh Prateek Bora wrote:
>
>
> On 5/15/23 14:02, Harsh Prateek Bora wrote:
> >>
> >> That would be wrong for the other HSRR fallthroughs above it.
> >>
> > Oh yeh, in that case, may be move it to top of the EXCP_HISI, it would=
=20
> > need duplicating one line of assignment though (relatively better?).
>
> correcting myself, no duplication needed if keeping above EXCP_HISI.

No, because HV_EMU interrupts get an error code that can not be put
into HSRR1.

Thanks,
Nick

