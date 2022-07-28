Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EBA58404C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 15:48:14 +0200 (CEST)
Received: from localhost ([::1]:43604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH3s3-0005gE-SZ
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 09:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH3lE-0007U3-94
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:41:08 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:39747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH3lA-0004kr-VC
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:41:07 -0400
Received: by mail-yb1-xb34.google.com with SMTP id r3so3308188ybr.6
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 06:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1lQgWxlQ4slLvmYL3VJ5B+tRHfjdk41NTcExj0tuCvo=;
 b=Nu+Gw1FdvFpwmJdHRGeo//NMNDFgfX5oQC6ROONxycV+qB2V2XUMuNiC/6RiSc20w3
 Oj8hNMi4m6GN2Qy+2L3jlPRlhMMz4UZUFd+zcjO0iLLDf0bVgWChuToFrAQJzVVFHZoO
 N+qEmIP9CbTIL40jWeWCnigcjGbrfQvsPe+Rr1LkT7Ti9o1qOjJtY4e8ox+FRnJ1yql6
 GHuAQPIp0DPBsNETnxAZNbqICxBSNvkeiCb4kK8oO8sjcg1QWVfGGP4hwxk9xM/xZ54h
 R0d/NleBm92YcTsQV5FWHh2bGFTxTzHQXiud/gOQIcN9i9Bny4k7gtVGZk5WxuZpWIEw
 pfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1lQgWxlQ4slLvmYL3VJ5B+tRHfjdk41NTcExj0tuCvo=;
 b=rIyTJt4MFSMAVbIEZXxGkvNaJVPWUJKouJ27qovXij3Khs/RiyCZCDKbVGKtzVRbsx
 EZl8b9AQtqel7wgS7QADzAlHqJFMSU/Pc8jl07ozPz9NG1LcU28aFToFuMTTNNfa/V6N
 2Qz7GYQyLv+a66wNHRAXsvX8+4xUtLQmdxo8AMZ/Fyc/KAdk780WHn0OUYkPhvfg5Pp0
 mJWEmkifQozeJZ0rTyl0ccyWm0tUaLwjwfrkQjuFnnGk4EFTn59UbojvAyxQc79dcxOz
 vvDQkunCHJcdP+qsOTA66zxQDGs5MxQ+PtoRcv32CpNp8f1G9h5h9xACQxNTwtQ1MmoV
 hGBg==
X-Gm-Message-State: AJIora+haoLmF+eyEt2t2aC/enpGfZWQkzRfmMr2ll1B8hCX3j/SS1uf
 S0dvB2hFBbYthxQOBmN9KPzyQYc6VlgcpfXqH7eVsQ==
X-Google-Smtp-Source: AGRyM1sQpl+czWy4ERfzrDrKHF4nawIWFr7CVDdDSm9un/+m78IyMsDyv4m7z2Jj9kq0G0trGhnudzq4K6uMkzmO/GQ=
X-Received: by 2002:a25:928b:0:b0:671:548f:fabd with SMTP id
 y11-20020a25928b000000b00671548ffabdmr13912884ybl.39.1659015662755; Thu, 28
 Jul 2022 06:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220728093558.1163751-1-imammedo@redhat.com>
 <YuJbaxMbqNF+Cw65@redhat.com>
 <CAFEAcA85qvEjV53XMs3uDWKqzY4vrLqxfLKjZ_qfbrYMmfkx=Q@mail.gmail.com>
 <YuJjhHLzQEx4Ui1J@redhat.com>
 <CAFEAcA_cH7_r7vFYno1A=1XfjfWHj=VbDY62up2yqrkQ3VdTLw@mail.gmail.com>
 <87mtctxt49.fsf@pond.sub.org>
In-Reply-To: <87mtctxt49.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2022 14:40:22 +0100
Message-ID: <CAFEAcA_GfY8uDA+z8NSOebw1MKoaNoCNYiRBss3Ku-Q-jTBeWg@mail.gmail.com>
Subject: Re: [PATCH for-7.1] applesmc: silence invalid key warning in case
 default one is used
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org, mst@redhat.com, 
 t0rr3sp3dr0@gmail.com, alex.bennee@linaro.org, dgilbert@redhat.com, 
 agraf@suse.de
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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

On Thu, 28 Jul 2022 at 14:30, Markus Armbruster <armbru@redhat.com> wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> I applaud the renaissance of roman-style inscriptions, but it's not just
> words without spaces, it's also capital letters only:
>
>     ANY64CHARACTERFAKEOSKISENOUGHTOPREVENTINVALIDKEYWARNINGSONSTDERR
>
> Seriously, throw in some dashes or spaces.

      any-64-char-fake-osk-will-avoid-an-invalid-key-warning-on-stderr

-- PMM

