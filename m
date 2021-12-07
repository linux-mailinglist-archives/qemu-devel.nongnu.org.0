Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A641C46C3EE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 20:46:29 +0100 (CET)
Received: from localhost ([::1]:36892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mugQ0-0001R8-AN
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 14:46:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@colorremedies.com>)
 id 1mugON-0000S4-0n
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 14:44:47 -0500
Received: from [2607:f8b0:4864:20::b2e] (port=44702
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chris@colorremedies.com>)
 id 1mugOK-0001tK-Gu
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 14:44:46 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id q74so333114ybq.11
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 11:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=colorremedies-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=pv56N59OYh3OWyRpYvYAFVCTCVe97urRbwQLcjCWj1U=;
 b=HloGL6JK5hAt0vcc1u0lemz2erhjdaHNJdEDFUtOO1r9b3Fd1g1uncPYx4L9yAk829
 p49NdCiCOv6v33DAPWT5QTr28bY6lWpY6OWUDEk/OJW8ZMHuElDjOnEj0AA4h57lseEB
 Giq0ltwks9WkVarYX3Lvu5huzPoDv8bX7eNoIWE9adAEehu/K9tAh2cL9h9QsGGOBVdN
 7QbEMvgHF02qaNkfrwK5GJJvBHtFgz+KvtyesXLmOSxUtUpNmBgh/2lQJDsV7sahMPhe
 bI5Vcw80c1jVveI582QR/DGF+5+EvLgkd5cC1AhT8bLq7haUAnxyyShaFNH7CiUeUd60
 DuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=pv56N59OYh3OWyRpYvYAFVCTCVe97urRbwQLcjCWj1U=;
 b=nb1gvWDjyXcLOYP+uWdYoPBGZ0mqrJrPO0BseTi++xDr5yWDUN6dUmMvvu3vw3Ce+0
 fkhiPiL1MU07/c6vY0cYmZZTy5zaI7s4SDMIeWFqva/tppP0T/qQg0bnUZGRrF+6Q9Uy
 xzw5CaFDOnFNO7aiVWhl+ii16gJTSnilwQ3FNr6nb9o1lF2TjTZv29Xrq/hKWmZq5jNT
 ZVLS8i0tlvquAnxe97rCNOnvQZyQ21s10o2A/fwVdLkeIrxTKcHnk8cKsWG4RTw9cQjW
 Vz130Zcnre8N7YdmtagknZZzbC/GX9dq/wz1TwGVXPgDe21hwHP/1SIux2l+5VPMewj6
 NZhA==
X-Gm-Message-State: AOAM531oRoRqNjoTt7thEESwStceyZEmU2/wB7U+0+uTu/TTsbMS5xHM
 pAzvMz3nTOdMGuLf9H2pTHx5RHQ2wDmVRMEkcEiSzncFlJzg5/0h
X-Google-Smtp-Source: ABdhPJxyCd41kLJfg21VXYAm0CDv6SDKVQ/tZgKVJkeTQ49n2d6/JcQ5LAL0yZR0dkwSr5PYS5NojP3hhfHR5fA7/RY=
X-Received: by 2002:a25:e543:: with SMTP id c64mr49019799ybh.239.1638906282813; 
 Tue, 07 Dec 2021 11:44:42 -0800 (PST)
MIME-Version: 1.0
From: Chris Murphy <lists@colorremedies.com>
Date: Tue, 7 Dec 2021 14:44:27 -0500
Message-ID: <CAJCQCtSx_OFkN1csWGQ2-pP1jLgziwr0oXoMMb4q8Y=UYPGqAg@mail.gmail.com>
Subject: dozens of qemu/kvm VMs getting into stuck states since kernel ~5.13
To: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=chris@colorremedies.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cc: qemu-devel

Hi,

I'm trying to help progress a very troublesome and so far elusive bug
we're seeing in Fedora infrastructure. When running dozens of qemu-kvm
VMs simultaneously, eventually they become unresponsive, as well as
new processes as we try to extract information from the host about
what's gone wrong.

Systems (Fedora openQA worker hosts) on kernel 5.12.12+ wind up in a
state where forking does not work correctly, breaking most things
https://bugzilla.redhat.com/show_bug.cgi?id=2009585

In subsequent testing, we used newer kernels with lockdep and other
debug stuff enabled, and managed to capture a hung task with a bunch
of locks listed, including kvm and qemu processes. But I can't parse
it.

5.15-rc7
https://bugzilla-attachments.redhat.com/attachment.cgi?id=1840941
5.15+
https://bugzilla-attachments.redhat.com/attachment.cgi?id=1840939

If anyone can take a glance at those kernel messages, and/or give
hints how we can extract more information for debugging, it'd be
appreciated. Maybe all of that is normal and the actual problem isn't
in any of these traces.

Thanks,

--
Chris Murphy

