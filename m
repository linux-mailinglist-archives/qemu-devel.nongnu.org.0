Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2894C2AF87C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 19:47:21 +0100 (CET)
Received: from localhost ([::1]:50400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcv9M-0000VH-6T
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 13:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv1b-0000W3-NQ
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:39:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv1Z-0008DS-4y
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:39:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605119953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3GbruwEim5Oz+NR1Pq/agreI9M/eP9YwMw3MCFICpaw=;
 b=ABGuMDfTYxKntGiq8P7k+CTegE1+eoHVubpRqS82ls+O8SeKTB7TSpYtsPo4ZFF8g0H1vi
 04wWhHHnYtWgJw7t/4rFP6hbpp3yKdBhLzlkJ9Fjtltj3uL9wwi/Wae326S4Mb36w6V6K2
 XiyFcekSib1eRAhTIMRvsJ/30eRDczs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-2ZJmszYnNb-_Kwvb7umCSg-1; Wed, 11 Nov 2020 13:39:11 -0500
X-MC-Unique: 2ZJmszYnNb-_Kwvb7umCSg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C8C75F9EF;
 Wed, 11 Nov 2020 18:39:10 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 288D91002C28;
 Wed, 11 Nov 2020 18:39:06 +0000 (UTC)
Date: Wed, 11 Nov 2020 13:39:05 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 00/44] Make qdev static property API usable by any QOM
 type
Message-ID: <20201111183905.GO5733@habkost.net>
References: <20201109113404.GA24970@merkur.fritz.box>
 <3b711053-e67a-86fb-59e7-c06948dd8928@redhat.com>
 <20201109152125.GZ5733@habkost.net>
 <2300fd53-afa1-b957-b33b-cff2986fcb93@redhat.com>
 <20201109171618.GA5733@habkost.net>
 <098ca211-3ad5-b194-e9f5-678291fe641e@redhat.com>
 <20201109185558.GB5733@habkost.net>
 <9659e726-7948-4e02-f303-abcbe4c96148@redhat.com>
 <20201109202855.GD5733@habkost.net>
 <20201110103804.GA6362@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20201110103804.GA6362@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 10, 2020 at 11:38:04AM +0100, Kevin Wolf wrote:
> Am 09.11.2020 um 21:28 hat Eduardo Habkost geschrieben:
[...]
> > Anyway, If we are the only ones discussing this, I will just
> > defer to your suggestions as QOM maintainer.  I hope we hear from
> > others.
> 
> Well, I expressed my preference for what you're arguing for now, but my
> expertise is more on the QAPI side than on the QOM side, so I can't
> really contribute more arguments in the details than you are already
> doing.

Sorry, I didn't mean to ignore the feedback you had already sent.

Let me rephrase: I was hoping we hear more from you and others.

> 
> In the end, as soon as it's generated code, it won't matter much any
> more what it looks like. But I'm not sure how soon we will be there and
> for the meantime I'll always prefer static data to runtime code.

Agreed.  I really hope we can convince Paolo that properties as
static const data are a desirable feature, and not a crippled
API.

Paolo convinced me that we still need object_class_add_field()
for cases like x86, but I still believe static const arrays of
properties should be the rule for all the rest.

In the meantime, I'll do the following:

I will submit v3 of this series with both
object_class_property_add_field() and
object_class_add_field_properties() as internal QOM APIs.
object_class_add_field_properties() will be used to implement
device_class_set_props().

After that, solving this controversy would be just a matter of
deciding if we want to make object_class_add_field_properties() a
public function or not.

-- 
Eduardo


