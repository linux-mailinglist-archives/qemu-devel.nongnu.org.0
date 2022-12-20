Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109E1652372
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 16:07:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7eD6-0003Yt-6W; Tue, 20 Dec 2022 10:07:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p7eCe-0003TW-9w
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:07:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p7eCa-0006iq-Qq
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671548803;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZkeBeZ5dCmuIr+f/xS1gTAoPsYFPx/RrfJvY51c7NI=;
 b=M45fp1bZWrc077BFEjAh3W7OjP1ZqgOMQ1obgtwx7owkA1+B2vPmM1RmtOvWmSn8QyWvMi
 to6kY344yZGqgTNY3GDFRvoJKKAkE2f/wv/hqMIT6d2IDT41DumEmMDOI2EAryx9FUhPpr
 HQrBgE/W34IwEHyBXU+fDZGoveT6ffE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-266-yyZkmKeCNZuP4vSpv5gEJA-1; Tue, 20 Dec 2022 10:06:42 -0500
X-MC-Unique: yyZkmKeCNZuP4vSpv5gEJA-1
Received: by mail-wr1-f72.google.com with SMTP id
 g14-20020adfa48e000000b00241f94bcd54so2273797wrb.23
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 07:06:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UZkeBeZ5dCmuIr+f/xS1gTAoPsYFPx/RrfJvY51c7NI=;
 b=o9who3xc4ndXKBohgSpBiQMDwAMmttoPyFk9th7rXfqVhMNVPrGTNmXQZQDHQf9DWK
 YUHi+cwLvemhn3Mexn6CAUIIqkIL2WhmQspxHvUQEaqXA7IpH454d51nBHSoeywnj3Bd
 uxpg4TEgx+2QDDsJ6fCfJ6G7UqrbpEJHZmffgcxkX3r21wMC0UG470ebnCUXUCpy/jPD
 ZYRj6kk4XERw1K25TExQ9YkCsfUNhLC7Uhe1N6PYpk6tURBW1uIDSybsHiJD68TPgwPm
 H3cTwgafMclTmJUPgGWEGCMgrJFSnfikWXR8VXfdhRsLsXbaQAvH2g4hqYDGNk+Mg495
 2rww==
X-Gm-Message-State: AFqh2kpuSWNvqjWoFYSRSbiwUCY2OIRB5843Aqs4yWvPLg2ZnqU3xFnt
 k8reb4XpeFvXaW7OnLJ9LcrZ+iD75a6/s3DDSvVZK0NaIe5m1xL3/qHCxSN0pXBd6rbeJi/5Udl
 PaaZ0jCVwZaqwpY4=
X-Received: by 2002:a05:600c:1e0e:b0:3d3:5506:1bac with SMTP id
 ay14-20020a05600c1e0e00b003d355061bacmr1873325wmb.30.1671548801145; 
 Tue, 20 Dec 2022 07:06:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXscCQsCq2IxXHKc5u9f/sem+2Z/ZbdtsYCdhYzwjc9NbkKJ4Pfv85Oy4WPt2NFC+g/fjoL//A==
X-Received: by 2002:a05:600c:1e0e:b0:3d3:5506:1bac with SMTP id
 ay14-20020a05600c1e0e00b003d355061bacmr1873310wmb.30.1671548800953; 
 Tue, 20 Dec 2022 07:06:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 8-20020a05600c028800b003c6d21a19a0sm15567370wmk.29.2022.12.20.07.06.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 07:06:40 -0800 (PST)
Message-ID: <dc81b94f-03f4-52af-bb99-5a50e82551d9@redhat.com>
Date: Tue, 20 Dec 2022 16:06:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH for 8.0 0/2] virtio-iommu: Fix Replay
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 jean-philippe@linaro.org, bharat.bhushan@nxp.com, alex.williamson@redhat.com
References: <20221207133646.635760-1-eric.auger@redhat.com>
 <Y5EmmjKBBnjSlvd+@x1n> <a281b12b-d905-4c96-72ce-6e22e41d0cfb@redhat.com>
 <Y5H7fu2ikdXU8b3i@x1n> <20221220095908-mutt-send-email-mst@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221220095908-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.161, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Michael, Peter,
On 12/20/22 15:59, Michael S. Tsirkin wrote:
> On Thu, Dec 08, 2022 at 09:58:06AM -0500, Peter Xu wrote:
>> On Thu, Dec 08, 2022 at 08:48:09AM +0100, Eric Auger wrote:
>>> Hi Peter,
>> Hi, Eric,
>>
>>> On 12/8/22 00:49, Peter Xu wrote:
>>>> Hi, Eric,
>>>>
>>>> On Wed, Dec 07, 2022 at 02:36:44PM +0100, Eric Auger wrote:
>>>>> When assigning VFIO devices protected by a virtio-iommu we need to replay
>>>>> the mappings when adding a new IOMMU MR and when attaching a device to
>>>>> a domain. While we do a "remap" we currently fail to first unmap the
>>>>> existing IOVA mapping and just map the new one. With some device/group
>>>>> topology this can lead to errors in VFIO when trying to DMA_MAP IOVA
>>>>> ranges onto existing ones.
>>>> I'm not sure whether virtio-iommu+vfio will suffer from DMA races like when
>>>> we were working on the vt-d replay for vfio.  The issue is whether DMA can
>>>> happen right after UNMAP but before MAP of the same page if the page was
>>>> always mapped.
>>> I don't think it can race because a mutex is hold while doing the
>>> virtio_iommu_replay(), and each time a virtio cmd is handled (attach,
>>> map, unmap), see virtio_iommu_handle_command.
>>> So I think it is safe.
>> It's not the race in the code, it's the race between modifying host IOMMU
>> pgtable with DMA happening in parallel.  The bug triggered with DMA_MAP
>> returning -EEXIST means there's existing mapping.
>>
>> If during replay there's mapped ranges and the ranges are prone to DMA,
>> then IIUC it can happen.
>>
>> I didn't really check specifically for virtio-iommu and I mostly forget the
>> details, just to raise this up.  It's possible for some reason it just
>> can't trigger.  VT-d definitely can, in which case we'll see DMA errors on
>> the host from the assigned device when the DMA triggers during the "unmap
>> and map" window.
>>
>> Thanks,
> Eric any resolution on this?

Sorry for the delay. Not yet unfortunately. following Peter's reply I
now understand the race issue and it makes total sense but I need to
study it further.

Eric


>
>> -- 
>> Peter Xu


