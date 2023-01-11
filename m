Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594C96658C4
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 11:16:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFY8t-0002aA-RT; Wed, 11 Jan 2023 05:15:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFY8h-0002Va-WD
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:15:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFY8g-0004MF-LY
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:15:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673432120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=taKacc8GXvovhu9NFEpRN/oe8aHcPhrWN/bGjcZ1K5c=;
 b=XC7pmrjOuUq2xqAM8HSmjb4CA3H5m38I+bCIBqHqtRz9OmyYGjultVbBWnF0UCNqeGSNrT
 gzUurSA2Ufy2v0/cHYixZpps+C5Zo7wCgnfsy2wwYkIITbStIv+pI9wxpPu4ro9FLXLFfD
 BpUA7HZni5jo4nL+zpC7eJInE9xfGEU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-26-ajraYpA7PEmJESI_pwZRsg-1; Wed, 11 Jan 2023 05:15:17 -0500
X-MC-Unique: ajraYpA7PEmJESI_pwZRsg-1
Received: by mail-wm1-f70.google.com with SMTP id
 fm17-20020a05600c0c1100b003d96f0a7f2eso10472782wmb.6
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 02:15:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=taKacc8GXvovhu9NFEpRN/oe8aHcPhrWN/bGjcZ1K5c=;
 b=Kgi1YhT3bc2/m1Jey8H/PDnmlD8M6RNuNpXcnfI75D8lO8IfDPv1q3O0H1j4z678v9
 qTnyIH0Xs7SOydWU3RQMq6OVvB8/rITKpDi2F2L8JDh0AkljOXTrgcEtxkn7qTS0oKB2
 lpOO5Nx9kVfVrjaVLH/Pb8l3t0c8Fp2AikHpPeddrFgJjkf8o9xsAcgzIbXxOXUL0QNq
 BTHOsh49zJTgy38v79QktKFxPirAnQ4diO61K13p5FcITSQ8lPJsr7IvPe0MFZL0S7TE
 7tKGcDvKQyVjZoWhdMMNQGGIg1eYs7VvlXgB6g3qG5mPIZsVnmb7NoJGKWFfoDsai1rs
 JtJA==
X-Gm-Message-State: AFqh2koapnDwmRtUkgBoV4ds4xMSMIKlppUU/TjHLYb4VKXJjdi+llaK
 tS3RjUaULJPtVqmNyDXR1BjrUDYOrAw3VxOsU3mbcr69SfDfSaW5Vbjo9JZ7Vziqaf/p/upyAMu
 +AEH2EoqMQzuaO2U=
X-Received: by 2002:a05:600c:246:b0:3d3:3deb:d91f with SMTP id
 6-20020a05600c024600b003d33debd91fmr54284887wmj.5.1673432116362; 
 Wed, 11 Jan 2023 02:15:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsuQa+/KiUsGRRJ/Xs9LZMum5IL/im0uARUTA35ON02uLKiQRTX7Fg1LjijekOmj9zGbJRsFA==
X-Received: by 2002:a05:600c:246:b0:3d3:3deb:d91f with SMTP id
 6-20020a05600c024600b003d33debd91fmr54284869wmj.5.1673432116027; 
 Wed, 11 Jan 2023 02:15:16 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:5b00:5b3c:db46:8eb5:ee24?
 (p200300cbc7045b005b3cdb468eb5ee24.dip0.t-ipconnect.de.
 [2003:cb:c704:5b00:5b3c:db46:8eb5:ee24])
 by smtp.gmail.com with ESMTPSA id
 az28-20020a05600c601c00b003cf57329221sm22157839wmb.14.2023.01.11.02.15.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 02:15:15 -0800 (PST)
Message-ID: <9a63d0ca-4cc3-773c-245c-b6fc28070cd4@redhat.com>
Date: Wed, 11 Jan 2023 11:15:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 4/7] target/s390x: Tidy access_prepare_nf
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230109201856.3916639-1-richard.henderson@linaro.org>
 <20230109201856.3916639-5-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230109201856.3916639-5-richard.henderson@linaro.org>
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

On 09.01.23 21:18, Richard Henderson wrote:
> Assign to access struct immediately, rather than waiting
> until the end of the function.  This means we can pass
> address of haddr struct members instead of allocating
> extra space on the local stack.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


