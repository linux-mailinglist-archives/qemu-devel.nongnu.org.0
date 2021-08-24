Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843613F602E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 16:23:15 +0200 (CEST)
Received: from localhost ([::1]:55010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIXKW-0007kN-TT
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 10:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIXIl-00064R-8L
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:21:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIXIi-0002yr-NI
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629814875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J6UWI9UwDTRDMdeQVTQrFN9/AwLG26ujz7ONvSTemek=;
 b=FpsDZ0xILDFHSXdi8K9UvWlMWAEQCp3RRgB6LyU9yGMJ46cmuvkpGCwZQFtCFlPsDL1nFe
 pQuKVl9h+Aij2Fuybtfrw9Vx5x9wAYqA/lsAMAgSIHtkfYUJOq2FQxg3+1jPvaV803bjNj
 /AcziCaSt0ZhusT+Ghc5AD31yatEl9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-nfGCSSJDNGOqxLIl2Ji-dw-1; Tue, 24 Aug 2021 10:21:14 -0400
X-MC-Unique: nfGCSSJDNGOqxLIl2Ji-dw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 157261018F74;
 Tue, 24 Aug 2021 14:21:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA0D3272D4;
 Tue, 24 Aug 2021 14:21:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 72FA311380A9; Tue, 24 Aug 2021 16:21:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 1/5] qemu/qarray.h: introduce QArray
References: <cover.1629638507.git.qemu_oss@crudebyte.com>
 <42e8b7fec3f03487e322be42ef5ca0e09fd9edea.1629638507.git.qemu_oss@crudebyte.com>
 <3042104.q1AUgp70hy@silver>
Date: Tue, 24 Aug 2021 16:21:11 +0200
In-Reply-To: <3042104.q1AUgp70hy@silver> (Christian Schoenebeck's message of
 "Tue, 24 Aug 2021 13:58:38 +0200")
Message-ID: <87fsuydiug.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Christian Schoenebeck <qemu_oss@crudebyte.com> writes:

> On Sonntag, 22. August 2021 15:16:46 CEST Christian Schoenebeck wrote:
>> Implements deep auto free of arrays while retaining common C-style
>> squared bracket access.
>> 
>> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>> ---
>>  include/qemu/qarray.h | 150 ++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 150 insertions(+)
>>  create mode 100644 include/qemu/qarray.h
>> 
>> diff --git a/include/qemu/qarray.h b/include/qemu/qarray.h
>> new file mode 100644
>> index 0000000000..9885e5e9ed
>> --- /dev/null
>> +++ b/include/qemu/qarray.h
>> @@ -0,0 +1,150 @@

[...]

>> + * Consider the following user struct @c Foo which shall be used as scalar
>> + * (element) type of an array:
>> + * @code
>> + * typedef struct Foo {
>> + *     int i;
>> + *     char *s;
>> + * } Foo;
>> + * @endcode
>> + * and assume it has the following function to free memory allocated by @c Foo
>> + * instances:
>> + * @code
>> + * void free_foo(Foo *foo) {
>> + *     free(foo->s);
>> + * }
>> + * @endcode
>> + * Add the following to a shared header file:
>> + * @code
>> + * DECLARE_QARRAY_TYPE(Foo);
>> + * @endcode
>> + * and the following to a C unit file:
>> + * @code
>> + * DEFINE_QARRAY_TYPE(Foo, free_foo);
>> + * @endcode
>> + * Finally the array may then be used like this:
>> + * @code
>> + * void doSomething(int n) {
>> + *     QArrayRef(Foo) foos = NULL;
>> + *     QARRAY_CREATE(Foo, foos, n);
>> + *     for (size_t i = 0; i < n; ++i) {
>> + *         foos[i].i = i;
>> + *         foos[i].s = calloc(4096, 1);
>> + *         snprintf(foos[i].s, 4096, "foo %d", i);
>> + *     }
>> + * }
>> + * @endcode
>
> Or should that probably be changed to upper case QArrayRef() -> QARRAY_REF(), 
> because ...
>
>> + */

[...]

>> +/**
>> + * Used to declare a reference variable (unique pointer) for an array. After
>> + * leaving the scope of the reference variable, the associated array is
>> + * automatically freed.
>> + *
>> + * @param scalar_type - type of the individual array elements
>> + */
>> +#define QArrayRef(scalar_type) \
>> +    __attribute((__cleanup__(qarray_auto_free_##scalar_type))) scalar_type*
>> +
>
> ... it is actually a macro?

I'd change it.

[...]


