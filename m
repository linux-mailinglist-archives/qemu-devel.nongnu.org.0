Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3DA519EF3
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 14:08:22 +0200 (CEST)
Received: from localhost ([::1]:34524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmDnp-0001ZS-Bz
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 08:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmDJe-0007CX-5x
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:37:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmDJb-00043K-Ue
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:37:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651664226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cVAXrGI6iO5kvmsrIySKn2Wi+yqGC1pNpwIaqV//vrA=;
 b=bNtN9+d6YiHgLuOgE0iIgmTXQgME5ENCWhOlgGLI7b7eIVeLqJtz4tMDcUaBDTBxcOLC07
 omq5ECPrYxX4d7QGd4SjxAmVbuCMBlX1J2lX356OEhT3NLL9fKMfHPOaN0DGe9e/fbZL1J
 qxF5s79OIAmlUrpmigr4RRzj3majp+Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-8X5kM_HMN0GZUFJCFfHpCg-1; Wed, 04 May 2022 07:37:03 -0400
X-MC-Unique: 8X5kM_HMN0GZUFJCFfHpCg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E3491D96CA2;
 Wed,  4 May 2022 11:37:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDB6B413721;
 Wed,  4 May 2022 11:37:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A9D8221E68BC; Wed,  4 May 2022 13:37:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Cc: qemu-devel@nongnu.org,  stefanha@redhat.com,  mst@redhat.com,
 f4bug@amsat.org,  pbonzini@redhat.com,  marcandre.lureau@redhat.com,
 thuth@redhat.com,  bleal@redhat.com,  berrange@redhat.com,
 eduardo@habkost.net,  marcel.apfelbaum@gmail.com,  eblake@redhat.com,
 quintela@redhat.com,  dgilbert@redhat.com,  imammedo@redhat.com,
 peterx@redhat.com,  john.levon@nutanix.com,  thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com,  john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com
Subject: Re: [PATCH v9 00/17] vfio-user server in QEMU
References: <cover.1651586203.git.jag.raman@oracle.com>
Date: Wed, 04 May 2022 13:37:01 +0200
In-Reply-To: <cover.1651586203.git.jag.raman@oracle.com> (Jagannathan Raman's
 message of "Tue, 3 May 2022 10:16:41 -0400")
Message-ID: <87a6bx7cma.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Does not apply for me.  What's your base?


