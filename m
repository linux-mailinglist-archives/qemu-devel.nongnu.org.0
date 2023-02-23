Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6E06A0D48
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:47:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDoU-0008AR-Sy; Thu, 23 Feb 2023 10:47:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pVDoO-00085C-Ix
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:47:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pVDoN-0001ku-8T
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:47:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677167229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tYLCYYtsIhdZX432tdnc+tDaO6zGMKvCjdCtF2+h8mY=;
 b=id7aM0XvDNLyd1lSl7HWEceoR6wGPo0xLFzLeDjKe+Ct6N5MUEo3Z8p2O66Ie77FUZJDEX
 h9UnVTpLW7FQkXRGD5jI5UGYyFWryYKxx4Qhd2ADW8Orrt5L3LacKfQd6BHenpGGEXBQQT
 Re5D2K9W89jquZLDVjXv/lm0vYU2UBQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-wP5FI6yTNxq8k18z9tOYlA-1; Thu, 23 Feb 2023 10:47:08 -0500
X-MC-Unique: wP5FI6yTNxq8k18z9tOYlA-1
Received: by mail-qk1-f200.google.com with SMTP id
 z23-20020a376517000000b00731b7a45b7fso5873283qkb.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:47:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677167228;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tYLCYYtsIhdZX432tdnc+tDaO6zGMKvCjdCtF2+h8mY=;
 b=akBGrckXBo9yPBhkHDPzEHwV8/fE9l1Nxbd7B9DEryWfYibPeWiilj5mnZRIxGkPOx
 beT6MP/E9J9jBBBRodK51dKjXhuGGc6KuchWpVkEvgECKHaS7gvLdyGZICy3tD2RHXQ5
 JHwr9u3CyMb8l8VgB8CT5o0kIw/3LDRA2Wz6HyOVlZAVYBDv+PmxTtRKasKOQDGCXh1Z
 XwssGXN7awnZ8MWvqgJg44WVzJpZ7Ke7qBp1VCjyVz9d0NnPKeNunoZ1S98wZ8A6QPGr
 r6JSYphHMEzbemgGTGABHKVq3eGxg/EcgANwB8LwUL0g+pWrDLDWPwvzQa56rLtZeXNs
 DD/A==
X-Gm-Message-State: AO0yUKVdVjbFpM6/MnGVP8eNMIlF9hWjXVofc03J+gSuBxudrYfSMDkp
 EXscUIed4pdJbxoz6Kni+db0+A1DDqYYPwMY+NMLmmvdddOsh0jGZanIdtzeluYmwRaoV14bYE9
 YqRcJLpKdS5M/qLw=
X-Received: by 2002:ac8:5cd4:0:b0:3bb:75c7:9326 with SMTP id
 s20-20020ac85cd4000000b003bb75c79326mr24523242qta.0.1677167227823; 
 Thu, 23 Feb 2023 07:47:07 -0800 (PST)
X-Google-Smtp-Source: AK7set8KfrK/ADYXplFqtJKdnVJYctD1A/Zju8/9UXIX2/FxZ6GSP80kYJRFkA6knHj39JmO4rnf8g==
X-Received: by 2002:ac8:5cd4:0:b0:3bb:75c7:9326 with SMTP id
 s20-20020ac85cd4000000b003bb75c79326mr24523210qta.0.1677167227533; 
 Thu, 23 Feb 2023 07:47:07 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 o13-20020ac8024d000000b003b8238114d9sm3896647qtg.12.2023.02.23.07.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 07:47:06 -0800 (PST)
Date: Thu, 23 Feb 2023 10:47:05 -0500
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com,
 viktor@daynix.com, lvivier@redhat.com
Subject: Re: [PATCH V2 0/5] Fix UNMAP notifier for intel-iommu
Message-ID: <Y/eKecGZp2H3jmIK@x1n>
References: <20230223065924.42503-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230223065924.42503-1-jasowang@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 23, 2023 at 02:59:19PM +0800, Jason Wang wrote:
> Hi All:
> 
> According to ATS, device should work if ATS is disabled. This is not
> correctly implemented in the current intel-iommu since it doesn't
> handle the UNMAP notifier correctly. This breaks the vhost-net +
> vIOMMU without dt.
> 
> The root casue is that the when there's a device IOTLB miss (note that
> it's not specific to PCI so it can work without ATS), Qemu doesn't
> build the IOVA tree, so when guest start an IOTLB invalidation, Qemu
> won't trigger the UNMAP notifier.
> 
> Fixing this by triggering UNMAP notifier in those cases.

Maybe someday we should start merging different places where we used the
same IOMMU_NOTIFIER_UNMAP event and also taking care of truncation of
notifier ranges within memory.c, but that can definitely be done later.

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks, Jason!

-- 
Peter Xu


