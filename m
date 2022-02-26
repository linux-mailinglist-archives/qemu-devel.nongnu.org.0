Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 488854C5474
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 08:39:43 +0100 (CET)
Received: from localhost ([::1]:48194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNrg5-0004PG-TH
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 02:39:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nNrdS-0002Nx-VE; Sat, 26 Feb 2022 02:36:58 -0500
Received: from [2a00:1450:4864:20::42d] (port=33725
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nNrdQ-0007af-K8; Sat, 26 Feb 2022 02:36:58 -0500
Received: by mail-wr1-x42d.google.com with SMTP id j17so7672645wrc.0;
 Fri, 25 Feb 2022 23:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gpJtFGkPkmQjIFWwHk0PFzMK1Sd+jFl/kAxDE7Tf3Yk=;
 b=KQ4Lqe1fJDrkpNch+sP1MJ2O6qKahtoPjHNTcBbPB9I1XTb9AcXrpJ8xAvy7jaMrH8
 OelKJHB5DCdfmGfDpZzdtjaGsogELn4DhJF/f4hQwFaI4MSYHAgHQngpY7dWWaPY/p7z
 eJMiD+TtyP6qOiprlbyIu6HlT7CinJ4864klSOQaV3+8ihV6NwynjSLCqNdKtZCwI6TE
 0rKTqZHfBgu5DDS6L4enTRVp13zZQBq0R4fo7IY8Bvz5TZWtxpdVCBik6BvrhYbAsOMo
 vrISO1Y0kMFgxVVomzjPec3n4K+brDFoXqQd5SOR3U31eeNgighzy15+O808q9FBlyqj
 ixaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gpJtFGkPkmQjIFWwHk0PFzMK1Sd+jFl/kAxDE7Tf3Yk=;
 b=aleXnx9HyUeCt+ngfDn8AT5Ozb53W+PWjWsBOmgXkKF6ueRbKPogdGCCcERBY0BPqR
 MA8A6N8bWc8G3++wvvh0p0TO42dpAfo4eHfx0nPCojH12gKFGzBFFqhicrf56nmGyv6o
 EqElAchzVx/uwcy6+eRsJ3KuWRahcc+5ASSYjdeU6j2aNB/rxetIE0xjd8vPNLLIvjuB
 5COQx5xiiDURS84VLJksUOq9pGah7/2T+r3s58SHr5mpyd6tVILrruitGho5cetadxdg
 2HNVLujhAatBKrFCbUn9WGpXeDK73NIzzBfgsStTu425kADDh7HpkQCBq+Xktu2HxQY1
 yc4w==
X-Gm-Message-State: AOAM530r0awNRZ28I06sCRSo8wIW6d+bro1/IgtnLh3GcKA+KeR96t3T
 ZGmMp53F8FLS4xGb1OwqlfQ=
X-Google-Smtp-Source: ABdhPJxbA/m7AM7oiz9aec25dA5w5zPvIeLDoHGasOT8DcoLdqRUWwUYfv1bNIxCnu83hbV8pBorKQ==
X-Received: by 2002:adf:d22d:0:b0:1ed:f5c3:b654 with SMTP id
 k13-20020adfd22d000000b001edf5c3b654mr8129751wrh.497.1645861014447; 
 Fri, 25 Feb 2022 23:36:54 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 r4-20020a05600c35c400b0037e9868e364sm8349067wmq.33.2022.02.25.23.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 23:36:53 -0800 (PST)
Message-ID: <50fedd74-81b5-dab6-6279-b01591970acd@redhat.com>
Date: Sat, 26 Feb 2022 08:36:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] util & iothread: Introduce event-loop abstract class
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>
References: <20220221170843.849084-1-nsaenzju@redhat.com>
 <20220221170843.849084-2-nsaenzju@redhat.com>
 <YhdUcRNi95PY0X98@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YhdUcRNi95PY0X98@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, eduardo@habkost.net,
 hreitz@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 10:48, Stefan Hajnoczi wrote:
> On Mon, Feb 21, 2022 at 06:08:43PM +0100, Nicolas Saenz Julienne wrote:
>> diff --git a/qom/meson.build b/qom/meson.build
>> index 062a3789d8..c20e5dd1cb 100644
>> --- a/qom/meson.build
>> +++ b/qom/meson.build
>> @@ -4,6 +4,7 @@ qom_ss.add(files(
>>     'object.c',
>>     'object_interfaces.c',
>>     'qom-qobject.c',
>> +  '../util/event-loop.c',
> 
> This looks strange. I expected util/event-loop.c to be in
> util/meson.build and added to the util_ss SourceSet instead of qom_ss.

Or alternatively, to be in the root just like iothread.c.

Paolo

> What is the reason for this?
> 
>>   ))
>>   
>>   qmp_ss.add(files('qom-qmp-cmds.c'))
>> diff --git a/util/event-loop.c b/util/event-loop.c
>> new file mode 100644
>> index 0000000000..f3e50909a0
>> --- /dev/null
>> +++ b/util/event-loop.c
> 
> The naming is a little inconsistent. The filename "event-loop.c" does
> match the QOM type or typedef name event-loop-backend/EventLoopBackend.
> 
> I suggest calling the source file event-loop-base.c and the QOM type
> "event-loop-base".
> 
>> @@ -0,0 +1,142 @@
>> +/*
>> + * QEMU event-loop backend
>> + *
>> + * Copyright (C) 2022 Red Hat Inc
>> + *
>> + * Authors:
>> + *  Nicolas Saenz Julienne <nsaenzju@redhat.com>
> 
> Most of the code is cut and pasted. It would be nice to carry over the
> authorship information too.
> 
>> +struct EventLoopBackend {
>> +    Object parent;
>> +
>> +    /* AioContext poll parameters */
>> +    int64_t poll_max_ns;
>> +    int64_t poll_grow;
>> +    int64_t poll_shrink;
> 
> These parameters do not affect the main loop because it cannot poll. If
> you decide to keep them in the base class, please document that they
> have no effect on the main loop so users aren't confused. I would keep
> them unique to IOThread for now.


