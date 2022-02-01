Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC134A60D5
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 16:57:27 +0100 (CET)
Received: from localhost ([::1]:39482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEvX4-0001Zu-TY
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 10:57:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEuQp-0002ck-P5
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:47:10 -0500
Received: from [2a00:1450:4864:20::52b] (port=46962
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEuQg-0002yC-RZ
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:46:51 -0500
Received: by mail-ed1-x52b.google.com with SMTP id m11so34805471edi.13
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 06:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=dFNlnQV90zMJaW+AX+jj7kMg4d9uoBXWnMh4xN9HdZU=;
 b=u+RtONgCz3DjrgAmpsSIiacrerCGcgRRWgPzqO1G6olE593naTA4UraaqAuPnI6PT/
 ZuwNHMAOFq6g/t00HTvnxenuUv1QVa38TY/cq/uFpTxK24rVJK/7V9GIsV99IQ4jewiA
 qQQtcaYOF2VsPZdpNlRtL3OyyoFQsWzJC7aA/jr6Ppdv8QuY+JtgT3lEo/WDAP+KDiY8
 eDkwLo7XzLrTj5BjC2KEpvEivTAUAYhc2gNZ3V+EQZkhONe+I2Djf3Zm+NVTlCo5O2F1
 zAhcjLYUQL34UjXGd5zkV9g1slwx+tzavLAknuFXsimI/cRAm675ioBT3mFKCx/NS7t4
 Oq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=dFNlnQV90zMJaW+AX+jj7kMg4d9uoBXWnMh4xN9HdZU=;
 b=eeugfdHGxeEIB+kKVWFlH5GV+HMD4zKkOeJgMJkTM6sOEsMDhZedWwyNL0Dt7ZN3NE
 1rOlnSqu0qVhqRYN7UYuybZI50vsFI/bte8/zEedLz8AO/uqHzPtIGd30rWXY9qKgpVW
 kVC2sLZqLGGlCw71cEnTbySTZvt7V7wwsjDx/3yYiAMjMMJB8zVGdpJeygtpf/65exsj
 tvokqnCtwbyrrP9fTygHWTtBGaAty9lZ7ytJ4YSVFeKE0B4RsaTII+qhsbvvCbAwLiDT
 BWgSWzMAx9NzLhKLQZgAL076Q3PKFv4RZC3xCjknt+21xK19ITIw/4cWgM8HDgD2e8Wk
 0Fcw==
X-Gm-Message-State: AOAM530awtcNd4ADkay1575IN3N0IbzBJjKc23A417XQamqf5bLHXE1B
 Gj/igJsT4NTSrM7U8Lges4milxwy/QGaLZeQwTon31x7i6Wg7Q==
X-Google-Smtp-Source: ABdhPJxp01svA7jo/gZVz5WibCwpkZhu9N8gfw2/DCE8OnXw2vURiz/AOojOWOcH1xQewdwRpAjRerA5u7FjncdfAl0=
X-Received: by 2002:a5d:5343:: with SMTP id t3mr22264101wrv.521.1643725151202; 
 Tue, 01 Feb 2022 06:19:11 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Feb 2022 14:19:00 +0000
Message-ID: <CAFEAcA-QUopyEk6OH=6zLi+F_sZ0+6XWpqqW-MLyMNek3Gy3mA@mail.gmail.com>
Subject: iotests failure on netbsd VM, no useful errors logged
To: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi; I see an iotests error running 'make vm-build-netbsd' (ie running
a build and make check on a NetBSD VM), but there is no indication
of what's actually failing. Same thing seems to happen on OpenBSD too.

Full logfile at https://people.linaro.org/~peter.maydell/netbsd-log.txt ;
here's the relevant section:

=3D=3D=3Dbegin=3D=3D=3D
=E2=96=B6 1/1 qcow2 qsd-jobs                OK
1/1 qemu:block / qemu-iotests qcow2 ERROR          227.62s   exit status 1


Summary of Failures:

1/1 qemu:block / qemu-iotests qcow2 ERROR          227.62s   exit status 1


Ok:                 0
Expected Fail:      0
Fail:               1
Unexpected Pass:    0
Skipped:            0
Timeout:            0

Full log written to /home/qemu/qemu-test.z9hOGs/build/meson-logs/iotestslog=
.txt
=3D=3D=3Dendit=3D=3D=3D


Would somebody like to investigate ? I'm not sure if this is an intermitten=
t,
or a new persistent failure that I let slip into the tree by accident.

thanks
-- PMM

