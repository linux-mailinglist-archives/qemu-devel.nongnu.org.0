Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BB42B7639
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 07:22:48 +0100 (CET)
Received: from localhost ([::1]:50994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfGre-0007B1-Rj
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 01:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfGqN-0006jN-9I
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 01:21:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfGqJ-0005us-AR
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 01:21:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605680481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dxPdWVAJhI1Rr4HfpQ76PuhjRxYHOx2rVS4Rgijet38=;
 b=dgTELdi9ltbzW/Wp5iISUgRwrlHQNdRMRTU3GKUhzHeeClcHNEDe+0iSO09ORLLcU/0c8i
 cbhUPOLZB/h31cSuqO1gs2eig6ULR5C83wMro8Ob+qrnjtVOrZdPkstUiEb0Efsp+6/3SG
 /rimvKRsQO4i60CrMhgLaMytX3IcqP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-PuPRQJSOPlmovuEDrKLucg-1; Wed, 18 Nov 2020 01:21:19 -0500
X-MC-Unique: PuPRQJSOPlmovuEDrKLucg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6666364144;
 Wed, 18 Nov 2020 06:21:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18E9751512;
 Wed, 18 Nov 2020 06:21:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 938D711358BA; Wed, 18 Nov 2020 07:21:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 5/7] qapi: Introduce QAPI_LIST_APPEND
References: <20201113011340.463563-1-eblake@redhat.com>
 <20201113011340.463563-6-eblake@redhat.com>
 <87blfw9mf1.fsf@dusky.pond.sub.org>
 <53efa18b-9fe2-fe38-a416-7a4f3ba6e07e@redhat.com>
Date: Wed, 18 Nov 2020 07:21:16 +0100
In-Reply-To: <53efa18b-9fe2-fe38-a416-7a4f3ba6e07e@redhat.com> (Eric Blake's
 message of "Tue, 17 Nov 2020 18:41:36 -0600")
Message-ID: <87mtzfp4mb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 11/17/20 6:51 AM, Markus Armbruster wrote:
>> Eric Blake <eblake@redhat.com> writes:
>> 
>>> Similar to the existing QAPI_LIST_PREPEND, but designed for use where
>>> we want to preserve insertion order.  Callers will be added in
>>> upcoming patches.  Note the difference in signature: PREPEND takes
>>> List*, APPEND takes List**.
>>>
>>> Signed-off-by: Eric Blake <eblake@redhat.com>
>
>>> +#define QAPI_LIST_APPEND(tail, element) do { \
>>> +    *(tail) = g_malloc0(sizeof(**(tail))); \
>>> +    (*(tail))->value = (element); \
>>> +    (tail) = &(*tail)->next; \
>
> Hmm; I'm inconsistent on whether to spell things '*tail' or '*(tail)'.
> I don't think any of the callers converted in patches 6 or 7 care about
> the difference, but for maximal copy-paste portability, the use of the
> macro parameter should be surrounded by () anywhere that could otherwise
> cause a mis-parse on some arbitrary expression with an operator at
> higher precedence than unary * (hmm, the only such operators are all
> suffix operators; so maybe the *(tail) is overkill...)

Good habit: enclose macro parameter in parenthesis unless there is a
reason not to.  Let's do it here, too.

>> Reviewed-by: Markus Armbruster <armbru@redhat.com>


