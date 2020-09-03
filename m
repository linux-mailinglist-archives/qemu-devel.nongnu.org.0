Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3A925C1C7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 15:41:03 +0200 (CEST)
Received: from localhost ([::1]:41080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDpU6-000518-82
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 09:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kDpT3-0003wS-Ve
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 09:39:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kDpT2-0000RT-Jj
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 09:39:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599140394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eX3imYedQvzbjUlbpPhSs9mw/kwOE/aD51WYWhcHWko=;
 b=hGYzU8s7QydImQoENnhv727Tzc2ESWa20Ijs7o0Su4H6bKYgV5G233TsytdNLIXZB6lVdD
 2VVDe0Vqzjw3bQslvmkVUgSxt1by2moYZll5eRscskTPqb9fKfuPTfXNhCNoK1QPKaiBPh
 y27ioppRwOFUy45PIebd5tWKgE9aZiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-vbMxNEDTPhC4qqg9IJLZPQ-1; Thu, 03 Sep 2020 09:39:51 -0400
X-MC-Unique: vbMxNEDTPhC4qqg9IJLZPQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1444D1084D61;
 Thu,  3 Sep 2020 13:39:50 +0000 (UTC)
Received: from kaapi (ovpn-113-31.rdu2.redhat.com [10.10.113.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74F375C22B;
 Thu,  3 Sep 2020 13:39:46 +0000 (UTC)
Date: Thu, 3 Sep 2020 19:09:43 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] hw/ide: check null block pointer before blk_drain
In-Reply-To: <a9de0e0e-273e-ece6-7e5a-4ea26c536c33@amsat.org>
Message-ID: <nycvar.YSQ.7.78.906.2009031908100.2047119@xnncv>
References: <20200827114428.1850912-1-ppandit@redhat.com>
 <CAAdtpL6o7_Cvnui+dsaobNaY93Noj7fcLWYx37mEGd3kTBv56Q@mail.gmail.com>
 <nycvar.YSQ.7.78.906.2009031631370.2047119@xnncv>
 <a9de0e0e-273e-ece6-7e5a-4ea26c536c33@amsat.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1463810047-325064299-1599140389=:2047119"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:47:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Ruhr-University <bugs-syssec@rub.de>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463810047-325064299-1599140389=:2047119
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

+-- On Thu, 3 Sep 2020, Philippe Mathieu-Daudé wrote --+
| > +            if (s->blk) {
| > +                ide_cancel_dma_sync(s);
| > +                bm->status &= ~BM_STATUS_DMAING;
| 
| If you don't clear this bit the guest might keep retrying (looping).

Oh, okay will keep it out of the if(s->blk) block.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463810047-325064299-1599140389=:2047119--


