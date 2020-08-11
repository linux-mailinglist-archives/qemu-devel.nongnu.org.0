Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB20241EE0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Aug 2020 19:05:56 +0200 (CEST)
Received: from localhost ([::1]:47190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5Xim-0005tB-2a
	for lists+qemu-devel@lfdr.de; Tue, 11 Aug 2020 13:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1k5Xht-0005Pl-TN
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 13:05:01 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22359
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1k5Xhs-00053H-Bx
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 13:05:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597165499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YW12wal9es5W+eP0ZV9/DrO6fWH8YJoNo00ibe8hB78=;
 b=N/mPQth51/GQpAQFkCL7AETaE5mw4IVQka3KLKSddGOZhrkHCRqCubLS1us7jI1N86Oglk
 591UVDWp2mMY+NxXfWHL8mpPuNWhQmdKjLwE0MQls5tigRuR9JEsFdgvhvEiit2bKLm8Nr
 3txG4f9FkogjULWGxfwhttoZewSoNQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-YBeLJzERN72iui8DluMx_A-1; Tue, 11 Aug 2020 13:04:56 -0400
X-MC-Unique: YBeLJzERN72iui8DluMx_A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9543F800465;
 Tue, 11 Aug 2020 17:04:54 +0000 (UTC)
Received: from kaapi (unknown [10.74.8.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35EBE65C6E;
 Tue, 11 Aug 2020 17:04:42 +0000 (UTC)
Date: Tue, 11 Aug 2020 22:34:40 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 6/9] spapr_pci: add spapr msi read method
In-Reply-To: <9da90cfa-71d3-b7cd-5e5b-a19db72fc405@redhat.com>
Message-ID: <nycvar.YSQ.7.78.906.2008112223030.306228@xnncv>
References: <20200811114133.672647-1-ppandit@redhat.com>
 <20200811114133.672647-7-ppandit@redhat.com>
 <9da90cfa-71d3-b7cd-5e5b-a19db72fc405@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1463810047-1381052753-1597165494=:306228"
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ppandit@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 04:41:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 "Michael S. Tsirkin" <mst@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Lei Sun <slei.casper@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463810047-1381052753-1597165494=:306228
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

+-- On Tue, 11 Aug 2020, Philippe Mathieu-Daudé wrote --+
| Cc'ing PCI maintainers
... 
| > +    .read = spapr_msi_read,
|
| Shouldn't this be a read_with_attrs handler returning MEMTX_ERROR
| instead? Maybe we need another MemTxResult which does not yet exist.

Could this be a subsequent new patch? This patch series is reviewed/ack'd, 
could be included in the v5.1.0 release.


Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463810047-1381052753-1597165494=:306228--


