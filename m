Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3845F3063E7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 20:17:12 +0100 (CET)
Received: from localhost ([::1]:41366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4qJJ-0000wj-Hy
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 14:17:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l4qGZ-0008NY-1F
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:14:11 -0500
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a]:39570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l4qGW-0002pc-FL
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:14:10 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id m25so770112vkk.6
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 11:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Puo9HNQ5v9q2qy2WW3Y41976aGdG1x+LL3nbJt3zixE=;
 b=tdVkGFr1aq65+ANNM21Wgj10Eh6ZyQzE0LUYYA3DgqI/8ZHa2Hh/aDJzSBBBhRNiTe
 9EKNqaolZZLop/rF+4F2g/zh08UXa3rCK+rhKgWbkF8+ARi5TgOl0JL2oq1cMAu9j+Tg
 qNHkA6aQPUKEScELSnbswU1rqavOihMdHWXZFXuk6KerHHOn+cj+FDDlGCC1TPVYAiqN
 KwF5JYL+c+mk4p9bGZr7TY9sFNdWxrBBj/hBOlNrnLYS6y1l7xKyrzLF76E3AhgT385O
 k7UZtPBkEjRgjb0lk7WlbwiJkOOeY7pTC5WnslSov+XqgbX5STSBB5vDciHaVCctWuuf
 6QrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Puo9HNQ5v9q2qy2WW3Y41976aGdG1x+LL3nbJt3zixE=;
 b=akmPwUVBfDrCaJpTtGV9Hwv8qkbHG0pyPsGzzskLq3c9WUHOHdEPyxbp8kQ2i/ERgI
 f6a3ynzJYhxIl5XvF66g++0e4ZORmkEiw5/DENIY7ucTNfYyXy5WnS5YcTt7P240T0ug
 MWaMtCXmh/8fh3y9r0hh/HAebyG/ILCO/n/bR4bj0DGNFEv9EsSNCAp2zbyIbSFDe8fp
 iiSevb7vRLAhTyNZrjsMIq2lv7UadFTjou0JLWFa7B57R2TX6djMkSGmmHN5Xp5HjCG2
 3+NDrvRXifrWqcDAgcpnZMkIn5Uo9IfxGcLPSLmfqJ6NvK6V+pV17RqT22T/zDraSV+B
 rNiw==
X-Gm-Message-State: AOAM533L4+dP4MF74nczueVSIiuDhbuGAN5awcUeLhw6Yv9xnzWBG9O2
 RFLLn92ahHu3a+rPy5S5IGFjP7E7WXqdtps28phY3NiXWmg=
X-Google-Smtp-Source: ABdhPJx2ciGTDL+omhSCnAC4HBTqJYK/o2isJO8uUe9rLm4zZ+ILPY+jZ0Rkvg2i4pT+K4/LDdHDA+jDLVVKmq37x6s=
X-Received: by 2002:a1f:29c9:: with SMTP id p192mr2128515vkp.8.1611774845405; 
 Wed, 27 Jan 2021 11:14:05 -0800 (PST)
MIME-Version: 1.0
From: Doug Evans <dje@google.com>
Date: Wed, 27 Jan 2021 11:13:29 -0800
Message-ID: <CADPb22QjukHvqxTzjXUZyiO7jdDxKaHd=ioAb8SSgfrAUgiskg@mail.gmail.com>
Subject: [RFC] Change default ipv6 network from fec0/10 (site local) to
 fe80/10 (link local)
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000001ed81e05b9e69351"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=dje@google.com; helo=mail-vk1-xa2a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001ed81e05b9e69351
Content-Type: text/plain; charset="UTF-8"

Hi.

This is just an information gathering question. I don't know enough to
formally propose the change.
I happened to notice QEMU's default for the ipv6 network is fec0::/10 which
is deprecated (RFC3879).
I think(!) an obvious replacement is fe80::/10, link local.

Has anyone thought about this issue or know of reasons why we shouldn't
make this change?

--0000000000001ed81e05b9e69351
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hi.=
<br></div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">This is just an info=
rmation gathering question. I don&#39;t know enough to formally propose the=
 change.</div><div class=3D"gmail_default" style=3D"font-size:small">I happ=
ened to notice QEMU&#39;s default for the ipv6 network is fec0::/10 which i=
s deprecated (RFC3879).</div><div class=3D"gmail_default" style=3D"font-siz=
e:small">I think(!) an obvious replacement is fe80::/10, link local.</div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Has anyone thought about this =
issue or know of reasons why we shouldn&#39;t make this change?</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div></div>

--0000000000001ed81e05b9e69351--

