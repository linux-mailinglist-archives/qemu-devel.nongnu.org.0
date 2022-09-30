Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409865F0D9C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 16:34:40 +0200 (CEST)
Received: from localhost ([::1]:43352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeH66-0005gw-EI
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 10:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oeGuO-0002SA-RL
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:22:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oeGuK-00061A-Au
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:22:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664547746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JcuLWc6BfFOhOPcqOp9E0Xk4IHLCKSvmXMOrkUKJBzk=;
 b=LrYIz+eeWRonqVyqAlXpeS36QmD1/VoDtP4DjnMxlD8IybdpYqbUnqaF4MHOVkQhNLOvDU
 lEomVF1I2BWzpTyske2Ab11OJIyJNkHaB38HU8fWnXBAAyqljGJNPo+hccYD40c/UP7Cc7
 YyTRnZN4S39dQT63rr0qR6hluJsl/QQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-At8pDkswOOCAmmWiBtQ75g-1; Fri, 30 Sep 2022 10:22:24 -0400
X-MC-Unique: At8pDkswOOCAmmWiBtQ75g-1
Received: by mail-wr1-f70.google.com with SMTP id
 k6-20020adfc706000000b0022cc19d5dd2so1601126wrg.7
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 07:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=JcuLWc6BfFOhOPcqOp9E0Xk4IHLCKSvmXMOrkUKJBzk=;
 b=qGhs9YJljItcShfy9ZYc7soWKdII0oCI5n+g/t/kHwlNtZmiWRBazIkXkn7lbPldhV
 RWKqPAu1po1+MLT/5t4YJYW9+ln4mbhE0ROcFtZ0aSu0GcQFVKDCjhl008LtUQI+rHO1
 2luvZP8OKFp04ze1DnUK+vcyXI+JH0JAxl2uiirMtW9BB6n/+/q31p4gMK5jU3Kd70Ue
 O6V85PiRQV/HdsP3D2cL+MG+donuHeNRTJtfY4ECqyPDN36CJpXsv7UOl87REfg6DtLe
 t8i3GObGnRIHGVkH0+yjqpyuyaZ5UadhPR7mpmV5u1643rfDwj2EgVD3txG6lzvISzrz
 ItvA==
X-Gm-Message-State: ACrzQf1pXE3o7UGmbFsddIO/s+Y4tLerfaGLu5MN39DDsB+ECjS+R4vZ
 YRYXM6ibAx4LC90nRRso1S53xuXpiK928CBLgqpjy3nMS7uxPpEF3roFjr0/G1I5QZIjX3Mr+/X
 anhU1Sc3UhbSrlKE=
X-Received: by 2002:a05:600c:a195:b0:3b4:fc79:f778 with SMTP id
 id21-20020a05600ca19500b003b4fc79f778mr14200475wmb.177.1664547743512; 
 Fri, 30 Sep 2022 07:22:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4gtMzQpe/A9W1k7Wp5K1yl1fp+eqMLrTj3LEqkU4WuFvpDVMq6OG8BAZq9F6G4iGjg+aGmOg==
X-Received: by 2002:a05:600c:a195:b0:3b4:fc79:f778 with SMTP id
 id21-20020a05600ca19500b003b4fc79f778mr14200461wmb.177.1664547743252; 
 Fri, 30 Sep 2022 07:22:23 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70c:c00:48b:b68a:f9e0:ebce?
 (p200300cbc70c0c00048bb68af9e0ebce.dip0.t-ipconnect.de.
 [2003:cb:c70c:c00:48b:b68a:f9e0:ebce])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c2cd200b003a63a3b55c3sm7640985wmc.14.2022.09.30.07.22.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 07:22:22 -0700 (PDT)
Message-ID: <4f186b7a-79b6-8253-c886-e8b24310ab8a@redhat.com>
Date: Fri, 30 Sep 2022 16:22:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 0/5] pci-ids: virtio cleanup
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, peter.maydell@linaro.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220930135810.1892149-1-kraxel@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220930135810.1892149-1-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.583, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 30.09.22 15:58, Gerd Hoffmann wrote:
> Drop legacy ids for virtio 1.0 devices, they are not needed
> and will be overridden anyway by generic virtio pci code.
> 
> Improve modern virtio id documentation.
> 
> Gerd Hoffmann (5):
>    pci-ids: drop PCI_DEVICE_ID_VIRTIO_IOMMU
>    pci-ids: drop PCI_DEVICE_ID_VIRTIO_MEM

I remember that for some weird reason, this was required for Linux to 
actually make use of the device. I never figured out why -- maybe that 
changed.

-- 
Thanks,

David / dhildenb


