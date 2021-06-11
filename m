Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C503A4441
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 16:41:28 +0200 (CEST)
Received: from localhost ([::1]:59630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lriLf-0001BP-IT
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 10:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lriKr-0000Ke-Lf
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 10:40:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lriKq-0007I1-03
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 10:40:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623422434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vXsiHo7PiOUTMir6j4SaMsNEHoMrGpruoBXkg/pzTt0=;
 b=GYMYGRIKbuu+h5NywG3RJJHbRbNNFKPCOPheT2UjfNCLbCclf6FIKzkiuPKsqxi2btIRoH
 OBfp3Vc6nWNLLrWInmLsQo7CQ/UZleqNIIPD30a0MZ86JezDO41tUt0Ihb7n1RHrroWgxm
 xP+wvAY0o/MU0tfo4F3Qd5oXD+K9qMA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-HZPjZVz2MUKbNf8huWdybw-1; Fri, 11 Jun 2021 10:40:33 -0400
X-MC-Unique: HZPjZVz2MUKbNf8huWdybw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5B96EC1A1;
 Fri, 11 Jun 2021 14:40:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 786775C1A1;
 Fri, 11 Jun 2021 14:40:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 14350113865F; Fri, 11 Jun 2021 16:40:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 2/6] qapi/parser: Allow empty QAPIDoc Sections
References: <20210519191718.3950330-1-jsnow@redhat.com>
 <20210519191718.3950330-3-jsnow@redhat.com>
 <87y2c94gbp.fsf@dusky.pond.sub.org>
 <542e94f4-be9c-da6a-8307-1a36c8c6c7c4@redhat.com>
 <87v97cr6np.fsf@dusky.pond.sub.org>
 <c4eeaccf-7b7a-cf11-fdd0-d917085c6a15@redhat.com>
Date: Fri, 11 Jun 2021 16:40:31 +0200
In-Reply-To: <c4eeaccf-7b7a-cf11-fdd0-d917085c6a15@redhat.com> (John Snow's
 message of "Fri, 21 May 2021 11:55:29 -0400")
Message-ID: <87eed8ihwg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 5/21/21 1:35 AM, Markus Armbruster wrote:
>> Does not fire for qga/qapi-schema.json.  Can you help?
>
> Odd.
>
> I did:
>
> if self._section:
>     ...
> else:
>     raise QAPIWhicheverErrorItWas(...)
>
> and then did a full build and found it to fail on QGA stuff. You may
> need --enable-docs to make it happen.
>
> It later failed on test cases, too.

PEBKAC: I tested with a --disable-docs tree.  Disabled, because the
conversion to reST restored the "touch anything, rebuild everything" for
docs, which slows me down too much when I mess with the schema.

This snippet triggers the error:

    ##
    # @GuestExec:
    # @pid: pid of child process in guest OS
    #
    # Since: 2.5
    ##
    { 'struct': 'GuestExec',
      'data': { 'pid': 'int'} }

This one doesn't:

    ##
    # @GuestExec:
    #
    # @pid: pid of child process in guest OS
    #
    # Since: 2.5
    ##
    { 'struct': 'GuestExec',
      'data': { 'pid': 'int'} }

The code dealing with sections is pretty impenetrable.


