Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08090625D8B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 15:54:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otVPH-0005p7-8H; Fri, 11 Nov 2022 09:53:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1otVP7-0005kA-L1
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:53:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1otVP6-0006rX-6Z
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:53:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668178391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NoeHhGlDmiOo6k1RIC0a1F9yJ3wGGSJDdMsWgiMgJlA=;
 b=fSQtI7epY7789xk0iaYslGL+/UD0iC7GmyStYnjgX2vhRrEl+s/ifB1GAzQv/iNbLLwcx7
 H+uguDPG4mcYYpL0RMzogLFau/D7ao4b63AZlIo+7HrCdbfw9k3z0WiNG9NiRzqCOMBwUu
 mclMozuEPmVD0CdfXsysYGqTy7vMIZI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-CEb4gXCmN46traamfOWD7g-1; Fri, 11 Nov 2022 09:53:07 -0500
X-MC-Unique: CEb4gXCmN46traamfOWD7g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AC3A185A7AE;
 Fri, 11 Nov 2022 14:53:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC70B140EBF5;
 Fri, 11 Nov 2022 14:53:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A41F321E6921; Fri, 11 Nov 2022 15:53:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org,  Matthew Rosato <mjrosato@linux.ibm.com>,  Tony
 Krowiak <akrowiak@linux.ibm.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v2] util/qemu-config: Fix "query-command-line-options"
 to provide the right values
References: <20221111141323.246267-1-thuth@redhat.com>
Date: Fri, 11 Nov 2022 15:53:05 +0100
In-Reply-To: <20221111141323.246267-1-thuth@redhat.com> (Thomas Huth's message
 of "Fri, 11 Nov 2022 15:13:23 +0100")
Message-ID: <875yflbl0u.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

Thomas Huth <thuth@redhat.com> writes:

> The "query-command-line-options" command uses a hand-crafted list
> of options that should be returned for the "machine" parameter.
> This is pretty much out of sync with reality, for example settings
> like "kvm_shadow_mem" or "accel" are not parameters for the machine
> anymore. Also, there is no distinction between the targets here, so
> e.g. the s390x-specific values like "loadparm" in this list also
> show up with the other targets like x86_64.
>
> Let's fix this now by geting rid of the hand-crafted list and by
> querying the properties of the machine classes instead to assemble
> the list.

Do we know what uses this command, and how these users are
inconvenienced by the flaw you're fixing?

I'm asking because the command is pretty much out of sync with reality
by (mis-)design.

> Fixes: 0a7cf217d8 ("fix regression of qmp_query_command_line_options")

Hah: "We need to find a better fix for 2.4." 

> Signed-off-by: Thomas Huth <thuth@redhat.com>


