Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0064A2A03F9
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 12:19:43 +0100 (CET)
Received: from localhost ([::1]:42928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYSRa-00027D-HX
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 07:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kYSOw-00015C-Vd
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 07:16:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kYSOu-0002h0-Oe
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 07:16:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604056614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XdftMZGrTyWYnOQxNWpR4KUVyEt4uF+65WREa90OZ6I=;
 b=euF0ILmL1PlamTv2lyXHTjHNcrKU2unSbc650hf9iRpGjO9tvshQP7tTMg6EI6HXujNmv2
 8D07EhlmNli/LBxB8BSXHcJSWEGawD1OY3ooy6Ci6a2kWSp/BOidU9oQSgLnadw6h6cQHZ
 E2c7tr/DnB925VcfvODcNdssN8gQ6As=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-J5Rt32GXNMCHZqXL5u8uEw-1; Fri, 30 Oct 2020 07:16:49 -0400
X-MC-Unique: J5Rt32GXNMCHZqXL5u8uEw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2F921006702;
 Fri, 30 Oct 2020 11:16:47 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D90BF5B4A1;
 Fri, 30 Oct 2020 11:16:43 +0000 (UTC)
Date: Fri, 30 Oct 2020 07:16:43 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH 12/36] qdev: Make error_set_from_qdev_prop_error() get
 Object* argument
Message-ID: <20201030111643.GN5733@habkost.net>
References: <20201029220246.472693-1-ehabkost@redhat.com>
 <20201029220246.472693-13-ehabkost@redhat.com>
 <CAJ+F1CK6qoCW1L8Bdo2eFV2-O62QxW3+Q3+htxUdv5wzGeRZ4g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CK6qoCW1L8Bdo2eFV2-O62QxW3+Q3+htxUdv5wzGeRZ4g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 02:24:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Qemu-s390x list <qemu-s390x@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 30, 2020 at 12:00:33PM +0400, Marc-André Lureau wrote:
> On Fri, Oct 30, 2020 at 2:16 AM Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > Make the code more generic and not specific to TYPE_DEVICE.
> >
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> >
> 
> What about dropping _qdev from the function name too?

I have a series that deletes the function completely, but I
decided to leave it outside of this first batch.

> 
> Also, I am not sure it's a well designed function.. I would rather have 3
> different helper functions than dispatching with an errno... Might be worth
> a TODO note :)
> 
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Thanks!

-- 
Eduardo


