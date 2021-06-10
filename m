Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9074D3A2DBA
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:07:43 +0200 (CEST)
Received: from localhost ([::1]:55004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrLLO-0005jU-NX
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrLIz-0002IS-Mv
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:05:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrLIt-0007I8-Co
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:05:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623333902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/6hT08WY8WYt8DF6eTk3PpC3JBFgr0nNBihXbU0QOTQ=;
 b=iPa4hhezLisWZQiy1WcUi8Belbc41SizMUPLa/7diHs5XvYFhVOXbf6A/Po2hv4IHXvI4v
 kEh4q7+kLsYQNgWTe5PA8yavvFruDIucf5Byw4jMXsW25GmHmKgo3V1xFOXuC35lR6Zm8a
 HoVYRVR4ZNdL0/MLNAj/02vLrrg7rB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-rueLrJnfPv-qZLIKbMWGXw-1; Thu, 10 Jun 2021 10:04:09 -0400
X-MC-Unique: rueLrJnfPv-qZLIKbMWGXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5814F9F92F;
 Thu, 10 Jun 2021 14:04:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 841095C1CF;
 Thu, 10 Jun 2021 14:03:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AA57118000B2; Thu, 10 Jun 2021 16:03:54 +0200 (CEST)
Date: Thu, 10 Jun 2021 16:03:54 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 17/18] modules: check arch and block load on mismatch
Message-ID: <20210610140354.egrgtwa5r5yxei3f@sirius.home.kraxel.org>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <20210610055755.538119-18-kraxel@redhat.com>
 <YMIHDKEGQWKtwEU5@redhat.com>
 <20210610125721.b27j6raf4h3qujt3@sirius.home.kraxel.org>
 <YMIOQNXkOoFekp8p@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YMIOQNXkOoFekp8p@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Is the JSON file completely static, listing all modules that were built
> regardless of whether they are currently installed, or would it need to
> be refreshed when installing/uninstalling RPMs with modules ? I would
> think we can do the former and simply handle missing modules on disk
> fairly easily

We can do both.  The file is generated and installed as part of the
build/install process, and it can be simply used as-is even if some of
the modules are missing.

It's also possible to update the modinfo.json file in postinstall /
postuninstall by simply running qemu-modinfo, so only the modules
actually installed are listed there.

take care,
  Gerd


