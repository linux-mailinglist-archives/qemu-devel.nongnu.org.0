Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DEF4C28D4
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 11:08:14 +0100 (CET)
Received: from localhost ([::1]:48310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNB2j-0005GB-2l
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 05:08:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nNB0X-0003x9-By
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:05:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nNB0V-0006qn-PB
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:05:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645697154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o9/wPFKHRsuXBXaTXhVUeAaiExOAQfkrl8LU4prJwIg=;
 b=XrvBYghSUBeSFK07PWMclHQPt3B0hqVwtkg8sxUkKBBBMQKvYLpyO/9++wCs8tFTV4d5YW
 lTHdNbyisADSwrpJW0BOempInXRFLJU2f9+etu339BKgiVFeeJZaAF04oJT9RSK2uWIMo8
 ngeVYFmE9fBgEf81ZhoSbXxqtJ6Xh90=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-iMXCikMbN5GXFShweX68Vg-1; Thu, 24 Feb 2022 05:05:53 -0500
X-MC-Unique: iMXCikMbN5GXFShweX68Vg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DC1E1006AA6;
 Thu, 24 Feb 2022 10:05:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55C5A2308A;
 Thu, 24 Feb 2022 10:04:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CB28D21E6A00; Thu, 24 Feb 2022 11:04:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Fabian Ebner <f.ebner@proxmox.com>
Subject: Re: [PATCH v8 1/3] monitor/hmp: add support for flag argument with
 value
References: <20220204101220.343526-1-f.ebner@proxmox.com>
 <20220204101220.343526-2-f.ebner@proxmox.com>
 <87tud8f7t0.fsf@pond.sub.org>
 <40352d01-3577-088d-23c6-1ab5f062d8a9@proxmox.com>
Date: Thu, 24 Feb 2022 11:04:56 +0100
In-Reply-To: <40352d01-3577-088d-23c6-1ab5f062d8a9@proxmox.com> (Fabian
 Ebner's message of "Thu, 24 Feb 2022 10:17:21 +0100")
Message-ID: <87zgmgvauv.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: w.bumiller@proxmox.com, berrange@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, marcandre.lureau@gmail.com, kraxel@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, eblake@redhat.com,
 t.lamprecht@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fabian Ebner <f.ebner@proxmox.com> writes:

> Am 09.02.22 um 15:12 schrieb Markus Armbruster:
>> Fabian Ebner <f.ebner@proxmox.com> writes:
>
> ----8<----
>
>>> diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
>>> index 3da3f86c6a..a4cb307c8a 100644
>>> --- a/monitor/monitor-internal.h
>>> +++ b/monitor/monitor-internal.h
>>> @@ -63,7 +63,8 @@
>>>   * '.'          other form of optional type (for 'i' and 'l')
>>>   * 'b'          boolean
>>>   *              user mode accepts "on" or "off"
>>> - * '-'          optional parameter (eg. '-f')
>>> + * '-'          optional parameter (eg. '-f'); if followed by a 'V', it
>>> + *              specifies an optional string param (e.g. '-fV' allows '-f foo')
>>>   *
>>>   */
>> 
>> For what it's worth, getopt() uses ':' after the option character for
>> "takes an argument".
>> 
>
> Doing that leads to e.g.
>     .args_type  = "protocol:s,password:s,display:-d:,connected:s?",
> so there's two different kinds of colons now.

Point.

>                                               It's not a problem
> functionality-wise AFAICT, but it might not be ideal. Should I still go
> for it?
>
> Also, wouldn't future non-string flag parameters need their own letter
> too? What about re-using 's' here instead?

Another good point.

Dave, what do you think?

>> Happy to make that tweak in my tree.  But see my review of PATCH 3
>> first.


