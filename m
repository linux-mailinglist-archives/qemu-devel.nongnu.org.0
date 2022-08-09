Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC9458D4D9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 09:46:55 +0200 (CEST)
Received: from localhost ([::1]:40938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLJx0-0003yR-Hp
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 03:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yu.zhang@ionos.com>)
 id 1oLJue-0002PS-JZ
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 03:44:29 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:45040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yu.zhang@ionos.com>)
 id 1oLJuY-0000uF-VR
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 03:44:28 -0400
Received: by mail-lf1-x12e.google.com with SMTP id r17so15846822lfm.11
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 00:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=y1uIvg4K1Vwe69ADiu3d2UT2+U1Ve+8D6+E7S/z23kM=;
 b=HimUf25Wi/+JkUERkAX7BQk+Pb3XlVIU4XIVHCh64K3gEsNlUuhnKGouZO+OeyO45e
 d5QTBaKAs9PSfWyd4WN6RP7+nXWuV4jrthTlQ1xdNJcI0px4fGB0xy6Wfmo+EEtMUI/c
 /8opuPXaMYEJevUhbtwAwtoH9LZYX6WVtWMwXNvXyW9l9/XrXgEdr/I6iS9n9yF3GERg
 FXCixV1A8G+5VVqXc3AxEQ4HTVZuY1h+cnnGd5bxgH2gHCyA5ykkDj5YnHq/QlQt4Mnz
 YLlmdWSD/NRajflKCEL4cDFKgLUMSk0xkKtbJXfdu4RMNDk0yzIGZrHDPnrr2b3lGds7
 Cqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=y1uIvg4K1Vwe69ADiu3d2UT2+U1Ve+8D6+E7S/z23kM=;
 b=4UcXLscRe0cVyUx7GmjqMIYBxRZUJjrIWPC5+iNwINRA7JLGDca70+0JBMD0gjmZ5+
 A177GWkXzE9ICWrwlQowwbqXMKakBGOZ2u6LwfipWxq1WwzL1L7fSdpACIeqyWCVwj77
 KTkvs1cP0hMfY/hYz6QVb0eUifz5cCCgpZhPYpdG/apcaWEP6ZMugrL5bxJexfFRXRgI
 Asr/VlFb+INYUYr0p3hUX4JmbOGh6ZREqoiBDmfjkOGOJGBInuqnwe5VFZnyUTSIiOE1
 8czVhHUyPncqpXIBwOBhH70GhV16SbKq2ogNSMYbr+mP/jXy0+YCXseHyxLZvopYeUmj
 xxMA==
X-Gm-Message-State: ACgBeo0Zbe6taNcQTwnNIL/dBs5P/fQvKdgscxqz9jtXCDpbh5LHT6rW
 X+CLAu7ARgPFgYbGr7A8DdxOtPN9B7SFpHQsg1/HAzPileptEA==
X-Google-Smtp-Source: AA6agR6RCoSueE/jNhqxAOlhQ5Q3aUU6+Z5MH5mD58A3Us4NxSD+WuVhnt+GYz3E5B+yBlBRGlHWfmyDOZFlg3hLnb0=
X-Received: by 2002:a05:6512:3c93:b0:48c:dc60:4786 with SMTP id
 h19-20020a0565123c9300b0048cdc604786mr3664390lfv.208.1660031059267; Tue, 09
 Aug 2022 00:44:19 -0700 (PDT)
MIME-Version: 1.0
From: Yu Zhang <yu.zhang@ionos.com>
Date: Tue, 9 Aug 2022 09:44:08 +0200
Message-ID: <CAHEcVy6VKYXLaNZJJ=2zF80ELH=EV4qARfCDYNkO0zPY=Qh+Eg@mail.gmail.com>
Subject: about the CPU frequency and power mode of QEMU-KVM guest
To: qemu-devel <qemu-devel@nongnu.org>, Jinpu Wang <jinpu.wang@ionos.com>, 
 Muneeb Qureshi <muneeb.qureshi@ionos.com>,
 Elmar Gerdes <elmar.gerdes@ionos.com>
Content-Type: multipart/alternative; boundary="0000000000009aa87d05e5ca191a"
Received-SPF: permerror client-ip=2a00:1450:4864:20::12e;
 envelope-from=yu.zhang@ionos.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

--0000000000009aa87d05e5ca191a
Content-Type: text/plain; charset="UTF-8"

Hi All,

currently we encountered two issues with the CPU frequency of the QEMU-KVM
guest.

We pin the VCPUs of a guest to a few of the host cores and set the
"cpupower governor" of these cores to "performance" mode to use the max CPU
frequency. However,

- the guest displays constant CPU freuquency in /proc/cpuinfo, no matter
how much of the workload is
- even the VCPUs are 100% loaded, the cores on which they are pinned show
only 94% of their max CPU frequency

From the AMD SDM we leanred that CPU frequency is calculated from the
values of two registers - MPERF and APERF, and is read to /proc/cpuinfo by
queying a CPUID. The first issue was also seen in [1,2].

We'd like to know:
- is there a way to display the host CPU frequency correctly by the VCPUs
in the guest ?
- does the power mode setting (e.g. ondemand - > performance) in a guest
change the power mode of the pinned host cores ?

Thank you very much for your reply.

[1] https://bugzilla.redhat.com/show_bug.cgi?id=670104
[2] https://lists.nongnu.org/archive/html/qemu-devel/2013-08/msg01875.html

Yu Zhang @IONOS Compute Platform

--0000000000009aa87d05e5ca191a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<br><br>currently we encountered two issues with th=
e CPU frequency of the QEMU-KVM guest.<br>=C2=A0<br>We pin the VCPUs of a g=
uest to a few of the host cores and set the &quot;cpupower governor&quot;=
=C2=A0of these cores to &quot;performance&quot; mode to use the max CPU fre=
quency. However, <br><br>- the guest displays constant CPU freuquency in /p=
roc/cpuinfo, no matter how much of the workload is<br>- even the VCPUs are =
100% loaded, the cores on which they are pinned show only 94% of their max =
CPU frequency<br><br>From the AMD SDM we leanred that CPU frequency is calc=
ulated from the values of two registers - MPERF and APERF,=C2=A0and is read=
 to /proc/cpuinfo by queying a CPUID. The first issue was also seen in [1,2=
]. <br><br>We&#39;d like to know:<br>- is there a way to display the host C=
PU frequency correctly by the VCPUs in the guest ?<br>- does the power mode=
 setting (e.g. ondemand - &gt; performance) in a guest change=C2=A0the powe=
r mode of the pinned host cores ?<br>=C2=A0 <br>Thank you very much for you=
r reply.<div><br></div><div>[1] <a href=3D"https://bugzilla.redhat.com/show=
_bug.cgi?id=3D670104">https://bugzilla.redhat.com/show_bug.cgi?id=3D670104<=
/a><br>[2] <a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/2013=
-08/msg01875.html">https://lists.nongnu.org/archive/html/qemu-devel/2013-08=
/msg01875.html</a><br><br>Yu Zhang @IONOS Compute Platform =C2=A0<br></div>=
</div>

--0000000000009aa87d05e5ca191a--

