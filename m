Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0107622C13
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 14:03:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oskiP-0005sJ-2w; Wed, 09 Nov 2022 08:02:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oskiK-0005oF-Kq
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 08:01:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oskiI-00026i-HW
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 08:01:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667998913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WnUt3FhWQVJH9D+X1OtCt6Hny/X3fQa+KBBK5zOBEwI=;
 b=cEPtUVFc+9uVw40FZ/QIb5o51SNWEJBNtiQ/Mr1If0oUiWM5fuHVK3wp2DMgrlHVmw4nR+
 v3RNaElbUgaHjhATHfBkGzjitZpwTaNj6FP3+RnJ3y2O2Gitk65LJgQsTQXpOCDpJRGdGL
 0tjwU/MBdWcePtVIdJMa+nA4vuBu8Jo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-sdlp5AIaNmm93HkmC84mbA-1; Wed, 09 Nov 2022 08:01:50 -0500
X-MC-Unique: sdlp5AIaNmm93HkmC84mbA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E31491C0CE61;
 Wed,  9 Nov 2022 13:01:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B313940C2086;
 Wed,  9 Nov 2022 13:01:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 448CF21E6921; Wed,  9 Nov 2022 14:01:48 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  Keith Busch
 <kbusch@kernel.org>,  Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH 1/2] hw/nvme: fix incorrect use of errp/local_err
References: <20221109105357.30430-1-its@irrelevant.dk>
 <20221109105357.30430-2-its@irrelevant.dk>
 <87a650nw2i.fsf@pond.sub.org> <Y2ugFFtUF7EVHXaG@cormorant.local>
Date: Wed, 09 Nov 2022 14:01:48 +0100
In-Reply-To: <Y2ugFFtUF7EVHXaG@cormorant.local> (Klaus Jensen's message of
 "Wed, 9 Nov 2022 13:41:56 +0100")
Message-ID: <871qqcnuwz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Klaus Jensen <its@irrelevant.dk> writes:

> On Nov  9 13:36, Markus Armbruster wrote:
>> Klaus Jensen <its@irrelevant.dk> writes:
>> 
>> > From: Klaus Jensen <k.jensen@samsung.com>
>> >
>> > Make nvme_check_constraints() return an int and fix incorrect use of
>> > errp/local_err.
>> >
>> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>> 
>> One more question: what exactly do you mean by "incorrect use of
>> errp/local_err"?  Is it incorrect in the sense of "behaves badly", or
>> merely in the sense of "doesn't use the Error API the way it wants to be
>> used"?
>> 
>
> It's the last hunk of the patch:
>
> @@ -7586,7 +7585,6 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
>                &pci_dev->qdev, n->parent_obj.qdev.id);
>
>      if (nvme_init_subsys(n, errp)) {
> -        error_propagate(errp, local_err);
>          return;
>      }
>
> It propagates local_err (and it's NULL here).

Now I see, thanks!

Harmless, because error_propagate(errp, NULL) does nothing.  Worth
cleaning up all the same.

> And the bug is a consequence of the error-prone use of an unneeded local
> error value.

Yes.  Eliminating unnecessary error_propagate() tends to result in more
concise and clearer code.


