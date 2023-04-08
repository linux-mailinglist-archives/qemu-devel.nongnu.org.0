Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5B46DBCD5
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 21:49:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plEXW-0007JA-Vr; Sat, 08 Apr 2023 15:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <landoncoolman@gmail.com>)
 id 1plEVZ-0006y0-FD; Sat, 08 Apr 2023 15:45:57 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <landoncoolman@gmail.com>)
 id 1plEVX-0003Ul-Rz; Sat, 08 Apr 2023 15:45:57 -0400
Received: by mail-qv1-xf34.google.com with SMTP id ly9so4481061qvb.5;
 Sat, 08 Apr 2023 12:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680983154; x=1683575154;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=t5sSnWd5PI6RbM5XO/pRbSTNTAn2fP7zcPuoCnva3aE=;
 b=qmypWPrPny0lHtSWYhX8ggfCgC5QAH8BmBw2XVl/h/yerLMqiW9Pm5e+4b3iyXtlCa
 tYImSpZzMZzVfIdFTLN3VAYlIszDyJeH2iQ7OOD3F5AZF0paxeJXG01nZARlOacn2Bf/
 1U2iNppqOeeCvaiefn3TQNUIeN+Ngn6tRn+HIJd5Q4XCpf2cEJY5N7WrKkkJisry3kkE
 hduBk0mTUDl/PXKc+GQmYYdyB7aKc2HiNdrhp4IGp2QtZMxRUq2y6qKBmXzYcK42yOXV
 9NnghLzATM7H366FzMjtQ+4IO4Zre13zR0XzQX3COfF6v8FWBSQYFsCvmUV19ZxTJTEM
 nXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680983154; x=1683575154;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t5sSnWd5PI6RbM5XO/pRbSTNTAn2fP7zcPuoCnva3aE=;
 b=acvIshqOnXsG2Q1mRzMXYrB+ZIhqszkW7AZi4J7RIMDY9HwS1EaHNHct5kQJ21pxB2
 JbjlKxooDolnmNtcFzURA35p/3y7EB9mrIdmx+Ol0oyHLIiWly++PHN7TF1Kqsezbd80
 sysz3YMNwGuO3DduWB5HvBKYQkzcer1BHoZvrGJow1NluwXCXBa5stvWCDnFiqXDbfRO
 4REPg6vZvUVHVUtICAv/ihY4bP1AKF8mjf5VR/kUsekc2//XEvU3mNKgS6uktz1C2wRu
 a6dUMDUvk0iEP07+6V5tHJ+9O3V2MQdT7j+3Sp0pxDpw0ciPBosfwr7D4C43PPj/mNkT
 DUoA==
X-Gm-Message-State: AAQBX9cj2vUFfNgdw3g+oTvNDbpv222U5QfBYtF2R0aOub8KhCxyCiV9
 COdnDL5ZxbxoHhdbXcJhhGKOsBcqwd8Kbq2YvHEYuExGpGU=
X-Google-Smtp-Source: AKy350b07ZOZGAiPcs5dID4b3R76MMFKWSXrm3SkSV6Kj7RawuNTAVn/VnA+a8ILPR8qFIjtzFQqa5kcP4fz+hBgNyg=
X-Received: by 2002:a05:6214:192d:b0:56e:96c3:e0f0 with SMTP id
 es13-20020a056214192d00b0056e96c3e0f0mr1203067qvb.0.1680983153719; Sat, 08
 Apr 2023 12:45:53 -0700 (PDT)
MIME-Version: 1.0
From: Landon Johnson <landoncoolman@gmail.com>
Date: Sat, 8 Apr 2023 14:45:43 -0500
Message-ID: <CAN8SqADF=F0AOJR6smxNKCEASJ_ocx3RWLGor6Vs8hPfYJLexQ@mail.gmail.com>
Subject: Error handling: Audit callers of load_image_targphys,...
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "jsnow@redhat.com" <jsnow@redhat.com>,
 toria.mendoza@live.com, "EylamTagor@gmail.com" <EylamTagor@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c0400305f8d8633b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=landoncoolman@gmail.com; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 08 Apr 2023 15:47:55 -0400
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

--000000000000c0400305f8d8633b
Content-Type: text/plain; charset="UTF-8"

Hello,

I am a student at UT Austin. A few other students and I would like to work
on this issue as part of a group project in our virtualization class: Error
handling: Audit callers of load_image_targphys, get_image_size,
event_notifier_init, msix_init
<https://gitlab.com/qemu-project/qemu/-/issues/413>.

We have looked through all of the callers of these methods and identified
where changes need to be made, but have not made any of the changes yet. We
weren't quite sure where it would be best to make these changes.

I have CC'd the trivial patches mailing list because it seems like this
might be a possible route forward.

--000000000000c0400305f8d8633b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,=C2=A0<div><br></div><div>I am a student at UT Austi=
n. A few other students and I would like to work on this issue as part of a=
 group project in our virtualization class: <a href=3D"https://gitlab.com/q=
emu-project/qemu/-/issues/413" target=3D"_blank">Error handling: Audit call=
ers of load_image_targphys, get_image_size, event_notifier_init, msix_init<=
/a>.=C2=A0<br></div><div><br></div><div>We have looked through all of the c=
allers of these methods and identified where changes need to be made, but h=
ave not made any of the changes yet. We weren&#39;t quite sure where it wou=
ld be best to make these changes.=C2=A0 =C2=A0</div><div><br></div><div>I h=
ave CC&#39;d the trivial patches mailing list because it seems like this mi=
ght be a possible route forward.</div></div>

--000000000000c0400305f8d8633b--

