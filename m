Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CE66329D9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 17:43:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox9rI-0004nX-Dl; Mon, 21 Nov 2022 11:41:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ox9r5-0004kw-M3
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:41:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ox9r0-0001cO-Jd
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:41:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669048863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XfORB0I6pG5/SoMVyZ5TnVgQi92VJac/YnibD6vAbx8=;
 b=J85sSWHozKwIVBhgSWAvQ+xSKzWMQo5cgXGcmto8ARr8PkTnogGu02eIIxQ6xhEJO531jt
 mw3En9tsM6GH22eQVwzn3cGOvGsc/SwTsyBkvzuI5CGWcW1+BEAew0k1LjvMEj/5AYhUjF
 TfmOOlDKvTMYT+CVp/L/mEjUjqjsuDQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-25-D-k_Y6mnMUuaLEGhFbmJNA-1; Mon, 21 Nov 2022 11:34:21 -0500
X-MC-Unique: D-k_Y6mnMUuaLEGhFbmJNA-1
Received: by mail-wm1-f71.google.com with SMTP id
 1-20020a05600c028100b003cf7833293cso9546765wmk.3
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 08:34:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XfORB0I6pG5/SoMVyZ5TnVgQi92VJac/YnibD6vAbx8=;
 b=wMA9zXW1FE5W6u+N/uGZQBEcHnY/yQeJ1MCIM3mucQLavBMMPP/5SrvPsZOfnMmbWq
 qEnJrXIBCmmrs6VWNCYxprNkbt7ELII6i2HyMZN3Js7I34cGj9ANY3Vz3vEMVzKzbaxh
 qUc2l+lb5joxuk2GB+QQkabwvG/FGeJc+mW3kleygoWSds/hNb8zjYLuEv7kZYsbjhCa
 l4oXlu0RM6EVfd0uIfQ4E1iHA7kEgru5VTHGcWFPSmDYWCn4jJ3/iPed1wyL8j7QBbbG
 +pCo5X1DrSLBdEIyuoS7lqeehJ1ap8E16k4n1jXpSiPjPKcycsTcQN5B+SqWd3LynI4e
 03QA==
X-Gm-Message-State: ANoB5pmQU/dwbDv1NerIKBAgLASKuE4hDk8qCUjr2OF4I3BoYOEy5GmJ
 +u2Lkekvf4UCmK13djL7+NdRK1BmbTgyP7NNTNl8wTByFko1IVBGiIpkvL2YBA5wsOONp/nwEyw
 iSGnJZtj9143mnbc=
X-Received: by 2002:a05:600c:4f55:b0:3cf:729b:d4b4 with SMTP id
 m21-20020a05600c4f5500b003cf729bd4b4mr7112326wmq.48.1669048460409; 
 Mon, 21 Nov 2022 08:34:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf62CR+eS8hfyzGHaQQCbo5nl9ASk/kXBf4VLJBzD9tUgVwGxRFN3OEI/Sq6ebXmY3pjmbPJJw==
X-Received: by 2002:a05:600c:4f55:b0:3cf:729b:d4b4 with SMTP id
 m21-20020a05600c4f5500b003cf729bd4b4mr7112278wmq.48.1669048460146; 
 Mon, 21 Nov 2022 08:34:20 -0800 (PST)
Received: from [192.168.8.105] (tmo-116-109.customers.d1-online.com.
 [80.187.116.109]) by smtp.gmail.com with ESMTPSA id
 w19-20020adfbad3000000b00241c6729c2bsm8556551wrg.26.2022.11.21.08.34.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 08:34:19 -0800 (PST)
Message-ID: <47e0d3d8-607d-5e29-6780-c0a4364993a9@redhat.com>
Date: Mon, 21 Nov 2022 17:34:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] cleanup: Tweak and re-run return_directly.cocci
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com, groug@kaod.org,
 qemu_oss@crudebyte.com, Alistair.Francis@wdc.com, bin.meng@windriver.com,
 palmer@dabbelt.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 yuval.shaia.ml@gmail.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pavel.dovgaluk@ispras.ru,
 alex.bennee@linaro.org, peterx@redhat.com, david@redhat.com,
 mrolnik@gmail.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 jcmvbkbc@gmail.com, berrange@redhat.com, lvivier@redhat.com,
 suhang16@mails.ucas.ac.cn, chen.zhang@intel.com, lizhijian@fujitsu.com,
 stefanha@redhat.com, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, virtio-fs@redhat.com
References: <20221121140121.1079100-1-armbru@redhat.com>
 <CAFEAcA_jnbp36Trjd3qJYzbf5-6SNNrirG7q2_-wKXkcX49ptg@mail.gmail.com>
 <7875a42b-2776-9d36-5373-78ac75cff89d@linaro.org>
 <87a64ki7zn.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87a64ki7zn.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 21/11/2022 17.32, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 21/11/22 15:36, Peter Maydell wrote:
>>> On Mon, 21 Nov 2022 at 14:03, Markus Armbruster <armbru@redhat.com> wrote:
>>>>
>>>> Tweak the semantic patch to drop redundant parenthesis around the
>>>> return expression.
>>>>
>>>> Coccinelle drops comments in hw/rdma/vmw/pvrdma_cmd.c; restored
>>>> manually.
>>>>
>>>> Coccinelle messes up vmdk_co_create(), not sure why.  Transformed
>>>> manually.
>>>>
>>>> Line breaks in target/avr/cpu.h and hw/rdma/vmw/pvrdma_cmd.c tidied up
>>>> manually.
>>>>
>>>> Whitespace in fuse_reply_iov() tidied up manually.
>>>>
>>>> checkpatch.pl complains "return of an errno should typically be -ve"
>>>> two times for hw/9pfs/9p-synth.c.  Preexisting, the patch merely makes
>>>> it visible to checkpatch.pl.
>>>>
>>>> checkpatch.pl complains "return is not a function, parentheses are not
>>>> required" three times for target/mips/tcg/dsp_helper.c.  False
>>>> positives.
>>>>
>>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>>
>>>>    .../user/ase/msa/bit-count/test_msa_nloc_b.c  |   9 +-
>>>>    .../user/ase/msa/bit-count/test_msa_nloc_d.c  |   9 +-
>>> [snip long list of other mips test files]
>>>
>>>>    328 files changed, 989 insertions(+), 2099 deletions(-)
>>> This patch seems to almost entirely be huge because of these
>>> mips test case files. Are they specific to QEMU or are they
>>> effectively a 3rd-party import that it doesn't make sense
>>> to make local changes to?
>>
>> They are imported and will unlikely be modified.
> 
> Not obvious to me from git-log.
> 
> Should I drop the changes to tests/tcg/mips/?

I'd say yes. At least move them to a separate patch. Otherwise reviewing 
this patch here is no fun at all.

  Thomas


