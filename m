Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 007C419D4E2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Apr 2020 12:17:16 +0200 (CEST)
Received: from localhost ([::1]:53200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKJNy-0002aj-OJ
	for lists+qemu-devel@lfdr.de; Fri, 03 Apr 2020 06:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35525)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jKJN5-0002A5-U0
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 06:16:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jKJN4-0007g5-Tk
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 06:16:19 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:28069
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jKJN4-0007fR-NF
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 06:16:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585908977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DAQqHLgwb31Jo+apnFzfKE2uGBKbKWX1M7C38S3wHkM=;
 b=EA6PoBOkZQ5b0CJWLI5KVFQZFZOOKnKGt58I9of0z3dbwgFWhE8wp+tUcFKNvwYuTV6qEN
 cPly70lS3Ml2N/CVcXSA1HguTQYS5//4N7ud0oVPt5oV99VMsKfahyPY5OK/28JJOiKVHh
 eiFBIxcaOZlcbvjYryr5xK3YZOS1BJs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-Gpp9P32dOiiuipVtIIJjew-1; Fri, 03 Apr 2020 06:16:16 -0400
X-MC-Unique: Gpp9P32dOiiuipVtIIJjew-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54C5F1005516;
 Fri,  3 Apr 2020 10:16:15 +0000 (UTC)
Received: from localhost (unknown [10.40.208.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B02FE10372C2;
 Fri,  3 Apr 2020 10:16:03 +0000 (UTC)
Date: Fri, 3 Apr 2020 12:16:01 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 09/12] acpi: move aml builder code for parallel device
Message-ID: <20200403121601.35099bf5@redhat.com>
In-Reply-To: <20200403121210.30a010cb@redhat.com>
References: <20200403080502.8154-1-kraxel@redhat.com>
 <20200403080502.8154-10-kraxel@redhat.com>
 <20200403121210.30a010cb@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 Apr 2020 12:12:10 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> On Fri,  3 Apr 2020 10:04:59 +0200
> Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
[...]
> > +static void parallel_isa_build_aml(ISADevice *isadev, Aml *scope)
> > +{
> > +    ISAParallelState *isa = ISA_PARALLEL(isadev);
> > +    Aml *dev;
> > +    Aml *crs;
> > +
> > +    if (isa->iobase != 0x0378) {
> > +        return;
> > +    }
if device is present why should we skip adding it to DSDT?

[..]


