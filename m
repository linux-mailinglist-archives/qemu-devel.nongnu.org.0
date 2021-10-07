Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7A0425F8E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 23:54:12 +0200 (CEST)
Received: from localhost ([::1]:42908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYbL8-00050U-H5
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 17:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mYbKF-0004C6-EC
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 17:53:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mYbK9-0001oR-9j
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 17:53:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633643586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g7w/TaktYoIddF3PSUMiplSM93gOKY8AkkUY3Cw+0KM=;
 b=YPDVLovh9ifXBBpjPE6wbRNXUfGcsWvWAErbPQhFqbZDaZZ8PSHJXo9iPdasI++Vl+da4z
 7Vz+u7Uv7sluyRuFAfdlLjfoV8pSCmNyore3vyw9Y3exUkrtN+gARgGJRPXrzEZthpfIXC
 E+EJUKbG+/q8YkGLJyDQOtKY6GnJBFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-O4pKimztN_iKmEUDdbFCBA-1; Thu, 07 Oct 2021 17:53:03 -0400
X-MC-Unique: O4pKimztN_iKmEUDdbFCBA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EC8A1760D6;
 Thu,  7 Oct 2021 21:46:38 +0000 (UTC)
Received: from redhat.com (ovpn-113-216.phx2.redhat.com [10.3.113.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E30D51057F64;
 Thu,  7 Oct 2021 21:46:34 +0000 (UTC)
Date: Thu, 7 Oct 2021 16:46:33 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 04/17] python/aqmp: add send_fd_scm
Message-ID: <20211007214606.ia5hob7heugzjoao@redhat.com>
References: <20210923004938.3999963-1-jsnow@redhat.com>
 <20210923004938.3999963-5-jsnow@redhat.com>
 <20211007145214.ua7db2hwifhtawis@redhat.com>
 <CAFn=p-bwAL5ZmGHHR+uC-vbb=AdgdoFoqY3aHCNV6CZdKxjcmA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-bwAL5ZmGHHR+uC-vbb=AdgdoFoqY3aHCNV6CZdKxjcmA@mail.gmail.com>
User-Agent: NeoMutt/20210205-818-e2615c
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 07, 2021 at 12:27:24PM -0400, John Snow wrote:
> On Thu, Oct 7, 2021 at 10:52 AM Eric Blake <eblake@redhat.com> wrote:
> 
> > On Wed, Sep 22, 2021 at 08:49:25PM -0400, John Snow wrote:
> > > The single space is indeed required to successfully transmit the file
> > > descriptor to QEMU.
> >
> > Sending fds requires a payload of at least one byte, but I don't think
> > that qemu cares which byte.  Thus, while your choice of space is fine,
> > the commit message may be a bit misleading at implying it must be
> > space.
> >
> >
> OK, I'll rephrase. (Space winds up being useful in particular because it
> doesn't mess with the parsing for subsequent JSON objects sent over the
> wire.)
> 
> (Idle curiosity: Is it possible to make QEMU accept an empty payload here?
> I understand that for compatibility reasons it wouldn't change much for the
> python lib even if we did, but I'm curious.)

No, my understanding is that for SCM_RIGHTS to work reliably, you HAVE
to have a payload to avoid a return value of 0 from recvmsg() which
would be ambiguous with the peer performing orderly shutdown.  'man 7
unix' confirms:

       At  least  one  byte of real data should be sent when sending ancillary
       data.  On Linux, this is required to successfully send  ancillary  data
       over  a  UNIX domain stream socket.  When sending ancillary data over a
       UNIX domain datagram socket, it is not necessary on Linux to  send  any
       accompanying real data.  However, portable applications should also in‐
       clude at least one byte of real data when sending ancillary data over a
       datagram socket.


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


