Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DCC1487E0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 15:26:08 +0100 (CET)
Received: from localhost ([::1]:43037 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuzuR-0005Pv-KM
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 09:26:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43093)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iuztd-0004sk-Gy
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 09:25:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iuztc-0004IX-Ih
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 09:25:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34768
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iuztc-0004Hn-F6
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 09:25:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579875916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c54fuVG0vxmx0kRXePeuvFU3Nt/3abqmiRwp/hdBskU=;
 b=MpQNHRINypTSFwu3fXVnhPxqcar6498rr1gM3HGW2Sk9DBZ1QKq1BO24WzYyVXoOwJUAFw
 S38zdtYYkNvkDONauUfgMjYJE9kMTnrTRLO/gOGrFbxnno1Nnm2YXWvrmFKKKI25EcUjyb
 Sh2wAI1cVv9Lxx7hoAWdMlKelF7nmBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-6OkJXfmHNsqLCzykMh3hJA-1; Fri, 24 Jan 2020 09:25:14 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFFCE1088383;
 Fri, 24 Jan 2020 14:25:12 +0000 (UTC)
Received: from gondolin (dhcp-192-195.str.redhat.com [10.33.192.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1143F1001B05;
 Fri, 24 Jan 2020 14:25:11 +0000 (UTC)
Date: Fri, 24 Jan 2020 15:25:09 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/5] target/s390x: Do not leak stack address in
 translate_one
Message-ID: <20200124152509.0de4137e.cohuck@redhat.com>
In-Reply-To: <41ea3b7b-745d-4d8a-24fa-3862035db41d@redhat.com>
References: <20200123232248.1800-1-richard.henderson@linaro.org>
 <41ea3b7b-745d-4d8a-24fa-3862035db41d@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 6OkJXfmHNsqLCzykMh3hJA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Jan 2020 10:43:32 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 24/01/2020 00.22, Richard Henderson wrote:
> > Thomas' patch avoids the leak, but I think we can do a bit more to
> > cleaning in this area, and move the structure inline to DisasContext.
> >  
> Sounds like a good idea to me. Cornelia, could you please replace my
> patch with Richard's series?

Yes, that sounds good. Dropped your patch in favour of this series.


