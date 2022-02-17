Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875744B954A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 02:17:09 +0100 (CET)
Received: from localhost ([::1]:43232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKVPw-0007zl-Cd
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 20:17:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.ellis.smith@gmail.com>)
 id 1nKVNd-0007IR-P9
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 20:14:45 -0500
Received: from [2607:f8b0:4864:20::631] (port=37705
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ben.ellis.smith@gmail.com>)
 id 1nKVNb-0008Jy-NR
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 20:14:45 -0500
Received: by mail-pl1-x631.google.com with SMTP id x4so3378325plb.4
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 17:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=T+CUSWjHZc3kG0jLKVbXxd8ceyKUldfzOvmvrGNcjjE=;
 b=BMuL7E+z1mKejCzM78tN48C4o/0j8ujS++jvziUV6H9AdyXrAqySunKfo6D5Bo+0nE
 JIgn4KuF29NLNRtzCOmYbCH9FHWdKsBjqykzYUIR9YIHitVQkTzHN4+pCtmMq0bZEhN7
 106HggM24BonkJIh4LDWsWAKXNBJg3jOMi6kEHSncEn5jMbFx2DsXTE5mCY0vF3WO5wd
 tZ7sE7o8kDR1DIRjSFH/2mU1zsIDyobxqxhTgIP4VOJ8c9OtTfTJm+QYJU8g2ahqTMd7
 FRq4nERNp1W1S+mK5e+aHMXt3lR04YE9nplKqUDTWGDj18Yw5d/l1M6dH9FqjLG11HRA
 PKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=T+CUSWjHZc3kG0jLKVbXxd8ceyKUldfzOvmvrGNcjjE=;
 b=j52DWUtxDT2oz9u/5opPi7UoVNU6i1qnyAIDBQHbW2rVWJ/HEJ3s9g2MhNvlFp06Xa
 KL8k8HzbxRyAJ7DIUhmE1w16yCLpuPCY8mGAWR/sVWBQVXW4h0uxIjcMhpQ8kCukikkC
 gbDdDuikmpE7HW/Hhtb3DogpOWzrn7TuVejwVWag2lDKrRTi0WMmTpW4r6hnSpvQafGr
 h5F0VlerS3bAVyemUivpQmD6ENS03vlUfdZ9Xy/LSim9I35ITrnJOy6+DSTLS3RruEPE
 olpEOfmnWZ1uy1HK3EKQxqnxLtierEhrM8zoPfPIbl7iIT9yi7toZ+jyWjnjJdoYhTQs
 E7MQ==
X-Gm-Message-State: AOAM533ddRQY3x5jzTexgIJPAx2kIkbo2ER5eXDGtql5qLVKLrBZDbZQ
 R83pNAxiS40oFwLaQ1E3YGSKXFNe57sMMjVCorNFKRApVA5U4Q==
X-Google-Smtp-Source: ABdhPJziMuxIDE3mJmDSz+EGAxTFSXCidbWXFlIVsD/ahto+zIg/LVju2uFlszXIQTM17vZ6AlZmNaGo9+Ba9UP6ioI=
X-Received: by 2002:a05:6102:cd0:b0:310:4636:78c5 with SMTP id
 g16-20020a0561020cd000b00310463678c5mr140513vst.45.1645060048094; Wed, 16 Feb
 2022 17:07:28 -0800 (PST)
MIME-Version: 1.0
From: Ben Smith <ben.ellis.smith@gmail.com>
Date: Thu, 17 Feb 2022 12:07:15 +1100
Message-ID: <CAK7yb4TeKr2br6RthdQwiU2+JGrWcs3ZgWbWHOYGEJ=Ae2z36Q@mail.gmail.com>
Subject: qemu crash 100% CPU with Ubuntu10.04 guest (solved)
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=ben.ellis.smith@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: 27
X-Spam_score: 2.7
X-Spam_bar: ++
X-Spam_report: (2.7 / 5.0 requ) AC_FROM_MANY_DOTS=2.999, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi All,

I'm cross-posting this from Reddit qemu_kvm, in case it helps in some
way. I know my setup is ancient and unique; let me know if you would
like more info.

Symptoms:
1. Ubuntu10.04 32-bit guest locks up randomly between 0 and 30 days.
2. The console shows a CPU trace dump, nothing else logged on the guest or host.
3. Host system (Ubuntu20.04) 100% CPU for qemu process.

Solution:
When using virt-install, always use the "--os-variant" parameter!
e.g. --os-variant ubuntu10.04

From the man page "--os-variant... Optimize the guest configuration
for a specific operating system".
In this case, "optimize" apparently means "stop the crashing".

I was deliberately avoiding the option because the VM was already
performing much better than expected and I didn't want to complicate
the configuration.

This was very, very painful to troubleshoot; Involving spinning up 60
VMs simultaneously, waiting for a failure, changing one parameter,
repeat. :(

