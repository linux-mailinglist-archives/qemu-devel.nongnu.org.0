Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D2D6A8B31
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:26:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqQh-0005u6-IT; Thu, 02 Mar 2023 16:25:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pXqQd-0005gD-VF; Thu, 02 Mar 2023 16:25:32 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pXqQc-0004SB-ED; Thu, 02 Mar 2023 16:25:31 -0500
Received: by mail-ed1-x531.google.com with SMTP id cw28so2530530edb.5;
 Thu, 02 Mar 2023 13:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677792328;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XAUO1YXcOBjdg+DnX6dktKeqsUXpQMrcfox5EiQpiho=;
 b=VoFtJSaHDtkCboaZAv1q/0bToiqblTmpci3tAwQndfrk8TVFue6CdqojvDMzprocu1
 UqnPhe7gYpEQwgEhpbcI8ZLrKPmj0fOsyJjTzstWqqWfeYU7N93aFrUQtAGBCG6IrAU/
 3ma6haQEELzrtvWOxGeOwv27Shj5zk2DxFHlyTj2yfRpEQLM4sjsTAqnzoXi0J5awlFw
 ftkI6Ad8a5aIB99JPOjnzB/Yu0tkJyTwlpUyKmkLXH+U4ZeePR4BkH6WWIM9xRW4spAA
 adFDbKY2LBCnyeDVBo1m7L3YCYpETQwk8MBrJ4UxUxI6o+uki9LmX4e9tboRTzua6sKy
 HLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677792328;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XAUO1YXcOBjdg+DnX6dktKeqsUXpQMrcfox5EiQpiho=;
 b=VC1jkQX7C8fmUfgdIqSeIUNlBByvThoOIk5ERWQfJqgWBM3qnVvrRr89u4x2I31ZOF
 ZSdZ52vnxoa6KL5p1+bWddzTd0k/8tW2wmf6l3zKu4wCmPOUDGzmI0MtrKb1Biki9omY
 7RJ2WDI4NThuansV5nE/B/E3t9d1bQhdfTHsb+a5vgo+MnqjlcTO1tSRoP6zCIy+KqsR
 cA5XmmIjO3qVn/VHzxxCKcXVBBCSQdTMaNy3v+LTn9ghTWJ6E5E4UlwuYetDzGa+5Fzq
 EazcmANXfFyoa08X5bfLShGoa6NoRIpZQ450TTJ2whhRaZnbKJNXU3U6OAU1M+oU/qJD
 dMIQ==
X-Gm-Message-State: AO0yUKW88fiS1hAzVzu3Ei8xakZ0R9nMsp+THciYE1gHIziHAlunDDDV
 WfF2fbDC5eddJYzv967hHf4=
X-Google-Smtp-Source: AK7set/YUu5qlUR9MzOZJi0kVOpabQMuvWvAwUmvSs9+xmG79kROXuyGfX32FFfJRwf6BQPWezwGIw==
X-Received: by 2002:aa7:c498:0:b0:474:a583:2e1a with SMTP id
 m24-20020aa7c498000000b00474a5832e1amr10853812edq.12.1677792327941; 
 Thu, 02 Mar 2023 13:25:27 -0800 (PST)
Received: from [127.0.0.1] (dynamic-092-224-150-004.92.224.pool.telefonica.de.
 [92.224.150.4]) by smtp.gmail.com with ESMTPSA id
 y9-20020a1709064b0900b008b176df2899sm130320eju.160.2023.03.02.13.25.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 13:25:27 -0800 (PST)
Date: Thu, 02 Mar 2023 21:25:14 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>
Subject: Re: [PATCH v7 00/23] Consolidate PIIX south bridges
In-Reply-To: <20230301171819-mutt-send-email-mst@kernel.org>
References: <20230212123805.30799-1-shentey@gmail.com>
 <A5067C75-87DB-4D58-B49E-97BEDF303831@gmail.com>
 <20230301171819-mutt-send-email-mst@kernel.org>
Message-ID: <0433958F-660C-4E33-9AE9-2ADBE1AE6D64@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 1=2E M=C3=A4rz 2023 22:19:12 UTC schrieb "Michael S=2E Tsirkin" <mst@re=
dhat=2Ecom>:
>On Thu, Feb 23, 2023 at 05:25:23PM +0000, Bernhard Beschow wrote:
>> Ping
>>=20
>> Can we queue the piix3 part already? Now that the series doesn't introd=
uce a PIC proxy any more the piix3 part is essentially QOM cleanup=2E
>>=20
>> Note that I cautiously dropped some Reviewed-by tags in the piix3 part =
as well=2E
>>=20
>> Best regards,
>> Bernhard
>
>This conflicts with ICH9 cleanup - I guess once that is merged you will
>rebase right?

I did -- v8 is out!

Best regards,
Bernhard

