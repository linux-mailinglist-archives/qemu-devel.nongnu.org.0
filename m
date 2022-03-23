Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 958F44E56A8
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:40:52 +0100 (CET)
Received: from localhost ([::1]:55940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX42V-0007Fk-Ma
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:40:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nX3Sp-0000L2-QQ
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:04:00 -0400
Received: from [2607:f8b0:4864:20::42a] (port=35650
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nX3Sl-0006q6-B3
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:03:57 -0400
Received: by mail-pf1-x42a.google.com with SMTP id f3so601806pfe.2
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 09:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=URu1Cld800RCpFArjD3mILx4RS3EOY2glrIHlB2KP8Q=;
 b=VFfXM5YxFWV1n769LQtS6lAB0qgqL8kW45iyrLTKOyu5t09OX//Lc2kgTexCPwxO1m
 DNO1uQtVYMW07nVqiP70fusf6ZNhI64ed4YsTbhAeBGIIV7aNp98yBQ0ltlSZ74Lpjud
 2+hFvqsrpb9Y25jcKBsrfjnKPQwYspqQcVyM5zL5bHijVyY6qFs15Woa5NzsE24q0oCr
 Rkbx+JVO5LwjOfYRfg+5cdghuSGXQ6PQi/d6Lm3Y4UXa6BvLDd0fH3lXvIgi1rwa18rD
 kg5+i306FFdIa9psNvPEBu91D9OSZjRvRynBGzdx5mEQDjvukE8G1MbzsqRPxMXN6ymf
 gJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=URu1Cld800RCpFArjD3mILx4RS3EOY2glrIHlB2KP8Q=;
 b=cR54GqGCPB0BInzZgD7tgtT1Qme9a5PT6mdl3Yb2Lq068erOhmqDZIjvAZWN+Bgt43
 AD2U8qHSipjDZcVjTcghxehpYCIMG1GSex3SrDzc9BbH6jalmtOue/FXjf7dvO9bysCY
 qpJvUHi3mBD1mBldTaPgvi03/mmakVawdEEdJiEQX1Hdd1l/I3FHQw98sWIheWhiBquv
 ZP0iryG+puqyOLxXR13McLaeamEiX5FDTnPU29kLS8LuLzsWUhxI3JL11//asrNoxcp5
 gTfXoYNxdAYPbkJWRVqu3tK8HVQRu9W8T1kPAcB4f49AJ8MPknNdjFQ+ofuwr64XGf8D
 3M5A==
X-Gm-Message-State: AOAM5331tgxhss1aJvLYLMaWvHTSYoOA4Uq+RQAhuht/o9kRRMl4tgQ8
 QL2phgM9joA4x4atZGgEVu85jw==
X-Google-Smtp-Source: ABdhPJwxGfSENN/9Lwi9Dj6rnEjBTulAhjGbko1yBhAsuIBmI8EdYx67EM0pJ0KJ8RIRRT7o4EbRQw==
X-Received: by 2002:a05:6a00:3309:b0:4fa:950b:d011 with SMTP id
 cq9-20020a056a00330900b004fa950bd011mr291249pfb.24.1648051433738; 
 Wed, 23 Mar 2022 09:03:53 -0700 (PDT)
Received: from [10.255.146.117] ([139.177.225.224])
 by smtp.gmail.com with ESMTPSA id
 oa16-20020a17090b1bd000b001c72b632222sm7101041pjb.32.2022.03.23.09.03.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 09:03:41 -0700 (PDT)
Message-ID: <59113ffd-60c3-8036-d5c8-ca19908f0e65@bytedance.com>
Date: Wed, 23 Mar 2022 23:59:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Re: [PATCH v3 1/6] virtio-crypto: header update
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220323024912.249789-1-pizhenwei@bytedance.com>
 <20220323024912.249789-2-pizhenwei@bytedance.com>
 <Yjs+7TYdumci1Q9h@redhat.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <Yjs+7TYdumci1Q9h@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: herbert@gondor.apana.org.au, mst@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 arei.gonglei@huawei.com, linux-crypto@vger.kernel.org,
 lei he <helei.sig11@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/22 23:38, Daniel P. Berrangé wrote:
> On Wed, Mar 23, 2022 at 10:49:07AM +0800, zhenwei pi wrote:
>> Update header from linux, support akcipher service.
> 
> I'm assuming this is updated for *non-merged* Linux headers, since
> I don't see these changes present in current linux.git
> 
>>
Hi,

The related context link:
https://lkml.org/lkml/2022/3/1/1425

- The virtio crypto spec is the first part. It will be deferred to 1.3.
The latest version: 
https://www.oasis-open.org/committees/ballot.php?id=3681 (need put 
"__le32 akcipher_algo;" instead of "__le32 reserve;" and repost)

- According to the spec, then we can define the linux headers. (depend 
on the spec)

- Update the header file for QEMU. (depend on the linux headers)

All the parts are in development.

-- 
zhenwei pi

