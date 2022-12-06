Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A3F64447C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 14:25:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Xvf-0006Jq-9H; Tue, 06 Dec 2022 08:24:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2Xvb-0006J2-Gf
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 08:24:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2Xva-0002ee-49
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 08:24:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670333045;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EJISXn/GvjgppRhGdASgIVZB9rd155DGVkIsZA7oqms=;
 b=QeyVc08Jo/QOiutMmvpBjk5RgWT3KFVGv59RvpvTzQr/qEUYpUyHPdK6xvNBj1h1Scbzih
 eN65p8i7HzTj9cc8Qp6bon55/KpGjmqdWwNowhbnnf55C0AInzefrRC13FN9AdS0nBi2I5
 vaCcdDJWboYz0ffsf81BdUTc0QnShlo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-24YjLQpoP26k1pIW0PKIfA-1; Tue, 06 Dec 2022 08:24:03 -0500
X-MC-Unique: 24YjLQpoP26k1pIW0PKIfA-1
Received: by mail-wr1-f72.google.com with SMTP id
 g14-20020adfa48e000000b00241f94bcd54so3244281wrb.23
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 05:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EJISXn/GvjgppRhGdASgIVZB9rd155DGVkIsZA7oqms=;
 b=PeI8xiMJEEKUrB7yz9K0dd6HZR2uwQypcyGovgebiUOxmvVa4p5/kYFwoI6Vu/AxYi
 vFFtW+8J8+pfSeidiiljVD/tWTphb3z4o+M7p8vw7VaF8xkUBRQx7s9mwlVMhFx0dBpR
 rmMpbI8d2Ha6TTvu9wOKHTJbYy6uYUcqLkGy8O42rOmEFLWZCIH5p6DgXcogj4oYhW+m
 b0hjpyd/bLVU3eqvfmWHUG5exo6ipFFwoxcZDSAi17L/spDs7Gocl98hqk9SZhr+dI9X
 tEoZoperkEOF5VWpW59eAcgk1xM/LWiJqiBcrBJbjNLltarSrchJ4pC1p/SgoyZh+hI4
 RixA==
X-Gm-Message-State: ANoB5plPBTDfCvNHL8+863StDRFD9ehG5zDRWdOn0jxjZWsslrsYTfyY
 fkGsV2JeLtOu2kMzsnvKk07huUPwdoUtRXUopQN1QPCEBH9bZ6toubHo5XMVL2A03SuX7wASP7j
 uRlQX7e1yUQpHpCo=
X-Received: by 2002:a05:600c:3c91:b0:3cf:6f23:a3e3 with SMTP id
 bg17-20020a05600c3c9100b003cf6f23a3e3mr5072427wmb.1.1670333041964; 
 Tue, 06 Dec 2022 05:24:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6l6lSDdDKjgPStMoMtOvfg8JAhsHQXnwPZUR00xzq6fwMvoHvxR3J3jTKsvifd5Nb/3hMvRA==
X-Received: by 2002:a05:600c:3c91:b0:3cf:6f23:a3e3 with SMTP id
 bg17-20020a05600c3c9100b003cf6f23a3e3mr5072424wmb.1.1670333041677; 
 Tue, 06 Dec 2022 05:24:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfebc5000000b00241c6729c2bsm16616448wrn.26.2022.12.06.05.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 05:24:00 -0800 (PST)
Message-ID: <2f00b938-88a1-08fb-9b92-b55a35648240@redhat.com>
Date: Tue, 6 Dec 2022 14:23:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/3] intel-iommu: fail MAP notifier without caching mode
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com, peterx@redhat.com
Cc: qemu-devel@nongnu.org, viktor@daynix.com
References: <20221129081037.12099-1-jasowang@redhat.com>
 <20221129081037.12099-2-jasowang@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221129081037.12099-2-jasowang@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.27, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

Hi Jason,

On 11/29/22 09:10, Jason Wang wrote:
> Without caching mode, MAP notifier won't work correctly since guest
> won't send IOTLB update event when it establishes new mappings in the
> I/O page tables. Let's fail the IOMMU notifiers early instead of
> misbehaving silently.
>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/i386/intel_iommu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index a08ee85edf..9143376677 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -3186,6 +3186,13 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>                           "Snoop Control with vhost or VFIO is not supported");
>          return -ENOTSUP;
>      }
> +    if (!s->caching_mode && (new & IOMMU_NOTIFIER_MAP)) {
> +        error_setg_errno(errp, ENOTSUP,
> +                         "device %02x.%02x.%x requires caching mode",
> +                         pci_bus_num(vtd_as->bus), PCI_SLOT(vtd_as->devfn),
> +                         PCI_FUNC(vtd_as->devfn));
> +        return -ENOTSUP;
> +    }
>  
>      /* Update per-address-space notifier flags */
>      vtd_as->notifier_flags = new;


