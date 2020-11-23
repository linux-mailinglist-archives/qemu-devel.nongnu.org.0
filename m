Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 771252C00E2
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 08:53:57 +0100 (CET)
Received: from localhost ([::1]:35692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh6fb-0002Np-UT
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 02:53:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kh6dM-0000qh-5r
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 02:51:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kh6dJ-0000uN-DB
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 02:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606117891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lQue2GdHKpm5ut1aCaHbqD2eYRNGDlaK/2aoF9VPjq0=;
 b=a7EEPsIJpMnEf8Jn98ufFsMGy2CVrClrFDl/2RexyYQpWaskT0wbNkhdniLuELxBl+Nbrv
 XxDZyKG0ZCt3kiY67GJOVnzUYPXkZux3mwZbBLKY1SI/0MzYag148UuhRLjf88TT4dRQwp
 YJqZgNZMyLa5yKEa3KFw/A5fPev3VSs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-JphOzXANNFeuOIiQHfOcyw-1; Mon, 23 Nov 2020 02:51:29 -0500
X-MC-Unique: JphOzXANNFeuOIiQHfOcyw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9FB69CC0F;
 Mon, 23 Nov 2020 07:51:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A2605C1BD;
 Mon, 23 Nov 2020 07:51:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 30C7411358BA; Mon, 23 Nov 2020 08:51:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 3/8] qnum: QNumValue type for QNum value literals
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-4-ehabkost@redhat.com>
 <CAJ+F1C+YUZdP56MuLtZbO0fK6rPsDosgxXG4zaDq=mjwqsV74A@mail.gmail.com>
 <20201117144246.GD1235237@habkost.net>
 <CAJ+F1CLZg-hhuK2ffRzVaWiZKe2Aqvf0-mqxXGAzscSa8FmCNw@mail.gmail.com>
 <87mtzdd4p7.fsf@dusky.pond.sub.org>
 <20201119182158.GX1509407@habkost.net>
 <877dqg8ukz.fsf@dusky.pond.sub.org>
 <20201120182720.GF2271382@habkost.net>
Date: Mon, 23 Nov 2020 08:51:27 +0100
In-Reply-To: <20201120182720.GF2271382@habkost.net> (Eduardo Habkost's message
 of "Fri, 20 Nov 2020 13:27:20 -0500")
Message-ID: <877dqcwlxc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Fri, Nov 20, 2020 at 06:29:16AM +0100, Markus Armbruster wrote:
[...]
>> When the structure of a data type is to be kept away from its users, I
>> prefer to keep it out of the public header, so the compiler enforces the
>> encapsulation.
>
> I prefer that too, except that it is impossible when users of the
> API need the compiler to know the struct size.

There are cases where the structure of a data type should be
encapsulated, yet its size must be made known for performance (avoid
dynamic memory allocation and pointer chasing).

Need for encapsulation correlates with complex algorithms and data
structures.  The cost of dynamic allocation is often in the noise then.


