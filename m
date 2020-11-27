Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1C72C6A2B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 17:52:34 +0100 (CET)
Received: from localhost ([::1]:57244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kigz3-0005Uy-5D
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 11:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kiguT-0001p6-FR
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:47:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kiguR-000591-8s
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:47:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606495664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uUyln2Foq9Nd8oUoDAxLIPNWIRSlHjjTwSpy+2vsr1o=;
 b=FDMyrMqh/nRZwvlvjkVZQn/z783wMsN7nY/Un/xHfDmQoyjmw36yuhVfZQS2lOi1CHLpAn
 6vrBuXMli5tQJTHE04CjbkONVJ2ypNkuxhijZQ7TcZgR+D1VjbGbP4DYqCVp1iiKkpUMyA
 M3AvL7uR+bAtm8FV76gefNFY24TNagg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-16u7koQ2M3mba2wFec3FOA-1; Fri, 27 Nov 2020 11:47:43 -0500
X-MC-Unique: 16u7koQ2M3mba2wFec3FOA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB3A95189;
 Fri, 27 Nov 2020 16:47:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 645861001E73;
 Fri, 27 Nov 2020 16:47:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EF36E113864E; Fri, 27 Nov 2020 17:47:36 +0100 (CET)
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
 <87y2imq2ni.fsf@dusky.pond.sub.org>
 <573ed53e-fe9e-895b-bb15-3058089d9b5f@suse.de>
Date: Fri, 27 Nov 2020 17:47:36 +0100
In-Reply-To: <573ed53e-fe9e-895b-bb15-3058089d9b5f@suse.de> (Claudio Fontana's
 message of "Fri, 27 Nov 2020 15:58:13 +0100")
Message-ID: <87im9qn3vb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

> On 11/27/20 3:45 PM, Markus Armbruster wrote:
>> Claudio Fontana <cfontana@suse.de> writes:
>> 
>>> On 11/26/20 10:48 PM, Eduardo Habkost wrote:
>>>> On Thu, Nov 26, 2020 at 10:06:03PM +0100, Claudio Fontana wrote:
>>>>> On 11/26/20 3:25 PM, Paolo Bonzini wrote:
>>>>>> On 26/11/20 15:13, Claudio Fontana wrote:
>>>>>>> One option I see is simply to document the behavior where
>>>>>>> accel_available() is declared in accel.h (ie do not use in fast
>>>>>>> path), as well as in accel_find() actually, so that both accel_find()
>>>>>>> and accel_available() are avoided in fast path and avoid being called
>>>>>>> frequently at runtime.
>>>>>>>
>>>>>>> Another option could be to remove the allocation completely, and use
>>>>>>> for example accel_find(ACCEL_CLASS_NAME("tcg")), or another option
>>>>>>> again would be to remove the allocation and use either a fixed buffer
>>>>>>> + snprintf, or alloca -like builtin code to use the stack, ...
>>>>>>>
>>>>>>> Not a big deal, but with a general utility and short name like
>>>>>>> accel_available(name) it might be tempting to use this more in the
>>>>>>> future?
>>>>>>
>>>>>> I think it's just that the usecase is not that common.  "Is this 
>>>>>> accelerator compiled in the binary" is not something you need after 
>>>>>> startup (or if querying the monitor).
>>>>>>
>>>>>> Paolo
>>>>>>
>>>>>>
>>>>>
>>>>> A script that repeatedly uses the QMP interface to query for
>>>>> the status could generate fragmentation this way I think.
>>>>
>>>> Is this a problem?  Today, execution of a "query-kvm" command
>>>> calls g_malloc() 37 times.
>>>>
>>>
>>> Not ideal in my view, but not the end of the world either.
>> 
>> QMP's appetite for malloc is roughly comparable to a pig's for truffles.
>> 
>
> :-)
>
> Btw, do we have limits on the maximum size of these objects? I mean, a single QMP command,
> a single QEMU object type name, etc?
>
> In this case we could do some overall improvement there, and might even avoid some problems down the road..

We have limits, but they are not comprehensive.

The QMP client is trusted.  We don't try to guard against a malicious
QMP client.  We do try to guard against mistakes.

The JSON parser limits token size (in characters), expression size (in
tokens), and expression nesting depth.  This protects against a
malfunctioning QMP client.  The limits are ridiculously generous.

The QMP core limits the number of commands in flight per monitor to a
somewhat parsimonious 8-9 in-band commands, plus one out-of-band
command.  This protects against a QMP client sending commands faster
than we can execute them.

QMP output is buffered without limit.  When a (malfunctioning) QMP
client keeps sending commands without reading their output, QEMU keeps
buffering until it runs out of memory and crashes.


