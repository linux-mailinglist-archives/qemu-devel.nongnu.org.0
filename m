Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AC56BD04E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 13:56:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcn8Y-0001fn-Ds; Thu, 16 Mar 2023 08:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pcn8U-0001fR-HB
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:55:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pcn8T-0007Gi-2D
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:55:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678971311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aTJVF+GZUkvnJhZ0IQYcCXCbWQ8v2RBDbWX2eq4omRA=;
 b=bTrFeiF8UvrPvG41c99e04Fj3vg644LKzUF1tnNVoKo4Mb+Z3a2Z5hbvl1AgsI3WRUJODo
 57/jsKA8IvqwAHIY7AJnD0RGdhtJQ8952x+iTuD7Gz0o/OQf6RCUepvqiwWq6A0NIPPYos
 wJsgyxaimnp7p3N4DkzTuiz78iPaeE8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-o-tmksU4M0-dZYFNW4VVVQ-1; Thu, 16 Mar 2023 08:55:05 -0400
X-MC-Unique: o-tmksU4M0-dZYFNW4VVVQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 bn9-20020a056000060900b002cfe8493fe6so252379wrb.4
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 05:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678971304;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aTJVF+GZUkvnJhZ0IQYcCXCbWQ8v2RBDbWX2eq4omRA=;
 b=c5G1cwS2ucBwGLOMeaa8VCsokUucxTVHHzXCrjaj9Mg1aAewYZm3zfwM/82IcoeyK9
 VyJyPvK7udtE/T5mAYwvnCohST8yOEp72NrhsxW/lfrww4cmAx3XHTEWYUIdlRZaYT2G
 xZdFepp1fjGG09VTniiV6KfsjFchrDcFW5IpZ9WFjCGXVrsPBlyvYVDz1zxp+MGHA+rU
 f+bCQdY7aDp4Ly/+UPia+9nZIDvq1tXCu2mDo2j8scQkmkQ988EiTI3Df9TuFGBX4rlt
 3OcERVLCp6obfg48VDw0GPO2X8/0X2x8XWPsM+DhE2DuK5/FA0mEEDaikPhV0J+ztUEf
 5qWw==
X-Gm-Message-State: AO0yUKXifOMXmtB9GHXDPZG+Odt3C16WFLBnO4ifpkA/pH1+qLUNQ5wV
 mI4t3qGCtcZyHfaoHxz3/P8+JmRPMKaqHOFJB/hJl4/iUkeHS9RLvgTv/E5r6ugPwY9DQ9CNcBs
 GZRQSPY8BehH+Ejc=
X-Received: by 2002:a05:600c:450c:b0:3ea:e7e7:95d9 with SMTP id
 t12-20020a05600c450c00b003eae7e795d9mr22516413wmo.32.1678971303956; 
 Thu, 16 Mar 2023 05:55:03 -0700 (PDT)
X-Google-Smtp-Source: AK7set+Xyf7hZYdH+laZX2+ALDVriT7uKywUEHBxlVO5RK6Y2KGdBeBMxit4ieGhJcpLNt9Sla0Gwg==
X-Received: by 2002:a05:600c:450c:b0:3ea:e7e7:95d9 with SMTP id
 t12-20020a05600c450c00b003eae7e795d9mr22516396wmo.32.1678971303663; 
 Thu, 16 Mar 2023 05:55:03 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 u22-20020a05600c00d600b003e203681b26sm4990854wmm.29.2023.03.16.05.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 05:55:02 -0700 (PDT)
Message-ID: <ee614c0a-28d3-5101-b51a-33d8acfa7862@redhat.com>
Date: Thu, 16 Mar 2023 13:55:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for 8.0 v2] memory: Prevent recursive memory access
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
References: <20230316122430.10529-1-akihiko.odaki@daynix.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230316122430.10529-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

On 3/16/23 13:24, Akihiko Odaki wrote:
> +static const Object **accessed_region_owners;
> +static size_t accessed_region_owners_capacity;
> +static size_t accessed_region_owners_num;
> +

These should be thread-local variables at least, because the memory 
access API is thread-safe.

Paolo


