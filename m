Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C7A601022
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 15:25:33 +0200 (CEST)
Received: from localhost ([::1]:37924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okQ7Y-0005De-Qc
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 09:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okQ1B-00063h-59
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 09:18:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okQ19-0000r0-Mh
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 09:18:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666012735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fv+H1HfBuuaSSU9ZqnF7RzUaR12fVhwYkvfJvFZE4jo=;
 b=IVCnZ3AbJh9UP//5w/VAuclTIXvngx28mAbBPGLky89iPUGpRG2BD8YIF5/6KSVI6yl8rA
 /Fv1xMCEvqDM55u/f8M8cXPlxPusv4sPEuVJe0K5sQpkEr+jH2atsYSA+5Hc4MK2I+2/6H
 6FRCat7aORi/eDYMmmfptVBZJbNIy6o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-ssZCpTwiOh-ZqUAIGcsi1g-1; Mon, 17 Oct 2022 09:18:50 -0400
X-MC-Unique: ssZCpTwiOh-ZqUAIGcsi1g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D918832D9B;
 Mon, 17 Oct 2022 13:18:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04FB91468226;
 Mon, 17 Oct 2022 13:18:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F1BF621E691D; Mon, 17 Oct 2022 15:18:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Stefano Stabellini <sstabellini@kernel.org>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  "Dr. David
 Alan Gilbert"
 <dgilbert@redhat.com>,  Jason Wang <jasowang@redhat.com>,  "Michael S.
 Tsirkin" <mst@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Anthony
 Perard <anthony.perard@citrix.com>,  Greg Kurz <groug@kaod.org>,  Eric
 Blake <eblake@redhat.com>,  Stefan Weil <sw@weilnetz.de>,  Thomas Huth
 <thuth@redhat.com>,  Samuel Thibault <samuel.thibault@ens-lyon.org>,  Paul
 Durrant <paul@xen.org>,  David Gibson <david@gibson.dropbear.id.au>,
 xen-devel@lists.xenproject.org,  Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v11 12/17] net: dgram: add unix socket
References: <20221011200539.1486809-1-lvivier@redhat.com>
 <20221011200539.1486809-13-lvivier@redhat.com>
Date: Mon, 17 Oct 2022 15:18:19 +0200
In-Reply-To: <20221011200539.1486809-13-lvivier@redhat.com> (Laurent Vivier's
 message of "Tue, 11 Oct 2022 22:05:34 +0200")
Message-ID: <87r0z64mhw.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Laurent Vivier <lvivier@redhat.com> writes:

> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>


