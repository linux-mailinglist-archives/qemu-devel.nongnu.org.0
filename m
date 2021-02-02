Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C6D30C371
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:19:32 +0100 (CET)
Received: from localhost ([::1]:41104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xSl-0006gE-JR
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6x0m-0001wJ-E0
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:50:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6x0k-0004ch-Ie
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:50:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612277431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I4dHhBe7DzFAp9tsO+U2TUUG5IVe9ZN6nfb5x4S5gbo=;
 b=EXE+ih0uWMpEEbYkeQRtLPKlS54YdclOo8LSyTOEsjMr/K+rt/y1j4SmS4NjzFUh2Jdx5S
 xlhT1NLaX6MODaBtCw85N7ktsxmHey/TZ+8iA+dhck3PiqYUXYClFmKljEMf64lIgbCBK9
 CwegHUE4XT5F06dly/xSmoA0txxfHbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-lF4AcIqKPI6u1xX8nRYpdQ-1; Tue, 02 Feb 2021 09:50:27 -0500
X-MC-Unique: lF4AcIqKPI6u1xX8nRYpdQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 444498030C7;
 Tue,  2 Feb 2021 14:50:26 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FDD53828;
 Tue,  2 Feb 2021 14:50:25 +0000 (UTC)
Subject: Re: macOS (Big Sur, Apple Silicon) 'make check' fails in
 test-crypto-tlscredsx509
To: Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <CAFEAcA88wwwK5RYDpkQ+KEGwS5Qon6wQc8UsuWjjkKtKM9egcA@mail.gmail.com>
 <20210127121723.GI3653144@redhat.com>
 <0de4a2a8-577d-a46e-3a66-1f9a9e589a4d@weilnetz.de>
 <20210127165330.GT3653144@redhat.com>
 <72e44724-94ca-43f0-aea1-2554c43cc4c3@weilnetz.de>
 <20210127181731.GX3653144@redhat.com>
 <27c01eba-ebc1-9b8e-d7ea-38ad9b4350d9@weilnetz.de>
 <20210127185917.GB3653144@redhat.com> <YBPKtL3reYFm7bgy@SPB-NB-133.local>
 <20210129095327.GC4001740@redhat.com> <YBjg7ubtbw3OeQCd@SPB-NB-133.local>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <6d360ded-f8b6-d08b-b4fc-af8c52554a58@redhat.com>
Date: Tue, 2 Feb 2021 08:50:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YBjg7ubtbw3OeQCd@SPB-NB-133.local>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>, Alexander Graf <agraf@csgraf.de>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/21 11:19 PM, Roman Bolshakov wrote:

> After a session of debugging I believe there's an issue with Clang 12.
> Here's a test program (it reproduces unexpected ASN1_VALUE_NOT_VALID
> from _asn1_time_der() in libtasn1):
> 
> #include <stdio.h>
> 
> static int func2(char *foo) {
>         fprintf(stderr, "%s:%d foo: %p\n", __func__, __LINE__, foo);
>         if (foo == NULL) {
>                 fprintf(stderr, "%s:%d foo: %p\n", __func__, __LINE__, foo);
>                 return 1;
>         }
>         return 0;
> }
> 
> int func1(char *foo) {
>         int counter = 0;
>         if (fprintf(stderr, "IO\n") > 0)
>                 counter += 10;
>         fprintf(stderr, "%s:%d foo: %p counter %d\n", __func__, __LINE__, foo, counter);
>         if(!func2(foo + counter)) {

This line has unspecified behavior in the C standard.  Adding an integer
to a pointer is only well-specified if the pointer is to an array and
the integer is within the bounds or the slot just past the array.  But
since you called func1(NULL), foo is NOT pointing to an array, and
therefore foo+counter points to garbage, and the compiler is free to
optimize it at will.

>                 fprintf(stderr, "good\n");
>                 return 0;
>         } else {
>                 fprintf(stderr, "broken\n");
>                 return 1;
>         }
> }
> 
> int main() {
>         char *foo = NULL;
>         return func1(foo);
> }
> 
> 
> What return value would you expect from the program?

Because the code is not strictly compliant to the C standard, I'm not
sure what to expect.

> 
> If the program is compiled with -O0/O1 it returns zero exit code.
> Here's the output:
> IO
> func1:16 foo: 0x0 counter 10
> func2:4 foo: 0xa
> good
> 
> If it is compiled with -O2 it returns 1:
> IO
> func1:16 foo: 0x0 counter 10
> func2:4 foo: 0xa
> func2:6 foo: 0x0

And this proves the point that the compiler was able to exploit the
undefined behavior in your program.

> broken
> 
> That happens because clang uses register behind foo from func1 (it has zero
> pointer) inside inlined func2 (it should have non zero pointer).
> 
> So, immediate workaround would be to downgrade optimization level of libtasn1
> to -O1 in homebrew.
> 
> I've submitted the issue to Apple bugtracker:
> FB8986815

Yes, it's annoying that as compilers get smarter, it exposes the
presence of unspecified code in weird ways.  But I don't see this as a
bug in clang, but as a bug in libtasn1 for assuming undefined behavior
produces a sane result.

> 
> Best regards,
> Roman
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


