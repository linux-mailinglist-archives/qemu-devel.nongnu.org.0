Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE88E4E44EA
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 18:21:12 +0100 (CET)
Received: from localhost ([::1]:57580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWiBy-0003jS-Mj
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 13:21:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWi9T-0002aU-Tg
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 13:18:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWi9S-0008UN-Ab
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 13:18:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647969513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wkF7BmoWZL4AOKgwc3cKUwAbv765+U3Ld9h9qaA4Rmo=;
 b=JQEmzOkHAIu1upy1VbXozJz+5mVcmy5dGe2T+SBYNt/NL+KcQuqN7JtQIibvlELQW4oMYP
 KSiiO6OOg5sRNXOsbGPShy+yorWlC24AFhZN/RZ7lL/k8fLVSKWdPs+Mekytmm0HmWpzpt
 fg5WuMmcaoAVS/OouD3aGXhYD1A0foY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-P0U-1Y-yOWeOfLO1malxwQ-1; Tue, 22 Mar 2022 13:18:32 -0400
X-MC-Unique: P0U-1Y-yOWeOfLO1malxwQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 13-20020a170906328d00b006982d0888a4so8984894ejw.9
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 10:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to;
 bh=nM2NNGCWd7hCA8C/4ubYLVgQa2XK+6AcZdg4zNLZK9s=;
 b=HVvZTMjfF5g43RXnzq0MWucgzNuxXm5v3IXpuOtyNrrWX6Q5gShYi2HmCxBM/MpU8r
 eqUwesuC42XoPpdrOWQyjYe9eeLnEJACgjyla5bIyJQSgEvdfwlqUkNu9912x9ymvj3J
 LRplillhCXopsjBTJ5DOa1FRhCmU1asxvMTij7BwY5GtJ0TL8VZZP6Locv8cXhZpB7pE
 oLAo/WqbvVsNA7CRxUEckpkDINCnUAlGYYi4vruKu224T77EZxw+NGZY4nqBEF6gKCyg
 CmLrvYhQDANr9133EG/lVkwV6R52vsRcOUm8Utp5jCUAF8GHpD/1/Aw72RuhF+cJusME
 n71Q==
X-Gm-Message-State: AOAM532JqIgY2MDKeDiKtcJ2cKT85QGUxB3apAOH1EFZXhSAjhW1K5cj
 UoMXYB2qrlvlKs1HXAPH5tO2qTwe1iiKGgOnQY1IRDHN5iBFNSKXu1Fpv3ZlcOnIK4lzRK9kUPR
 t+GCIiC3oVSd2YvY=
X-Received: by 2002:a17:906:d1c4:b0:6d5:83bb:f58a with SMTP id
 bs4-20020a170906d1c400b006d583bbf58amr27244632ejb.672.1647969511188; 
 Tue, 22 Mar 2022 10:18:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCLLgWIO+TczeaR8J7ArPRNKDlcZt1fbJMTHFK5n+EzHGWqjfEOFNmyi0dCjShu1SOs2IJAQ==
X-Received: by 2002:a17:906:d1c4:b0:6d5:83bb:f58a with SMTP id
 bs4-20020a170906d1c400b006d583bbf58amr27244607ejb.672.1647969510848; 
 Tue, 22 Mar 2022 10:18:30 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a170906274400b006da9456e802sm8793041ejd.102.2022.03.22.10.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 10:18:30 -0700 (PDT)
Message-ID: <06acbaf5-0e47-52f1-df79-5161b6c68424@redhat.com>
Date: Tue, 22 Mar 2022 18:18:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 00/15] iotests: add enhanced debugging info to qemu-io
 failures
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220318203655.676907-1-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220318203655.676907-1-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------t5h93eABLgQraak4uOlJ3umF"
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------t5h93eABLgQraak4uOlJ3umF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18.03.22 21:36, John Snow wrote:
> Howdy,

Heya,

[...]

