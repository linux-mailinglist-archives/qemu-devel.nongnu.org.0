Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9FD5AF79E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 00:05:16 +0200 (CEST)
Received: from localhost ([::1]:39130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVgh1-0003Ml-1p
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 18:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oVeYb-0004Z6-Nt; Tue, 06 Sep 2022 15:48:25 -0400
Received: from mout.gmx.net ([212.227.17.22]:45077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oVeYZ-00085K-Q0; Tue, 06 Sep 2022 15:48:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662493700;
 bh=6tNsnvyALQCekAEnGgE4v3vfbs9lSzguI1+wfNRfGJU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=TeFsH9zhZLMiVvcpx6gbmaR3jCP1tE0d5jg0QsIG2GgJF0QfUY5R1Vv+od3355xZL
 kb2dB93CACWuA2ihEVKWAaLaXOL0epAeoFJz4CXFU/J/tLuIQI0XehfbmbsTmkJ27A
 qXjPr0dlaghed7BM+4zlYCI2UNnhY2ROlDpcWWEk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from btm-mobil4.fritz.box ([88.72.97.126]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIx3C-1ooyvR2imA-00KRQp; Tue, 06
 Sep 2022 21:48:19 +0200
From: Arwed Meyer <arwed.meyer@gmx.de>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Arwed Meyer <arwed.meyer@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 4/4] serial: Allow unaligned i/o access
Date: Tue,  6 Sep 2022 21:47:55 +0200
Message-Id: <20220906194755.98090-5-arwed.meyer@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906194755.98090-1-arwed.meyer@gmx.de>
References: <20220906194755.98090-1-arwed.meyer@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bhf11o5juHcWQpPFVfbhgOQ2JaWDQIXkcJsU+LqdpO0kz2f+xAr
 RbdzozikyQwu4Ax+HNsyvWTrohWQqsZOVw5q/PjHisNCm07uJUda+2DDacsvBxKDePGULhJ
 11s68ZpKvBYfL1mTTLlRWXH3jsx8fRNXrdporIoQi9nqYEW6F099HTKhGg166ZZW4X9Ezte
 DItlCMecSIfClC86253MA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yqGueSSEACE=:7/egKm+A/ZNwCgDv4Q19mz
 Aj7dnflVj/NtTUK4Y6vVPBp/MmPN3Pzf32RtYaqDhWt84VvIezhImsN9dRmlvZLD/9du66ktW
 y0tvDJ8xPLmT9Bow65bYCjEWv7+s+3Rnl9+rrNOS5Qcea9lKg/L+Tpf9pR5FbtcDYFYb5NoHY
 WsJSAHSKtvcsqcyqFv+0qPjrA62XOupK78k3TpeOUpSIfoJqU67VJv7AvTZ24gJTPhxqDQG6t
 S8E7OtQvGzR2Q2hzY0SNDSmLq25O6uAqx6ED9H2UYetEAQGR5HVjOcqvh3qkCfecHxVVHX9aI
 Zv/T74ChHz3lnyVC/l74fumPlpDuT89lcx+jIMw0ba1DPr00Nph5lXPSZMllybsO1I8YvjcWw
 hHVMcxZKisjsM22GQ14c7qTwnfHg8U2+k/ipZzrakBQysZL4E61MjqUt4jHLYlx8WA05yIWkP
 mKlEljHCN0UsoZTaVD4ji/DpkMk+G0+nkiQ0H/1jENYNoXStyCQiF+rb7C3EEeXAFf6hxnAit
 asV2SoMpnn1TCsScjHH3Iv+XY81tknvrDXSmBk+qYvLAd2MTEKYl8/wcxKSTBfuTcrCXlJvox
 EUCYNcZAlB+qQxQBuuMUC013bEWb+Pz6ZChbxYPU66a6hj6VfKCv7Zihiam9RI27IwJ3fwisy
 GmwHM+eeR485q3pS+oZEN1L7Q5D75bJuTaezTB+1+NLhj7C5rgOktjOr1oMMkUm1hoxyMJJUi
 lbXfgLEtMwJA3UOD9VwDAsnf6nZj84brWMwOjUpcG9dB1NxSJU8HcHuYERZcaAPqayeis+9Mm
 kNjbEXWPh5JH++Bbqba320QHE5XxuEG3H77b7dLYpqe8rai1LIksxjMz4+WDQGJ6XEPSpLxkH
 2BITL8aoD7lx2CKfA/iK2eqKlJ2S5dHv19pkMC3Cxn09WAge8t74kVJR0ZpVJLxZoM/6B41Qa
 9vqsLJnEXgwWQyshIkA1vuOTpLhyqMaO4KO5MSH8Uw90AjQpvu68hSXDkQP0bwSJwUro0ix1k
 wlN7J4gIJdxY84o4W5nx94Dq30h3hgBfWOwDq0QolvHqqKAf1Mnk+p26Tx/wZNtR21iWH670i
 CI7qvTMd47ONgMWa4d8b1sktmKZ99NqUCc4s1Ivma6tuyOKgaTrmkk82QXNf2SWPaqalvi/1L
 Raea5FWYqX/pGAF1Z35pX3uGoD
Received-SPF: pass client-ip=212.227.17.22; envelope-from=arwed.meyer@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 06 Sep 2022 18:00:42 -0400
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

Unaligned i/o access on serial UART works on real PCs.
This is used for example by FreeDOS CTMouse driver. Without this it
can't reset and detect serial mice.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/77
Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
=2D--
 hw/char/serial.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 7061aacbce..41b5e61977 100644
=2D-- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -961,6 +961,9 @@ void serial_set_frequency(SerialState *s, uint32_t fre=
quency)
 const MemoryRegionOps serial_io_ops =3D {
     .read =3D serial_ioport_read,
     .write =3D serial_ioport_write,
+    .valid =3D {
+        .unaligned =3D 1,
+    },
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
=2D-
2.34.1


