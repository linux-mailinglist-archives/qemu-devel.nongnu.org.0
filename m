Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AF3302603
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 15:07:52 +0100 (CET)
Received: from localhost ([::1]:46796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l42X1-000637-4K
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 09:07:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l42UJ-0004y5-M6
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:05:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l42UD-0008Ow-Ib
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:05:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611583494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U4vjpEJVDFgg23KflSvzljr185Vac9LGFBelBttoAig=;
 b=KmG1M3/s9QLQ8y4y8RIeg4K9kE70JRYjNr87hYtea/fzC9uTOaS1oz1QUJqaxLCCuRKaIt
 rDCuMc35WUln2tUmhhk50W3Jaj58n+9Q6j2YohGSAbiYxOfmE070tytGyA9p8/HJTytDA4
 ZGTJobLecCRSzEMKDWRrU6WBz76RMxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-rBrCQ-FTPtaitABqliUr7g-1; Mon, 25 Jan 2021 09:04:52 -0500
X-MC-Unique: rBrCQ-FTPtaitABqliUr7g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D96068799FB
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 14:02:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8BAF5D6AB;
 Mon, 25 Jan 2021 14:02:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 25D92113865F; Mon, 25 Jan 2021 15:02:35 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 10/25] hmp: special case help options for object_add
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-11-pbonzini@redhat.com>
 <875z3lgp27.fsf@dusky.pond.sub.org>
 <3d8a34d2-47b2-5f6f-0294-66c950717397@redhat.com>
Date: Mon, 25 Jan 2021 15:02:35 +0100
In-Reply-To: <3d8a34d2-47b2-5f6f-0294-66c950717397@redhat.com> (Paolo
 Bonzini's message of "Mon, 25 Jan 2021 13:49:49 +0100")
Message-ID: <87zh0xdshw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 25/01/21 13:48, Markus Armbruster wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>> 
>>> Fix "object_add help" and "object_add TYPE,help".
>>>
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> Standard question when I read "Fix $interface" in a commit message:
>> how
>> exactly is it broken?
>
> It doesn't work at all ("Error: parameter 'id' is missing").

Adding simple reproducers to commit messages won't hurt a bit, I
promise!

;-P


