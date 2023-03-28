Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530546CBF6B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 14:42:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph8dm-0008BF-Sr; Tue, 28 Mar 2023 08:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ph8dk-0008B2-05
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:41:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ph8dg-00074k-Ha
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:41:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680007283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wsS8S5SJnxrnJgBCU26PFwCfhwRdDVAXiggVFYPy2zw=;
 b=IhbGFPN9ULh5DEscRhNLssQ6sg98LHtxE5oxfmSnssaq+wT6xcg0oSXVz6KVM1ggNcgmSL
 zULg33zzrvMLO7lNcxgsJG+C/OmjM5w4YmXaP7rbUFk2lAehogD7IQrGiomRt6X42G/QDg
 74LP3zadBihTs85jK4VmBE2wnnhGWCo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-bR24kDK7PuOJ_ZEQ4Cv-qg-1; Tue, 28 Mar 2023 08:41:22 -0400
X-MC-Unique: bR24kDK7PuOJ_ZEQ4Cv-qg-1
Received: by mail-qt1-f198.google.com with SMTP id
 v10-20020a05622a130a00b003e4ee70e001so2110474qtk.6
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 05:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680007281;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsS8S5SJnxrnJgBCU26PFwCfhwRdDVAXiggVFYPy2zw=;
 b=NTbeluuIY9gcd5Ufpo+KDQ94JDgaXHZSbYPgx0PdW1dnTDgSK3xl6imiO4hCkEq5Lq
 uqC8O3W30oXPUHZ7bjhB4jtoXraUcKsASzzu6YItFkGK4ps0lX+lhPvVrdvhngpCQyMx
 j5HVQqbtgDebma+fRKkrYK/qT6UR+nS+NgmlRRyFnPVu+/k8+Zl7HNAJF/IMcpYgLePo
 BtnHcxkxVnV1SWR3V6BBUJvIdNCcESxMX6Oio5WLCAY8WxtEIUxYhBn3TDMY2EMeFHhD
 rSCJ7ylUiNAcJq/SvCvIvnbjF8ex5Xg05/6735oycJghh2uftbYHJnT3cb+jEuP9oWv9
 zL4w==
X-Gm-Message-State: AAQBX9dSwCyZ1lgkOEsrzpxHhRF7/agkHF+z40oXenKNFqeWKp7f5lDy
 pZo1IwsP69pGKDWwZ0c+E2jlQcOBk4n48CPDlX7o4mf5NJiVQplEzKQz8mxAsMnnxP9tu9o8mEL
 buy7njPajIHGJ5tGjo2v7KK7YbA==
X-Received: by 2002:a05:6214:cc6:b0:5b6:fbc5:fb4f with SMTP id
 6-20020a0562140cc600b005b6fbc5fb4fmr31846002qvx.3.1680007281722; 
 Tue, 28 Mar 2023 05:41:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350a6kSgb7M8ABipdFXa0ZU+ghJZUUtP3VXJP9GuJk0X5lmCBimxpwl96BDhxGvh0FFLum1MNzw==
X-Received: by 2002:a05:6214:cc6:b0:5b6:fbc5:fb4f with SMTP id
 6-20020a0562140cc600b005b6fbc5fb4fmr31845973qvx.3.1680007281432; 
 Tue, 28 Mar 2023 05:41:21 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-113.web.vodafone.de.
 [109.43.179.113]) by smtp.gmail.com with ESMTPSA id
 mb4-20020a056214550400b005ddd27e2c0asm3144851qvb.36.2023.03.28.05.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 05:41:20 -0700 (PDT)
Message-ID: <213f660d-550b-c18f-8548-3a44495fc1b4@redhat.com>
Date: Tue, 28 Mar 2023 14:41:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: stat64 wrong on sparc64 user
Content-Language: en-US
To: Luca Bonissi <qemu@bonslack.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <db07e036-cc5f-c9ad-b63c-10fdd5404830@bonslack.org>
 <bdebe626-e552-affb-b756-02c70898bdd6@redhat.com>
 <d49d441a-01a6-d38d-2bc8-98b9658a288e@bonslack.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <d49d441a-01a6-d38d-2bc8-98b9658a288e@bonslack.org>
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

On 28/03/2023 14.22, Luca Bonissi wrote:
> On 28/03/23 13:55, Thomas Huth wrote:
>> On 28/03/2023 13.48, Luca Bonissi wrote:
>>> --- qemu-20230327/linux-user/syscall_defs.h    2023-03-27 
>>> 15:41:42.000000000 +0200
>>> +++ qemu-20230327/linux-user/syscall_defs.h.new    2023-03-27 
>>> 21:43:25.615115126 +0200
>>> @@ -1450,7 +1450,7 @@ struct target_stat {
>>>       unsigned int    st_dev;
>>>       abi_ulong    st_ino;
>>>       unsigned int    st_mode;
>>> -    unsigned int    st_nlink;
>>> +    short int    st_nlink;
>>>       unsigned int    st_uid;
>>
>> That looks wrong at a first glance. IIRC Sparc is a very strictly aligned 
>> architecture, so if the previous field "st_mode" was aligned to a 4-byte 
>> boundary, the "st_uid" field now would not be aligned anymore... are you 
>> sure about this change? Maybe it needs a padding field now?
> 
> The padding is automatic (either on Sparc or x86-64): short will be aligned 
> to 2-byte boundary, int will be aligned to 4-byte boundary, long will be 
> aligned to 8-byte boundary.

Ah, right, I blindly assumed that we were using __attribute__((packed)) here 
for such structs... but that does not seem to be the case, so never mind.

  Thomas


