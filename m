Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD62E2FA0F6
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 14:14:41 +0100 (CET)
Received: from localhost ([::1]:58016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1UMi-0000Oh-PJ
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 08:14:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l1UF5-0006OX-Gj
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 08:06:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l1UF1-0000gE-6a
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 08:06:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610975202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ga4CqChZo5oWqD1FcK0PO0Oimbh2OKX9McnwrZC6Cbk=;
 b=dyL1iQBs+xGrfA5udyaXvYKn6da+hRZsiqc3oV6FPpnjUtqcYDUmGUvq3OCQPRSFkp19lT
 5I82kHMM1VBsi7BEPiUzcQFJw81N70y1GPz1mV/ZbvpVctTR7OvmWMlohZsWWGVLn9vgdk
 8vsfWbQnzE4sUVggT3y93t/6reklK5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-eor3XuLnP5uoWmwJowubMw-1; Mon, 18 Jan 2021 08:06:40 -0500
X-MC-Unique: eor3XuLnP5uoWmwJowubMw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B0C11005599;
 Mon, 18 Jan 2021 13:06:39 +0000 (UTC)
Received: from kaapi (unknown [10.40.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39DB21346D;
 Mon, 18 Jan 2021 13:06:35 +0000 (UTC)
Date: Mon, 18 Jan 2021 18:36:31 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] ide: atapi: check logical block address and read size
 (CVE-2020-29443)
In-Reply-To: <1d1f5a04-e5f5-29be-c5f5-f2d3ec67f6b7@redhat.com>
Message-ID: <q2243r5-7spq-2op7-so1p-r3927q325113@erqung.pbz>
References: <20210118063229.442350-1-ppandit@redhat.com>
 <cdd8168a-3362-e038-8e7e-0a082a2f1917@redhat.com>
 <4q98o1s-r5r4-14s9-nnr4-4p2q16roqro@erqung.pbz>
 <7b7771b7-cdba-01a4-67a7-c9cb3e9e33ca@redhat.com>
 <s218282-33rp-63nn-q469-6s3227353nsq@erqung.pbz>
 <1d1f5a04-e5f5-29be-c5f5-f2d3ec67f6b7@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
| On 18/01/21 13:29, P J P wrote:
| > +    s->nb_sectors = nb_sectors & (uint64_t)INT_MAX << 2;
| >       if (kind == IDE_CD) {
| > +        s->nb_sectors &= (uint64_t)INT_MAX << 2;
|
| Not an &, but rather a MIN.
| 
| There is also ide_resize_cb, so perhaps a new function ide_set_nb_sectors in
| hw/ide/core.c would be better.
| 
| ... it doesn't hurt either to have INT_MAX << 2.

Okay, will do.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


