Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C105552B97
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 09:17:06 +0200 (CEST)
Received: from localhost ([::1]:59598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Y8F-0000nl-Nh
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 03:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3Y5v-00004v-Cw
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 03:14:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3Y5s-0008Gm-20
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 03:14:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655795675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4GKK6NNUfPhawrOhxOEb7cjf1QSg9pxpZm8H0PBIG9I=;
 b=LLgyajY8cqXhL2UoVKlqT0oZgeWemOfwAUIlgKFJN2HqFRPE8CYpADuF8++Ftu8yRRyJwa
 ZXOXaBe9U92WpgiN1lUCAdjUxGDz5ylEuz4Bu1ctCNJKwEI2nPriUk16NlknVrKPHE4S13
 /+k4wUZnsDWrwBuF6sR5JkXVnWw9ts0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-6Yh6NJvvNoKWyoOrDl7aOQ-1; Tue, 21 Jun 2022 03:14:31 -0400
X-MC-Unique: 6Yh6NJvvNoKWyoOrDl7aOQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E10A3801756
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 07:14:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB1E040334D;
 Tue, 21 Jun 2022 07:14:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7C70C21E688E; Tue, 21 Jun 2022 09:14:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: libvir-list@redhat.com,  John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [libvirt PATCH v2] tools: add virt-qmp-proxy for proxying QMP
 clients to libvirt QEMU guests
References: <20220620171950.1416742-1-berrange@redhat.com>
Date: Tue, 21 Jun 2022 09:14:29 +0200
In-Reply-To: <20220620171950.1416742-1-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 20 Jun 2022 18:19:50
 +0100")
Message-ID: <8735fywkru.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> Libvirt provides QMP passthrough APIs for the QEMU driver and these are
> exposed in virsh. It is not especially pleasant, however, using the raw
> QMP JSON syntax. QEMU has a tool 'qmp-shell' which can speak QMP and
> exposes a human friendly interactive shell. It is not possible to use
> this with libvirt managed guest, however, since only one client can
> attach to he QMP socket at any point in time.

On the other hand, you can configure multiple QMP monitors.

Regardless, users get to do with QMP what users find useful.  No
objections from me.

> The virt-qmp-proxy tool aims to solve this problem. It opens a UNIX
> socket and listens for incoming client connections, speaking QMP on
> the connected socket. It will forward any QMP commands received onto
> the running libvirt QEMU guest, and forward any replies back to the
> QMP client.
>
>   $ virsh start demo
>   $ virt-qmp-proxy demo demo.qmp &
>   $ qmp-shell demo.qmp
>   Welcome to the QMP low-level shell!
>   Connected to QEMU 6.2.0
>
>   (QEMU) query-kvm
>   {
>       "return": {
>           "enabled": true,
>           "present": true
>       }
>   }
>
> Note this tool of course has the same risks as the raw libvirt
> QMP passthrough. It is safe to run query commands to fetch information
> but commands which change the QEMU state risk disrupting libvirt's
> management of QEMU, potentially resulting in data loss/corruption in
> the worst case.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


