Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFA25A972A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 14:46:58 +0200 (CEST)
Received: from localhost ([::1]:36232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTjaz-0005hg-H3
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 08:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTjBD-0007La-Gl
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 08:20:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTjB7-0007W4-I4
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 08:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662034812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q/7oxXAlFPuRYiCqFJUqpIMPldX0zFhFijdtXwOtH9w=;
 b=OkPOoG/5UmU261fQ9oPAeIh/AJ5RwsodN8583iCIG4QJ4IcLLWN99uGsjfafMgYOm14kcM
 m9GUY3OWOvHNDIM8RLHC7iHUYSjVR4PkRo4YCTfaDd/fOipulxjc6J1U7Ea+l+olovETPA
 7erJ+vSwrA4dOeUYVSI/KhIGll6DSF8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-NSIuWtynMVmbsC9ijFDeOw-1; Thu, 01 Sep 2022 08:20:10 -0400
X-MC-Unique: NSIuWtynMVmbsC9ijFDeOw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7196B811E81;
 Thu,  1 Sep 2022 12:20:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 435BC2166B26;
 Thu,  1 Sep 2022 12:20:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E8EE921E6900; Thu,  1 Sep 2022 14:20:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v2 00/10] qapi examples fixes, simplified version
References: <20220901085840.22520-1-victortoso@redhat.com>
Date: Thu, 01 Sep 2022 14:20:08 +0200
In-Reply-To: <20220901085840.22520-1-victortoso@redhat.com> (Victor Toso's
 message of "Thu, 1 Sep 2022 10:58:30 +0200")
Message-ID: <877d2n1e2v.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Victor Toso <victortoso@redhat.com> writes:

> Hi,
>
> This is the follow up from v1. I've dropped a few patches that need
> further discussion. I plan to revisit those when submiting the generator
> again at a later time.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

and queued.  Thanks!

[...]


