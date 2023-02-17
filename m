Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B80C69ACEE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 14:48:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT16F-00011Y-VU; Fri, 17 Feb 2023 08:48:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pT166-00011C-0Q
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 08:48:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pT163-0003DB-A0
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 08:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676641695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=09HJBvtvglfoK//OmBgo3mgH3bTLRWAtT78UjjoR7RA=;
 b=U0YWnMM+k6b4csYpLHnexLoNQrZJHR0eMDnP3Z3Fqbts5g9mWRX23eFp4iK4+NsSFuMgnu
 uj1xOw6c2C6ZC2qfjnncosMlJ5/8JGEBrg2uH9d5OlQ1s3/RTWCVYwwB5VEizIQPRgLI1h
 GL9leCDZdlm0YuDnDZM+YZjVPRMDU2g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-f9s6S7emP5OwScPpN_GLfA-1; Fri, 17 Feb 2023 08:48:14 -0500
X-MC-Unique: f9s6S7emP5OwScPpN_GLfA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v6-20020a05600c444600b003e206cbce8dso756032wmn.7
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 05:48:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=09HJBvtvglfoK//OmBgo3mgH3bTLRWAtT78UjjoR7RA=;
 b=B50r4eXeLrtVGM3Jq5sZ0kyihXdGoxS1eclXfojhsNJeaCiRwvQv/3z5p9Zelm1gZe
 ues+b8vbvpaPEBHr0YCrMO2TEKjrXNHeVhgp/ZSqexL9erbEsgUqsA0Qsnvv6oXLHIJr
 AFVA+B7iIhoxCLLOEdA3sAdO+P+v2DybKba3tS5rzINyoFZYstZsBVp2fU22nULiIbB7
 5UIJsa0Ch0fTGBivNz25TBNxNKJpIgRl9Xsdq6s6Y6NTPK+DflrewizpG4lmTcrZhCxV
 wepChiBKWalZrRjiLIdQW9qtzTeCgBCLALiXyQqQKcgvd4e3Yp+jBkSdpBuYi3vSdGvJ
 tkwA==
X-Gm-Message-State: AO0yUKW9bZzAHQDuwerI7mjMAkFdSW6FJRhVXOuR0+SkPIYW8moZQdKS
 A4GVSloakk5xQXYd1BJZApPwbBHFLGpvv3URH2gdNpT3SV2FAAYqtXgBqUEtKyv1HGmbEJavkIH
 o3faxij+SdqCcKPU=
X-Received: by 2002:a05:600c:998:b0:3cf:68d3:3047 with SMTP id
 w24-20020a05600c099800b003cf68d33047mr907482wmp.41.1676641693281; 
 Fri, 17 Feb 2023 05:48:13 -0800 (PST)
X-Google-Smtp-Source: AK7set8BVBpS8em36gZQHaCYLZQO+k1GvLZc+c+ZHMQSYpC5K5ZNnpvzJO0q1pMpPlCEdN9bWFCNNQ==
X-Received: by 2002:a05:600c:998:b0:3cf:68d3:3047 with SMTP id
 w24-20020a05600c099800b003cf68d33047mr907469wmp.41.1676641692937; 
 Fri, 17 Feb 2023 05:48:12 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:9800:59ba:1006:9052:fb40?
 (p200300cbc707980059ba10069052fb40.dip0.t-ipconnect.de.
 [2003:cb:c707:9800:59ba:1006:9052:fb40])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1c7902000000b003dd1bd66e0dsm5034084wme.3.2023.02.17.05.48.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 05:48:12 -0800 (PST)
Message-ID: <4869861d-651a-34ee-d6ac-734d21e0d092@redhat.com>
Date: Fri, 17 Feb 2023 14:48:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 0/2] vhost: memslot handling improvements
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20230216114752.198627-1-david@redhat.com>
 <Y+5UB2+lrNf1pWOH@fedora>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Y+5UB2+lrNf1pWOH@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.256, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 16.02.23 17:04, Stefan Hajnoczi wrote:
> Acked-by: Stefan Hajnoczi<stefanha@redhat.com>

Thanks!

-- 
Thanks,

David / dhildenb


