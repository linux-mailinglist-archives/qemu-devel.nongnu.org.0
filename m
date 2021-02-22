Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A88E321F19
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 19:24:03 +0100 (CET)
Received: from localhost ([::1]:36620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEFsI-0005rV-5E
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 13:24:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lEFrG-0005Pk-89
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 13:22:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lEFrC-0000qd-1u
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 13:22:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614018172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=605HT3GZYrJzwOtc09kEDNmROElmT7CQmvXpIhBugX0=;
 b=HrkiXbeYt7cup7uKLs7jJfK1o/AUwDojYucSPZXmXWF4FRhXhBwx0/Q0SkBNHS/DATfUW5
 mmQ3Vb6IYFPkOiqN00aqdC/KMVy9mB2wIRKwf4ebkgjauz2+gkCgYO/O9I7cF0UjMbwdfw
 ZM136ta+iWbG+vRiGhZupq9DN1uCc60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-3tXs2OkoOm2uBdtsr7goiQ-1; Mon, 22 Feb 2021 13:22:50 -0500
X-MC-Unique: 3tXs2OkoOm2uBdtsr7goiQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 760921074CC1;
 Mon, 22 Feb 2021 18:22:49 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61C735D71D;
 Mon, 22 Feb 2021 18:22:35 +0000 (UTC)
Date: Mon, 22 Feb 2021 19:22:32 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: A brief look at deprecating our JSON extensions over RFC 8259
Message-ID: <20210222182232.GZ2875719@angien.pipo.sk>
References: <875z2knoa5.fsf@dusky.pond.sub.org>
 <ceb5d0f8-3022-e91a-006b-5ac6e5862e4a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ceb5d0f8-3022-e91a-006b-5ac6e5862e4a@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 22, 2021 at 18:42:00 +0100, Paolo Bonzini wrote:
> On 22/02/21 15:57, Markus Armbruster wrote:
> > * The block layer's pseudo-protocol "json:" (which can get embedded in
> >    image headers)
> 
> If it gets embedded in image headers, I don't think we'll be able to
> deprecate it ever.  We'd need to keep a converter for old images, at which
> point it's simpler to keep the extensions.

The converter or better 'fixer' actually doesn't need to be able to
interpret the old string, just accept a new. IOW it's more of a
documentation problem, because qemu-img can already do that since it's
able to write invalid JSON without interpreting it:

$ qemu-img rebase -f qcow2 -F qcow2 -b 'json:{' -u /tmp/ble.qcow2
$ qemu-img info /tmp/ble.qcow2
image: /tmp/ble.qcow2
file format: qcow2
virtual size: 10 MiB (10485760 bytes)
disk size: 196 KiB
cluster_size: 65536
backing file: json:{
backing file format: qcow2
Format specific information:
    compat: 1.1
    compression type: zlib
    lazy refcounts: false
    refcount bits: 16
    corrupt: false