> - Uh, actually, test 040 fails with this patchset and I don't understand
>    if it's intentional, harmless, a test design problem, or worse:
>
> ======================================================================
> ERROR: test_filterless_commit (__main__.TestCommitWithFilters)
> ----------------------------------------------------------------------
> Traceback (most recent call last):
>    File "/home/jsnow/src/qemu/tests/qemu-iotests/040", line 822, in tearDown
>      self.do_test_io('read')
>    File "/home/jsnow/src/qemu/tests/qemu-iotests/040", line 751, in do_test_io
>      qemu_io('-f', iotests.imgfmt,
>    File "/home/jsnow/src/qemu/tests/qemu-iotests/iotests.py", line 365, in qemu_io
>      return qemu_tool(*qemu_io_wrap_args(args),
>    File "/home/jsnow/src/qemu/tests/qemu-iotests/iotests.py", line 242, in qemu_tool
>      raise VerboseProcessError(
>
> qemu.utils.VerboseProcessError: Command
>    '('/home/jsnow/src/qemu/bin/git/tests/qemu-iotests/../../qemu-io',
>    '--cache', 'writeback', '--aio', 'threads', '-f', 'qcow2', '-c',
>    'read -P 4 3M 1M',
>    '/home/jsnow/src/qemu/bin/git/tests/qemu-iotests/scratch/3.img')'
>    returned non-zero exit status 1.
>    ┏━ output ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
>    ┃ qemu-io: can't open device
>    ┃ /home/jsnow/src/qemu/bin/git/tests/qemu-iotests/scratch/3.img:
>    ┃ Could not open backing file: Could not open backing file: Throttle
>    ┃ group 'tg' does not exist
>    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
>
> It looks like we start with the img chain 3->2->1->0, then we commit 2
> down into 1, but checking '3' fails somewhere in the backing
> chain. Maybe a real bug?

Looks like my hunch was right: The problem is that it’s hard to figure 
out a good backing file string when there are filters involved, and so 
in one test here we generate one that contains a JSON description of the 
backing subgraph including a throttle node. Outside of qemu, that 
doesn’t make much sense, hence the error.

(And because we checked only for “pattern verification failed” 
specifically, that error here never surfaced.)

I think (hope?) we can expect management tools to manually specify 
backing file strings in such cases, like the attached diff does. That 
seems to fix the problem.

Hanna
--------------t5h93eABLgQraak4uOlJ3umF
Content-Type: text/x-patch; charset=UTF-8; name="040.diff"
Content-Disposition: attachment; filename="040.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3Rlc3RzL3FlbXUtaW90ZXN0cy8wNDAgYi90ZXN0cy9xZW11LWlvdGVzdHMv
MDQwCmluZGV4IGM0YTkwOTM3ZGMuLjMwZWI5NzgyOWUgMTAwNzU1Ci0tLSBhL3Rlc3RzL3FlbXUt
aW90ZXN0cy8wNDAKKysrIGIvdGVzdHMvcWVtdS1pb3Rlc3RzLzA0MApAQCAtODM2LDcgKzgzNiw4
IEBAIGNsYXNzIFRlc3RDb21taXRXaXRoRmlsdGVycyhpb3Rlc3RzLlFNUFRlc3RDYXNlKToKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgam9iX2lkPSdjb21taXQnLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBkZXZpY2U9J3RvcC1maWx0ZXInLAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB0b3Bfbm9kZT0nY293LTInLAotICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBiYXNlX25vZGU9J2Nvdy0xJykKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmFzZV9u
b2RlPSdjb3ctMScsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJhY2tpbmdfZmlsZT1z
ZWxmLmltZzEpCiAgICAgICAgIHNlbGYuYXNzZXJ0X3FtcChyZXN1bHQsICdyZXR1cm4nLCB7fSkK
ICAgICAgICAgc2VsZi53YWl0X3VudGlsX2NvbXBsZXRlZChkcml2ZT0nY29tbWl0JykKIApAQCAt
ODUyLDcgKzg1Myw4IEBAIGNsYXNzIFRlc3RDb21taXRXaXRoRmlsdGVycyhpb3Rlc3RzLlFNUFRl
c3RDYXNlKToKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgam9iX2lkPSdjb21taXQnLAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXZpY2U9J3RvcC1maWx0ZXInLAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB0b3Bfbm9kZT0nY293LTEnLAotICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBiYXNlX25vZGU9J2Nvdy0wJykKKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYmFzZV9ub2RlPSdjb3ctMCcsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJh
Y2tpbmdfZmlsZT1zZWxmLmltZzApCiAgICAgICAgIHNlbGYuYXNzZXJ0X3FtcChyZXN1bHQsICdy
ZXR1cm4nLCB7fSkKICAgICAgICAgc2VsZi53YWl0X3VudGlsX2NvbXBsZXRlZChkcml2ZT0nY29t
bWl0JykKIAo=
--------------t5h93eABLgQraak4uOlJ3umF--


