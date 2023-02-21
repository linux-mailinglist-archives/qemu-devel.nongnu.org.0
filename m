Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A6069DE0B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 11:41:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQ4u-0008Ir-B2; Tue, 21 Feb 2023 05:40:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUQ4s-0008Hr-4K; Tue, 21 Feb 2023 05:40:54 -0500
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUQ4q-0007cT-96; Tue, 21 Feb 2023 05:40:53 -0500
Received: by mail-lj1-x230.google.com with SMTP id a30so3971108ljr.0;
 Tue, 21 Feb 2023 02:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CmrTOdCOQTkhLKY3Z7Nc4z4iC9UTE9odEPIPnnS8/7E=;
 b=X4vLJ22gsuNCUog7EW3s0C0CL1OFH8arJpZf7m95nnw+yyNm9beXxfnRpwScPlraeY
 cVJW+3R/p5Ft8nOO0l9BPZP5JuWjvIGKUr1r67qLNfM4m0LRc/SuMu1/LZibsrjHFlDT
 ovHJJPxIIWdMY0oNZJTpQRX1j/azrhzPBNZM0r2B9ZiFA5/b/kk37497NzANG0buSN02
 BXCyIITHjhOCbzt9O+uxNAtOIdSQo/OceOKFgdBDni1GFdmy4/AAB2U/u3vnXFLdRDsT
 fVeXXjjs+v5oUyLsrqWuUqmg8yY1ujhRULYN6tIGsP5waz+nSMa13Ypi5MjwKmdZsAKs
 OmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CmrTOdCOQTkhLKY3Z7Nc4z4iC9UTE9odEPIPnnS8/7E=;
 b=qjEr+35YnxERO14Cmxke9+IiLMqfX8GX0XNY/O6zhR3xyt7kxoU8wCM5GwR/pmqBWA
 QCu0lA0h3M8B4n8HV5lditLUAYz0U+ii+FikRn9uO9uq6r0eylysPdyj0m0aShoKJjQX
 4XhBtmWkpuUtLBax5cHHI/UfIZeckt27B6dYWLZkiKTNpU+2ftooisVzpRfT/cnsP9uo
 hE9o+/Cu1Sd5/AFh8wNBHWWHfMEh6AsyR0KvOpzYWQmGCJkpZjkoub8lDN9ruX7ESooo
 aXfoqMCvs+QY2gySMwfv8/nxun6GLYxsvm/bn5wr5k3tcDyLMxVN8Ykrz9JTsZTTntt2
 9BsQ==
X-Gm-Message-State: AO0yUKUEUgFvKE1X12Z40LC597OSnrBFZSvHruvcmkQ6yObe4933Zuvu
 LoyT+0a4DQoP1CLUh6YW5FsM6Q0P+RPwvprDAL4=
X-Google-Smtp-Source: AK7set/oiygIZ4BXN1fKpFz+6m8VaWvCOFQUKEtzfjxtTc8QHAGz0Z5Upt9k6mKrX8nrtguVIo+eTFG1lYu75KX2+JQ=
X-Received: by 2002:a05:651c:1a06:b0:293:4da7:669a with SMTP id
 by6-20020a05651c1a0600b002934da7669amr2354017ljb.2.1676976049723; Tue, 21 Feb
 2023 02:40:49 -0800 (PST)
MIME-Version: 1.0
References: <20230212204942.1905959-1-marcandre.lureau@redhat.com>
 <20230212204942.1905959-4-marcandre.lureau@redhat.com>
 <87r0ukbjfp.fsf@pond.sub.org>
 <CAMxuvaxiN1jYr70k2yK0CUSjo4UQF8DqjPX_COvCdtAWhf3zNw@mail.gmail.com>
 <55e488cf-0b5f-f1e9-0a15-5d3e8c155abe@redhat.com>
 <CAMxuvayAMEwR29fCs3SkHd8iOiOB+36QZBvEd7qG-sMhPdf2EQ@mail.gmail.com>
In-Reply-To: <CAMxuvayAMEwR29fCs3SkHd8iOiOB+36QZBvEd7qG-sMhPdf2EQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 21 Feb 2023 14:40:38 +0400
Message-ID: <CAJ+F1CKJidDs41TV-NuvnVftXJsLkg7WHRuR2_4Xusde3sPfAA@mail.gmail.com>
Subject: Re: [PATCH 3/4] win32: stop mixing SOCKET and file descriptor space
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Joel Stanley <joel@jms.id.au>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi

On Tue, Feb 21, 2023 at 1:13 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Hi
>
> On Tue, Feb 21, 2023 at 12:18 PM Paolo Bonzini <pbonzini@redhat.com> wrot=
e:
>>
>> On 2/20/23 16:29, Marc-Andr=C3=A9 Lureau wrote:
>> >> 7. A Windows SOCKET is also a HANDLE.  Maybe.  I guess.  Docs are
>> >>     confusing.
>> >>
>> > Kind of, but not really. I think a HANDLE is a kind of void*. You need=
 to
>> > be careful using it appropriately with the right functions. Sometime, =
a
>> > HANDLE can work with generic functions, like ReadFile, but you should =
not
>> > use a CloseHandle on SOCKET, or registry key..
>>
>> A Windows SOCKET *is* a file HANDLE except it's always in overlapped
>> mode so Windows provides send()/recv() in case you don't want to deal
>> with overlapped mode.  But you can use it with ReadFile too (Windows API
>> documentation says that is only true sometimes, but Winsock API is 30
>> years old and right now you pretty much always can).
>>
>> However, sockets also has some extra information on the side, so you
>> need to close them with closesocket() and CloseHandle() is not enough.
>
>
> Yeah, the question is "is it safe to call CloseHandle() on a SOCKET, befo=
re closesocket()". Testing/error checking seems to say it's okay.. I wouldn=
't be surprised if internally the CloseHandle() function does something to =
check if the given handle is a SOCKET and skip it. I wish they would docume=
nt it..
>
>>
>> The problem is that close() of something opened with _open_osfhandle()
>> *does* do that CloseHandle(), so basically you are closing the handle
>> twice.  IIRC there used to be undocumented functions _alloc_osfhnd() and
>> similar, but they don't exist anymore (even Wine does not have them), so
>> we're stuck; unfortunately this is the reason why QEMU is not already
>> doing something like what you have in this patch.
>>
>> Is this a real bug or is it theoretical?  Do file descriptor and socket
>> spaces overlap in practice?
>>
>
> Yes it likely can, the first SOCKET value starts at 92 in a simple test. =
It looks like it may depend on the system number of opened sockets.
>
> I think the second big issue is that we have many places where we assume =
a fd is a fd, and we simply call close() (which would result in CloseHandle=
, but missing closesocket).
>
> sigh, if the CRT would allow us to steal the handle back..
>

I found an interesting option here, using HANDLE_FLAG_PROTECT_FROM_CLOSE:
https://github.com/ksmurph1/VulkanConfigurator/blob/986992a8b963a6b271785a7=
7d5efd349b6e6ea4f/src/folly/src/net/detail/SocketFileDescriptorMap.cpp#L36


And also an old KB:
https://jeffpar.github.io/kbarchive/kb/185/Q185727/
When _open_osfhandle is used on a socket descriptor, both _close() and
closesocket() should be called before exiting. _close() only closes the fil=
e
handle. closesocket() has to be called as well to close the socket descript=
or
and clean up the underlying socket object.

I'll work on a v3 of the patch/series with the flag trick.




--=20
Marc-Andr=C3=A9 Lureau

