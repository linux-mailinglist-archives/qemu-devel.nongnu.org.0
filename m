Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DE96A9691
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 12:40:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY3kj-0005HC-E4; Fri, 03 Mar 2023 06:39:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pY3kh-0005Gn-LV
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:39:07 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pY3kf-0000o8-MS
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:39:07 -0500
Received: by mail-wm1-x332.google.com with SMTP id az36so1391826wmb.1
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 03:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N1Tr3cEn0IPoDXwpyECThq8K4uK3jdwJbxgzsMW3+uw=;
 b=kRhCDQkvXiR7LHb2WlH2WRai5r9vTs0fEE5NdhlShrP4rxpB7C52aOSfEaL0qHre9a
 r8SFQH0xP/4F/gu7AeVoa7W9jfIH8KV5v/U4Q2k/qHuS3LOb8hCKl6FP8UCiDCIR5uzB
 nr3ZWiHYeHxZwQSVSEW1bLMUDnvMl/K8AeBQA4fHo/mwLM7dIikmBCHEMprdFO556GYa
 9kjrWXADqarTJrIzAnihSR/V81h4kFH35MCDWzBmYEFH1K7crxe00KwXLi4C/RGzN9dd
 Ko9aETKoDlnDsQPBwkwDsWY/hJiyZ2g8l2M7vbmGCBwTRaaYFzck5VR405s+M5vSLUyO
 ciPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=N1Tr3cEn0IPoDXwpyECThq8K4uK3jdwJbxgzsMW3+uw=;
 b=Y+HooM54xLbdDe4dQA2UlaaTZdjlEwMh2M7xS/1ExqEOHa1+Fcz7pQk1qwL5DUcDir
 Pc9Gu8TGE6CE3WCImPvejtsoGLZfOhnk02IXg00pFI0iNi44iCTP7Hcl5VaT5p7oW+MM
 +D89W77cfcP6o/OSWWsn/YLi+c2g7tUkgOxtI5G4in2ovkvRt3x8ap84OtMs5qG0/3PT
 7UU38SLk52k9/EwxNis3aZQ8XNfgxAs7lhRtkKL54GG+kPF4claXpMSkXGbGGjRhgmel
 9YQROpKH3RY5HCorl0MeYoB5+mv42CS7BSJ8SmnRHw/JFjLR0o2wn2Rr7N52atVliPK9
 vEJw==
X-Gm-Message-State: AO0yUKV/XOrS6zdF02xWnIssAQ7p5C2L4v1R/2T6y/RiiQw+y4o8nvDz
 pfjjLUO8GVmB3d5UiFNcv946ZQ==
X-Google-Smtp-Source: AK7set9F54Y+eKffj27o0gvXZbaQ3VEJOakVtGa6pipbHbTy1A48Aq/y/R4yvH/g1xJrHPEZ6k9FoA==
X-Received: by 2002:a1c:f304:0:b0:3eb:29fe:734a with SMTP id
 q4-20020a1cf304000000b003eb29fe734amr1271221wmq.39.1677843544320; 
 Fri, 03 Mar 2023 03:39:04 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003e00c453447sm5290606wmc.48.2023.03.03.03.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 03:39:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 907B31FFB7;
 Fri,  3 Mar 2023 11:39:03 +0000 (GMT)
References: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
 <20230302191146.1790560-3-marcin.juszkiewicz@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Radoslaw Biernacki <rad@semihalf.com>, Peter Maydell
 <peter.maydell@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Da?=
 =?utf-8?Q?ud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH 3/3] tests/avocado: add Alpine Linux boot on
 AArch64/sbsa-ref
Date: Fri, 03 Mar 2023 11:38:31 +0000
In-reply-to: <20230302191146.1790560-3-marcin.juszkiewicz@linaro.org>
Message-ID: <87bkla9i94.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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


Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> writes:

