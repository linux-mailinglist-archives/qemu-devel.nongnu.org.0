Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 737755FD833
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 13:19:18 +0200 (CEST)
Received: from localhost ([::1]:32906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiwFB-0003GI-DX
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 07:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oivmD-0002ZR-TG
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 06:49:21 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oivmC-0002WA-6r
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 06:49:21 -0400
Received: by mail-wr1-x434.google.com with SMTP id n12so2169368wrp.10
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 03:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zcNOnDvexFUonbNQQRbuneLsiVQTEcKfHxTg8Eiz3vk=;
 b=mMh/mX5kYf3zdVHjYZ2mEqS/EO0B9H5g+ShsyJMPGIfHShsRA6nE42rvFwLP0kBw5G
 SslcamE9AEE7S/zmosWj+yUtFMigmIGrGz/i49NArWuF/D5rjYvEy4Zmny6UMXkD4Akv
 ZYWuKc5gYsuSgQpWj3s8LJQEpVSbIpugqV4g6yRscuTS9qXDhtIllYahdMSlvOL4s+RP
 VmFNE5Vof9dTZx0yGQe34iZNaFOirAYmBPTDmZ+HbC7P9Tem6odl/rxaLA8f+pIh7JIq
 4iroUdMSRoDq65VpbNvxGyNqHIw39a4TLc8nrkWtwdgpX+o1bDsICQ3gKT3BHNcr3T8g
 kulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zcNOnDvexFUonbNQQRbuneLsiVQTEcKfHxTg8Eiz3vk=;
 b=J5ZOCsUlTbQ6H28Mkxg9zsz069C5x1dUYZfxz2j0lbTHdKib4tO8wcesiLPXsUCtQz
 KQaL7CRx7mq+CEW2mC7e0sqe6TYBp3tj37dJCR3gOokXG2lzfTF1kv6xCBiPpD4SgWys
 bz8SPn9kPv7wIX5Rlht1qhVExJK52yIMRu1Fmu3YoOVfxwdfvoWx2hQDnAWPZzXPVRdp
 bJeriVHPSHC9ahZ3QFZASmFT+SqcVVoel0og3rpEqJuolraXd7EoYDk7Z6Q89sOdq+8y
 s02rcYZ3VdKanBMEP+XDGGbq/P2fQ5aiuz17QqanCKHpiUyCTj1wybk5krMh3rmEGP7j
 lIGg==
X-Gm-Message-State: ACrzQf2RHIfdWg/A8bwe7GCbg8Qkk4mqE0Z1CJ/r5Z7gdgQeKELjMgPb
 u0HALQA54p9PFkOv8zOA9XKFwu3YBBVKxA==
X-Google-Smtp-Source: AMsMyM7wNUWvRE58olCa59V50sSRvCXafdUir9ZRH6WBxdEoPZurpDh4IklnBi2+5D1nTQEHg/6JsA==
X-Received: by 2002:a05:6000:10d1:b0:22e:3bc5:c91c with SMTP id
 b17-20020a05600010d100b0022e3bc5c91cmr20234951wrx.368.1665658157147; 
 Thu, 13 Oct 2022 03:49:17 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a5d4910000000b00232251d71c7sm1718573wrq.68.2022.10.13.03.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 03:49:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2AD5D1FFB7;
 Thu, 13 Oct 2022 11:49:16 +0100 (BST)
References: <20221011173229.57909-1-anjo@rev.ng>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Anton Johansson <anjo@rev.ng>
Cc: qemu-devel@nongnu.org, ale@rev.ng, tsimpson@quicinc.com,
 bcain@quicinc.com, mlambert@quicinc.com
Subject: Re: [PATCH] tests/docker: Add flex/bison to `debian-all-test`
Date: Thu, 13 Oct 2022 11:49:10 +0100
In-reply-to: <20221011173229.57909-1-anjo@rev.ng>
Message-ID: <87r0zcov6b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Anton Johansson <anjo@rev.ng> writes:

> Adds flex/bison to the debian-all-test-cross container which was missed
> in the previous CI patch. These dependencies are required by the
> idef-parser patchset for target/hexagon.
>
> Signed-off-by: Anton Johansson <anjo@rev.ng>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

