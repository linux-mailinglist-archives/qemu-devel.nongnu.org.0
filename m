Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAFA63A9BF
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 14:39:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozeLV-0008Od-DN; Mon, 28 Nov 2022 08:38:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozeLT-0008Ke-7Q
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:38:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozeLQ-0006aI-Rd
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:38:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669642728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jiFzm/k9soH6k/5lDy9A8EjXX5yB5yL456BE/nWSKik=;
 b=PYxk5han5gjHQWWfWmMy24Ur2fAqSp2nc6end2Itlf760qrytrQ/h5XA5PX04wIJAAJJTz
 4tDRC1YiiEm/Zho6DPLDjuC42xIU4nLxPoo5yX2v8KCNPVotF2z7EX3gfU28W+9eb4oJzK
 qUfcQ3keNRka/OKW/R+S7bHxY+Qvt94=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-NGUNMhbANzS7V9xJhwshSA-1; Mon, 28 Nov 2022 08:38:46 -0500
X-MC-Unique: NGUNMhbANzS7V9xJhwshSA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 479D238123A1;
 Mon, 28 Nov 2022 13:38:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18D66C15BA4;
 Mon, 28 Nov 2022 13:38:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DDE6921E6921; Mon, 28 Nov 2022 14:38:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org,  mst@redhat.com,  marcel.apfelbaum@gmail.com
Subject: Re: [PATCH 05/12] pci: Build hw/pci/pci-hmp-cmds.c only when
 CONFIG_PCI
References: <20221128080202.2570543-1-armbru@redhat.com>
 <20221128080202.2570543-6-armbru@redhat.com>
 <Y4Sol9q0NI52iTmE@work-vm>
Date: Mon, 28 Nov 2022 14:38:42 +0100
In-Reply-To: <Y4Sol9q0NI52iTmE@work-vm> (David Alan Gilbert's message of "Mon, 
 28 Nov 2022 12:24:55 +0000")
Message-ID: <87sfi3p5b1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Markus Armbruster (armbru@redhat.com) wrote:
>> We compile pci-hmp-cmds.c always, but pci-qmp-cmds.c only when
>> CONFIG_PCI.  hw/pci/pci-stub.c keeps the linker happy when
>> !CONFIG_PCI.  Build pci-hmp-cmds.c that way, too.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Had you considered wrapping the hmp-commands-info.hx entry
> with a #if defined instead?

No.  Would you prefer that?

Code containing #ifdef CONFIG_PCI is target-dependent.  Looks like the
affected monitor code already is, so no new headaches.

Aside: splitting off its target-independent parts could be nice.  Not
today.

[...]


