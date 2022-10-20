Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD9B605C62
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 12:33:11 +0200 (CEST)
Received: from localhost ([::1]:59692 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olSrN-00018W-Nv
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:33:10 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olSfQ-0003zB-DB
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olSKI-00022r-55
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:58:58 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:39559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olSKF-00009A-T3
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:58:57 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M1Yl9-1onv1u35XH-0035DO; Thu, 20 Oct 2022 11:58:49 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefano Brivio <sbrivio@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v3 0/2] virtio-net: re-arm/re-schedule when tx_burst stops
 virtio_net_flush_tx()
Date: Thu, 20 Oct 2022 11:58:44 +0200
Message-Id: <20221020095846.63831-1-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IWsFi8/XWbanRd86jdPn6HmHByT20i3ZCBppd+EdR4uiukyTGiO
 DJJuUIUkA9ZSpEwXeX7DiOZjSDcKkOrNAtvQlUkvqjs4grg3uSWoSSll/K+D+T3bSoEyauL
 0tg1XxMX7U0wPTyz7LcHLg0rIDSWnblh1b2uYqIq6J/EFWfS5avn8GuNg2DoUZOfgDps/Es
 FMgku1W4aAKR34++jsDMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ax7Aokp2jEE=:8PEQdFh8dt6fMaL+vctRAI
 ViDJT5TePzIiO0SKKB+OFj29EXXkRQP62hVGnC0pk1ODjotwdGAYsQQaMEdMCpeUzM8bWaIwo
 FVXt1c0rSaz2gDS3VRCP/eyovl44c8fxc73Hcfm0nXFTHv5cXil3tiQBKPV3mICWVv78dPNx8
 w6tGcjKMJOcI1s1k1xC0TjwA3ndWkyLRO8tJT0vX69WpUwNpcXKwyaPTs5cZYhBzOHY2rUlAR
 5EPcuDC/idYkX1hMNxG1jvXFElZwsLUF/SL8SOoyExRDgbHMYBtWx2Cvt8+VkIiLreh3JfA4e
 Kgh+jmOLrmLCoUH1zRzjzPKE1lxsUK6cY/tMZAqu46QyT9nrdKwEsWen4EdS4J1nibwI1xqDZ
 HgTU18LEOER3uQIdPIIRurOOz+JmqyQItPQuddAym+dC9fZzYkYZ9WMMCPdDNr2VoQW5waI/A
 kmwPXCDAQ+IDuzNFhr3E+Bs42nAh+xh7uOMrewHg3N1wTloTlWx7vQZE+h1GdeCo9/iV2vhbt
 fHEQ8PBEnNrxm9r3Y623EAFFGYtn11MyYZiHhxguWVOMnmOnwFQfm8koWeSS3EuV7DecaBUZ2
 ePaVm3tUGDr9cz0e6se72fnufXRj6kkYpBrl6ulCdFmExrwqOlG/RlodGe96UDzrg4lBdkq6O
 1PjoPJDlOjnZL39te5iMjeXsvTwAp+teCFjQCsOmGTfICFDvVX1ufVWZZnVeVNaW3SCuRKfq/
 Dj2/Qs1Pv9iieVMeoWgqya087jqGlDdTCYGFWr2iJxvriOH3jl2ss4MTC191TCUt4IH+FEIqv
 Pxgj6ZZ
Received-SPF: permerror client-ip=212.227.126.133;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_FAIL=0.001,
 SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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

When virtio_net_flush_tx() reaches the tx_burst value all the queue is=0D
not flushed and nothing restart the timer or the bottom half function.=0D
=0D
For BH, this is only missing in the virtio_net_tx_complete() function.=0D
For the timer, the same fix is needed in virtio_net_tx_complete() but=0D
it must be also managed in the TX timer function.=0D
=0D
v3:=0D
- keep "}=C2=A0else {"=0D
=0D
v2:=0D
- fix also tx timer=0D
=0D
Laurent Vivier (2):=0D
  virtio-net: fix bottom-half packet TX on asynchronous completion=0D
  virtio-net: fix TX timer with tx_burst=0D
=0D
 hw/net/virtio-net.c | 59 +++++++++++++++++++++++++++++++++++++++------=0D
 1 file changed, 51 insertions(+), 8 deletions(-)=0D
=0D
-- =0D
2.37.3=0D
=0D

