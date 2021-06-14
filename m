Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4853A68B9
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:09:30 +0200 (CEST)
Received: from localhost ([::1]:37366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnHN-0003wS-TP
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lsnFQ-0002O7-63
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:07:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lsnFN-0003MO-5D
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:07:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623679644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1bKopgjZfg7HQoJEZatXWRc4JEFQ42yCr4pCREAwO1c=;
 b=B3WUjvjwKsUH+UDaAESHomRQUUpIvjwS7J+HqwSsUlCa+IehycOc+SMv2C+380Yrj8m5Ea
 h3GzUhjPF6PvTP9+93XVU5q8f74p+wNHM0n3wa77i+kkS29V76dWXST7VZuT0gCQgy2M4i
 DX2xaZCRyYRES526yD/Fe2yBMDBUqvY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-1DQRJtUZNWKuM--tTjtqqg-1; Mon, 14 Jun 2021 10:07:23 -0400
X-MC-Unique: 1DQRJtUZNWKuM--tTjtqqg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D90C185061C;
 Mon, 14 Jun 2021 14:07:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECE2210016F4;
 Mon, 14 Jun 2021 14:07:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 11C1B18000B2; Mon, 14 Jun 2021 16:07:06 +0200 (CEST)
Date: Mon, 14 Jun 2021 16:07:06 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v2 00/18] modules: add metadata database
Message-ID: <20210614140706.o7vqhweo3oqklhct@sirius.home.kraxel.org>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <dd1c5487-b1bf-9e33-fd42-fc0863e0ddd7@suse.de>
 <20210610095434.iygaxizo5h3745zf@sirius.home.kraxel.org>
 <a33c7fda-0865-525b-5138-e87b6233f9a2@suse.de>
MIME-Version: 1.0
In-Reply-To: <a33c7fda-0865-525b-5138-e87b6233f9a2@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Peter Lieven <pl@kamp.de>, qemu-s390x@nongnu.org,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 =?utf-8?B?Sm9zw6k=?= Ricardo Ziviani <jose.ziviani@suse.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, berrange@redhat.com,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi,

> Based on the information you provided, the reason this whole series
> exists seems to be to remove the need to update modules in multiple
> places.

Well, I'm trying to improve the way we handle module meta-data (see
other mail just send for details).

> Is there a real need to copy over the mechanism from the kernel, or
> are the requirements actually different/simpler here?

Even though the exact kind of meta-data is different (qemu wants know
qom types implemented by module, kernel wants know what hardware a
module can drive) the fundamental problem is the same:  We need some
meta-data about modules for lookup.  The workflow is simliar too:
The meta-data is stored in a .modinfo elf section.  Then a utility
collects that data and stores them in a database.

For the kernel 'depmod' stores the data in
/lib/modules/$version/modules.$name (with modules.alias being the
largest database).

I'm trying to have qemu-modinfo store this in modinfo.json.

take care,
  Gerd