> To unify tests for AArch64/virt and AArch64/sbsa-ref we boot
> same Alpine Linux image on both.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  tests/avocado/machine_aarch64_sbsaref.py | 29 ++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/mac=
hine_aarch64_sbsaref.py
> index e36e53d4d5..fdbde4b891 100644
> --- a/tests/avocado/machine_aarch64_sbsaref.py
> +++ b/tests/avocado/machine_aarch64_sbsaref.py
> @@ -148,3 +148,32 @@ def test_sbsaref_linux_max(self):
>          :avocado: tags=3Dcpu:max
>          """
>          self.boot_linux('max')
> +
> +    # This tests the whole boot chain from EFI to Userspace
> +    # We only boot a whole OS for the current top level CPU and GIC
> +    # Other test profiles should use more minimal boots
> +    def test_alpine_sbsaref_max(self):
> +        """
> +        :avocado: tags=3Darch:aarch64
> +        :avocado: tags=3Dmachine:sbsa-ref
> +        """
> +        self.fetch_firmware()
> +
> +        iso_url =3D ('https://dl-cdn.alpinelinux.org/'
> +                   'alpine/v3.17/releases/aarch64/'
> +                   'alpine-standard-3.17.2-aarch64.iso')
> +
> +        # Alpine use sha256 so I recalculated this myself
> +        iso_sha1 =3D '76284fcd7b41fe899b0c2375ceb8470803eea839'
> +        iso_path =3D self.fetch_asset(iso_url, asset_hash=3Diso_sha1)
> +
> +        self.vm.set_console()
> +        self.vm.add_args("-cpu", "max,pauth-impdef=3Don")
> +        self.vm.add_args("-machine", "sbsa-ref")
> +        self.vm.add_args("-drive", f"file=3D{iso_path},format=3Draw")
> +        self.vm.add_args('-device', 'virtio-rng-pci,rng=3Drng0')
> +        self.vm.add_args('-object', 'rng-random,id=3Drng0,filename=3D/de=
v/urandom')
> +
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'Welcome to Alpine Linux 3.17')
> +

This seems to get to grub before hanging:

  2023-03-03 11:35:53,696 protocol         L0495 DEBUG| Transitioning from =
'Runstate.CONNECTING' to 'Runstate.RUNNING'.
  2023-03-03 11:35:53,700 __init__         L0153 DEBUG| NOTICE:  Booting Tr=
usted Firmware
  2023-03-03 11:35:53,700 __init__         L0153 DEBUG| NOTICE:  BL1: v2.8(=
release):v2.8-335-g6264643a0
  2023-03-03 11:35:53,700 __init__         L0153 DEBUG| NOTICE:  BL1: Built=
 : 17:51:50, Feb  8 2023
  2023-03-03 11:35:53,703 __init__         L0153 DEBUG| NOTICE:  BL1: Booti=
ng BL2
  2023-03-03 11:35:53,707 __init__         L0153 DEBUG| NOTICE:  BL2: v2.8(=
release):v2.8-335-g6264643a0
  2023-03-03 11:35:53,707 __init__         L0153 DEBUG| NOTICE:  BL2: Built=
 : 17:51:50, Feb  8 2023
  2023-03-03 11:35:53,722 __init__         L0153 DEBUG| NOTICE:  BL1: Booti=
ng BL31
  2023-03-03 11:35:53,727 __init__         L0153 DEBUG| NOTICE:  BL31: v2.8=
(release):v2.8-335-g6264643a0
  2023-03-03 11:35:53,727 __init__         L0153 DEBUG| NOTICE:  BL31: Buil=
t : 17:51:50, Feb  8 2023
  2023-03-03 11:35:53,732 __init__         L0153 DEBUG| UEFI firmware (vers=
ion 1.0 built at 16:17:37 on Feb  9 2023)
  2023-03-03 11:35:57,556 __init__         L0153 DEBUG| ESC[2JESC[04DESC[=
=3D3hESC[2JESC[09DESC[0mESC[30mESC[47mWelcome to GRUB!
  2023-03-03 11:35:57,599 __init__         L0153 DEBUG| ESC[0mESC[37mESC[40=
mESC[0mESC[30mESC[40mESC[2JESC[01;01HESC[0mESC[37mESC[40mESC[02;30HGNU GRUB=
  version 2.06
  2023-03-03 11:35:57,624 __init__         L0153 DEBUG| ESC[01C/-----------=
-----------------------------------------------------------------\ESC[05;02=
H|ESC[76C|ESC[06;02H|ESC[76C|ESC[07;02H|ESC[76C|ESC[08;02H|ESC[76C|ESC[09;0=
2H|ESC[76C|ESC[10;02H|ESC[76C|ESC[11;02H|ESC[76C|ESC[12;02H|ESC[76C|ESC[13;=
02H|ESC[76C|ESC[14;02H|ESC[76C|ESC[15;02H|ESC[76C|ESC[16;02H|ESC[76C|ESC[17=
;02H|ESC[76C|ESC[18;02H\---------------------------------------------------=
-------------------------/ESC[19;02HESC[20;02H     Use the ^ and v keys to =
select which entry is highlighted.
  2023-03-03 11:35:57,628 __init__         L0153 DEBUG| Press enter to boot=
 the selected OS, `e' to edit the commands
  2023-03-03 11:35:57,632 __init__         L0153 DEBUG| before booting or `=
c' for a command-line.                           ESC[05;80H
  2023-03-03 11:35:57,698 __init__         L0153 DEBUG| ESC[0mESC[30mESC[47=
mESC[05;03H*Linux lts                                                      =
            ESC[0mESC[37mESC[40mESC[01DESC[06;03H                          =
                                                  ESC[01DESC[07;03H        =
                                                                    ESC[01D=
ESC[08;03H                                                                 =
           ESC[01DESC[09;03H                                               =
                             ESC[01DESC[10;03H                             =
                                               ESC[01DESC[11;03H           =
                                                                 ESC[01DESC=
[12;03H                                                                    =
        ESC[01DESC[13;03H                                                  =
                          ESC[01DESC[14;03H                                =
                                            ESC[01DESC[15;03H              =
                                                              ESC[01DESC[16=
;03H                                                                       =
     ESC[01D
  ESC[17;03H                                                               =
             ESC[01DESC[02C
  2023-03-03 11:35:58,724 __init__         L0153 DEBUG| ESC[05;78HESC[23;01=
H   The highlighted entry will be executed automatically in 1s.            =
     ESC[05;78HESC[23;01H   The highlighted entry will be executed automati=
cally in 0s.                 ESC[05;78HESC[0mESC[30mESC[40mESC[2JESC[01;01H=
ESC[0mESC[37mESC[40mESC[0mESC[30mESC[40mESC[2J
  ESC[04DESC[0mESC[37mESC[40m  Booting `Linux lts'
  2023-03-03 11:37:51,367 stacktrace       L0039 ERROR|=20
  2023-03-03 11:37:51,368 stacktrace       L0041 ERROR| Reproduced tracebac=
k from: /home/alex/lsrc/qemu.git/builds/arm.all/tests/venv/lib/python3.9/si=
te-packages/avocado/core/test.py:770
  2023-03-03 11:37:51,368 stacktrace       L0045 ERROR| Traceback (most rec=
ent call last):
  2023-03-03 11:37:51,368 stacktrace       L0045 ERROR|   File "/home/alex/=
lsrc/qemu.git/builds/arm.all/tests/avocado/machine_aarch64_sbsaref.py", lin=
e 178, in test_alpine_sbsaref_max


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

