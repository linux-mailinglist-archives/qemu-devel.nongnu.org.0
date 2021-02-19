Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3363331F629
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 10:02:37 +0100 (CET)
Received: from localhost ([::1]:57678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD1gK-00033K-85
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 04:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1lD1f7-0002Qq-5c
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 04:01:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1lD1f4-00054l-97
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 04:01:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613725277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PIVlOcCClBsJF7F+kstPk1bb7oS447n6WFdVSG/+oVo=;
 b=EGLGg+jjOP9djKCYiway+Z/PZLnkuYM0tJgZaOdV4EUGNn6rmX4PS4YKDtQ9+z/8q4Nbl1
 OdHS0TsCjC6T3q77QWoiU+HC3WNkvwDqzFZs9AxHdtmlEUCWsJxFwo+BOG8oewf7XWj423
 mb8m9xmdh5ZsgD/nfykv55eGcCfuquE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-UZDhVQxNM0umY5J72y8z5A-1; Fri, 19 Feb 2021 04:01:12 -0500
X-MC-Unique: UZDhVQxNM0umY5J72y8z5A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8566A100A614;
 Fri, 19 Feb 2021 09:01:11 +0000 (UTC)
Received: from kaapi (vpn2-54-200.bne.redhat.com [10.64.54.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D68DC19D9D;
 Fri, 19 Feb 2021 09:01:06 +0000 (UTC)
Date: Fri, 19 Feb 2021 14:31:01 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [PATCH] net: e1000: check transmit descriptor field values
In-Reply-To: <20210219030449.x25yxp4x6myblm2y@mozz.bu.edu>
Message-ID: <7rq0q396-629q-7s1n-5q2-06spp506p8p@erqung.pbz>
References: <20210210145258.143131-1-ppandit@redhat.com>
 <20210219030449.x25yxp4x6myblm2y@mozz.bu.edu>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Ruhr-University Bochum <bugs-syssec@rub.de>,
 QEMU Developers <qemu-devel@nongnu.org>, Cheolwoo Myung <cwmyung@snu.ac.kr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+-- On Thu, 18 Feb 2021, Alexander Bulekov wrote --+
| Is this a DMA re-entracy/stack-overflow issue? IIRC the plan was to have 
| some sort of wider fix for these issues. There are bunch of these reports 
| floating around at this point, I believe.

* It is similar to the eepro100 one.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


