Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CC06765C3
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 11:46:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJBMX-0003yn-NZ; Sat, 21 Jan 2023 05:44:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1pJBMV-0003yY-Kq
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 05:44:39 -0500
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1pJBMT-0000bN-Rk
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 05:44:39 -0500
Received: by mail-ot1-x329.google.com with SMTP id
 f88-20020a9d03e1000000b00684c4041ff1so4532376otf.8
 for <qemu-devel@nongnu.org>; Sat, 21 Jan 2023 02:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lenBxHa8eY0Hzyuus8NlqdJj0tSFS6CEoe2Xul6Bigg=;
 b=tg/tiXDoMMJqDaoFE/8G4cF+G6pr2u4lb1pvKPKyGA4UbLR6GrVLCoNVGHefXoZpNo
 0uPr4wxxOq4z/A2g5mbG0kwqCXVHTq9+SjTSUuf2r3zoqWKBmf+kxsbUMLPxGxD8Xiv+
 a74w7iUM0qXjbspxlbn1emix+u5PfeF0+Orj5D1+GvCL33M6ujHFDgZ2vPUhfTn2Bm7e
 WuiecLnYTkN/T3ojyTEJaH/lgEaiPZvLQpQGwruUxbWEMdVpQgZ3knl6Y3jl/h2m2F3f
 MXsqUc7n6TXCpEKTPpWTV49iqs78kiJ1MY9zAUT5/0Sg3Ih8GyDwKFUQGd/vzENqYl3/
 zNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lenBxHa8eY0Hzyuus8NlqdJj0tSFS6CEoe2Xul6Bigg=;
 b=fF4zLa8DkCMyGQBlH39tFPfAiO5Rs2mL1X0jc03YsKY4kXA7rZf3+GUJ0BUfwmwjqY
 k3Wig23aqBBGJh8/3aQ/O0tzS1D6t3osnOz16AyWhusKv0DNIpOYssl9GbvJMlLiRu9r
 SqDgHqICVE14d/n8ZCAfbkRdy/z/MrbAz56llpun5x8hlkszfWi7Wx2ZCHMhKjnhEHC3
 DGpVobwvNt1iigQDnjgs7pzkPVCGdPMEwHarBjeGDjoQvvTZCs0qSaaiOThtVfEeWA0Q
 NNHNfTCFtazvzbKxl4gy3yYoNib4YsD/sR4Gif9J4UMHeUMdrJ1xHresqVokvLl59rqT
 WVWg==
X-Gm-Message-State: AFqh2krx8dM9aB5WQ72f1O0nNHoueV5D46h4Z1YugkhJGCzADybhvbb1
 iEv88Ty6U9p5X2EHkPzIBS6oeHJ7tuMuO9hC
X-Google-Smtp-Source: AMrXdXscksiSPIFoH7ZBji7EjL0T7VinlOVDaMPR7e7Y7ZbPv4agg1D/JPtdnRM+0eOlDcGC50oi2w==
X-Received: by 2002:a9d:639a:0:b0:684:dc1c:fe85 with SMTP id
 w26-20020a9d639a000000b00684dc1cfe85mr9617874otk.36.1674297875852; 
 Sat, 21 Jan 2023 02:44:35 -0800 (PST)
Received: from ?IPV6:2607:fb91:120e:c57a:644e:38ff:fe2e:c8e8?
 ([2607:fb91:120e:c57a:644e:38ff:fe2e:c8e8])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a9d6542000000b0067088ff2b45sm22271188otl.37.2023.01.21.02.44.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Jan 2023 02:44:35 -0800 (PST)
Message-ID: <d64812ad-5c7f-ac9e-bb87-ebc8451c3602@landley.net>
Date: Sat, 21 Jan 2023 04:56:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: QEMU Developers <qemu-devel@nongnu.org>
From: Rob Landley <rob@landley.net>
Subject: Commit 145e2198d749 broke mips big endian.
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::329;
 envelope-from=rob@landley.net; helo=mail-ot1-x329.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

wget https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/mips.tgz extract
and ./run-qemu.sh in there. Before this commit it goes:

loop: module loaded
ata_piix 0000:00:0a.1: enabling device (0000 -> 0001)
scsi host0: ata_piix
scsi host1: ata_piix
ata1: PATA max UDMA/33 cmd 0x1f0 ctl 0x3f6 bmdma 0x1080 irq 14
ata2: PATA max UDMA/33 cmd 0x170 ctl 0x376 bmdma 0x1088 irq 15
pcnet32 0000:00:0b.0: enabling device (0000 -> 0003)
pcnet32: PCnet/PCI II 79C970A at 0x1060, 52:54:00:12:34:56 assigned IRQ 10
pcnet32: eth0: registered as PCnet/PCI II 79C970A
pcnet32: 1 cards_found
NET: Registered PF_INET6 protocol family
Segment Routing with IPv6

Afterwards:

loop: module loaded
NET: Registered PF_INET6 protocol family
Segment Routing with IPv6

and lots of hardware is missing. (I noticed ethernet first.) The mipsel.tgz in
the same directory still worked.

Rob

