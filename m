Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E06EC5EDACD
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:59:31 +0200 (CEST)
Received: from localhost ([::1]:34224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odUmp-00049m-0L
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odTXd-00013f-Nq
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:39:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odTXb-0003cj-E1
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:39:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664357981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6A7a9VG/40etsoJS6LKEwC849ZTOtqh6FaidUHbJGig=;
 b=gYkcx6Qx9V244LqthoTKm1rSeSupq7huuB2V+8eCwtFvmhapmcfYrjbgH/8XHExnoq2Lwa
 5WXtcjeQ9gG/Vh6h+vQ9FOkdfdNDoKtifTyKNKddmdU7w7ejbd3B8BMzs6Dj2qJx/Stg3q
 OziIhpeqFDPT+m2EVlP1AmLCL5UD1W8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-84-vkgawuRsOsGRR3i90wfAsA-1; Wed, 28 Sep 2022 05:39:40 -0400
X-MC-Unique: vkgawuRsOsGRR3i90wfAsA-1
Received: by mail-wm1-f71.google.com with SMTP id
 r9-20020a1c4409000000b003b3f017f259so134106wma.3
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 02:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=6A7a9VG/40etsoJS6LKEwC849ZTOtqh6FaidUHbJGig=;
 b=WXFh6U8eMd9Glzxj3kOdLUdVmeXGUrIB1puWDOt4ba2ZGDJzd+JntJBKT1TyWg5GAa
 HajBtSAXZJo4AdrjzIQxbRh5ijOoJVHp7im+j0MWd3YGlxa5eDl3l7Ct2PFocvOhx0l7
 /4XImjJD2nUNCrfvLM0wJG+snRzHHWsWvV4ZRKcODNVx2IwsKmHWpWxNwP5Lmw3mx8IU
 IJcqBDtOIaSYrAAZjTmi932WKMWjhEQ1ItnMuqfDZQxx5fSbGa4etfFZUAxkXm3LtpH4
 ZuSYnWDw0JdTLZ/968mLH8uhEce8BvXARehgmKSfAJPJJXzSXKeul9ePGOId1juk706n
 Gi0A==
X-Gm-Message-State: ACrzQf3qm7CSDAOenDgsm5UkCuSJG1a/rhwnlFof9tSWCiRu/zYdQaH3
 ld9YlbCXYDZkjFD2DP+swapKB7RIYuIXiTsTl0Xkv/KxlzCNAxCFt2B8edLeS4e5m+eAWOIQzdn
 E201sOvnYkzpHRAM=
X-Received: by 2002:a05:6000:cf:b0:228:e37b:361b with SMTP id
 q15-20020a05600000cf00b00228e37b361bmr20243721wrx.374.1664357979006; 
 Wed, 28 Sep 2022 02:39:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4SHWblJn8utdy/M3vGRdP2ajVOvYoshQtJlR+KuGecPDW5ksIb3FrlMO+BJeeBpC+4qOg1xw==
X-Received: by 2002:a05:6000:cf:b0:228:e37b:361b with SMTP id
 q15-20020a05600000cf00b00228e37b361bmr20243713wrx.374.1664357978825; 
 Wed, 28 Sep 2022 02:39:38 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-89.web.vodafone.de.
 [109.43.176.89]) by smtp.gmail.com with ESMTPSA id
 i11-20020a05600c354b00b003b4935f04a4sm1590417wmq.5.2022.09.28.02.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 02:39:38 -0700 (PDT)
Message-ID: <17d249fc-d1b7-4336-fa4c-dc5e245e10c8@redhat.com>
Date: Wed, 28 Sep 2022 11:39:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, pbonzini@redhat.com
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com, jsnow@redhat.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
References: <20220917162606-mutt-send-email-mst@kernel.org>
 <CAARzgwxoy_E-vkwo-mKo0tbG31Y3E3r9FB6v3H3hgPYW4fb6sA@mail.gmail.com>
 <YzK1VzoU05vnlxY4@redhat.com>
 <CAARzgwxpm-tF3OwK95gHe+9_6qBebiqPFLug-59RUt85aCnuZQ@mail.gmail.com>
 <YzLN3Y1pNO8SVn9M@redhat.com>
 <CAARzgwx+ZitnYKvmkDGA1+Aq3_yPQFSs5GfTvGaAeNmHxUSNOQ@mail.gmail.com>
 <CAARzgwwLXp9rDkQ4OTW2TUgnp_XDyMTXf6OhsKE9qAL1HTuMRQ@mail.gmail.com>
 <YzMahUpNtsas18rN@redhat.com> <20220927172044-mutt-send-email-mst@kernel.org>
 <2a5c6c18-e0b1-aaf8-78fa-5a12396fef87@redhat.com>
 <20220928053421-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220928053421-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/09/2022 11.35, Michael S. Tsirkin wrote:
> On Wed, Sep 28, 2022 at 10:31:39AM +0200, Thomas Huth wrote:
>> On 27/09/2022 23.21, Michael S. Tsirkin wrote:
>>> On Tue, Sep 27, 2022 at 04:45:09PM +0100, Daniel P. Berrangé wrote:
>>>> On Tue, Sep 27, 2022 at 07:35:13PM +0530, Ani Sinha wrote:
>> ...
>>>>> Alright, .gitlab-ci.yml is produced and the pipeline succeeds.
>>>>> However, the question still remains, where do we keep the generated
>>>>> artifacts?
>>>>
>>>> The following link will always reflect the published artifacts from
>>>> the most recently fully successful CI pipeline, on the 'qemu-bits'
>>>> branch, and 'qemu-bits-build' CI job:
>>>>
>>>> https://gitlab.com/qemu-project/biosbits-bits/-/jobs/artifacts/qemu-bits/download?job=qemu-bits-build
>>>>
>>>> Tweak as needed if you push the CI to master branch instead. This
>>>> link can be considered the permanent home of the artifact. I'd just
>>>> suggest that the QEMU job automatically skip if it fails to download
>>>> the artifact, as occassionally transient infra errors can impact
>>>> it.
>>>
>>> This just means once we change the test old qemu source can no longer use it.
>>> Why is this a good idea? Are we so short on disk space? I thought CPU
>>> is the limiting factor?
>>
>> FYI, we'll soon be short on disk space, gitlab plans to introduce storage
>> limits:
>>
>>   https://about.gitlab.com/pricing/faq-paid-storage-transfer/
>>
>>   Thomas
> 
> A good reason not to use CI artifacts to store images maybe?
> I was proposing storing binaries on qemu.org not on gitlab.

For qemu.org, you should maybe talk to Paolo and Stefan first, I'm not sure 
whether we could allow additional network traffic
beside the normal release tarballs there...

  Thomas


