Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA332C6822
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 15:48:25 +0100 (CET)
Received: from localhost ([::1]:41448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kif2u-0002VM-Ik
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 09:48:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kif0T-0000jU-AR
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 09:45:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kif0N-00035A-Lp
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 09:45:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606488345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+8DpDrbM0g09yxh3FkjKfQZxKJTK6HYKX+qWaLUc5m8=;
 b=F4UZgMshkH9xrKGh3Vs9cWbhF0avg9RFPjXYM+azRQixY9L66i6N8nYr3uFC2K8PyMmSvi
 vmI6RQmWTwjh57UbTH1igP2Vq56sn62KWCJa18Gra8q5NpQOzxkyV/U5vrwL4ih6YPjSae
 5IiHRCeNDszxjeAvo+GSAQkGcgTPdbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-Np_0Wn-FMm2qeWe6V38l5A-1; Fri, 27 Nov 2020 09:45:44 -0500
X-MC-Unique: Np_0Wn-FMm2qeWe6V38l5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C12831E7F1;
 Fri, 27 Nov 2020 14:45:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 631855D9CC;
 Fri, 27 Nov 2020 14:45:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EB27C113864E; Fri, 27 Nov 2020 15:45:37 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v2 2/6] accel: accel_available() function
References: <20201125205636.3305257-1-ehabkost@redhat.com>
 <20201125205636.3305257-3-ehabkost@redhat.com>
 <12f82771-9db9-8fcd-ea25-736428d2650a@suse.de>
 <20201126133645.GG2271382@habkost.net>
 <8d90d611-6545-a478-1316-542dc5424b92@suse.de>
 <f4f64154-9fbb-36fa-d9cb-e49c8ed06537@redhat.com>
 <7df7713c-5125-9e41-3572-a476cad2946b@suse.de>
 <20201126214810.GR2271382@habkost.net>
 <55ed249f-9fd3-fe3d-c63a-8d74803a72ca@suse.de>
Date: Fri, 27 Nov 2020 15:45:37 +0100
In-Reply-To: <55ed249f-9fd3-fe3d-c63a-8d74803a72ca@suse.de> (Claudio Fontana's
 message of "Fri, 27 Nov 2020 10:04:37 +0100")
Message-ID: <87y2imq2ni.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Claudio Fontana <cfontana@suse.de> writes:

> On 11/26/20 10:48 PM, Eduardo Habkost wrote:
>> On Thu, Nov 26, 2020 at 10:06:03PM +0100, Claudio Fontana wrote:
>>> On 11/26/20 3:25 PM, Paolo Bonzini wrote:
>>>> On 26/11/20 15:13, Claudio Fontana wrote:
>>>>> One option I see is simply to document the behavior where
>>>>> accel_available() is declared in accel.h (ie do not use in fast
>>>>> path), as well as in accel_find() actually, so that both accel_find()
>>>>> and accel_available() are avoided in fast path and avoid being called
>>>>> frequently at runtime.
>>>>>
>>>>> Another option could be to remove the allocation completely, and use
>>>>> for example accel_find(ACCEL_CLASS_NAME("tcg")), or another option
>>>>> again would be to remove the allocation and use either a fixed buffer
>>>>> + snprintf, or alloca -like builtin code to use the stack, ...
>>>>>
>>>>> Not a big deal, but with a general utility and short name like
>>>>> accel_available(name) it might be tempting to use this more in the
>>>>> future?
>>>>
>>>> I think it's just that the usecase is not that common.  "Is this 
>>>> accelerator compiled in the binary" is not something you need after 
>>>> startup (or if querying the monitor).
>>>>
>>>> Paolo
>>>>
>>>>
>>>
>>> A script that repeatedly uses the QMP interface to query for
>>> the status could generate fragmentation this way I think.
>> 
>> Is this a problem?  Today, execution of a "query-kvm" command
>> calls g_malloc() 37 times.
>> 
>
> Not ideal in my view, but not the end of the world either.

QMP's appetite for malloc is roughly comparable to a pig's for truffles.


