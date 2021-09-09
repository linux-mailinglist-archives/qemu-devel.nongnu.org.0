Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4900D405E9A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 23:07:38 +0200 (CEST)
Received: from localhost ([::1]:45262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mORGi-0003K3-T2
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 17:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mORFW-0002e7-Dy
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 17:06:22 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:38436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mORFV-00012t-3W
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 17:06:22 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id z12so2110055qvx.5
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 14:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=zWNdv1Lxu6hA4xftpOW/hOYKgR1vaBUT+XW1EYeoyrA=;
 b=ksJ/de18U9Xqw3HDglFxdQs9z81cIXLnYK1Hsq+ugb2WqiWwRB6g8tc7Hn9klNUfGS
 iF/nCy/gdrCWbs2CeIc1Nay8KCW6i927rA4WtgDs64vDGG4utBFCir2MyEs4GN/OrD7U
 Ya2V6tVGm2gUtZUBfweff8oUzgqyLiea5etgsxDGLLYJhmUtEVm5YvmLS6/TDuqxheAX
 6M2EUMxv8L9oMVOcFqCrO8AfJxEImUWcSJRIat4JSaecZAZdHShb1jnhOvsjWihrsqQ0
 p/nziSgea6CP/+2TkvQpnai29WuRTXC+yOWheHjGwysXVMLc4MkCI0Mdyhm6Bqg1hgVs
 hsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=zWNdv1Lxu6hA4xftpOW/hOYKgR1vaBUT+XW1EYeoyrA=;
 b=Y0zRE++ebG7DivmIgJgCOpD1/S0kuRddpE09uSrM3NIL4kc4rtkYd/NSevRIMpj3i+
 MWhjH14TSWfA+C+3jkYGSuufWTMCEBd9nLbE+FVDzerM5gj6zmm1nWu2kryxxW06apgD
 eejY8OWtP3LkYXABYaEp1nB5C6t3WDbmAbQsO+sJkJfjtIvTwKDsgWED5jwzWP+NNC4U
 Gp8nGeFquETTiRD0/EROTgvXI5p84C6kA1xgAC3ZdsAwK1noOGmtz+/gvN6PgkeizXsI
 Lu8dyfS5ncQqISou7z6DEawqllR5rXw0N4/Y6D6QmkH7d+wYGcGJLpAJ8uiuLohf9hS+
 lHIw==
X-Gm-Message-State: AOAM530NMFK2ka+kdRingwUbKHpMNMFU31UEvj3kPDCYHnt3aGo5xrPj
 8M3CNU9r6U+3lBIqNXX87yY=
X-Google-Smtp-Source: ABdhPJzvWASW7HACmQ0jB2k6JqWT/9V4HxsT8cu8gffACNzvs0rYs+CEai1l87jRdaixb0qRDCJWHw==
X-Received: by 2002:a0c:f10b:: with SMTP id i11mr5082824qvl.67.1631221579139; 
 Thu, 09 Sep 2021 14:06:19 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id d13sm1854406qtm.32.2021.09.09.14.06.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Sep 2021 14:06:18 -0700 (PDT)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Implementing isochronous transfers in hw/hcd-ohci.c
Message-Id: <263FF66A-21D7-4D0D-BE37-2D44B484A1EE@gmail.com>
Date: Thu, 9 Sep 2021 17:06:17 -0400
To: Gerd Hoffmann <kraxel@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=programmingkidx@gmail.com; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,

Howard and I were talking about USB audio problems with Mac OS guests. =
We think the issue might be with frames being sent to the USB audio card =
too soon. My guess is only one frame is suppose to be transmitted every =
1 millisecond. I was also reading the todo notes in the file =
hw/hcd-ohci.c. This is what it says:

 * TODO:
 *  o Isochronous transfers
 *  o Allocate bandwidth in frames properly
 *  o Disable timers when nothing needs to be done, or remove timer =
usage
 *    all together.
 *  o BIOS work to boot from USB storage
*/

Do you think implementing isochronous transfers would fix the audio =
problems Mac OS guest are experiencing?=

