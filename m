Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB622F9E9A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 12:46:42 +0100 (CET)
Received: from localhost ([::1]:56936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1SzZ-0002HD-Kd
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 06:46:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l1SxR-0001kK-UW
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 06:44:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l1SxL-0005fQ-44
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 06:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610970262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xw/SAOJlAOltKsBd/gFO8N8mMJkZCTp5bvlFyV7gJuQ=;
 b=bXyE/O/9m9V5YW+hdyYqkzXflqMDFNGkT6FwKEDDSCUM+YHyXQYwIJo1ewiN2kW/qKfjKk
 eck7uJm+iiZCnngjEPCq2sXWQ2ASO2gLfL/JKZjRWcFtUcXL7K/0EG94QemIL4+c6NK4s+
 xaXKcIRsbIqIenJciIrpVI8wAepBtc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-bEH8f4bMMJypVyQxln04Dg-1; Mon, 18 Jan 2021 06:44:18 -0500
X-MC-Unique: bEH8f4bMMJypVyQxln04Dg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94338C73A1;
 Mon, 18 Jan 2021 11:44:17 +0000 (UTC)
Received: from kaapi (unknown [10.40.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D253E5B6AF;
 Mon, 18 Jan 2021 11:44:13 +0000 (UTC)
Date: Mon, 18 Jan 2021 17:14:08 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] ide: atapi: check logical block address and read size
 (CVE-2020-29443)
In-Reply-To: <cdd8168a-3362-e038-8e7e-0a082a2f1917@redhat.com>
Message-ID: <4q98o1s-r5r4-14s9-nnr4-4p2q16roqro@erqung.pbz>
References: <20210118063229.442350-1-ppandit@redhat.com>
 <cdd8168a-3362-e038-8e7e-0a082a2f1917@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Wenxiang Qian <leonwxqian@gmail.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+-- On Mon, 18 Jan 2021, Paolo Bonzini wrote --+
| Thank you!  This looks great.
| With the small spacing fix suggested by checkpatch,
| Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

  Thank you. Will send patch v3 with space typo fix.

| You may add a small patch on top to clamp s->nb_sectors at (uint64_t)INT_MAX 
| << 2, just to be super safe.

To confirm:

  * (uint64_t)INT_MAX << 2 is => 8589934588 ~= 8.5G sectors ?
    Media size would be:
      8.5G * 512B(sector) => ~4TB
      8.5G * 4096B(sector) => ~32TB

  * We are limiting IDE media size to ~4TB/~32TB ?


Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


