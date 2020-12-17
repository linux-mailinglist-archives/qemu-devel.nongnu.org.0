Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE71B2DCCD0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 08:02:52 +0100 (CET)
Received: from localhost ([::1]:44162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpnJL-0006EN-DP
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 02:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpnHX-0005mK-GD
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 02:01:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpnHU-0003hs-Hq
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 02:00:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608188454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o0t5yCxj9qgl5JDNksJT9RnGmu/cic03WfQb5JDDSOI=;
 b=Eiglli0Qrk/Ec7026kiKmSIUTb3g/pWxRk1ZhvMj9+FmiBuUw/563nrbiGRwC8d/Wh7B09
 EbWbKVbf2cRjf7VnH8+duL3rnODG5KRBDZzy2fwFOe+7CnjN/ee8Joc4T/rkjUFSL90zgZ
 FnmASmKqw3tAOGfdul0j3OlZkPN2xOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-hcGhLiI_O4e7NNfO_miitg-1; Thu, 17 Dec 2020 02:00:52 -0500
X-MC-Unique: hcGhLiI_O4e7NNfO_miitg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 703F8107ACE6
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 07:00:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F4FB57;
 Thu, 17 Dec 2020 07:00:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A19CC11329A5; Thu, 17 Dec 2020 08:00:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 05/11] qapi/introspect.py: add preliminary type hint
 annotations
References: <20201026194251.11075-1-jsnow@redhat.com>
 <20201026194251.11075-6-jsnow@redhat.com>
 <874kltnqx8.fsf@dusky.pond.sub.org>
 <995012d8-9b13-726a-fa05-844ec8ff61f6@redhat.com>
 <87v9d2tci9.fsf@dusky.pond.sub.org>
 <0f1b6793-b91b-604a-c3c1-1c7e343b356b@redhat.com>
Date: Thu, 17 Dec 2020 08:00:49 +0100
In-Reply-To: <0f1b6793-b91b-604a-c3c1-1c7e343b356b@redhat.com> (John Snow's
 message of "Wed, 16 Dec 2020 20:35:04 -0500")
Message-ID: <877dpgncgu.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 12/16/20 2:51 AM, Markus Armbruster wrote:
>> Is it too late to delay the introduction of type hints until after
>> the
>> data structure cleanups?
>> If yes, I have to spend more time replying below.
>> 
>
> No, I re-ordered the series again to delay typing until the end, or
> close to it.

Thanks!

> Though I abandoned plans to slacken List[...] inputs to Iterable[...]
> or Sequence[...] like I had mentioned; I think it could still be done,
> but it's fine to just use List[...] for the inputs for now. We can
> worry about optimizing type flexibility later, I think.

Shouldn't be a problem now I know what to expect.

> Let's just get the dog hunting at all first.

Yes.


