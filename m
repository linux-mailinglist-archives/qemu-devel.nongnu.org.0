Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F3A2F4BDE
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 13:59:57 +0100 (CET)
Received: from localhost ([::1]:48588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzfki-0002we-V1
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 07:59:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzfii-0001mk-JC
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 07:57:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzfih-0007eJ-3A
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 07:57:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610542670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6DEOEbZv38MLrn2JV+WqBLZ+bLaJVMnwxEZoZFMgQAY=;
 b=M/z0Qd0+Kp23MTzEXRCD0/D2sV00P6VJAkkX+Qzzx7+NdQdrFyI5fh325Ees0gx7KE+y/V
 3CKpf01t+1udgM2P0w4dg600nfoLW9m+O6tkgh+kdXrDzYqp0hILJYYF2qiZUXlxZlvjDQ
 eoQUEsKIDyEzKE8diUc1oOjcnFm6cCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-HYZB7nPxMm2EyiqGgt6DTw-1; Wed, 13 Jan 2021 07:57:48 -0500
X-MC-Unique: HYZB7nPxMm2EyiqGgt6DTw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E106192D785;
 Wed, 13 Jan 2021 12:57:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6296710002A6;
 Wed, 13 Jan 2021 12:57:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 193B011386A7; Wed, 13 Jan 2021 13:57:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 2/7] rocker: Revamp fp_port_get_info
References: <20201223221102.390740-1-eblake@redhat.com>
 <20201223221102.390740-3-eblake@redhat.com>
Date: Wed, 13 Jan 2021 13:57:45 +0100
In-Reply-To: <20201223221102.390740-3-eblake@redhat.com> (Eric Blake's message
 of "Wed, 23 Dec 2020 16:10:57 -0600")
Message-ID: <87mtxd0zau.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> Instead of modifying the value member of a list element passed as a
> parameter, and open-coding the manipulation of that list, it's nicer
> to just return a freshly allocated value to be prepended to a list
> using QAPI_LIST_PREPEND.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Alread in master as commit fe4d7e338f.


