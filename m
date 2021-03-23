Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22620345BA2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 11:07:36 +0100 (CET)
Received: from localhost ([::1]:38230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOdwl-0004Ai-17
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 06:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdo1-0004Tf-V2
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:58:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdnx-0003zG-KC
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616493508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DsM+qnZ/2epz6bkzR0TDB1+W9g8xy/VINjgu0Lae1Gw=;
 b=e54zNSqc2GUUqCLM9nJvB3tjZLAOQu/jwN1QZ+JmW8t0Qm+XQP0w1565n45EXU5dLQgwTe
 laLxktXvlFOwowhbxKyvHVf8OV4tiCDuKlQFPZ1cUt5b24Ou0QHOwGi4jtaxFI6kQZSPwj
 e7G8CiyKPeom4FeYO0t90DVvDNbSdC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-pwKm1o39Mf6nJ39_sNVu_A-1; Tue, 23 Mar 2021 05:58:24 -0400
X-MC-Unique: pwKm1o39Mf6nJ39_sNVu_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E060910866A0;
 Tue, 23 Mar 2021 09:58:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7A0460BE5;
 Tue, 23 Mar 2021 09:58:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3B8EA11327E1; Tue, 23 Mar 2021 10:58:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Zhang, Chen" <chen.zhang@intel.com>
Subject: Re: [PATCH V4 3/7] qapi/net: Add new QMP command for COLO passthrough
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-4-chen.zhang@intel.com>
 <87ft0n4b7u.fsf@dusky.pond.sub.org>
 <63966964f3ea447bac59561cc1174f9f@intel.com>
Date: Tue, 23 Mar 2021 10:58:21 +0100
In-Reply-To: <63966964f3ea447bac59561cc1174f9f@intel.com> (Chen Zhang's
 message of "Tue, 23 Mar 2021 09:19:36 +0000")
Message-ID: <87tup2tcn6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Zhang, Chen" <chen.zhang@intel.com> writes:

>> -----Original Message-----
>> From: Markus Armbruster <armbru@redhat.com>
[...]
>> Now let's look at colo-passthrough-del.  I figure it is for deleting the kind of
>> things colo-passthrough-add adds.
>> 
>
> Yes.
>
>> What exactly is deleted?  The thing created with the exact same arguments?
>> 
>
> Delete the rule from the module's private bypass list.
> When user input a rule, the colo-passthrough-del will find the specific module by the object ID,
> Then delete the rule.
>
>> This would be unusual.  Commonly, FOO-add and FOO-del both take a string
>> ID argument.  The FOO created by FOO-add remembers its ID, and FOO-del
>> deletes by ID.
>
> The ID not for rules itself, it just logged the modules(ID tagged) affected by the rule.

I'm not sure I understand.

If you're pointing out that existing colo-passthrough-del parameter @id
is not suitable for use as unique rule ID: you can always add another
parameter that is suitable.


