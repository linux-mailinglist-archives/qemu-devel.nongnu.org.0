Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D897337557
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:22:21 +0100 (CET)
Received: from localhost ([::1]:47120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMCi-0000yI-HM
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:22:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKLzH-000117-LF
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:08:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKLzE-0002FM-Bx
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:08:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615471703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IjJtPH/4jYI7VpVZaQ2xwJY/9rG6S/IX/JjWoQdmnsU=;
 b=bzr2BKf4Yr3ab/1nyir9ICo4g5AWBnRfo6QJZcDMkaPdKAnDZz81OT2MBZGbzWRxJRdeAs
 pixYq3fvSbztPXLibhwhz00aTntm3n2E7V2DZxIKn4kSUUkN7WZhyOm42wqm/AU81hNF2/
 /ZU1mZxuOb0cV8sWL84Pq6jPD6nj0Qs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-9E9zLbvzNaWyjAKwwUHH0w-1; Thu, 11 Mar 2021 09:08:21 -0500
X-MC-Unique: 9E9zLbvzNaWyjAKwwUHH0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B750100C61A;
 Thu, 11 Mar 2021 14:08:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF89318AAB;
 Thu, 11 Mar 2021 14:08:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3A8CE1132C12; Thu, 11 Mar 2021 15:08:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 00/30] qapi/qom: QAPIfy --object and object-add
References: <20210308165440.386489-1-kwolf@redhat.com>
 <YEjWQnWKbr5teciB@angien.pipo.sk>
 <90130a0c-7f96-f344-b185-b790c5d6b78a@redhat.com>
 <20210310173044.GF6076@merkur.fritz.box>
 <87ft12q8kf.fsf@dusky.pond.sub.org>
 <e98a5eb7-4716-a0f4-0ad2-adaa4cd9cefa@redhat.com>
Date: Thu, 11 Mar 2021 15:08:12 +0100
In-Reply-To: <e98a5eb7-4716-a0f4-0ad2-adaa4cd9cefa@redhat.com> (Paolo
 Bonzini's message of "Thu, 11 Mar 2021 12:00:12 +0100")
Message-ID: <87h7lhbx6b.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>, lvivier@redhat.com, thuth@redhat.com,
 Peter Krempa <pkrempa@redhat.com>, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, kraxel@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 11/03/21 11:38, Markus Armbruster wrote:
>> Here's a differently terrible hack.  We have
>>           keyval_parse()       visitor
>>      optarg --------> QObject --------> QAPI type
>> Idea: hack the QObject.  If we're working for -object, and QObject
>> maps
>> key "qom-type" to value "memory-backend-ram", get the value of
>> host-nodes, and if it's a string, parse it into a list like the opts
>> visitor does, and put that back, replacing the string value.
>> Same for other uses of Memdev and NumaNodeOptions with -object, if
>> they
>> exist.
>
> This doesn't help with backwards compatibility, since keyval loses the
> first of host-nodes=0,host-nodes=4.

You're right, I missed the fact that we rely on both hacks working
together for the full syntax.

> I would rather keep the OptsVisitor here.  Do the same check for JSON
> syntax that you have in qobject_input_visitor_new_str, and whenever
> you need to walk all -object arguments, use something like this:
>
>     typedef struct ObjectArgument {
>         const char *id;
>         QDict *json;    /* or NULL for QemuOpts */
>         QSIMPLEQ_ENTRY(ObjectArgument) next;
>     }
>
> I already had patches in my queue to store -object in a GSList of
> dictionaries, changing it to use the above is easy enough.

I think I'd prefer following -display's precedence.  See my reply to
Kevin for details.


