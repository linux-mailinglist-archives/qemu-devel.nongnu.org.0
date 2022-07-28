Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B733583BE8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 12:19:06 +0200 (CEST)
Received: from localhost ([::1]:33694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH0bg-00084R-Nj
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 06:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yan@daynix.com>) id 1oH0Wo-0005xc-2R
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 06:14:02 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yan@daynix.com>) id 1oH0Wl-0004dW-Hz
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 06:14:01 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 i10-20020a1c3b0a000000b003a2fa488efdso67697wma.4
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 03:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc;
 bh=OwtQ01iyvWW02aEqU8I1cLzmE86cVtLSJOim+G3EiMo=;
 b=nC6N1+FIfZ8qW8P0WLRt9JA3s69lzCNOcSga+7s0vxdLP3XjZhzqaIkwkP5P1tgdci
 GR29rDWmzdTuVrv+SOFKki7grcLPwYUiqICTNkz5XhDaGc4HlU/7v/OjyUWcuiqFLq5w
 XxlGRm45fSYhULfaBFChgd0iPEaaWaecoYNrA1cFSRmVPSds/r64v9iD0YBl+QaoJDmb
 DDT76x+FsCCNvJoWCquIF8cbzw2e7TqhQbbyL6e1OOVJJx1N3F1SLvDT+LLLDn/gXuhc
 sLzhGwsywrEMLyiwnEFIBOkxkyeil52HKUcWSpIYYBKOX6evRjV1ebxhgp/HO558pWb5
 /7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc;
 bh=OwtQ01iyvWW02aEqU8I1cLzmE86cVtLSJOim+G3EiMo=;
 b=uwGP+W4X+LRNSJStudkS/kriH7QxBREPFDY0nRMWUHMYPGCCYEMkP4QhaUa+HYXZJs
 YVL5H69krGH/Ywyt1Fi6r8jA2uBdAW4+5MWx2UhbTKtTj4QpHlW9UL1mZ1XM82Bb//cp
 4Ktt6ca4zOuAPJRs5dfJT90LQELZrISUDVWNvHGk5fit5//2QaSkkK33sojx6ZEwzgq7
 uvplY/o5DmhcGpPY9zp92mJvlo+Tu/XfUKDeSHlnAysYXv5i18gqOWumB0BdrOklKx/n
 yS32Fdf+cCVWPII54X+5DEOEXs0oQElc0LO1iwICH9U1+hPqn9f47VjUKSptbIagIYs/
 ULDw==
X-Gm-Message-State: AJIora8DChMeYI4HN+/c+h0cYw9q/d8gfw2MFPAFQAlwVmnmk2rZhbSy
 U/tpRx7ykYg92sTWTTUR692vCw==
X-Google-Smtp-Source: AGRyM1vHfpjCseABSE4t/EiEtNmp3FM9HuOorpTvtmL0uvz/Z+yWRkdPxuVojee2GnZDIh6FNDVYjw==
X-Received: by 2002:a05:600c:3b9e:b0:3a2:feb5:2b43 with SMTP id
 n30-20020a05600c3b9e00b003a2feb52b43mr6073835wms.26.1659003237562; 
 Thu, 28 Jul 2022 03:13:57 -0700 (PDT)
Received: from smtpclient.apple (bzq-84-110-34-91.static-ip.bezeqint.net.
 [84.110.34.91]) by smtp.gmail.com with ESMTPSA id
 r21-20020a05600c35d500b003a17ab4e7c8sm5441937wmq.39.2022.07.28.03.13.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jul 2022 03:13:56 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Guest reboot issues since QEMU 6.0 and Linux 5.11
From: Yan Vugenfirer <yan@daynix.com>
In-Reply-To: <eb0e0c7e-5b6f-a573-43f6-bd58be243d6b@proxmox.com>
Date: Thu, 28 Jul 2022 13:13:54 +0300
Cc: kvm@vger.kernel.org, QEMU Developers <qemu-devel@nongnu.org>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>,
 Mira Limbeck <m.limbeck@proxmox.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1675C8E3-D071-4F5A-814B-A06C281CC930@daynix.com>
References: <eb0e0c7e-5b6f-a573-43f6-bd58be243d6b@proxmox.com>
To: Fabian Ebner <f.ebner@proxmox.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Received-SPF: none client-ip=2a00:1450:4864:20::336;
 envelope-from=yan@daynix.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Fabian,

Can you save the dump file with QEMU monitor using dump-guest-memory or =
with virsh dump?
Then you can use elf2dmp (compiled with QEMU and is found in =
=E2=80=9Ccontrib=E2=80=9D folder) to covert the dump file to WinDbg =
format and examine the stack.=20


Best regards,
Yan.


> On 21 Jul 2022, at 3:49 PM, Fabian Ebner <f.ebner@proxmox.com> wrote:
>=20
> Hi,
> since about half a year ago, we're getting user reports about guest
> reboot issues with KVM/QEMU[0].
>=20
> The most common scenario is a Windows Server VM (2012R2/2016/2019,
> UEFI/OVMF and SeaBIOS) getting stuck during the screen with the =
Windows
> logo and the spinning circles after a reboot was triggered from within
> the guest. Quitting the kvm process and booting with a fresh instance
> works. The issue seems to become more likely, the longer the kvm
> instance runs.
>=20
> We did not get such reports while we were providing Linux 5.4 and QEMU
> 5.2.0, but we do with Linux 5.11/5.13/5.15 and QEMU 6.x.
>=20
> I'm just wondering if anybody has seen this issue before or might have =
a
> hunch what it's about? Any tips on what to look out for when debugging
> are also greatly appreciated!
>=20
> We do have debug access to a user's test VM and the VM state was saved
> before a problematic reboot, but I can't modify the host system there.
> AFAICT QEMU just executes guest code as usual, but I'm really not sure
> what to look out for.
>=20
> That VM has CPU type host, and a colleague did have a similar enough =
CPU
> to load the VM state, but for him, the reboot went through normally. =
On
> the user's system, it triggers consistently after loading the VM state
> and rebooting.
>=20
> So unfortunately, we didn't manage to reproduce the issue locally yet.
> With two other images provided by users, we ran into a boot loop, =
where
> QEMU resets the CPUs and does a few KVM_RUNs before the exit reason is
> KVM_EXIT_SHUTDOWN (which to my understanding indicates a triple fault)
> and then it repeats. It's not clear if the issues are related.
>=20
> There are also a few reports about non-Windows VMs, mostly Ubuntu =
20.04
> with UEFI/OVMF, but again, it's not clear if the issues are related.
>=20
> [0]: https://forum.proxmox.com/threads/100744/
> (the forum thread is a bit chaotic unfortunately).
>=20
> Best Regards,
> Fabi
>=20
>=20
>=20


