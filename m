Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDF16A8F2C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 03:27:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXv7m-0000qu-M1; Thu, 02 Mar 2023 21:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hshan@google.com>) id 1pXv7f-0000pS-Rj
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:26:16 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hshan@google.com>) id 1pXv7e-0007PI-1c
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:26:15 -0500
Received: by mail-pl1-x62a.google.com with SMTP id ky4so1303574plb.3
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1677810371;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=yWq1b42T5OkEZJaONEGUZy+16inY6nykNkwD2+9MX+g=;
 b=dJ/MTr5oAWNgFxdfadMrOSa5lS4Ex46jg6jW23N0lRXw8T1ClXYVgzZ5hFAdLjX0DM
 8Zbvw+opxaO44lhS9gwvT3QPHN3PzPBWmNltNubArKYdGW+pegMFdETTCdV9qGR7C8fb
 wXVXCuYAR06jmJMkvbTPaEPh9N7mBsBA+hDouC72+dp8CLbBGHT7WVZGsvlpYWBNYCCM
 ELCOdDmMwurJWeaLtC7/PzlOpecAdW68jVrS2/zKW6yOd4y0SahPmSAFe/4fVZ72BIcp
 0c20ftJn519VS9FUO0A0ZvbId+so3oBGBJx1vVC/Z8nr48RxOrZPPB0DKaUgcuXm6ONe
 nEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677810371;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yWq1b42T5OkEZJaONEGUZy+16inY6nykNkwD2+9MX+g=;
 b=1xbgSVTlQTp/fXxU4iHS5fvpMbTMiuiLVzHl2njL0Z+VypLuDNmhLthB1rY6QQ/uZb
 xQnnxA/cuotVDaKioWgWtQvZnDdpcF87qg5WGKORAiUYOHxgYiZ0sbckRJqK2AAy6ihv
 RMoV6C3gpx49+M0liLdvsW3AYDbAJ7+tzl6QfG87OwlEWFUpye9WSHpZff4tJt6asA7b
 f9o9UVVUpkfg545qBKIvWnnbGVmKokYogGoytQylDPMX37tPDb6yuqlISY3Wt29dyq1O
 C+0FCEnqgISF0eMtC2AWv5MBdZuLrPNd69CpYoXqXQCWE54AzDdOxGnF6p7SDeJ+nQhi
 Q+iw==
X-Gm-Message-State: AO0yUKURD3mYQ6QMMFcA4eROC/SFzaZY/ZFgStmFjtbrBX7Hng58Ex8P
 Q+AFghMzrEMhuQii5Bk58TGXYZM5xEE61hWN7VK5JYNdsU+XF5KCsl0=
X-Google-Smtp-Source: AK7set/MbZBbYi6hBSKxnHcuMq5LMBW58GvlYBQBSnPzRelt7LfTe33Zbv8Z/+BWkbv8u5PLsXcZUJcfeq2zkay+JSM=
X-Received: by 2002:a17:90b:368e:b0:233:d131:29be with SMTP id
 mj14-20020a17090b368e00b00233d13129bemr4694371pjb.9.1677810370700; Thu, 02
 Mar 2023 18:26:10 -0800 (PST)
MIME-Version: 1.0
From: Haitao Shan <hshan@google.com>
Date: Thu, 2 Mar 2023 18:25:59 -0800
Message-ID: <CAGD3tSzW1QoAsn+uGjoAkBegLt1iZ=9YWDFcvqbcHMr0S_5kVw@mail.gmail.com>
Subject: [PATCH 0/6] Adding the Android Emulator hypervisor driver accelerator
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=hshan@google.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

Hi, qemu maintainers and community members,

The following 6 patches implemented a new x86_64 CPU accelerator called
the Android Emulator hypervisor driver (AEHD).

The Android Emulator hypervisor driver is a hypervisor for Windows (7
or later), made by porting the KVM from the linux kernel 4.9-rc7. Its
initial purpose was to support the Android Emulator on the AMD
platforms as the old name "Android Emulator Hypervisor Driver for AMD
Processors" suggested. Despite the name, Intel processors have been
supported ever since its first release. Since Intel dropped HAXM support,
the android emulator is switching from HAXM to AEHD.
Refer to:
https://github.com/google/android-emulator-hypervisor-driver.

This patchset implements the user space support for the new
hypervisor. It was initially made by cloning and modifying the KVM
source codes. In order to support users who wanted to use the new
hypervisor to run generic OSes such as Windows and Ubuntu,  it was
periodically rebased to latest QEMU releases ever since QEMU v4.2.0.
Refer to: https://github.com/qemu-gvm/qemu-gvm.

Given that both the Windows driver and patched QEMU were out and
tested for a few years, we would like to see if we could submit our
work to the QEMU community. Users can have another choice of
hypervisor on Windows.

The patchset is tested on Windows 11 (64bit) with the AEHD 2.1 by
installing Ubuntu 22.04 and Windows 10 guests and playing with
savevm/loadvm. It is also tested on Linux (Ubuntu 22.04) and MacOS
(Intel and Apple Silicon), making sure it does not break others.

Any comments are welcome. Thanks!

Note:
The Android Emulator hypervisor driver will be maintained by
Google. However, there is no plan to rebase it to the latest KVM.

-- 
Haitao @Google

