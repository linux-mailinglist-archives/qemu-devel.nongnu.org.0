Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BFC65526C
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 16:49:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8kHF-0000Am-Nk; Fri, 23 Dec 2022 10:48:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8kHE-0000Ae-JS
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 10:48:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8kHD-0001jC-7E
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 10:48:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671810482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JMjcy7Ptv5m5Nw7r6ojwdHjs53Hu8VA/6oDquB1bdSk=;
 b=bdpMrQM/JQQ6N4vNKApNweIxoSzl4O0yq53fb8m+J634oCMhIKp7k5+6EJ14Uc83ksrZmU
 UC3JdvjdhCeYPmYLIQcTGjCOtIgZ6nXjMkn2CpRB7wn9t/bHkvwXItU3j0nqVnRVNjOMPV
 z7DfnzNwVALHhelmkV1uhCa81l6CPbU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-70-4832BWQXNUeGkndZIpoc8w-1; Fri, 23 Dec 2022 10:48:00 -0500
X-MC-Unique: 4832BWQXNUeGkndZIpoc8w-1
Received: by mail-ed1-f70.google.com with SMTP id
 y20-20020a056402271400b0046c9a6ec30fso3907289edd.14
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 07:48:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JMjcy7Ptv5m5Nw7r6ojwdHjs53Hu8VA/6oDquB1bdSk=;
 b=6HRwLRBS4R/GLby66MtPhEH2DQVkFsgytFBodpDZlOc5xlSR1SjK2HKoX56BwuuVDX
 woqqgYYyRw/ZhGeMxCoDBByxIPciHgBgun4/JfnkIg57q8qRXAxkJm1MfcRCsSGDyPaN
 lRwTPgFSp3xEBIdU2rfjjxYSaoSzGYNZ5G8PORDmINOzv3hCS1vN8/txmnUhyqYVrw38
 HjuqBryMyEY9i8y/cFy+EKaR8BchgxxtT8huI2rbdcPxDumuNOUrUl5k35cSZzvnB6WL
 I3sun5JXz6SCzsKa4kTJaOPT8Mzvh+hzBUJ/xyuQ3JMVocs93J0cvmSFiK5wa9vbP+r9
 oMBw==
X-Gm-Message-State: AFqh2kpWhMVJHV/Qz6FzlpAC/NGLM1ayPY9/N0mcA206rUC/vQsuuwBZ
 enp37AKrd7Nxc9tLQNC4C+YgmB9fqocwrwMKN1CI5EhtvIh1kdR1sYHgnxqz1jdwdAScaglr0cy
 XSZDapJO8xie9DNU=
X-Received: by 2002:a05:6402:4009:b0:467:dc59:cec6 with SMTP id
 d9-20020a056402400900b00467dc59cec6mr15334689eda.0.1671810479471; 
 Fri, 23 Dec 2022 07:47:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu3xE2gJPRGRFxolhJtv6rs1FxuJl53Vg+OiorYvzeMuespyEks15zBulxobPK0Qv7E9y1QoQ==
X-Received: by 2002:a05:6402:4009:b0:467:dc59:cec6 with SMTP id
 d9-20020a056402400900b00467dc59cec6mr15334672eda.0.1671810479275; 
 Fri, 23 Dec 2022 07:47:59 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 n20-20020aa7db54000000b0047e6fdbf81csm1610699edt.82.2022.12.23.07.47.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Dec 2022 07:47:58 -0800 (PST)
Message-ID: <05c4cb9e-0f41-c60f-6a68-cf5050ad7a02@redhat.com>
Date: Fri, 23 Dec 2022 16:47:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC v4 2/3] memory: add depth assert in address_space_to_flatview
Content-Language: en-US
To: Chuang Xu <xuchuangxclwt@bytedance.com>, qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, peterx@redhat.com,
 david@redhat.com, philmd@linaro.org, zhouyibo@bytedance.com
References: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
 <20221223142307.1614945-3-xuchuangxclwt@bytedance.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221223142307.1614945-3-xuchuangxclwt@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/23/22 15:23, Chuang Xu wrote:
>   static inline FlatView *address_space_to_flatview(AddressSpace *as)
>   {
> +    /*
> +     * Before using any flatview, sanity check we're not during a memory
> +     * region transaction or the map can be invalid.  Note that this can
> +     * also be called during commit phase of memory transaction, but that
> +     * should also only happen when the depth decreases to 0 first.
> +     */
> +    assert(memory_region_transaction_get_depth() == 0 || rcu_read_locked());
>       return qatomic_rcu_read(&as->current_map);
>   }

This is not valid because the transaction could happen in *another* 
thread.  In that case memory_region_transaction_depth() will be > 0, but 
RCU is needed.

Paolo


