Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9283FBD62
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 22:18:18 +0200 (CEST)
Received: from localhost ([::1]:52544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKnjK-0005FC-Ey
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 16:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKnge-0003A4-QA
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 16:15:20 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:34732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKngc-0003Q2-Au
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 16:15:20 -0400
Received: by mail-ej1-x632.google.com with SMTP id u3so33643421ejz.1
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 13:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gZHxqII6pE72vP1yX9i41mIgsKVp3Raa/v4NDJVfcxM=;
 b=qQ7la5ngyYE+rrBSYfuSlulO+sgiNAUuIrjrViyvC1IUDhVF7ffqeMrZLQFZsWJ4FW
 A2SoXkYmzh1qXSAfGjsefzEBfyKZJQNeQAO/S4K8+SVDh4/iIn3S7w5YSRVPzvKk8zu1
 IyQlAyLC7gifBvw5Z4j/VeOuWfcmNIqnp9uiW5ROd1FAREBKKNsFWcr+pGYqAHpr/3Yk
 8pbVYSCnlA1ypcLUb32eH8oS9TSaFOaHqc/JpwemcjJIVsJYIjX8k8KaGS+fW8mWMbQ7
 PTUSa5Xx2aK/YgypCgb2MkSwCCg2/F/jF9BhlxQ45wXIlwFftcEBhnZmY7EAW8U8mXTn
 i4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gZHxqII6pE72vP1yX9i41mIgsKVp3Raa/v4NDJVfcxM=;
 b=cpDLpQG/cLC7lcCFu6U42c7qIMjIn6kxYoLQIR71BLQUI6YmPiJV1seJ548Y3LdGJj
 QjTJ0TE5AlTHLvYlIX0fwB8OXh2uqSpcmgFDOHVzaU3ipkDzLF63GMQm/LmTGbOSIdDY
 kcM33lH7EEen9KQVcUBqh7NlQ8113UDCSoejCxRIVuguHhX83tW5aNhhaPSM8XCrDTMz
 Djkatma6XVOf9iDYMTlVPBqoeSVCXItW2I1pb5zCvS9rBlnoTFdDpbkWWOfMKufRbooR
 2qFDaCJAyGTFfPrMEZxkVkDLaoz44xjCUs+OlVbmjGndBeRNT55aZnISfilPn6PkgFfP
 xfsQ==
X-Gm-Message-State: AOAM531ifj5WX4ZYPj+GV/vREYaApsF/JTr2YAB0KG4Hv6YKRSRgVqv3
 a5p898WsyUYLmrwMY59m1XNSsnDChR3FXg9v/M62xQ==
X-Google-Smtp-Source: ABdhPJxNbYcf3zDhoAE+d1zSPUTffTrsWA8fm1Cr92qAvtCcsPeoJ4lVHzWxUX7F6+54iN1FPzT7Q4b7GYt9LJR1IZ0=
X-Received: by 2002:a17:907:923:: with SMTP id
 au3mr24792012ejc.482.1630354516646; 
 Mon, 30 Aug 2021 13:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210805193950.514357-1-johannes.stoelp@gmail.com>
 <CAFEAcA8TRQdj33Ycm=XzmuUUNApaXVgeDexfS+3Ycg6kLnpmyg@mail.gmail.com>
 <20210830154708.ah27fh34q5dgg3le@redhat.com>
 <CAFEAcA-QW1_sLEArKY1jBJkmGdKQukgwe=O36p7gDpH2mFceqw@mail.gmail.com>
 <CAMnW+q_6Vd0os7AEVVyM30m1kzev_3j8MWusXV1kp6jmUmRqcg@mail.gmail.com>
In-Reply-To: <CAMnW+q_6Vd0os7AEVVyM30m1kzev_3j8MWusXV1kp6jmUmRqcg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Aug 2021 21:14:28 +0100
Message-ID: <CAFEAcA-PSg6puCy95bskoFzq1a0F60O43cAkz=k73SXLZxO0nQ@mail.gmail.com>
Subject: Re: [PATCH v0] kvm: unsigned datatype in ioctl wrapper
To: Johannes S <johannes.stoelp@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Johannes_St=C3=B6lp?= <johannes.stoelp@gmail.com>,
 Eric Blake <eblake@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 30 Aug 2021 at 20:37, Johannes S <johannes.stoelp@googlemail.com> wrote:
> In my opinion we should use 'unsigned' data types here for the ioctl
> request in the ioctl wrappers or would you prefer to keep the ioctl
> wrapper definition as is today? What is you opinion?

I think I would vote for following the type used by the ioctl()
function as declared in the headers for both Linux and the BSDs,
and using 'unsigned long'.
(We should change KVMState::irq_set_ioctl too, to match.)

-- PMM

