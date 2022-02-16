Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5374B868E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 12:22:03 +0100 (CET)
Received: from localhost ([::1]:37120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKINm-0004a4-5n
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 06:22:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKIKS-0003b9-T1
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 06:18:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKIKQ-0007pf-8x
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 06:18:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645010312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nSEcn2G9eZcfO9aMYYUKHFod0b+Ly1yLWGxot+Q/PvQ=;
 b=caSlhgWSuAPnni/WK59C863jQ/nXmgY6CQDp+UfY4bOHVHH/BACWShrUvWLFVkveRL14+W
 JY7VzbnjKWOJuRKh5G2/x+j8v89NrvcX7n7f3Xtvplif2qkxUI0gtQjOYkDXAax8HA358y
 KZnzoc6K7zs8d90xuRnebeIyjBMuj3w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-Y_8PcIwANOiMD3TJtzi_Rg-1; Wed, 16 Feb 2022 06:18:31 -0500
X-MC-Unique: Y_8PcIwANOiMD3TJtzi_Rg-1
Received: by mail-wm1-f69.google.com with SMTP id
 d8-20020a05600c34c800b0037e3cd6225eso37106wmq.6
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 03:18:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nSEcn2G9eZcfO9aMYYUKHFod0b+Ly1yLWGxot+Q/PvQ=;
 b=zYL90cT6fV8GSIHF144uDyFCleURvcqCt7KG8Qw5v1kbEY0277IV86gptkn+y31J2q
 zG5RoMYa6Qwx9JERXh6Sl1FU/K4DvOqowA6IvpALzCjQeYbsnfNy+9B02qCKpKo21Nzl
 wxF/2KA61OUqdSxUbxtHdasqgTTbLtgD79PWrk03ulMDvTUXSZq6vqrdblZWfXKxd9o/
 2GL4Nn8GAwWjdq8j5nmhcPcJL7ZiGPA8Iog1Bc1qaGo6h5SdNI1duOlBF7J7Hf6HW/MW
 SLKuCQ6+T2Quj+T1wm7iTfjEqzbfIELVIBrWrDx1xJuBDyHw+V5JgflL+VjnfWc4asnW
 KWqQ==
X-Gm-Message-State: AOAM533HjZFMwkQVtnIXNNEF8mH2vjXSGynrMdbkw09UEVRs8GufrXk4
 Wk3Or4Lb3SamaMHDmaFIE2aGqLc5Ies3Msyaxri2dYcuXJXO6oeOoGc4Kb6C2YsmyqZv3AJshYD
 kYTLji/Q9bH69ZiE=
X-Received: by 2002:a5d:5302:0:b0:1e3:1af3:13c9 with SMTP id
 e2-20020a5d5302000000b001e31af313c9mr1954723wrv.128.1645010310376; 
 Wed, 16 Feb 2022 03:18:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6H6WPMjhHk7y7d73eNOwfKnHSTHuQ6oMseB1jireC+e2BhWzhhByv5k9J6IZl+ob11VZyiw==
X-Received: by 2002:a5d:5302:0:b0:1e3:1af3:13c9 with SMTP id
 e2-20020a5d5302000000b001e31af313c9mr1954708wrv.128.1645010310179; 
 Wed, 16 Feb 2022 03:18:30 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:600:4ff7:25c:5aad:2711?
 (p200300cbc70b06004ff7025c5aad2711.dip0.t-ipconnect.de.
 [2003:cb:c70b:600:4ff7:25c:5aad:2711])
 by smtp.gmail.com with ESMTPSA id o4sm14992533wrc.52.2022.02.16.03.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 03:18:29 -0800 (PST)
Message-ID: <8f264304-3c48-da34-42e3-30519cf0c3e3@redhat.com>
Date: Wed, 16 Feb 2022 12:18:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 1/3] s390x/tcg: Implement
 Miscellaneous-Instruction-Extensions Facility 3 for the s390x
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <25fcb9f9-4314-faca-a7e3-99fbbe0541d2@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <25fcb9f9-4314-faca-a7e3-99fbbe0541d2@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: thuth@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 farman@linux.ibm.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>       /* Really format SS_b, but we pack both lengths into one argument
> @@ -735,6 +753,9 @@
>   /* PACK UNICODE */
>       C(0xe100, PKU,     SS_f,  E2,  la1, a2, 0, 0, pku, 0)
>   +/* POPULATION COUNT */
> +    C(0xb9e1, POPCNT,  RRE,   PC,  0, r2_o, r1, 0, popcnt, nz64)

You actually need RRF_c instead of RRE.

Otherwise QEMU aborts when the guest executes POPCNT as RRE does not
include the m3 field.


-- 
Thanks,

David / dhildenb


