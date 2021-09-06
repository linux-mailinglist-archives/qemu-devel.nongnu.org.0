Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C5E401D5E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 17:02:32 +0200 (CEST)
Received: from localhost ([::1]:44612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNG8l-00045Q-87
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 11:02:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNG77-0003DA-Fz
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:00:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNG75-0000NA-SQ
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:00:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630940446;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i/atWmPceuYv1i0bGChw5lVr1CuUMcznVL0/Pkg/Vgw=;
 b=Pe4bEZ2O3/IcDJ/N03kvFowvwVMuaFKK4y6f3mUbQzVG/f+EiboUHvu+Y0/j7Xz3CBPaEP
 RZEkWrgTjVhZ0x+sBJrYt4CVrfv4OrX85GaCshPFlYuPZRqTDFMGJd4XpE5uCBSahBrGjk
 +fdq8QHtI/Enxpi/b8RvzN5b4ckUzJk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-PcoTJY7OM5SVKsDF2jMt_A-1; Mon, 06 Sep 2021 11:00:44 -0400
X-MC-Unique: PcoTJY7OM5SVKsDF2jMt_A-1
Received: by mail-wr1-f69.google.com with SMTP id
 i16-20020adfded0000000b001572ebd528eso1258461wrn.19
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 08:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=i/atWmPceuYv1i0bGChw5lVr1CuUMcznVL0/Pkg/Vgw=;
 b=eKHr7ioROGuVWtuUeUXFqZHd/GI0UfiYg6GQnTGa6LaWILaqw+520JcQ23RC0O4mm3
 zkAzj8pyNPyU/OHIWTVHUpPfdE7zrSq41phqxliII3XgWf/tEsfOGUBlm28aPb7eZ526
 5CmMdvxC+xeuedLDnfuTK2uFfr1Bla77B0puDkp2dYrJVSLPYJnWRsRJc/d0kKZT6Qc+
 zdo2QRZQ/dqt6cZEWLu0JcGcLEY2Tn3Ywu1nmSKMJCnnyrKnUgdWsZpuxqtYsfLhW6n1
 h6AP3v/uohktKRUwdGR7RSGOlEPvp8y43cGVBapWUPjOXi/YQ2aM7yhVSZhGyKClWDT3
 WQlA==
X-Gm-Message-State: AOAM53148knPaJBIX7SZwtyAR7FD4/pkd5/XEKLLSMhQrDZX5sOBgrGv
 AG1xZ04IgYAr/D/JD36bIpkB+fTwdughwaXd1EhmYmKsE4M5QXaMml6yA4Blyj4+5ob57fBBdY7
 bS66la+mW5BT6BxQ=
X-Received: by 2002:adf:b745:: with SMTP id n5mr14082545wre.338.1630940443684; 
 Mon, 06 Sep 2021 08:00:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwytSgGDk8VgSEkHxbpRiF347Y2XnVpmFCLpYZ0/7KYyUgE7CRR8lOhen0QFuboK2SkniE+jA==
X-Received: by 2002:adf:b745:: with SMTP id n5mr14082530wre.338.1630940443524; 
 Mon, 06 Sep 2021 08:00:43 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id f17sm7449981wmf.4.2021.09.06.08.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 08:00:42 -0700 (PDT)
Subject: Re: [PATCH v2 8/8] docs: Add '-device virtio-iommu' entry
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
 <20210903143208.2434284-9-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <10687d9b-5b54-fab6-b62b-3f8aab88086c@redhat.com>
Date: Mon, 6 Sep 2021 17:00:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210903143208.2434284-9-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 9/3/21 4:32 PM, Jean-Philippe Brucker wrote:
> Document the virtio-iommu device for qemu-system-x86_64. In particular
> note the lack of interrupt remapping, which may be an important
> limitation on x86.
>
> Suggested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  qemu-options.hx | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 83aa59a920..9a1906a748 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -976,6 +976,9 @@ SRST
>      Please also refer to the wiki page for general scenarios of VT-d
>      emulation in QEMU: https://wiki.qemu.org/Features/VT-d.
>  
> +``-device virtio-iommu``
> +    Enable a paravirtual IOMMU, that manages DMA isolation and remapping
> +    for all PCI devices, but does not support interrupt remapping.
maybe you should also document which machines do support the
virtio-iommu (as done for intel-iommu). By the way intel-iommu only is
supported on q35. Is it the same for the virtio-iommu. I think we should
restrict the virtio-iommu to q35 too

Thanks

Eric
>  ERST
>  
>  DEF("name", HAS_ARG, QEMU_OPTION_name,


