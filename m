Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8754D64C7
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 16:39:05 +0100 (CET)
Received: from localhost ([::1]:53992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nShM8-0001hF-2w
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 10:39:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nShKy-0000vB-5u
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 10:37:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nShKu-0007F3-5l
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 10:37:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647013067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4L8zjOE8R1y/kIuhg4Hq71F2pEFtqgwj8lfSEGL55o8=;
 b=bKB7ERWMilNyAoFfyI3ehhzYPlhDbfWI5X7dc65hEXmtdZMFO/9myxsPTb/qFVrK+YcMAP
 OyrXL4GcVkpRcxrc1shJsSYf5idPaf3+qZBhBtz9G0IYq0MC73Y8yZQVVXCPQOwVxu0FRp
 GCJJCGuVEVtQ8jjepXxf8WSDwZ2nLuc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-j-pFS001OcqCD8-ZdMMd6A-1; Fri, 11 Mar 2022 10:37:45 -0500
X-MC-Unique: j-pFS001OcqCD8-ZdMMd6A-1
Received: by mail-wm1-f69.google.com with SMTP id
 v67-20020a1cac46000000b00383e71bb26fso3127440wme.1
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 07:37:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4L8zjOE8R1y/kIuhg4Hq71F2pEFtqgwj8lfSEGL55o8=;
 b=XmgCp6y2i1eJX57Rs9S2jnc/ZVk3pfEFun0RwFRNZ2xVChEQrhpP6qz1gLbsc0Iolc
 ctxA3lk7ogbAHWj/kVSjAk0hcIwWU+ja2RyEmP9WYSwITP0HJ5yY3orJhMguuhJohL05
 YcEX9WEGHQffDw+S83J8tk6il35oTFQ96BiqXgeI07ca+vdLIdJGBTq2yJrNhC+OECsV
 CP71uyUz61YaMdPul8E4Twq9epl2Q50vCFboElaByGJ/BWyfBdLqAlWsD4XYQqRcIXKQ
 AzcIPaVaObVtka+VlgxK3Kf4jQwHRTdtR+LIK4IRFkcWHtJ7RRHpjNEfb7jOz88wdXOx
 CRDQ==
X-Gm-Message-State: AOAM531KOtgUYVKw7RZ95+gcm7EbaAtrgFfBIxi53B2b/fhOWgir1X/Z
 F9vbamc/sTSJ4ikZ7eN5or3sVFGOWpd+VP1OkGbzJYH5thaow0QvlPzjCsZouHLhi2HQOJep0Yp
 KKg5Z0JcvTD4fuSk=
X-Received: by 2002:adf:eb86:0:b0:1e6:8c92:af6b with SMTP id
 t6-20020adfeb86000000b001e68c92af6bmr7678752wrn.116.1647013064126; 
 Fri, 11 Mar 2022 07:37:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyXKAadP2Aad8zqJkfrKXZZhlGV7a+wPJqNlOxmrg9iXqlZ7vKGnto24wt4grc3VY6jllsWw==
X-Received: by 2002:adf:eb86:0:b0:1e6:8c92:af6b with SMTP id
 t6-20020adfeb86000000b001e68c92af6bmr7678740wrn.116.1647013063903; 
 Fri, 11 Mar 2022 07:37:43 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:8200:163d:7a08:6e61:87a5?
 (p200300cbc7078200163d7a086e6187a5.dip0.t-ipconnect.de.
 [2003:cb:c707:8200:163d:7a08:6e61:87a5])
 by smtp.gmail.com with ESMTPSA id
 bj7-20020a0560001e0700b001f1d7822865sm6694926wrb.43.2022.03.11.07.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 07:37:43 -0800 (PST)
Message-ID: <c501a55a-ca01-8750-3bbd-473d142923b0@redhat.com>
Date: Fri, 11 Mar 2022 16:37:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 1/7] target/s390x: vxeh2: vector convert short/32b
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220307020327.3003-1-dmiller423@gmail.com>
 <20220307020327.3003-2-dmiller423@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220307020327.3003-2-dmiller423@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 farman@linux.ibm.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.03.22 03:03, David Miller wrote:
> Signed-off-by: David Miller <dmiller423@gmail.com>
> ---
>  target/s390x/helper.h               |  4 +++
>  target/s390x/tcg/translate_vx.c.inc | 44 ++++++++++++++++++++++++++---
>  target/s390x/tcg/vec_fpu_helper.c   | 31 ++++++++++++++++++++
>  3 files changed, 75 insertions(+), 4 deletions(-)
> 

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


