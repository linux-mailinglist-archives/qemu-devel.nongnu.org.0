Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26524AE0CB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 19:29:31 +0100 (CET)
Received: from localhost ([::1]:42240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHVF4-0003FI-Vm
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 13:29:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nHUlS-0006CC-VR
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 12:58:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nHUlP-0001rL-CA
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 12:58:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644343130;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NuH5kqxLETFpqxM6uvLgSEAHb6uIZXUFvcgBpunesls=;
 b=D8QdT4aDeJ+9rE58mEQKjz8ENps/hLI6QvIs4XYV+hS/dn/NNkNKINEcOwOeTHy3pPhG/g
 DODCdEnyghk0Xe87kefsJ1tgrkg30tj0ZXE8YwdK+56jUsvp9BhFwedlyEnXzgkOg6bCeB
 dFNDw92XHqBKVFGTJaKco+RSmKH8HGA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-vY2gVVkONsSkdx0w2auzQQ-1; Tue, 08 Feb 2022 12:58:44 -0500
X-MC-Unique: vY2gVVkONsSkdx0w2auzQQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 k3-20020adfb343000000b001e463e6af20so35260wrd.8
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 09:58:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=NuH5kqxLETFpqxM6uvLgSEAHb6uIZXUFvcgBpunesls=;
 b=IK7TN5aF9tq1fYSS/NIIxeI9sVeGdVhqwBTngpTmIAIlHGohKmCAEprTjvXHjFkwUI
 VyaS+ZXXNS9OeI1HI3VShfRKgOpvJB2R+rOnA42anyI/R89+3l60BNu8cJr9Xz+PPlqc
 7KpnNk/L7LU6s2Hk/KUrlPD4QjGLdSlnUDIaAPBECXWIt3MV4LdwPT2EUF4ZUDbdnNgV
 x3TO9KwaS1lMfhgeMsvtO3KFrWGxn2M8PEqjvAHMJrPJo5vgcplyuaCs9o7pduLjGekE
 /BTvtZMuMpos6x5FFawgrBd37B1+YCG4O7H0Rp/JdQOuTivf5jqzLhM8S5Orncfn6jwC
 ohTQ==
X-Gm-Message-State: AOAM532e+dCQonbZaEhGmhuULn26UVRiyZEn5EbGcJ8t2lU6H1Mn4VAS
 +T62nIGFWAJ2rQHEtyfWdZkgwx3+I7yGczk2x4Ehst9apW+qWMYW+dY0C0R1Fywrmx0G4DCiozI
 mdUKavlYfgfn7wow=
X-Received: by 2002:a5d:62c1:: with SMTP id o1mr4437134wrv.262.1644343122765; 
 Tue, 08 Feb 2022 09:58:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjLgKFxvyTto1RPEwqsDt7zV+2c4w+Id9AXqv/rUNbdO+tcSU3Ad3BstvZ3lCxVi8+wu60MA==
X-Received: by 2002:a5d:62c1:: with SMTP id o1mr4437117wrv.262.1644343122547; 
 Tue, 08 Feb 2022 09:58:42 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id bg26sm2902268wmb.48.2022.02.08.09.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 09:58:42 -0800 (PST)
Subject: Re: [PATCH v4 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
To: Stefan Berger <stefanb@linux.ibm.com>, eric.auger.pro@gmail.com,
 stefanb@linux.vnet.ibm.com, qemu-devel@nongnu.org, alex.williamson@redhat.com
References: <20220208133842.112017-1-eric.auger@redhat.com>
 <20220208133842.112017-2-eric.auger@redhat.com>
 <310e3bd1-0ca8-ddc6-4500-dd1bea589fad@linux.ibm.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <b39a5fd1-15a5-7461-0849-4b4478f1aef5@redhat.com>
Date: Tue, 8 Feb 2022 18:58:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <310e3bd1-0ca8-ddc6-4500-dd1bea589fad@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: quintela@redhat.com, cohuck@redhat.com, f4bug@amsat.org,
 dgilbert@redhat.com, imammedo@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On 2/8/22 6:16 PM, Stefan Berger wrote:
>
> On 2/8/22 08:38, Eric Auger wrote:
>> Representing the CRB cmd/response buffer as a standard
>> RAM region causes some trouble when the device is used
>> with VFIO. Indeed VFIO attempts to DMA_MAP this region
>> as usual RAM but this latter does not have a valid page
>> size alignment causing such an error report:
>> "vfio_listener_region_add received unaligned region".
>> To allow VFIO to detect that failing dma mapping
>> this region is not an issue, let's use a ram_device
>> memory region type instead.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Tested-by: Stefan Berger <stefanb@linux.ibm.com>
>> Acked-by: Stefan Berger <stefanb@linux.ibm.com>
>> [PMD: Keep tpm_crb.c in meson's softmmu_ss]
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>
>
> v4 doesn't build for me:
>
> ../hw/tpm/tpm_crb.c: In function ?tpm_crb_realize?:
> ../hw/tpm/tpm_crb.c:297:33: error: implicit declaration of function
> ?HOST_PAGE_ALIGN? [-Werror=implicit-function-declaration]
>   297 | HOST_PAGE_ALIGN(CRB_CTRL_CMD_SIZE));
>       |                                 ^~~~~~~~~~~~~~~
> ../hw/tpm/tpm_crb.c:297:33: error: nested extern declaration of
> ?HOST_PAGE_ALIGN? [-Werror=nested-externs]
> cc1: all warnings being treated as errors

Do you have
b269a70810a  exec/cpu: Make host pages variables / macros 'target
agnostic' in your tree?

Thanks

Eric
>
>
>


