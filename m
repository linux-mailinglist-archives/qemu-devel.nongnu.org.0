Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5238B324154
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 17:06:13 +0100 (CET)
Received: from localhost ([::1]:51840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwg0-0006wn-C9
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 11:06:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lEwc7-0004i5-0k
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:02:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lEwc3-0004oc-Gl
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:02:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614182524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3uEyW2fzn2gx9uDyf1AtTnATPxUl8vLFACs8U9A3Dhw=;
 b=ihFuBPQNe+kpPfjl9OEVFMgyxLBoxIuKY0EkvZu1wZmJX1i8T2NnTfDRz7NkLI2+lf7YvM
 IsBkPaNRlxgh2q6xH90AytOySge0q5U6xm5+OIRURrmnRiOTLEoi0StIvdxzGhbmKvITiv
 UTfUofoGsSU5bJAPjmJ7t1idYGNfgXs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-j5Ia6tgXNiOmJuAA5IFvBQ-1; Wed, 24 Feb 2021 11:01:59 -0500
X-MC-Unique: j5Ia6tgXNiOmJuAA5IFvBQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC63980404B;
 Wed, 24 Feb 2021 16:01:57 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B328100760C;
 Wed, 24 Feb 2021 16:01:46 +0000 (UTC)
Date: Wed, 24 Feb 2021 17:01:43 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 00/31] qapi/qom: QAPIfy --object and object-add
Message-ID: <20210224160143.GB2875719@angien.pipo.sk>
References: <20210224135255.253837-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210224135255.253837-1-kwolf@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 24, 2021 at 14:52:24 +0100, Kevin Wolf wrote:
> This series adds a QAPI type for the properties of all user creatable
> QOM types and finally makes the --object command line option (in all
> binaries) and the object-add monitor commands (in QMP and HMP) use the
> new ObjectOptions union.
> 
> This change improves things in more than just one way:
> 
> 1. Documentation for QOM object types has always been lacking. Adding
>    the schema, we get documentation for every property.
> 
> 2. It prevents bugs by performing parts of the input validation (e.g.
>    checking presence of mandatory properties) already in QAPI instead of
>    relying on separate manual implementations in each class.
> 
> 3. It provides QAPI introspection for user creatable objects.
> 
> 4. Non-scalar properties are now supported everywhere because the
>    command line parsers (including HMP) use the keyval parser now.

I've updated and posted another version of the libvirt patches which add
testing that our generated props conform to the schema and also deals
with the dropped 'props' wrapper:

https://listman.redhat.com/archives/libvir-list/2021-February/msg01212.html

Libvirt's test pass after it without any change, so on behalf of libvirt

ACKed-by: Peter Krempa <pkrempa@redhat.com>


