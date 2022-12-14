Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E5B64C49E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 09:07:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Mfz-0000nM-L7; Wed, 14 Dec 2022 02:59:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5Mfv-0000mH-GG
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:59:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5Mft-00014U-Kf
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:59:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671004773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pj54tYTJtrc/4XOoBnCEENfYs3JoAf+7/zbEt4VGwg4=;
 b=QD9iClGN+hhIos3Blv5mI/uyU0xm8t5q4fKIwW1ZtMxH37pHp01ZJce9dP9Hfmq9c4YvjL
 QVZdKBpjuFBbRxuchRD8bdzhHYV6FcqihSBp0Ns/wW29S+iAgs0yeu+rL6dbeXroBnphud
 iZB7bTz0rAHL3XDdEMg7j0O1UVQVQWg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-Hn2ZjuklOK2z8hhD37E9xg-1; Wed, 14 Dec 2022 02:59:29 -0500
X-MC-Unique: Hn2ZjuklOK2z8hhD37E9xg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88B8129A9D39;
 Wed, 14 Dec 2022 07:59:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6437F14171BE;
 Wed, 14 Dec 2022 07:59:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3F51021E6900; Wed, 14 Dec 2022 08:59:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  kwolf@redhat.com,  hreitz@redhat.com,
 qemu-block@nongnu.org
Subject: Re: [PATCH 1/3] include/block: Untangle inclusion loops
References: <20221208143939.2775453-1-armbru@redhat.com>
 <20221208143939.2775453-2-armbru@redhat.com>
 <c623ec7a-657d-09e2-b205-09e455924154@redhat.com>
Date: Wed, 14 Dec 2022 08:59:26 +0100
In-Reply-To: <c623ec7a-657d-09e2-b205-09e455924154@redhat.com> (Paolo
 Bonzini's message of "Mon, 12 Dec 2022 23:19:40 +0100")
Message-ID: <87iliemn4x.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 12/8/22 15:39, Markus Armbruster wrote:
>>    * Global state (GS) API. These functions run under the BQL.
>>    *
>>    * See include/block/block-global-state.h for more information about
>> - * the GS API.
>> + * the GS API.b
>>    */
>
> One-character typo.

Thanks!


