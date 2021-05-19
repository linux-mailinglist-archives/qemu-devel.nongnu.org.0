Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6476E388827
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 09:29:21 +0200 (CEST)
Received: from localhost ([::1]:41648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljGds-00019u-Ft
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 03:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1ljGcn-0000LK-JH
 for qemu-devel@nongnu.org; Wed, 19 May 2021 03:28:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1ljGck-0003Ai-AG
 for qemu-devel@nongnu.org; Wed, 19 May 2021 03:28:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621409288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YHDRRV5oBGaIOsINRLcDQJTrUDbD9baT/TtdJILP1Uk=;
 b=Edvx/sElHf6nBY35CBdE6SQZdRBXCrw3gwO4w75YdJRNHYxtBQf4SwerJxou8penjNFyGy
 r1NkJZ6FItaQXaf+uW3AY7n+HYFa/3QdXVydgkZERZipTfJDDgbed2GSo7B4EwgnCk77Gp
 PrFJZErCbBIBr9gadmdEMASKoH/vrXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-uYkNhpZlMrWvsiTsZlJPnQ-1; Wed, 19 May 2021 03:28:06 -0400
X-MC-Unique: uYkNhpZlMrWvsiTsZlJPnQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDCE4800D62;
 Wed, 19 May 2021 07:28:05 +0000 (UTC)
Received: from kaapi (unknown [10.74.9.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99EF4687EE;
 Wed, 19 May 2021 07:28:03 +0000 (UTC)
Date: Wed, 19 May 2021 12:57:59 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2] fdc: check null block pointer before r/w data transfer
In-Reply-To: <f6abc649-172d-ccd6-49dc-7c12488c04e0@redhat.com>
Message-ID: <1qq5n2sp-7n1p-8n9n-s913-r09375s3r751@erqung.pbz>
References: <20200922092722.344518-1-ppandit@redhat.com>
 <f6abc649-172d-ccd6-49dc-7c12488c04e0@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Ruhr-University <bugs-syssec@rub.de>, Li Qiang <liq3ea@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+-- On Tue, 18 May 2021, John Snow wrote --+
| I assume it can be rolled into the most recent issue that actually grabbed 
| my attention:
|
|  -> https://gitlab.com/qemu-project/qemu/-/issues/338
| 
| And we can credit both reporters (and Alexander) and solve all of these issues
| all at once.
| 
| I am therefore dropping this patch from my queue. Please let me know if I am
| mistaken.

* It should be okay to collate patches together under above gitlab issue as a 
  series.
 
  Considering they've individual CVEs assigned, we'll still need to tag them 
  with CVEs, so that it's easier for downstream users to pick them.


Thank you.
--
 - P J P
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


