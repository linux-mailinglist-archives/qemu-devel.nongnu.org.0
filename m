Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FEE4E2E1A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:32:36 +0100 (CET)
Received: from localhost ([::1]:36402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKxP-0007HF-2j
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:32:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWKrD-0006O3-RV
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:26:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWKrB-0001oj-V6
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:26:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647879969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a7hhjmPYpBowoI6w4GxhbynqJRTQmZ+YMwUcB7HBUr8=;
 b=NJdGN9LEBwong8pV3HeEheTqQXdUqQruyMev9R1gJ8LN4GwQ82E5kbGn6h8u9jmltplAMm
 1NVclvQdzDpya3ZuxEHZVQHvf+xAqkuFTDx2zDb7oWNRAW7T12h8yZt2FQ26HkXDzwsoqr
 LR+ZhB//xKJUbyJqGvNAMcNxEgo//iU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-w0MKefaAO7uy7wcP8-RhwA-1; Mon, 21 Mar 2022 12:26:07 -0400
X-MC-Unique: w0MKefaAO7uy7wcP8-RhwA-1
Received: by mail-ej1-f71.google.com with SMTP id
 hr26-20020a1709073f9a00b006d6d1ee8cf8so7245507ejc.19
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 09:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a7hhjmPYpBowoI6w4GxhbynqJRTQmZ+YMwUcB7HBUr8=;
 b=lK/HvR+hDCKo5rMo1FnNtbVxqGeoyfV+bNeraSQ71OIBblLs+5fwoBhpoylsC0BWsM
 hEj5nepDSHqQbAd2fIfhr7okH8JCHvVtri+MK8w/QFspLmRhy/Z5UgNNL0VLX0ng/Y1P
 UeV51Kd4YWgGkZdh/ChUbjCUG2yTqDDQntJJ1gY1Umobjks7kqe23q+ReTB+CMQaZ9eP
 GN1v1m7oMl3zlHWibU9cGmQ9bNz+dEmNfo8z6YBwutgWWNPhgEAQgqbT9KNLNQRWDzNV
 21qFEWRmm7FCIbOn313YaJxdplxuPZKBaGtpowZ9KjVjJGyU4aBNwO/7ynQky/Ny5DWr
 x+Lg==
X-Gm-Message-State: AOAM531OKlwpe3TtoZGoIzKu5kxrSY1K9TNNHb1zKeEVb/xcQnFIPenx
 fKuLYIp8tvp2Fyt3RFDQVDN9R3gO5Udq1aOJWNjHceibEDllJOjKtcuxp4xqkizXj9ojdiMkkN/
 f9xWBpafPX8Bg9/Q=
X-Received: by 2002:a17:907:7b88:b0:6df:ee7d:10e2 with SMTP id
 ne8-20020a1709077b8800b006dfee7d10e2mr9365245ejc.586.1647879966561; 
 Mon, 21 Mar 2022 09:26:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxp/AYd1TTt11AdzWV/+fSIC5Xb7V0ORDLYI72jzb/Lxs9M5VtfuNaUKXf7g4PhiZi0d/fsGg==
X-Received: by 2002:a17:907:7b88:b0:6df:ee7d:10e2 with SMTP id
 ne8-20020a1709077b8800b006dfee7d10e2mr9365227ejc.586.1647879966267; 
 Mon, 21 Mar 2022 09:26:06 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a170906275500b006d10c07fabesm7070137ejd.201.2022.03.21.09.26.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 09:26:05 -0700 (PDT)
Message-ID: <d627f73e-0744-bd9f-6683-6698d0734f78@redhat.com>
Date: Mon, 21 Mar 2022 17:26:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 00/18] iotests: add enhanced debugging info to qemu-img
 failures
To: John Snow <jsnow@redhat.com>
References: <20220317234937.569525-1-jsnow@redhat.com>
 <73e7fc10-e843-68fd-ebe3-e7916c891c34@redhat.com>
 <CAFn=p-bffj3CK9o2haN-3PDRQvyMcdnMRJ0fKpqAFifYq_L63A@mail.gmail.com>
 <96332ab4-c4fb-75c3-d865-4fe3d2588325@redhat.com>
 <c75ad6d2-c4cc-bf79-3f7b-ac150450dd65@redhat.com>
 <CAFn=p-aDoMOf0urEibgsiNoKgrX9vqvk+11nB5gKOnqAGA-ohA@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFn=p-aDoMOf0urEibgsiNoKgrX9vqvk+11nB5gKOnqAGA-ohA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.03.22 17:23, John Snow wrote:
