Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E2A41C181
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:20:08 +0200 (CEST)
Received: from localhost ([::1]:58916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVVl0-0005Cq-VS
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mVVjk-0003yu-Tc
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:18:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mVVjh-0005PL-UI
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:18:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632907124;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S4Vzg/lQG/E/1TPkR1gAKaRWBkCUcowRuyd7xbArqzs=;
 b=B/6H4p0PnNZyiF6c6c8H7/Ft+j4nAdzyXr9+VQtu5BxuZCJDa9cOykRjn9I5rZqVelZsnm
 j1HZnCIlSOZJL+tA7Ds9RRGcT45+BME4OvtUUhbR8VN21zvUZweDIRrQBngA4wX9tET21M
 X1mjEcbrEXrRxyoX+v1KR41tQ9XC1QE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-6Vi0o-ArNe-5rMGM8R6YAg-1; Wed, 29 Sep 2021 05:18:43 -0400
X-MC-Unique: 6Vi0o-ArNe-5rMGM8R6YAg-1
Received: by mail-wm1-f71.google.com with SMTP id
 j21-20020a05600c1c1500b0030ccce95837so603633wms.3
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 02:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=S4Vzg/lQG/E/1TPkR1gAKaRWBkCUcowRuyd7xbArqzs=;
 b=R9KcAddAmyN+438uV9tRY0rG7u7KFcc164AhenzETYcjqMuDxMn75bVlm+jyUxVClr
 jWCLdCZPDAL3JazBND67pjreMboKDpRbGVu18sHXKFFtdunQfV8Ah5sPWYMguxrzaLAc
 PeDV68PT1+YvKKXli4OOg7jssddYy6dgcqJzu0mVSKehaibBcnHxWZLr1wCu9Bgjv5EF
 sgBC0gWZrlVJXMXCHMOYb2reZEidEMgbt1JUA8qFLlgF2pBhULV1g6jnDS6VqcALd1nd
 JbUypfRlCh4t4o5EHz/GalFUNWSxcwWiMmHZ1YxcKRkUbc2HvR8JBbLRIGn/WfTly+JP
 ElBg==
X-Gm-Message-State: AOAM531Q5ufQUDbFHZPIxJzjiXDH2NFhBZxY0jX9nbHLrj822nhj5hDH
 FTlFGfpqTIVxqzbYLkMwfDskCzrYkTHgV/Q5b/3XgBcFgl8Bl0VnNDM+xf+HKPR2J8gGRE9yb6D
 pwbESGak9HhsNh8o=
X-Received: by 2002:a5d:4571:: with SMTP id a17mr5379441wrc.290.1632907122210; 
 Wed, 29 Sep 2021 02:18:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzCSKdaJw33ZSjbzUJLavmcew6cEPRE1SVJTcx4QrrdQeDe3kETty0J7swQ/FQ5vtciC8kOg==
X-Received: by 2002:a5d:4571:: with SMTP id a17mr5379418wrc.290.1632907122026; 
 Wed, 29 Sep 2021 02:18:42 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id n14sm974344wmc.38.2021.09.29.02.18.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 02:18:41 -0700 (PDT)
Subject: Re: [PATCH 0/6] virtio-iommu: Add ACPI support
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
 <808699d8-d2cf-bd66-c53d-8ae8c2fdbb9b@redhat.com> <YSjo7hZ9ptMH9JSx@larix>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <0b61d1e3-095e-b830-e160-4f56dd5ff171@redhat.com>
Date: Wed, 29 Sep 2021 11:18:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YSjo7hZ9ptMH9JSx@larix>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.562,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jean,

On 8/27/21 3:30 PM, Jean-Philippe Brucker wrote:
> Hi Eric,
>
> On Tue, Aug 17, 2021 at 04:58:01PM +0200, Eric Auger wrote:
>> Hi Jean,
>>
>> On 8/10/21 10:45 AM, Jean-Philippe Brucker wrote:
>>> Allow instantiating a virtio-iommu device on ACPI systems by adding a
>>> Virtual I/O Translation table (VIOT). Enable x86 support for VIOT.
>> Don't you need your other patch
>> "virtio-iommu: Default to bypass during boot"?
>>
>> Without this latter, for me the guest fails to boot.
> Good point, I think I've been lucky during my testing. My bootloader and
> kernel are on virtio-blk-pci devices and as I wasn't explicitly enabling
> the "iommu_platform" parameter, they would bypass the IOMMU. When enabling
> the parameter, boot hangs since the IOMMU isn't enabled when the
> bootloader needs to fetch the kernel, and DMA faults. That parameter is
> specific to virtio devices. Using another storage for bootloader and
> kernel will result in failure to boot.
>
> I've been postponing the boot-bypass patch since it requires a
> specification change to be done right, but it's next on my list.
The boot-bypass feature seems a critical feature to overcome the current
v3 limitation. Are there big spec changes required? Maybe we shall work
on this in parallel of this series because, to me, it will delay the
integration of virtio-iommu in libvirt for instance.

Thanks

Eric
>
> Thanks,
> Jean
>


