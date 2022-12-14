Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D30964CC99
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 15:46:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5SZl-0005dp-UL; Wed, 14 Dec 2022 09:17:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5SZb-0005bo-P6
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 09:17:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5SZZ-0005M3-UV
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 09:17:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671027444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WApAy5UgVh6VHcGC/8WSeQfWhh1t0eolLBkyDdQ6n3w=;
 b=HTPM3Hq/kI+xvd7aGtAi2wq3HAZGig6rzrN4UuSUKVUWKfyFfdhTiQgaJOzAb8XkmsCpRN
 DON+OqCh1fr4eoXYM/F8Ozo/YX1CmGGW0TOALgqWy3EHsGGRFwjCjM90RGbX0dIipy965b
 YFI0zXr99pZM58h7seQxbno/czHxFq4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-6bdbk0h8Oc-ljnawfYG5BQ-1; Wed, 14 Dec 2022 09:17:21 -0500
X-MC-Unique: 6bdbk0h8Oc-ljnawfYG5BQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA8CD101A521;
 Wed, 14 Dec 2022 14:17:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A766A2026D68;
 Wed, 14 Dec 2022 14:17:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8A7B621E6900; Wed, 14 Dec 2022 15:17:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: James Bottomley <jejb@linux.ibm.com>
Cc: "Daniel P." =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH] tpm: add backend for mssim
References: <4780481659602f92fffacac66e7dca41ad2787c4.camel@linux.ibm.com>
 <Y5dNC77CubqrfXku@redhat.com>
 <bbe14f32fcf19ba4c800953c7db6486a340d5b14.camel@linux.ibm.com>
 <Y5mz96wJN9+nxLs8@redhat.com>
 <5a91ffbd8fa01d8f60df4cc14bcc53eeb3cc93e4.camel@linux.ibm.com>
Date: Wed, 14 Dec 2022 15:17:17 +0100
In-Reply-To: <5a91ffbd8fa01d8f60df4cc14bcc53eeb3cc93e4.camel@linux.ibm.com>
 (James Bottomley's message of "Wed, 14 Dec 2022 07:47:28 -0500")
Message-ID: <87a63qgjde.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

James Bottomley <jejb@linux.ibm.com> writes:

> On Wed, 2022-12-14 at 11:31 +0000, Daniel P. Berrang=C3=A9 wrote:

[...]

>> These days, we have a policy of not tyring to map nested data onto
>> the flat QemuOpts. This has been done in several areas and we've
>> ended up with a mess of ever so slightly different impls each with
>> their own flaws. This is why our preferred approach these days is to
>> add support for JSON syntax to enable non-flat config.
>
> Well, OK, but I've got to say on behalf of shell script writers
> everywhere that using json for command line arguments is a textbook
> definition of cruel and unusual punishment.

For new code, use qobject_input_visitor_new_str().  Parses both JSON and
dotted keys.  Example: case QEMU_OPTION_blockdev in qemu_init().  Dotted
keys can fall apart for corner cases.  See util/keyval.c if you're
curious.

Sometimes we bend over backwards for backward compatibility, and do
something like

    if (optarg[0] =3D=3D '{') {
        QObject *obj =3D qobject_from_json(optarg, &error_fatal);

        v =3D qobject_input_visitor_new(obj);
        qobject_unref(obj);
    } else {
        ... old parser ...
    }

This parses both JSON and whatever old crap.  Example:
object_option_parse().

Questions?


