Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 247146C4E6C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:49:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezlM-0002hC-0a; Wed, 22 Mar 2023 10:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pezlG-0002gi-Vm
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:48:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pezlF-0005uf-Df
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679496500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JjsDASg/MYR/uf174dr8InE2CUu28hrE27ber7XbVcg=;
 b=YK3vE5ncTc/ERtv1xQ9zJKZUcBZ0g7pNoN9EkzjNtR/0heYWXgLtkkhGjT+R0q1UrjVNF2
 QXA9otWGckz5pdzCdzZrmgNXxM5rYIoNvC5cuDPZfWJLflam2CytEV4EwXOSIQe4k1vvLQ
 zUMHq7g658frAmQrIZIFpnCv3iQyElg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-O_DwecsoNYuzs0K73gzRUw-1; Wed, 22 Mar 2023 10:48:17 -0400
X-MC-Unique: O_DwecsoNYuzs0K73gzRUw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCCB8858297;
 Wed, 22 Mar 2023 14:48:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D1561121314;
 Wed, 22 Mar 2023 14:48:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9637221E6926; Wed, 22 Mar 2023 15:48:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Claudio Imbrenda <imbrenda@linux.ibm.com>,
 qemu-devel <qemu-devel@nongnu.org>,  David Hildenbrand
 <david@redhat.com>,  "Borntraeger, Christian" <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,  fiuczy@linux.ibm.com,  Halil
 Pasic <pasic@linux.ibm.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Subject: Re: [PATCH v2 1/1] util/async-teardown: wire up
 query-command-line-options
References: <20230320131648.61728-1-imbrenda@linux.ibm.com>
 <20230320131648.61728-2-imbrenda@linux.ibm.com>
 <87v8ivmocr.fsf@pond.sub.org>
 <6a9ef526-1b30-e9a6-37ee-59ca3dadea9d@redhat.com>
 <CABgObfaN3sLipc2UuoZc2yHP0YK3e59sK5wn8gpkJ8xgNHc7qg@mail.gmail.com>
 <ZBrKVGVHRtqyaKvL@redhat.com>
 <3237c289-b8c2-6ea2-8bfb-7eeed637efc7@redhat.com>
Date: Wed, 22 Mar 2023 15:48:14 +0100
In-Reply-To: <3237c289-b8c2-6ea2-8bfb-7eeed637efc7@redhat.com> (Thomas Huth's
 message of "Wed, 22 Mar 2023 15:00:09 +0100")
Message-ID: <87v8is6dw1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Thomas Huth <thuth@redhat.com> writes:

> On 22/03/2023 10.28, Daniel P. Berrang=C3=A9 wrote:
>> On Tue, Mar 21, 2023 at 09:47:57PM +0100, Paolo Bonzini wrote:
>>> Il lun 20 mar 2023, 16:42 Thomas Huth <thuth@redhat.com> ha scritto:
>>>
>>>> Would it make sense to add it e.g. to "-action" instead, i.e. something
>>>> like
>>>> "-action teardown=3Dasync" ?
>>>>
>>>
>>> -action is just a wrapper for the action-set QMP command. I don't think=
 it
>>> fits very well; its arguments are only guest actions while asynchronous
>>> tear down happens for example when you issue a quit command on the moni=
tor.
>> Right, we discussed -action when this feature was first proposed and
>> that was the reason it was discounted.
>
> I guess that was this thread here :
>
>  https://mail.gnu.org/archive/html/qemu-devel/2022-08/msg04479.html
>
> ?
>
> Anyway, how to continue now here? If I've got that right, we currently ne=
ed an option that takes a parameter if we want to make it visible via QAPI,=
 right?

Visible in query-command-line-options, to be precise.

To make it visible in query-qmp-schema, you need to make it a QMP
command in addition to a CLI option.  Would that be possible?

> So maybe remove the previous option (since it cannot be used by upper lay=
er like libvirt anyway yet), and introduce a new one like "-teardown async|=
sync" ? Or rework the current one into "-async-teardown on|off" (similar to=
 "-sandbox on")? Any preferences?
>
> Or do we want something even more generic instead, e.g.:
>
>  -run-with teardown=3Dasync
>  -run-with daemonized=3Don
>  -run-with chroot=3D/path/to/chroot/dir
>  -run-with userid=3DUID
>
> ... so we could get rid of -deamonize, -chroot and -runas and other simil=
ar options one day?

If we expect more teardown-relation configuration knobs, then something
like -teardown async=3D[on|off] would let us add more with ease.

-run-with is a bit of a grab bag.  We've done worse :)


