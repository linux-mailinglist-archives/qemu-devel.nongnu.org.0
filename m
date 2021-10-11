Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC8B42876B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 09:06:17 +0200 (CEST)
Received: from localhost ([::1]:33182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZpO3-0000UH-RV
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 03:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZpMN-00080y-1B
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 03:04:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZpMK-0005dR-0X
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 03:04:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633935866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v5pOd99/BXZKzzbkjnR4NvRSdxAOWl5zl1h4mXewW3M=;
 b=KJVpvyofcQUsSw4nduZAim5xMw7oize+y8CmtBZPNPElUegVitOAbGD2zCz9khqJG6xoYw
 8FzN2sVQRCuveMORe6j5kxpyeMjXc7Kk2puVm4KhtCBFaepkj+CkF/qtd6CfCCGnla03DF
 kSrATiDSu82Fg8FUwumBdSJSDyT1tew=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-o_7PaJHMOPKZ02vqJaW4gA-1; Mon, 11 Oct 2021 03:04:21 -0400
X-MC-Unique: o_7PaJHMOPKZ02vqJaW4gA-1
Received: by mail-wr1-f72.google.com with SMTP id
 s18-20020adfbc12000000b00160b2d4d5ebso12545901wrg.7
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 00:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=v5pOd99/BXZKzzbkjnR4NvRSdxAOWl5zl1h4mXewW3M=;
 b=s5CvtZ4141OfYi1RTVHh8QxBPBO1+41FEpWYsZsMO6pOBUPu8SUcJSEeW7Jt7+CxJv
 53EwVaJ1p5d3EUV2nWB37w+PpoRRyLkT//xN9IzqShWXc9gQj0JeWhCENpqdrk/T1v16
 9FBrzYmSzaIoY6iLg2oegThhZcXbg0L35x3Y/ZTEPTuMDPTV9aAmHWMt6hVkKaI04Ybt
 VhDgylzWPA/sty5r2JBdNIgm3CfjfQo9xQVsgNlEpq1xgwLoMzwDJH8t4E+IbAaOpdwE
 qfmJR+pvMreQ0c+cOReTXjPbyB9kvfz0PcfpILPDYeadlGU/e2ERsKl5gkijwZkTG4xk
 uHOw==
X-Gm-Message-State: AOAM531jYCE/YBb07lstfIfnLVlLXcNEniJKRZKQYYAIB6mbd08TTVK0
 Fuoivhi2JyNEoTDtvSW2JZz/rzNdfCW+wA0VFU6aPCH26+tl+Rvh92K0rTi3q+AiJe+9gRB9OLc
 qWpAsfw6plVt/zzQ=
X-Received: by 2002:a05:6000:1042:: with SMTP id
 c2mr16118390wrx.272.1633935860383; 
 Mon, 11 Oct 2021 00:04:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzn72xIb63lhP8+Db2RBnLwwtr1/dkqH9IQSt+sKZW7kORPeUzg4DrFGBo4F88za4AoYbz+CA==
X-Received: by 2002:a05:6000:1042:: with SMTP id
 c2mr16118359wrx.272.1633935860152; 
 Mon, 11 Oct 2021 00:04:20 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64ba.dip0.t-ipconnect.de. [91.12.100.186])
 by smtp.gmail.com with ESMTPSA id b15sm7088374wrr.90.2021.10.11.00.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 00:04:19 -0700 (PDT)
Subject: Re: [RFC PATCH v1 1/2] s390x: sigp: Force Set Architecture to return
 Invalid Parameter
To: Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>
References: <20211008203811.1980478-1-farman@linux.ibm.com>
 <20211008203811.1980478-2-farman@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <47d83d1b-1f8d-1d07-9625-2d2b410c2f47@redhat.com>
Date: Mon, 11 Oct 2021 09:04:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211008203811.1980478-2-farman@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.10.21 22:38, Eric Farman wrote:
> According to the Principles of Operation, the SIGP Set Architecture
> order will return Incorrect State if some CPUs are not stopped, but
> only if the CZAM facility is not present. If it is, the order will
> return Invalid Parameter because the architecture mode cannot be
> changed.
> 
> Since CZAM always exists when S390_FEAT_ZARCH exists, which in turn
> exists for every defined CPU model, we can simplify this code.
> 
> Fixes: 075e52b81664 ("s390x/cpumodel: we are always in zarchitecture mode")
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Reviewed-by: Janosch Frank <frankja@linux.ibm.com>

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


