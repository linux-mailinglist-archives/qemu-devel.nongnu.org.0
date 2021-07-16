Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD2B3CB511
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 11:11:55 +0200 (CEST)
Received: from localhost ([::1]:40954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Jsw-0007Dj-FM
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 05:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m4JrN-000607-SV
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 05:10:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m4JrM-0007ga-EP
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 05:10:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626426615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r/YoYk8K/FyVbmWZv6g+CPLv0lhpZjaXPLdJjiDjIUk=;
 b=et1vjlvea2byy4+maITj9NP2hoqP4ENQDzP21GcU9sSKxscXRlSiYmwUzJAp4os13eh7gm
 8BQyM/5BBbOSHr2WamKkF48Ef8dHYZNTNV4jvj1rPC3XMmQGUW1Jpy6q6sc6VLfzYW3mqD
 Vz97hubs2ZbesoPEmye5vckI76Ge5lQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-TEmumYNPObCKVBTrT53tig-1; Fri, 16 Jul 2021 05:10:13 -0400
X-MC-Unique: TEmumYNPObCKVBTrT53tig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 975DDA40C3;
 Fri, 16 Jul 2021 09:10:12 +0000 (UTC)
Received: from localhost (ovpn-112-169.ams2.redhat.com [10.36.112.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70CEB5C22B;
 Fri, 16 Jul 2021 09:10:06 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v1 2/9] s390x: toplogy: adding drawers and books to smp
 parsing
In-Reply-To: <87bl73df9y.fsf@dusky.pond.sub.org>
Organization: Red Hat GmbH
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
 <1626281596-31061-3-git-send-email-pmorel@linux.ibm.com>
 <87y2a8cda7.fsf@dusky.pond.sub.org>
 <0801e122-0e9c-e266-42e8-d5cddb16c237@linux.ibm.com>
 <87bl73df9y.fsf@dusky.pond.sub.org>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 16 Jul 2021 11:10:04 +0200
Message-ID: <87y2a6bp5f.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com, ehabkost@redhat.com, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 15 2021, Markus Armbruster <armbru@redhat.com> wrote:

> Pierre Morel <pmorel@linux.ibm.com> writes:
>
>> On 7/15/21 8:16 AM, Markus Armbruster wrote:
>>> Pierre Morel <pmorel@linux.ibm.com> writes:
>>> 
>>>> Drawers and Books are levels 4 and 3 of the S390 CPU
>>>> topology.
>>>> We allow the user to define these levels and we will
>>>> store the values inside the S390CcwMachineState.
>>> 
>>> Double-checking: are these members specific to S390?
>>
>> Yes AFAIK
>
> Makes me wonder whether they should be conditional on TARGET_S390X.
>
> What happens when you specify them for another target?  Silently
> ignored, or error?

I'm wondering whether we should include them in the base machine state
and treat them as we treat 'dies' (i.e. the standard parser errors out
if they are set, and only the s390x parser supports them.)

[I remember that we had a discussion ages ago about which parameters
should be included in the cpu topology, but I cannot recall the details :/]


