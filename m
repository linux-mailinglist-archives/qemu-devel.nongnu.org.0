Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1C739FA0F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 17:12:09 +0200 (CEST)
Received: from localhost ([::1]:41956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqdOi-00027W-6B
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 11:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqdNO-0001BW-1M
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:10:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqdNK-0004Fl-JM
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:10:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623165040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1Mmd5cDKpqN1Xa8YdJUMNJkDit57XTnoPV8XgmHQMr0=;
 b=S+7vhTGtyRoJeNdMHSWlWXAwVpx7KKlYTFciGzezDxZRr3gOZ+zKTFOyfHTIos7AwTBoaV
 wxHuj3TnwDpjN6VwK1Z5LmHwyWrG3L5ITT0FjeikTQr03XcZOkdIIq1opak8/CrJ03VWTj
 ljOcUdJIlzU12HpPOfbx6roUGTQGn/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-mghmnHetMu2yOpV8qhhTUg-1; Tue, 08 Jun 2021 11:10:37 -0400
X-MC-Unique: mghmnHetMu2yOpV8qhhTUg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5D83106BAE4;
 Tue,  8 Jun 2021 15:10:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 207E760C04;
 Tue,  8 Jun 2021 15:10:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9E9FB113865F; Tue,  8 Jun 2021 17:10:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 4/5] monitor: removed cpustats command
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-5-bruno.larsen@eldorado.org.br>
 <20210527084038.512c5270@bahia.lan>
Date: Tue, 08 Jun 2021 17:10:32 +0200
In-Reply-To: <20210527084038.512c5270@bahia.lan> (Greg Kurz's message of "Thu, 
 27 May 2021 08:40:38 +0200")
Message-ID: <8735tsxuhj.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Greg Kurz <groug@kaod.org> writes:

> On Wed, 26 May 2021 17:21:03 -0300
> "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> wrote:
>
>> Since ppc was the last architecture to collect these statistics and
>> it is currently phasing this collection out, the command that would query
>> this information is being removed.
>> 
>
> So this is removing an obviously user visible feature. This should be
> mentioned in docs/system/removed-features.rst... but, wait, I don't
> see anything for it in docs/system/deprecated.rst. This is dropping
> a feature without following the usual deprecation policy, i.e.
> marking the feature as deprecated and only remove it 2 QEMU versions
> later. Any justification for that ?

Our deprecation policy applies to stable interfaces, which HMP is not.

We don't break things there just because.  But dropping a command right
away when it is no longer useful is just fine.  No need to deprecate and
wait for the grace period.

[...]


