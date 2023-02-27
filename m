Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB526A4627
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 16:35:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWfWY-0001gl-JU; Mon, 27 Feb 2023 10:34:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pWfWS-0001aT-PY
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 10:34:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pWfWP-0001Mc-Ox
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 10:34:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677512076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pf57iGYw7tc5yWrllmnQ1KbHMXZrJwdvHRaL6K/RmqM=;
 b=JY3K01CCxql3qpD5X1tVmkNtQlsd4SfDLAOoD0ImneGslK6kBPfTq1d9bYI9XLrNjZ+AIa
 i1rZ6+ytrJcwtsVsJ2yEcgsvbtU7KXD/WaJYWUcaYO54os2X7H4YCEG1vF/H0nl+UnQ6Qc
 BhB6IlAnO8I8vzU3nGg+MD5ewgKsXFM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-I015Qc6ONw2s2eSUN08pUw-1; Mon, 27 Feb 2023 10:34:32 -0500
X-MC-Unique: I015Qc6ONw2s2eSUN08pUw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDD8A1C068C8;
 Mon, 27 Feb 2023 15:34:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2DF4140EBF4;
 Mon, 27 Feb 2023 15:34:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 94A2521E6A1F; Mon, 27 Feb 2023 16:34:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>,  Pierre Morel <pmorel@linux.ibm.com>,
 qemu-s390x@nongnu.org,  qemu-devel@nongnu.org,  borntraeger@de.ibm.com,
 pasic@linux.ibm.com,  richard.henderson@linaro.org,  david@redhat.com,
 cohuck@redhat.com,  mst@redhat.com,  pbonzini@redhat.com,
 kvm@vger.kernel.org,  ehabkost@redhat.com,  marcel.apfelbaum@gmail.com,
 eblake@redhat.com,  seiden@linux.ibm.com,  nrb@linux.ibm.com,
 frankja@linux.ibm.com,  berrange@redhat.com,  clg@kaod.org
Subject: Re: [PATCH v16 08/11] qapi/s390x/cpu topology: set-cpu-topology
 monitor command
References: <20230222142105.84700-1-pmorel@linux.ibm.com>
 <20230222142105.84700-9-pmorel@linux.ibm.com>
 <aaf4aa7b7350e88f65fc03f148146e38fe4f7fdb.camel@linux.ibm.com>
 <0a93eb0e-2552-07b7-2067-f46d542126f4@redhat.com>
 <9e1cbbe11ac1429335c288e817a21f19f8f4af87.camel@linux.ibm.com>
 <87v8jnqorg.fsf@pond.sub.org>
 <d8da6f7d1e3addcb63614f548ed77ac1b8895e63.camel@linux.ibm.com>
Date: Mon, 27 Feb 2023 16:34:23 +0100
In-Reply-To: <d8da6f7d1e3addcb63614f548ed77ac1b8895e63.camel@linux.ibm.com>
 (Nina Schoetterl-Glausch's message of "Mon, 27 Feb 2023 13:51:19
 +0100")
Message-ID: <871qmbqg00.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Nina Schoetterl-Glausch <nsg@linux.ibm.com> writes:

> CpuS390Entitlement would be useful in both machine.json and machine-target.json
> because query-cpu-fast is defined in machine.json and set-cpu-topology is defined
> in machine-target.json.
> So then the question is where best to define CpuS390Entitlement.
> In machine.json and include machine.json in machine-target.json?
> Or define it in another file and include it from both?

Either should work.

If you include machine.json into machine-target.json, the
qapi-FOO-machine-target.h will include the qapi-FOO-machine.h.  No big
deal, I think: affects just eight .c.


