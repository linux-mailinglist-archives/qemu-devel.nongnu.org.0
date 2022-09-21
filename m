Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B83D95BFF0E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 15:41:53 +0200 (CEST)
Received: from localhost ([::1]:39046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oazz5-0001IQ-RU
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 09:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oaz8n-00073E-Jf
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:47:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oaz8k-0005yJ-Be
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:47:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663764465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xOSaANbV2GRcoGINR/HL4qWr8dFW3tLqPEry8NahnUI=;
 b=gNH+u3tWP3pDZLygL30PeCzkDTYynw8HtbsEadj6cwp08ADUUnYcPtWeI48inJyZErfrPR
 dJgs+n7Ynm2tv63D/F4Uaf0HJETj06GcoxQcnOYebGO913DqFcjcoxdpW5aov8W24jUiYS
 JDMzQIjDRum+vbDa6Drn45EQ/HRyL5I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-sqODtlPDM2-h7InBJqn7GA-1; Wed, 21 Sep 2022 08:47:41 -0400
X-MC-Unique: sqODtlPDM2-h7InBJqn7GA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92184380114B;
 Wed, 21 Sep 2022 12:47:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DBFA4EA57;
 Wed, 21 Sep 2022 12:47:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 410A121E6900; Wed, 21 Sep 2022 14:47:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org,  dinechin@redhat.com,  Gerd Hoffmann
 <kraxel@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Daniel =?utf-8?Q?P=2EBerrang=C3=A9?= <berrange@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one
 and module_load_qom_one
References: <20220908183012.17667-1-cfontana@suse.de>
 <20220908183012.17667-3-cfontana@suse.de>
 <877d23ekj0.fsf@pond.sub.org>
 <bc88027a-41bb-aef4-fd64-fcc367bf179d@suse.de>
 <87illnbdk5.fsf@pond.sub.org>
 <f4ff63d4-ff53-7e40-44fe-083aec1a98e3@suse.de>
 <87r10793sj.fsf@pond.sub.org>
 <63cfdc69-a326-51ea-78d1-ec1975be0298@suse.de>
Date: Wed, 21 Sep 2022 14:47:38 +0200
In-Reply-To: <63cfdc69-a326-51ea-78d1-ec1975be0298@suse.de> (Claudio Fontana's
 message of "Mon, 19 Sep 2022 10:45:07 +0200")
Message-ID: <87pmfodhcl.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Claudio Fontana <cfontana@suse.de> writes:

> Hi Markus, sorry for the harsh response last week, it comes from a position of lack of time,
> and the expectation that Richard's review would be enough.

I gladly accept your apology.

We had the good fortune to meet in person (at KVM Forums before the
plague).  Makes it so much easier to react "good guy is having a bad
day, try to help" instead of "bad guy, avoid".

> I don't have (and I suspect no one that is not 100% working on qemu "upstream" and cannot hang around IRC channels or such)
> good visibility of what happens to patches after they are reviewed like in this case,
> so this makes the process in my view overall quite unpredictable and seems to require a lot of time investment for even the smallest change.

I understand.  It's a common complaint.

> That is why I would generally prefer smaller chunks of work to be committed incrementally, each series self-contained,
> rather than hundred-patch series that I expect to lose momentum or get lost.
>
> There are things we can fine tune here, but I see some of the changes you propose as going beyond what a fix for the acute problem really requires,
> so if this series requires a lot of work in your view for even the minimal fix to be done, I think we will need someone else to step in and expand on the work,
>
> or we will have to keep the fix as downstream-only for now, and I'll try to find more time to invest early next year.

That's fair.

We can accept patches that don't solve the entire problem.  I still like
to understand the entire problem to a useful degree, and have a rough
idea of how a solution of the entire problem could look like.

We may then conclude that such a solution isn't in the cards right now,
but a partial solution is, so we better take it.

Sometimes, the proposed patch turns out to be not even a partial
solution (but we recognize that only now we understand the entire
problem).  Then we better reject it.

Trouble is that developing such an understanding in patch review can
easily come over as non-negotiable demands.  This can be frustrating and
demoralizing for patch submitters.  I try to avoid this trap, but I
don't always succeed.  When understanding the patch and the problem
consumes 95% of my poor brain's capacity, I'm left with 5% for
communicating...  and when 5% aren't enough, I need to apologize for not
expressing myself clearly.


