Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335C36D3E30
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 09:40:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjEmJ-0000qV-Hh; Mon, 03 Apr 2023 03:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pjEmF-0000q4-Oc
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:38:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pjEmD-0005rR-Lj
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:38:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680507531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lqtp0HvV4YDg61R88HjLwUgK6u+/vlNT2ltq3tMagyY=;
 b=QlQlj79CGc3zG0RjetmAqUgR37v0JRereO9h0XO9N9cRUv1Oif+Fo7WW3SoaOctCMcyrzg
 t8GawKsaOzpRF8PkgixNJVqNc2QJi0WlU0/b2lCw5PQ2LFatI7avGAgG2z42KZAreHq9ms
 b+zisP0JKr228Mo7ma9ZFjFawClOmec=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-thj3msMFNluS3b0w6qX_FA-1; Mon, 03 Apr 2023 03:38:50 -0400
X-MC-Unique: thj3msMFNluS3b0w6qX_FA-1
Received: by mail-wr1-f69.google.com with SMTP id
 o13-20020adfa10d000000b002d34203df59so2966859wro.9
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 00:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680507529;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lqtp0HvV4YDg61R88HjLwUgK6u+/vlNT2ltq3tMagyY=;
 b=fclNgYsa6fAm7rk9EgEawN/HaiPLcVJ4v1hvJQJ2v0SwkWpdUBJqurH9/glNRVN6At
 uKJZ+wUeHzFHRhBinjQ/dZnah5RzAbUVuM8RveC29f5NAEhYAIQZV9Q2u0yc0kVUzc5i
 tT6vFWE6jQ5Zu37N+wBG/dFcJmd+iQ7unSJsOi9Yl6Ik2+p3qSaHFq1iH+0Be7RJE2Po
 Fddi6BaITTnF94Jxf2OO3UFkVHeMmiq3BKYLVgGa0Q1y+M+jNOUbxCUHFmiL6gGKwbf/
 tsp3j0Tjz1S3V+DMG58qCAmPKd3t+xdYxK1OkhkQRKeWTvLbp4E4VkM9UjQb13KOKNvT
 ssoQ==
X-Gm-Message-State: AAQBX9d7RdMaTxHNz2bpelJAHTCqb/KEDlHitXpPO+ozDSAC8aV21HfD
 IsjWCL9BwoNE9ij2A9ZvHComoiosTtDRT53rIaMmYpieUSQaHdFOG2lvlH0NuLL5/jjE8jD3oPp
 TZEO1ThPXbuvxoUI=
X-Received: by 2002:a05:600c:a4e:b0:3ed:bfb4:ad9f with SMTP id
 c14-20020a05600c0a4e00b003edbfb4ad9fmr12239179wmq.2.1680507529460; 
 Mon, 03 Apr 2023 00:38:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350aKmvWO9IDgd37gOzXActpbUuLmeag3rP7UyGHWFTB5JAh4UiVmR9ojbqZJnzcGU4Kh6I+lIQ==
X-Received: by 2002:a05:600c:a4e:b0:3ed:bfb4:ad9f with SMTP id
 c14-20020a05600c0a4e00b003edbfb4ad9fmr12239166wmq.2.1680507529160; 
 Mon, 03 Apr 2023 00:38:49 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:5e00:8e78:71f3:6243:77f0?
 (p200300cbc7025e008e7871f3624377f0.dip0.t-ipconnect.de.
 [2003:cb:c702:5e00:8e78:71f3:6243:77f0])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c161500b003ef4cd057f5sm17651301wmn.4.2023.04.03.00.38.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 00:38:48 -0700 (PDT)
Message-ID: <733d9f6b-476c-a401-bc0b-e01fd2206a2a@redhat.com>
Date: Mon, 3 Apr 2023 09:38:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH v1 00/26] migration: File based migration with multifd
 and fixed-ram
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com, 
 dgilbert@redhat.com, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Juan Quintela <quintela@redhat.com>
References: <20230330180336.2791-1-farosas@suse.de>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230330180336.2791-1-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.37, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 30.03.23 20:03, Fabiano Rosas wrote:
> Hi folks,
> 
> I'm continuing the work done last year to add a new format of
> migration stream that can be used to migrate large guests to a single
> file in a performant way.
> 
> This is an early RFC with the previous code + my additions to support
> multifd and direct IO. Let me know what you think!
> 
> Here are the reference links for previous discussions:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01813.html
> https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg01338.html
> https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg05536.html
> 
> The series has 4 main parts:
> 
> 1) File migration: A new "file:" migration URI. So "file:mig" does the
>     same as "exec:cat > mig". Patches 1-4 implement this;
> 
> 2) Fixed-ram format: A new format for the migration stream. Puts guest
>     pages at their relative offsets in the migration file. This saves
>     space on the worst case of RAM utilization because every page has a
>     fixed offset in the migration file and (potentially) saves us time
>     because we could write pages independently in parallel. It also
>     gives alignment guarantees so we could use O_DIRECT. Patches 5-13
>     implement this;
> 
> With patches 1-13 these two^ can be used with:
> 
> (qemu) migrate_set_capability fixed-ram on
> (qemu) migrate[_incoming] file:mig

There are some use cases (especially virtio-mem, but also virtio-balloon 
with free-page-hinting) where we end up having very sparse guest RAM. We 
don't want to have such "memory without meaning" in the migration stream 
nor restore it on the destination.

Would that still be supported with the new format? For example, have a 
sparse VM savefile and remember which ranges actually contain reasonable 
data?

-- 
Thanks,

David / dhildenb


