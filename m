Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8F4475A96
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 15:20:43 +0100 (CET)
Received: from localhost ([::1]:45306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxV96-0007oy-Gw
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 09:20:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUXn-00086q-8B
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 08:42:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUXl-0001Rf-5L
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 08:42:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639575724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vla8ivlAnKwDZ6B2C3vHg6z2wszXMVpMOeCr7XezSY4=;
 b=OYUDaonmv8810qiWouiVGXeN11Un+FGu/yReyih6StD222oHRpp2az8vlTX7eivUo8kPZD
 uZeRihQqCCMzg+Y8/FJOXXftdrHtAs3W1VNMH0gCS4blqutHAo1LkPrgRlzz+2F69NV5G9
 ZKz587qBU1ROkJ8TIZvG0FzdX63jneo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-yuHVu0tLPNiNHxq6kD9adg-1; Wed, 15 Dec 2021 08:42:03 -0500
X-MC-Unique: yuHVu0tLPNiNHxq6kD9adg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0698F85B6C0;
 Wed, 15 Dec 2021 13:42:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EF245B362;
 Wed, 15 Dec 2021 13:41:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4EEBF113865F; Wed, 15 Dec 2021 14:41:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v10 3/3] cpus-common: implement dirty page limit on
 virtual CPU
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
 <cover.1639479557.git.huangy81@chinatelecom.cn>
 <d54bfe75d5d64e64a21bda977d40f62579cd0222.1639479557.git.huangy81@chinatelecom.cn>
 <874k7anwtc.fsf@dusky.pond.sub.org>
 <4397f17c-4431-8480-127b-4228271523c8@chinatelecom.cn>
 <Ybmiw59Qh3sHukyh@xz-m1.local>
Date: Wed, 15 Dec 2021 14:41:32 +0100
In-Reply-To: <Ybmiw59Qh3sHukyh@xz-m1.local> (Peter Xu's message of "Wed, 15
 Dec 2021 16:09:39 +0800")
Message-ID: <87y24m2df7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Hyman Huang <huangy81@chinatelecom.cn>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> writes:

> On Wed, Dec 15, 2021 at 03:56:55PM +0800, Hyman Huang wrote:
>> > > +{ 'command': 'vcpu-dirty-limit',
>> > > +  'data': { 'enable': 'bool',
>> > > +            '*cpu-index': 'uint64',
>> > > +            '*dirty-rate': 'uint64'} }
>> > 
>> > Drop @enable, please.
>> > 
>> > If @dirty-rate is present, set the limit to its value.
>> > 
>> > If it's absent, cancel the limit.
>> > 
>> Ok. Indeed, this is the simplest style. :)
>> 
>> So the final qmp format should be like:
>> 
>> case 1: setup vcpu 0 dirty page limit 100MB/s
>> vcpu-dirty-limit  cpu-index=0   dirty-rate=100MB/s
>> 
>> case 2: cancle vcpu 0 dirty page limit
>> vcpu-dirty-limit  cpu-index=0
>
> I actually agree with what you said... for human beings no one will read it as
> "disable vcpu throttling", instead people could consider it enables vcpu
> throttle with a default dirty rate from a gut feeling.
>
> I think what Markus suggested is the simplest solution for computers, but it
> can confuse human beings.  So it turns out to be a general question to QMP
> scheme design: should we always assume QMP client to be a piece of software, or
> should we still consider the feeling of human beings operating on QMP
> interfaces using qmp-shell.
>
> IMHO we should still consider the latter, if we don't lose much, anyway.  But I
> don't have a strong opinion.

If you want a more explicit interface, then I'd recommend to go right
back to v7:

    {"execute": "set-vcpu-dirty-limit",
     "arguments": {"cpu-index": 0, "dirtyrate": 200}}

    {"execute": "cancel-vcpu-dirty-limit",
     "arguments": {"cpu-index": 0}}

Bonus: it already has my Acked-by.


