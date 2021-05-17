Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E4C382B76
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:49:31 +0200 (CEST)
Received: from localhost ([::1]:35448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libkY-0004Ae-Ru
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1libAu-0006j8-Tg
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:12:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1libAs-00016Q-0m
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:12:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621249956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WWEMxvkW5E3HXeFuDYBml8WAhtwhFHnNHopt0dihZy0=;
 b=ENRSDSZoXdMzIRPcmFS/sRxGYA+CzY0aB8QhGLTTCWKruT3YI2/csuZFLiiOrkl3aUEAZG
 8EWvLOQBAof+RmduX2j0YMJ758OTiNxwxZvA8fOGeN8IWBnNbRvT6+3rvMSUC3oDahTk3c
 r9Gq47dbeL6ogLEi7TaKxBwqxYGEcPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-uwNgbmlDODiN_MGuqPf59w-1; Mon, 17 May 2021 07:12:35 -0400
X-MC-Unique: uwNgbmlDODiN_MGuqPf59w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D831D1854E25;
 Mon, 17 May 2021 11:12:33 +0000 (UTC)
Received: from kaapi (ovpn-112-103.ams2.redhat.com [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E4205DDAD;
 Mon, 17 May 2021 11:12:28 +0000 (UTC)
Date: Mon, 17 May 2021 16:42:22 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] fdc: check drive block device before usage
 (CVE-2021-20196)
In-Reply-To: <bea5cec1-eb1b-3eab-8e71-4af7ae1078ff@redhat.com>
Message-ID: <8n7o47n5-741n-819-187-n27p1o87q362@erqung.pbz>
References: <20210123100345.642933-1-ppandit@redhat.com>
 <6881ef3c-99a1-1f5f-cca5-0850ec2bd6cf@redhat.com>
 <89fb8d54-707a-9965-75e2-665d4cb07d63@redhat.com>
 <bea5cec1-eb1b-3eab-8e71-4af7ae1078ff@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1463810559-605171029-1621249953=:138440"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-stable@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Gaoning Pan <pgn@zju.edu.cn>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463810559-605171029-1621249953=:138440
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

+-- On Sat, 15 May 2021, Philippe Mathieu-Daudé wrote --+
| This patch misses the qtest companion with the reproducer
| provided by Alexander.

Do we need a revised patch[-series] including a qtest? OR it can be done at 
merge time?

Thank you.
--
 - P J P
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463810559-605171029-1621249953=:138440--


