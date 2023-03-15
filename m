Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48136BAB4F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 09:57:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcMwS-00030l-5p; Wed, 15 Mar 2023 04:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pcMwK-0002tI-Eg
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 04:56:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pcMwI-00075K-7q
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 04:56:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678870610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pDiLbrkybvMs3y98EnwrfhF7jK0Mxrnxh7GKQH+7S5c=;
 b=AzrKGTL5YTlVOPkHBH0Nu6wHEAqi16q9grvVGPoSxnxhnqgYHVGMZMOX59tbDmpdm6itUC
 fLCRuD1YB9Re8eG1lu+MvSDdee4E7DyZ5CEbWrbca6df4hESVt7w3O3mUwBIy/O5D60K3q
 4zlFYc/Cfog3t6yWrfPnnEML593ryfU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-xa3tRkIqOceKMxP61iT58g-1; Wed, 15 Mar 2023 04:56:49 -0400
X-MC-Unique: xa3tRkIqOceKMxP61iT58g-1
Received: by mail-wr1-f71.google.com with SMTP id
 o15-20020a05600002cf00b002c54a27803cso3086136wry.22
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 01:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678870608;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pDiLbrkybvMs3y98EnwrfhF7jK0Mxrnxh7GKQH+7S5c=;
 b=mKSuFguA39vcWQn1afudH9xC1c2pdJeGJF9Fk6yLJKPyOefh4NmugbSM7T2QT1i82c
 ZWeWbcFv8w0h29sbzo3H4WR4csqK0F11QuR4xZ1XqFAKd0RA1Cfk4SeVpvsCeo1XrnLj
 zSDfX+IQliRQQed/CwXxmj1dqaFhr0XFuCuR1BAvArYeXZ3iFlaUwBE2djrDCnY3CkZE
 vKuf9AiiMseVlRsX2nYXtWfJvwvbSss9NzyKIDKEIru4P9q0pYow3a/redTvjJFt4kj9
 dhq+EMxwS18I2/Jo1F49A1u4rSN51rUfMGMRjSBd1liPWO+Zi7VcWzNGdtkDuXcgR48b
 mLxQ==
X-Gm-Message-State: AO0yUKW0EDr43eBuDaUH+A1aNS7Hj8Q6bePBQcwD45ogV0xPByGaBHB0
 oMxSgXpORhkL6EiE6ofGde5OC0vJ4w7iBj/lbXJe16tcxsK/rRIGy7++wkxcGaYGnqurMZ/qTHJ
 n1Ini6oKOALwIuaQ=
X-Received: by 2002:a5d:4a4c:0:b0:2d0:cf21:a40e with SMTP id
 v12-20020a5d4a4c000000b002d0cf21a40emr360856wrs.30.1678870607840; 
 Wed, 15 Mar 2023 01:56:47 -0700 (PDT)
X-Google-Smtp-Source: AK7set+gBl8ZdF8B+sBHn+oEK+S4yfMDaOIUPl31QX0YOAVdoVHFZPz26peuCRErHndPUGl/fgUWqw==
X-Received: by 2002:a5d:4a4c:0:b0:2d0:cf21:a40e with SMTP id
 v12-20020a5d4a4c000000b002d0cf21a40emr360841wrs.30.1678870607513; 
 Wed, 15 Mar 2023 01:56:47 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:2f00:2038:213d:e59f:7d44?
 (p200300cbc7022f002038213de59f7d44.dip0.t-ipconnect.de.
 [2003:cb:c702:2f00:2038:213d:e59f:7d44])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a5d5485000000b002c5a1bd5280sm4007762wrv.95.2023.03.15.01.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 01:56:47 -0700 (PDT)
Message-ID: <10aa9232-4092-f8a0-811f-0b5f67fd9f48@redhat.com>
Date: Wed, 15 Mar 2023 09:56:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] target/s390x: Fix LPSW
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
References: <20230315020408.384766-1-iii@linux.ibm.com>
 <20230315020408.384766-2-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230315020408.384766-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

On 15.03.23 03:04, Ilya Leoshkevich wrote:
> Currently LPSW does not invert the mask bit 12 and incorrectly copies
> the BA bit into the address.
> 
> Fix by generating code similar to what s390_cpu_load_normal() does.
> 
> Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
> Co-developed-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


