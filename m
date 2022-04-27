Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980FD5118B5
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 16:20:16 +0200 (CEST)
Received: from localhost ([::1]:59046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njiWd-0007vv-Nc
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 10:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1njiV5-0005hj-Jf
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 10:18:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1njiV2-0006FS-Vk
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 10:18:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651069116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6i1tQAjMp5Fj+yxCQsLXbsJrqyis5IZblQVE/4UC23M=;
 b=fwFZqGrv21wuOSGnpWyu8EQnksE6jIoqq/8y+1VHl8spi2LqYAnSTvPTqwGeLoTVEnq4bZ
 l99CH66QzPPe1GOBCESTwG7vo2IgxBxP7TwKvm6DZUQoTr00xyQzhhjE1KTXry6z2DD/1l
 9sEP3t0hEI4KNibu9JFqsFM8e11YHKQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-zzXqOB9UOPyn8VWfldO3oQ-1; Wed, 27 Apr 2022 10:18:34 -0400
X-MC-Unique: zzXqOB9UOPyn8VWfldO3oQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 r30-20020a50d69e000000b00425e1e97671so1072525edi.18
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 07:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=6i1tQAjMp5Fj+yxCQsLXbsJrqyis5IZblQVE/4UC23M=;
 b=v/pMquvuMF8PhK2htNnwXArKwuuggvK/CIb8DXQcuIp240oI+9v9OaeONz87wnfMAK
 KsU4TWtwNrg4YP8IpZ58KXotaD1Z/CRsleOJilkDSrgE3FdPT/MpKDcoDgGaEDt7ikmu
 gwQ5F4JqxNrVVdV/Yt2Hx7MRni2b+7MtZ++RC3IkQS6SsbXrKaZYQ72soFl+KZAt7yhQ
 LT62swUp2gkN7zVW5ZPJiSRTv9pO0Z4XFP5Ebdhbff0E+VhvHGeqLXQYiUDCt8ObXmeW
 iFvwkKOBAPLV3+SM79BZFhVvnPISRA3oKi1xV1x/ekESCyR8GUmVg2Avax8tGyfvpr5l
 TrFg==
X-Gm-Message-State: AOAM530Z/TcW5jysCNjlH+DiQ8W91WPumnjqzVKGoKBdxKFqTRLpv4Gj
 sHT/zwMpsu4Akme6ao2CM6m+YVVOtznjNL9vvTliTTMbkhclEQljBVjejYIbdAaHf9mMdoh/U95
 5ryHusmOH448+lWU=
X-Received: by 2002:a05:6402:370b:b0:41d:8508:20af with SMTP id
 ek11-20020a056402370b00b0041d850820afmr31564223edb.16.1651069113407; 
 Wed, 27 Apr 2022 07:18:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgLVtloAnBQgLRp2psRl38AKL9Q2RbsxpmkDsi/KdbMx2H9DiuvuiI5fuTCYXh8E09nYrskQ==
X-Received: by 2002:a05:6402:370b:b0:41d:8508:20af with SMTP id
 ek11-20020a056402370b00b0041d850820afmr31564204edb.16.1651069113190; 
 Wed, 27 Apr 2022 07:18:33 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 n11-20020a170906700b00b006f39c00b27fsm4082256ejj.13.2022.04.27.07.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 07:18:32 -0700 (PDT)
Message-ID: <e52b3798-f501-fed5-f86b-2ef3d2a1d1ba@redhat.com>
Date: Wed, 27 Apr 2022 16:18:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 02/26] qcow2: remove incorrect coroutine_fn annotations
Content-Language: en-US
From: Paolo Bonzini <pbonzini@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
 <20220415131900.793161-3-pbonzini@redhat.com>
 <20220419180643.hhzredj3qfazd4a3@redhat.com>
 <YmEwzOZ36npM1QZJ@stefanha-x1.localdomain>
 <5d3049fd-23c6-c287-fcdb-c673c4eede56@redhat.com>
In-Reply-To: <5d3049fd-23c6-c287-fcdb-c673c4eede56@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/22 14:36, Paolo Bonzini wrote:
> On 4/21/22 12:24, Stefan Hajnoczi wrote:
>>>> -int coroutine_fn qcow2_flush_caches(BlockDriverState *bs)
>>>> +int qcow2_flush_caches(BlockDriverState *bs)
>>>>   {
>>>>       int ret = qcow2_write_caches(bs);
>>>
>>> Both of these eventually hit qcow2_cache_write, which is not marked
>>> coroutine, so these should not be either.
>>
>> coroutine_fn may call non-coroutine_fn, so this alone is not a reason
>> for removing it from qcow2_write_caches().
>>
>> There must be a call chain where qcow2_write_caches() and
>> qcow2_flush_caches() are is invoked from outside coroutine_fn.
> 
> The main problematic caller is qcow2_inactivate(), which calls these 
> functions via qcow2_mark_clean().  Another one is 
> update_ext_header_and_dir(), called by 
> qcow2_store_persistent_dirty_bitmaps(), called by qcow2_inactivate().
> 
> Converting inactivate to run in coroutine context would help.

Or maybe not so much because bdrv_close also calls the same paths.

Paolo


