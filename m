Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E553B6658C6
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 11:16:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFY9S-0002vJ-TX; Wed, 11 Jan 2023 05:16:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFY9J-0002tf-CB
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:16:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFY9I-0004Ww-0s
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:16:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673432159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KlYzIau1IL/UcK9150O/lhK2rkcs3B7Teajb5TnUoMg=;
 b=ejpkAc3xXlCtNhGAfBxvi+nAxkw1rB8f5n783rk8GBeqpBG/GXzVvktpMnsnD2INAvC8uO
 cNv7p0IdUUUYBI5VGlgYtTzK5EeAMAnGCqwfNEg1yd4O527TF+gOIfTe67A2o5fKPpwIWq
 ipSgE0sJNXsLZGQqT4VYzP0bctpZN3o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-qeYCPUHxMzWB6eyPdxxmNA-1; Wed, 11 Jan 2023 05:15:57 -0500
X-MC-Unique: qeYCPUHxMzWB6eyPdxxmNA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m38-20020a05600c3b2600b003d23f8c6ebdso1592600wms.0
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 02:15:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KlYzIau1IL/UcK9150O/lhK2rkcs3B7Teajb5TnUoMg=;
 b=YwUE/cVVOZZ7AsSZtzgcWOMkyX82bAVc2yptXknU8qQSeU2esVi/TRyIu4Dy4egs0n
 AyW+jKXzQkkRp007TbHjXu7FX+kVT2+I94ajiwVJE4eALYSXTvlDgj3K+6gSa8+vcYqB
 Ke+2Q184li72oBBk7lOishDL4JdrPCB026Eba7j/VIs5P2m7n13EjGqtl8qndtyAEtnO
 YvCVXo/ekNcNrf+YIrhFCG1rq/fdLQNX/l4trJ1BNnyXo20YiKkaN6gMWAgN7vXjrqXO
 hBl0u2C+CL1gm42L0K400lhD+HuDThsAmIDmSdxD/LoccPM8aCYdu7bmi0Q1ML7T4eY0
 9khQ==
X-Gm-Message-State: AFqh2koS50L77X7BVG+2F+LROS+HBn7Ku6CPUdmdZnbbstug9/AWimx8
 KLfTcO4i9WCjKuuMdpQbpWC3ZcoHEmDXp4qe4T/sY+iHCnsWH3+5pQhtpLkMmqN/q1MRa2ek6tx
 fbOQKkLh0sNyXwTg=
X-Received: by 2002:a05:600c:4d25:b0:3d2:27ba:dde0 with SMTP id
 u37-20020a05600c4d2500b003d227badde0mr52676860wmp.33.1673432156607; 
 Wed, 11 Jan 2023 02:15:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtvwlaj/a54jAb/6lqAetf1DdAZeaP/Wmjn7v4GpdVpSB82IUZ2Wen8nhDw/YQ+wnATf0Vm9w==
X-Received: by 2002:a05:600c:4d25:b0:3d2:27ba:dde0 with SMTP id
 u37-20020a05600c4d2500b003d227badde0mr52676847wmp.33.1673432156361; 
 Wed, 11 Jan 2023 02:15:56 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:5b00:5b3c:db46:8eb5:ee24?
 (p200300cbc7045b005b3cdb468eb5ee24.dip0.t-ipconnect.de.
 [2003:cb:c704:5b00:5b3c:db46:8eb5:ee24])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c4f8700b003c6bd12ac27sm20511022wmq.37.2023.01.11.02.15.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 02:15:56 -0800 (PST)
Message-ID: <1e093251-10a7-5635-7ca3-6aed5c97da10@redhat.com>
Date: Wed, 11 Jan 2023 11:15:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/7] target/s390x: Use void* for haddr in S390Access
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230109201856.3916639-1-richard.henderson@linaro.org>
 <20230109201856.3916639-4-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230109201856.3916639-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 09.01.23 21:18, Richard Henderson wrote:
> The interface from probe_access_flags is void*, and matching
> that will be helpful.  We already rely on the gcc extension
> for byte arithmetic on void*.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


