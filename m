Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA85A2FA2E6
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 15:24:43 +0100 (CET)
Received: from localhost ([::1]:58896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1VST-0003Hv-Fu
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 09:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l1VR0-00025n-KO
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:23:10 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:40479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l1VQz-00020v-3f
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:23:10 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-a95lV3R3N0mmkQWLLRnGGg-1; Mon, 18 Jan 2021 09:23:03 -0500
X-MC-Unique: a95lV3R3N0mmkQWLLRnGGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFE4B806663;
 Mon, 18 Jan 2021 14:23:02 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-20.ams2.redhat.com [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2B9160861;
 Mon, 18 Jan 2021 14:23:01 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] 9pfs: Improve unreclaim logic
Date: Mon, 18 Jan 2021 15:22:57 +0100
Message-Id: <20210118142300.801516-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

clone of "master"=0D
=0D
Greg Kurz (3):=0D
  9pfs: Convert V9fsFidState::clunked to bool=0D
  9pfs: Convert V9fsFidState::fid_list to QSIMPLEQ=0D
  9pfs: Improve unreclaim loop=0D
=0D
 hw/9pfs/9p.c | 83 +++++++++++++++++++++++++++++-----------------------=0D
 hw/9pfs/9p.h |  6 ++--=0D
 2 files changed, 50 insertions(+), 39 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


