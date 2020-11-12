Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DA32B07E4
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 15:55:39 +0100 (CET)
Received: from localhost ([::1]:42154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdE0g-0000hg-D5
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 09:55:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdDyj-0007fD-9s
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:53:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdDyh-0007rG-3X
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:53:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605192813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j/BXgmg+yRwMkozcNYji3GRGLld8fzOmlmGZtOxgdRU=;
 b=MfIScndpmUoxlyWjMLbRc16uIWpSV/i6VLk+siO1dMXkbwi5xCnemGifAGXUIos00RvMXY
 UCoyv+Yvv0YelZ3NRg7SaEfBJ/bZmjYhcUr0oLNV8/Wy7dbnuz7PGRhqDgH0THIuqKtaf3
 VEExTxc1tOIOSTlh5RfSgCZkQ7Wq++0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-F7PdR28aPN23HqQR15P62A-1; Thu, 12 Nov 2020 09:53:31 -0500
X-MC-Unique: F7PdR28aPN23HqQR15P62A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B7BB803659;
 Thu, 12 Nov 2020 14:53:30 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F07C85C1C7;
 Thu, 12 Nov 2020 14:53:25 +0000 (UTC)
Date: Thu, 12 Nov 2020 09:53:24 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 00/44] Make qdev static property API usable by any QOM
 type
Message-ID: <20201112145324.GQ5733@habkost.net>
References: <20201109152125.GZ5733@habkost.net>
 <2300fd53-afa1-b957-b33b-cff2986fcb93@redhat.com>
 <20201109171618.GA5733@habkost.net>
 <098ca211-3ad5-b194-e9f5-678291fe641e@redhat.com>
 <20201109185558.GB5733@habkost.net>
 <9659e726-7948-4e02-f303-abcbe4c96148@redhat.com>
 <20201109202855.GD5733@habkost.net>
 <20201110103804.GA6362@merkur.fritz.box>
 <20201111183905.GO5733@habkost.net>
 <c2c2f63f-111a-1c17-29af-72b83e9b600a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c2c2f63f-111a-1c17-29af-72b83e9b600a@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 12, 2020 at 09:11:48AM +0100, Paolo Bonzini wrote:
> On 11/11/20 19:39, Eduardo Habkost wrote:
> > I will submit v3 of this series with both
> > object_class_property_add_field() and
> > object_class_add_field_properties() as internal QOM APIs.
> > object_class_add_field_properties() will be used to implement
> > device_class_set_props().
> 
> I have no problem making both of them public APIs.  If an object can use
> only a single array of static^Wfield properties that's totally fine; I'm
> just not sure about splitting properties between class_init and static
> arrays, which is the less consistent case.

I agree that using a static array for a couple of properties and
object_class_property_add*() for all the rest isn't desirable.
Making both APIs public sounds like a good plan.

I'd like us to make almost every object use only an array (just
like almost every device already use only an array, today), but
maybe we'll hit too many obstacles trying to do that.  We'll see.

-- 
Eduardo


