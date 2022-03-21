Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169C34E2D69
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:09:49 +0100 (CET)
Received: from localhost ([::1]:45392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKbL-0007Da-LA
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:09:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWKIq-0002qi-7P
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:50:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWKIm-0007uP-3K
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:50:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647877834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cxQbWTKlWHCeQa2TtcWX5ee3dzcqNcpnn8Bq1nvT1OU=;
 b=cO5xO5pgn7m7Q/CvWW3wFbjidZ+vrw+Jt2Q5aqhQdiFzUX3LXqeRB5y7IWNRhi0WoSkPtd
 9K2LFCFkcTwuGTe4zdbHQ5oDo57IJzUqCAPRMe6Fjet/Qkixx0gogmI5eLzOTDGTiZDoTL
 umE5TAId7+n2Z6TGZbhbSqK7zfZeQKg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-1DAen9MuMBa6VS_qAgqawQ-1; Mon, 21 Mar 2022 11:50:32 -0400
X-MC-Unique: 1DAen9MuMBa6VS_qAgqawQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 hy26-20020a1709068a7a00b006dfa034862cso5046179ejc.23
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 08:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=cxQbWTKlWHCeQa2TtcWX5ee3dzcqNcpnn8Bq1nvT1OU=;
 b=s2psaQJjCOAPoNA+ZuaU5kN7L2rAvxhysvBfcASxsnBYqqud4rlL9p72EEkE0l1Qpn
 mOJfsAa4gvNY1ILx1uWiuoRuSnVfGoacPyd2sNp188G2mZBpF6e1TMhv+QSZJjywSyid
 u+YHIcTBWERZ5i05Y496gyOhLG4M3BuoKuvcXDZwxTaPKO1z23almoXG7Oo7L8+6i/Oc
 0W7ZOntdzEEa/cXOkrYSoxfyL7iQL5CtMELv9loBPgxl4pHnKKzzpqErbsryE2MpFp8i
 +RKyp719f96Qt7uTRtUnHQMWAjtg9GYRa0jEu4hjnhLtmvlhbI1c8qRqS7NWtIfZMwP3
 cnKQ==
X-Gm-Message-State: AOAM533ZurrzpxfMGuvc9HeJQV9/Hf6/UF2jSjXiewJuY/1pYgch3abW
 QyJL1gVswoA0wA0l/oWoZOTvaZHQFM+SrLdrnX7Lx8CfCtK6o+KRYjHuGVc0uUWjmXiHkytUcyt
 w5Cap2xcZZXl1+eg=
X-Received: by 2002:a50:9fad:0:b0:419:f22:46db with SMTP id
 c42-20020a509fad000000b004190f2246dbmr16509586edf.354.1647877831418; 
 Mon, 21 Mar 2022 08:50:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxf25PGP1dcWcuUUSJQExNqOYrMpjxCkz0AIixkA9HSqxeKmgs41FVesFM54sfDDsnDwqqjRQ==
X-Received: by 2002:a50:9fad:0:b0:419:f22:46db with SMTP id
 c42-20020a509fad000000b004190f2246dbmr16509562edf.354.1647877831173; 
 Mon, 21 Mar 2022 08:50:31 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 gb3-20020a170907960300b006dfafbb4ba4sm4641310ejc.83.2022.03.21.08.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 08:50:30 -0700 (PDT)
Message-ID: <c75ad6d2-c4cc-bf79-3f7b-ac150450dd65@redhat.com>
Date: Mon, 21 Mar 2022 16:50:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 00/18] iotests: add enhanced debugging info to qemu-img
 failures
From: Hanna Reitz <hreitz@redhat.com>
To: John Snow <jsnow@redhat.com>
References: <20220317234937.569525-1-jsnow@redhat.com>
 <73e7fc10-e843-68fd-ebe3-e7916c891c34@redhat.com>
 <CAFn=p-bffj3CK9o2haN-3PDRQvyMcdnMRJ0fKpqAFifYq_L63A@mail.gmail.com>
 <96332ab4-c4fb-75c3-d865-4fe3d2588325@redhat.com>
In-Reply-To: <96332ab4-c4fb-75c3-d865-4fe3d2588325@redhat.com>
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

On 21.03.22 14:14, Hanna Reitz wrote:
> On 18.03.22 22:14, John Snow wrote:
>> On Fri, Mar 18, 2022 at 9:36 AM Hanna Reitz <hreitz@redhat.com> wrote:
>>> On 18.03.22 00:49, John Snow wrote:
>>>> Hiya!
>>>>
>>>> This series effectively replaces qemu_img_pipe_and_status() with a
>>>> rewritten function named qemu_img() that raises an exception on 
>>>> non-zero
>>>> return code by default. By the end of the series, every last 
>>>> invocation
>>>> of the qemu-img binary ultimately goes through qemu_img().
>>>>
>>>> The exception that this function raises includes stdout/stderr output
>>>> when the traceback is printed in a a little decorated text box so that
>>>> it stands out from the jargony Python traceback readout.
>>>>
>>>> (You can test what this looks like for yourself, or at least you 
>>>> could,
>>>> by disabling ztsd support and then running qcow2 iotest 065.)
>>>>
>>>> Negative tests are still possible in two ways:
>>>>
>>>> - Passing check=False to qemu_img, qemu_img_log, or img_info_log
>>>> - Catching and handling the CalledProcessError exception at the 
>>>> callsite.
>>> Thanks!  Applied to my block branch:
>>>
>>> https://gitlab.com/hreitz/qemu/-/commits/block
>>>
>>> Hanna
>>>
>> Actually, hold it -- this looks like it is causing problems with the
>> Gitlab CI. I need to investigate these.
>> https://gitlab.com/jsnow/qemu/-/pipelines/495155073/failures
>>
>> ... and, ugh, naturally the nice error diagnostics are suppressed here
>> so I can't see them. Well, there's one more thing to try and fix
>> somehow.
>
> I hope this patch by Thomas fixes the logging at least:
>
> https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg02946.html

So I found three issues:

1. check-patch wrongfully complains about the comment added in in 
“python/utils: add add_visual_margin() text decoration utility” that 
shows an example for how the output looks.  It complains the lines 
consisting mostly of “━━━━━━━━” were too long.  I believe that’s because 
it counts bytes, not characters.

Not fatal, i.e. doesn’t break the pipeline.  We should ignore that.

2. riscv64-debian-cross-container breaks, but that looks pre-existing.  
apt complains about some dependencies.

Also marked as allowed-to-fail, so I believe we should also just ignore 
that.  (Seems to fail on `master`, too.)

3. The rest are runs complaining about 
`subprocess.CompletedProcess[str]`.  Looks like the same issue I was 
facing for ec88eed8d14088b36a3495710368b8d1a3c33420, where I had to 
specify the type as a string.

Indeed this is fixed by something like 
https://gitlab.com/hreitz/qemu/-/commit/87615eb536bdca7babe8eb4a35fd4ea810d1da24 
.  Maybe squash that in?  (If it’s the correct way to go about this?)

Hanna


