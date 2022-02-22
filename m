Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AEA4BF1E6
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 07:10:38 +0100 (CET)
Received: from localhost ([::1]:60814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMONh-0004eU-JD
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 01:10:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nMOLC-0003j1-P7
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 01:08:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nMOL7-0000KF-80
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 01:08:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645510071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wylJiDwSjC/xm83drv3CFGzI4ZdLORJbkPlRXw95Tug=;
 b=Qhloe37kH9zauH/mCammrSnvmaaiQhgV+3P/VEwmbSXjn+ZrXYEUX4H/0Iu+DduxeE/LCo
 x/z36o03zR0pWhTWgIMiyOaoXhu69hlDO/MuPcZ74XqhLu+STLL2Doznvt1QUmdWzvUWGA
 Jz69JIohTpEjfA/t34q6V7kfrgO5Oj0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-0t5tkvdcMaO7_NY5HAKpoA-1; Tue, 22 Feb 2022 01:07:48 -0500
X-MC-Unique: 0t5tkvdcMaO7_NY5HAKpoA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED2BB5123;
 Tue, 22 Feb 2022 06:07:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41C675DB9B;
 Tue, 22 Feb 2022 06:07:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9ECAE21608C7; Tue, 22 Feb 2022 07:07:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: [PATCH 2/3] util/main-loop: Introduce the main loop into QOM
References: <20220221170843.849084-1-nsaenzju@redhat.com>
 <20220221170843.849084-3-nsaenzju@redhat.com>
Date: Tue, 22 Feb 2022 07:07:44 +0100
In-Reply-To: <20220221170843.849084-3-nsaenzju@redhat.com> (Nicolas Saenz
 Julienne's message of "Mon, 21 Feb 2022 18:08:44 +0100")
Message-ID: <87ilt7zb67.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, eduardo@habkost.net, hreitz@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nicolas Saenz Julienne <nsaenzju@redhat.com> writes:

> 'event-loop-backend' provides basic property handling for all
> 'AioContext' based event loops. So let's define a new 'MainLoopClass'
> that inherits from it. This will permit tweaking the main loop's
> properties through qapi as well as through the command line using the
> '-object' keyword[1]. Only one instance of 'MainLoopClass' might be
> created at any time.
>
> 'EventLoopBackendClass' learns a new callback, 'can_be_deleted()' so as
> to mark 'MainLoop' as non-deletable.
>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
>
> [1] For example:
>       -object main-loop,id=main-loop,poll-max-ns=<value>

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>