>
>
> On Mon, Mar 21, 2022, 11:50 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
>     On 21.03.22 14:14, Hanna Reitz wrote:
>     > On 18.03.22 22:14, John Snow wrote:
>     >> On Fri, Mar 18, 2022 at 9:36 AM Hanna Reitz <hreitz@redhat.com>
>     wrote:
>     >>> On 18.03.22 00:49, John Snow wrote:
>     >>>> Hiya!
>     >>>>
>     >>>> This series effectively replaces qemu_img_pipe_and_status()
>     with a
>     >>>> rewritten function named qemu_img() that raises an exception on
>     >>>> non-zero
>     >>>> return code by default. By the end of the series, every last
>     >>>> invocation
>     >>>> of the qemu-img binary ultimately goes through qemu_img().
>     >>>>
>     >>>> The exception that this function raises includes
>     stdout/stderr output
>     >>>> when the traceback is printed in a a little decorated text
>     box so that
>     >>>> it stands out from the jargony Python traceback readout.
>     >>>>
>     >>>> (You can test what this looks like for yourself, or at least you
>     >>>> could,
>     >>>> by disabling ztsd support and then running qcow2 iotest 065.)
>     >>>>
>     >>>> Negative tests are still possible in two ways:
>     >>>>
>     >>>> - Passing check=False to qemu_img, qemu_img_log, or img_info_log
>     >>>> - Catching and handling the CalledProcessError exception at the
>     >>>> callsite.
>     >>> Thanks!  Applied to my block branch:
>     >>>
>     >>> https://gitlab.com/hreitz/qemu/-/commits/block
>     >>>
>     >>> Hanna
>     >>>
>     >> Actually, hold it -- this looks like it is causing problems
>     with the
>     >> Gitlab CI. I need to investigate these.
>     >> https://gitlab.com/jsnow/qemu/-/pipelines/495155073/failures
>     >>
>     >> ... and, ugh, naturally the nice error diagnostics are
>     suppressed here
>     >> so I can't see them. Well, there's one more thing to try and fix
>     >> somehow.
>     >
>     > I hope this patch by Thomas fixes the logging at least:
>     >
>     >
>     https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg02946.html
>
>     So I found three issues:
>
>     1. check-patch wrongfully complains about the comment added in in
>     “python/utils: add add_visual_margin() text decoration utility” that
>     shows an example for how the output looks.  It complains the lines
>     consisting mostly of “━━━━━━━━” were too long.  I believe that’s
>     because
>     it counts bytes, not characters.
>
>     Not fatal, i.e. doesn’t break the pipeline.  We should ignore that.
>
>
> Agree. (Though I did shorten the lines in my re-spin to see if I could 
> make it shut up, but it didn't work. Ignoring it is.)
>
>
>     2. riscv64-debian-cross-container breaks, but that looks
>     pre-existing.
>     apt complains about some dependencies.
>
>     Also marked as allowed-to-fail, so I believe we should also just
>     ignore
>     that.  (Seems to fail on `master`, too.)
>
>
> Yeah, I don't think this is me.
>
>
>     3. The rest are runs complaining about
>     `subprocess.CompletedProcess[str]`.  Looks like the same issue I was
>     facing for ec88eed8d14088b36a3495710368b8d1a3c33420, where I had to
>     specify the type as a string.
>
>     Indeed this is fixed by something like
>     https://gitlab.com/hreitz/qemu/-/commit/87615eb536bdca7babe8eb4a35fd4ea810d1da24
>
>     .  Maybe squash that in?  (If it’s the correct way to go about this?)
>
>     Hanna
>
>
> Yep, sorry for not replying. I respun the series and tested it, but it 
> became "way too Saturday" for me to hit send on the respin. Will do so 
> today.

Great, thanks!

Hanna


