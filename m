Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD7E215682
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 13:40:12 +0200 (CEST)
Received: from localhost ([::1]:42296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsPTn-00005Q-49
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 07:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jsPSD-0006rN-17
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 07:38:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33638
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jsPSB-0002KO-Bw
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 07:38:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594035510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BxyY8fHQuGh0O6z39NVMHrhqOWF9Si8qwwucYQTaMaM=;
 b=GIFXgIk8lMGx3/DAe3iy82+Ie6M/pci+WC8AR7SLGAIArdxDmUrdDr77w4YOgGaomAsyMu
 vLy8hOFflf0AuA33u2ne5oLi120ziAjMVXxO33mu0g+V/jViOZHI5wiheqGjL/sOqyrUmJ
 rw32JAMgoEHd5cYSmQGS/IYXmuAEEvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-qJJTae2uMve_Jzp6pJTcWw-1; Mon, 06 Jul 2020 07:38:28 -0400
X-MC-Unique: qJJTae2uMve_Jzp6pJTcWw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56C71107ACCD;
 Mon,  6 Jul 2020 11:38:27 +0000 (UTC)
Received: from gondolin (ovpn-112-234.ams2.redhat.com [10.36.112.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E887260BF3;
 Mon,  6 Jul 2020 11:38:25 +0000 (UTC)
Date: Mon, 6 Jul 2020 13:38:23 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PULL 13/14] virtio-ccw: fix virtio_set_ind_atomic
Message-ID: <20200706133823.64f6945a.cohuck@redhat.com>
In-Reply-To: <20200706132311.2add044f.pasic@linux.ibm.com>
References: <20200703100650.621212-1-cohuck@redhat.com>
 <20200703100650.621212-14-cohuck@redhat.com>
 <20200706132311.2add044f.pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:52:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 Andre Wild <Andre.Wild1@ibm.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 6 Jul 2020 13:23:11 +0200
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Fri,  3 Jul 2020 12:06:49 +0200
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > From: Halil Pasic <pasic@linux.ibm.com>
> > 
> > The atomic_cmpxchg() loop is broken because we occasionally end up with
> > old and _old having different values (a legit compiler can generate code
> > that accessed *ind_addr again to pick up a value for _old instead of
> > using the value of old that was already fetched according to the
> > rules of the abstract machine). This means the underlying CS instruction
> > may use a different old (_old) than the one we intended to use if
> > atomic_cmpxchg() performed the xchg part.
> > 
> > Let us use volatile to force the rules of the abstract machine for
> > accesses to *ind_addr. Let us also rewrite the loop so, we that the  
> 
> Michael T. Has pointed out that this sentence is ungrammatical. 
> 
> s/we// would IMHO solve the problem. Can we fix this before it gets
> merged?

Unfortunately, it's already too late :(

> 
> > new old is used to compute the new desired value if the xchg part
> > is not performed.


