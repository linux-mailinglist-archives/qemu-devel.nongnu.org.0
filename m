Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177B65A274A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 13:59:59 +0200 (CEST)
Received: from localhost ([::1]:49046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRY0D-0004QA-Rw
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 07:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRXfU-0006Ga-UZ
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 07:38:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRXfO-0001Vp-MF
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 07:38:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661513904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xfzmbacoxqKE0XQ+quufLBqCLUTMpC4fb5SruDScjPk=;
 b=eA/FM2+ctsJET4lARlE46YvBCWR71PNJv9nd33eDbZTuOl/7lXr3At2tYDGjFXcgkccBll
 UTJntSMh3txgaBIfXXVP7qEj9rdX0dUMyIRwc4z/heQLv14VDC49hoirNZtXlXQvssD+qa
 plQ1FZwfVtzbS6DJ2irAq4Dcc6VWuXg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-380-H3-eVEL1PvqTcpZJiX0nzA-1; Fri, 26 Aug 2022 07:38:23 -0400
X-MC-Unique: H3-eVEL1PvqTcpZJiX0nzA-1
Received: by mail-wm1-f71.google.com with SMTP id
 j22-20020a05600c485600b003a5e4420552so3939057wmo.8
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 04:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=xfzmbacoxqKE0XQ+quufLBqCLUTMpC4fb5SruDScjPk=;
 b=aU7/e3Yoce/eEI7fqkEzhu311Nm+PCp+uqX8gh5I6YCqU1y+kbQt+RhnQ6xzvJ4Ixj
 QWrd4Ld5dg3wuQQnqPqSCmQD1tiOjVYvWL1OxPOizPLv/HW4RLyXKYCjdUBJdxMMhof2
 M7mrclsPhqmcVgZs2g+m0usQ9ffE8Z3lLA84ybw83+MhGykEDxZc2jvgddXZo1ZQhsTb
 HmFciAmnwzFa+zlcGBai1QJ6ea3l/G7jp9Po6vEjX6mkZLfi159rCEJEvntaS01TMBr3
 tXM9hfpCdtzGYp5okNmbYj4azdKBcisk9NUVB4a7b2FczU1upUJL/k5R///FhKlbg7ee
 wo5A==
X-Gm-Message-State: ACgBeo0yeTAie6KUmL/oUGGq0Exbc8UrUs/CyUQjokFQd7np214SrG/5
 TZZczYMArav+hoyJvHzi3YEc584FBy5hGqjPMcZsatmbFDwfdrQRmqrKyNOxKk+6ykWmZ+NZ3Av
 E0oguxq1goGXq40o8IZlJKznM727muMIxX85fBz7voHLogpJvKG64QouXmdPEiPw=
X-Received: by 2002:a05:600c:2193:b0:3a5:346f:57d0 with SMTP id
 e19-20020a05600c219300b003a5346f57d0mr4945271wme.124.1661513902442; 
 Fri, 26 Aug 2022 04:38:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6zyYcot1peaBGFM/2yu9w56bTgDlaWx48rNClIMlzHA4Ip9VayeukK8EIlEOG+E5aAKpqZAw==
X-Received: by 2002:a05:600c:2193:b0:3a5:346f:57d0 with SMTP id
 e19-20020a05600c219300b003a5346f57d0mr4945250wme.124.1661513902078; 
 Fri, 26 Aug 2022 04:38:22 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-42.web.vodafone.de.
 [109.43.179.42]) by smtp.gmail.com with ESMTPSA id
 bv13-20020a0560001f0d00b0021e42e7c7dbsm1698172wrb.83.2022.08.26.04.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 04:38:21 -0700 (PDT)
Message-ID: <8ad9a3a7-ca42-c9f5-9005-e8f1ae7b3c4f@redhat.com>
Date: Fri, 26 Aug 2022 13:38:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 0/3] Fix hugepages with memfd on s390x and clean up
 related code
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Claudio Imbrenda <imbrenda@linux.ibm.com>
References: <20220810125720.3849835-1-thuth@redhat.com>
In-Reply-To: <20220810125720.3849835-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 10/08/2022 14.57, Thomas Huth wrote:
> The first patch fixes the problem that hugepages cannot be used via
> the "memory-backend-memfd" object on s390x. The second and third patch
> are some clean-ups that can be done after generalizing the code in the
> first patch.
> 
> v2:
>   - Use qemu_ram_pagesize(memdev->mr.ram_block) instead of adding
>     additional code for the memfd object
>   - Added the two clean-up patches on top to simplify the code
> 
> Thomas Huth (3):
>    backends/hostmem: Fix support of memory-backend-memfd in
>      qemu_maxrampagesize()
>    softmmu/physmem: Remove the ifdef __linux__  around the pagesize
>      functions
>    util/mmap-alloc: Remove qemu_mempath_getpagesize()
> 
>   include/qemu/mmap-alloc.h |  2 --
>   backends/hostmem.c        | 14 ++------------
>   softmmu/physmem.c         | 17 -----------------
>   util/mmap-alloc.c         | 31 -------------------------------
>   4 files changed, 2 insertions(+), 62 deletions(-)
> 

Thanks to David and Claudio for the reviews! FWIW, I'll take this through my 
s390x-next branch since it fixes a s390x-related problem:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas


