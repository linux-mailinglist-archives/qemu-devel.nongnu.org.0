Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 253954BB8AF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 12:51:18 +0100 (CET)
Received: from localhost ([::1]:60814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL1nB-0005hH-6q
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 06:51:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1nL1cO-0005Cg-5C
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 06:40:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1nL1cK-0007Bt-Fm
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 06:40:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645184403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u6oPFlqZUUf9Ilo74KAr7+ULBewI1p3jLa6moAZI9Uo=;
 b=hP0JHvEENjhETLfFHdjCW+/L0WghpfOa7+4Ry9k1XaDLYKtA4Z4U5+tNa3nGA4IGPycmgt
 CmkNqW6NkvzZIbwG/1VpOGGU0O6aM9CjJZvaUkYPuiXzn0bRdShjQ3nIQSsbA2BcD2FDM7
 MPTDnwiv9ErUTrVTyZeILvcYatFwM8U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-dSQpJkSvN2mWAoKmQJRijQ-1; Fri, 18 Feb 2022 06:39:47 -0500
X-MC-Unique: dSQpJkSvN2mWAoKmQJRijQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 y8-20020adfc7c8000000b001e755c08b91so3449808wrg.15
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 03:39:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u6oPFlqZUUf9Ilo74KAr7+ULBewI1p3jLa6moAZI9Uo=;
 b=Tz+w5isL4BrL7+CIsNwK2l9y7Y4ZLsWRu+B0y3/vNfVfO8Yvvh/2WRxcixwCIbv9la
 b6M/29uWL5XoxBSyp7OKzRrsfBcOMWZkarUz5jAtvxkgtiL0qDPpwUz/T3ed+KU3TJsb
 nFUCFHR25QZ28IkPU1+K4knZwcmUJyHgCqtkOh02erRZjZbhwUr8DQ8QmmMU3RROwkop
 fj3kqDBPstcovGE8ser6wssyfYQMOPpLZNGOmnn6v1UpDXj79xLzMH84NThyrDVER/zy
 RVUzBZtoVRazzex12UV4A3B4pQGjDvyFbJZCViqOmdJQnVO3MELfRHVuQ0RkyrDB3KxM
 XWNw==
X-Gm-Message-State: AOAM530GKLVhsr1Zi8l45A0spz0Ot16Yi3unPPgf5Y4PxMn1rf7A+Wi0
 cES3bbaaDYq7U3YoyEvkiaZLyQ0YVrrBEsyKvM+f2iC1T0M5B8/cLsreKuxKUQRlMZnjuxsrc2+
 IOIAGz+qQ454eZRI=
X-Received: by 2002:a5d:6d85:0:b0:1e2:f9f9:ab97 with SMTP id
 l5-20020a5d6d85000000b001e2f9f9ab97mr5649468wrs.469.1645184386297; 
 Fri, 18 Feb 2022 03:39:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGK/FyLZfrD5HIi49gEBBhO4Pe3orBzg+nmlIsf6SrirbQns/xRDOAPKkpjRc47sEkm+NhlA==
X-Received: by 2002:a5d:6d85:0:b0:1e2:f9f9:ab97 with SMTP id
 l5-20020a5d6d85000000b001e2f9f9ab97mr5649455wrs.469.1645184386090; 
 Fri, 18 Feb 2022 03:39:46 -0800 (PST)
Received: from [192.168.0.5] (ip4-95-82-160-17.cust.nbox.cz. [95.82.160.17])
 by smtp.gmail.com with ESMTPSA id p16sm4322038wmq.18.2022.02.18.03.39.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 03:39:45 -0800 (PST)
Message-ID: <bf97384a-2244-c997-ba75-e3680d576401@redhat.com>
Date: Fri, 18 Feb 2022 12:39:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
To: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 kvm <kvm@vger.kernel.org>, "libvir-list@redhat.com" <libvir-list@redhat.com>
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <f7dc638d-0de1-baa8-d883-fd8435ae13f2@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <f7dc638d-0de1-baa8-d883-fd8435ae13f2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/22 18:52, Paolo Bonzini wrote:
> On 1/28/22 16:47, Stefan Hajnoczi wrote:
>> Dear QEMU, KVM, and rust-vmm communities,
>> QEMU will apply for Google Summer of Code 2022
>> (https://summerofcode.withgoogle.com/) and has been accepted into
>> Outreachy May-August 2022 (https://www.outreachy.org/). You can now
>> submit internship project ideas for QEMU, KVM, and rust-vmm!
>>
>> If you have experience contributing to QEMU, KVM, or rust-vmm you can
>> be a mentor. It's a great way to give back and you get to work with
>> people who are just starting out in open source.
>>
>> Please reply to this email by February 21st with your project ideas.
> 
> I would like to co-mentor one or more projects about adding more
> statistics to Mark Kanda's newly-born introspectable statistics
> subsystem in QEMU
> (https://patchew.org/QEMU/20220215150433.2310711-1-mark.kanda@oracle.com/),
> for example integrating "info blockstats"; and/or, to add matching
> functionality to libvirt.
> 
> However, I will only be available for co-mentoring unfortunately.

I'm happy to offer my helping hand in this. I mean the libvirt part,
since I am a libvirt developer.

I believe this will be listed in QEMU's ideas list, right?

Michal


