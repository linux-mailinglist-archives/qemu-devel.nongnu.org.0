Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EE33340BB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 15:51:14 +0100 (CET)
Received: from localhost ([::1]:32942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK0B6-0005vl-V8
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 09:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lK092-0005L7-Oi
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 09:49:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lK090-0002yK-At
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 09:49:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615387739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=leE63RMCbVj0JPhc+lDOEy/Zz2FILLLukAPJPdyz30c=;
 b=dP06H6jk7bgL4HN0dwYwOEBdv5RAdRPtrFLjDjN6TwwZZJ1x576E74y9p/KzDm3/h4aZgN
 MSlaGC+8O8kO48nZ69htflESv0MiW6AIqYo5x36sc8pSs0qeeLW+LXrVjbC7cX2I65ckdK
 x5RRZvk4hEpxxPrR9NHJI1E+mpIEphQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-3Ge17v3VPOaiYCE0RRBAqA-1; Wed, 10 Mar 2021 09:48:58 -0500
X-MC-Unique: 3Ge17v3VPOaiYCE0RRBAqA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69F05881D6B;
 Wed, 10 Mar 2021 14:48:57 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A76DB5DEF9;
 Wed, 10 Mar 2021 14:48:44 +0000 (UTC)
Date: Wed, 10 Mar 2021 15:48:39 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 00/30] qapi/qom: QAPIfy --object and object-add
Message-ID: <YEjcR8wXTpbkAaZi@angien.pipo.sk>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <YEjWQnWKbr5teciB@angien.pipo.sk>
 <90130a0c-7f96-f344-b185-b790c5d6b78a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <90130a0c-7f96-f344-b185-b790c5d6b78a@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Kevin Wolf <kwolf@redhat.com>, lvivier@redhat.com, thuth@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 Markus Armbruster <armbru@redhat.com>, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 15:31:57 +0100, Paolo Bonzini wrote:
> On 10/03/21 15:22, Peter Krempa wrote:
> > I've stumbled upon a regression with this patchset applied:
> > 
> > error: internal error: process exited while connecting to monitor: qemu-system-x86_64: -object memory-backend-ram,id=pc.ram,size=1048576000,host-nodes=0,policy=bind: Invalid parameter type for 'host-nodes', expected: array
> 
> This is the magic conversion of "string containing a list of integers" to
> "list of integers".
> 
> The relevant code is in qapi/string-input-visitor.c, but I'm not sure where
> to stick it in the keyval-based parsing flow (i.e.
> qobject_input_visitor_new_keyval).  Markus, any ideas?

I've got a slightly off-topic question/idea.

Would it be reasonably easy/straightforward to run qemu's init code
which parses arguments and possibly validates them but quit before
actually starting to initiate resources?

The use case would be to plug it (optionally?) into libvirt's
qemuxml2argvtest to prevent such a thing from happening.

It's not feasible to run all the configurations we have with a real VM
but a partial validation would possibly make sense if it's easy enough.


