Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 699C46827DC
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 10:00:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMmUO-0007kz-K3; Tue, 31 Jan 2023 03:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pMmUG-0007kI-2C
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 03:59:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pMmUE-0006m1-Lt
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 03:59:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675155569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fDsR44pEvjWof7fufF40okHJDg32jkW2zs67abe8DFI=;
 b=VqY+coKHLLCVcMyVmSTl2mzOS6g0eHmOjPGUFtNGfWxkQmh2e+ItZRqFGncVPCxB4caU4v
 Ur80UBgPwNJr29GsJVPIFjpDPem3eK6beNDheh3mCn+NlkA6hnrnyJSYZegLY2EG9P68C4
 s2CKZRFdfxnETmp99taDuEY+jB1BYu8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-247-M7lC6s4VP2mUgnTWMig8Jw-1; Tue, 31 Jan 2023 03:59:18 -0500
X-MC-Unique: M7lC6s4VP2mUgnTWMig8Jw-1
Received: by mail-wr1-f72.google.com with SMTP id
 v15-20020adfe4cf000000b002bf9413bc50so2311524wrm.16
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 00:59:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fDsR44pEvjWof7fufF40okHJDg32jkW2zs67abe8DFI=;
 b=r1kqZortLE867cD38ehl8AaJMazEwFHEoDw6iK+VzCcDo+nauEaooRwQaHeGpdl1Xw
 WoAPWm19NYvrkl8W4vLJKb6B0Wb2z0Mi4WRL2rtdLDi5E12NEPqrb5JdaE0S8TuswA3t
 Mofl5SUsXGc4FjlG2L03ssswA415r/SFPiq73sNEHdMGylXewt2FYyy/tiTQDIlrlDLN
 gp8dzXFyFiOsHjLlqIGO8n2yAerHthaXvoufjFYo79qAC3u7YFRvvnugms8qRul9nyoI
 VsWu6nE1oaFnwWt/fI67oIU+vbgYFGF7SuZc6/aCaksLR7GPABHA4skSsa/2mISZcxYI
 NN6g==
X-Gm-Message-State: AFqh2kp6epYKQcTDbdZZc7npojcVdK22i1HYkofC/HJAFITG2p8ZpPkV
 JgOHdA5lkAqzqEHOs8Sy+nT/e8tXkgfNppKLUfgWQxGeRWQKLzvOMvxfTbq0PHfhbF+yd9+JZjJ
 TJwZT75/1v6qDYYE=
X-Received: by 2002:a5d:6b50:0:b0:2bc:7fdd:9245 with SMTP id
 x16-20020a5d6b50000000b002bc7fdd9245mr42761348wrw.5.1675155557557; 
 Tue, 31 Jan 2023 00:59:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuawK4GrSijHA81FiY5xkcMKOM7Ydn+oujCmQw1VICtE5S8E7vgg3d3T8RWYF6hf7H6C35gaw==
X-Received: by 2002:a5d:6b50:0:b0:2bc:7fdd:9245 with SMTP id
 x16-20020a5d6b50000000b002bc7fdd9245mr42761337wrw.5.1675155557203; 
 Tue, 31 Jan 2023 00:59:17 -0800 (PST)
Received: from ?IPV6:2003:d8:2f0a:ca00:f74f:2017:1617:3ec3?
 (p200300d82f0aca00f74f201716173ec3.dip0.t-ipconnect.de.
 [2003:d8:2f0a:ca00:f74f:2017:1617:3ec3])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfe382000000b002bfae43109fsm13988407wrm.93.2023.01.31.00.59.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 00:59:16 -0800 (PST)
Message-ID: <3ba78b2c-f6f3-bcd9-05eb-7c00a9397fce@redhat.com>
Date: Tue, 31 Jan 2023 09:59:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 32/36] target/s390x: Use tcg_gen_atomic_cmpxchg_i128
 for CDSG
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, philmd@linaro.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
 <20230130214844.1158612-33-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230130214844.1158612-33-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 30.01.23 22:48, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Ilya Leoshkevich <iii@linux.ibm.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


