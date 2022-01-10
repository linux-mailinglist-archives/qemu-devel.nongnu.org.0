Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9143248942C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 09:50:25 +0100 (CET)
Received: from localhost ([::1]:38270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6qNd-00050z-Qm
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 03:50:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qKN-0002HQ-Ee
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:46:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qKM-0006bI-4E
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:46:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641804413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=brAsbluwuLpTWy55HCEEd7ZvCJhSeHqS0YDtuAvPfn0=;
 b=UNqGyNmqfp0fKp6ZkC/y4NvFl9avFhj9/MYBh/MNpVr1OazuUR3z05qvKNPan6CAFLhps7
 LwWAVi3DH7K4j8Bh39FpfzpneXrsorGBGzZCcWBcgWC1yzX6zUUGbuyZdvAxYJH1ycNGCh
 UFyY5aUPchK03eCuIa30rWIKoDR3h+0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-uaXjybKXN76kb_oDztI1uA-1; Mon, 10 Jan 2022 03:46:50 -0500
X-MC-Unique: uaXjybKXN76kb_oDztI1uA-1
Received: by mail-ed1-f72.google.com with SMTP id
 o20-20020a056402439400b003f83cf1e472so9547095edc.18
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 00:46:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=brAsbluwuLpTWy55HCEEd7ZvCJhSeHqS0YDtuAvPfn0=;
 b=ZRTpl/VMUH1rIHw+aZ31arkf+8eSKadyW1QQI8A2PckBW5/LtaVosQaeZEXUgHWoyX
 L26enRCF2w/L7jaD8esh/OBGA6uN0v9m/07/VVtf2cj9R0susNMt+CVorF8cf4gRx8XF
 qqUWpfIGPaGaapPADH8JsHByT2n85g7rrkki6cauP8LzI+hIX5CUzY07GhdefFIdwbq/
 PSDw3mAHW3KPpbff7z+2AGRTFSoBcX26WWPtj8hkbDC/PK2diC2Du9OEuG2vn0Qpj9uf
 WXKrm8yhSZ6BNi0/lc7QfIAb/cfNJqRCv4iE8bAHe4rJJkmoIMzmBY7rv8zWVVBad4ha
 NzcA==
X-Gm-Message-State: AOAM5336Qc6cIH579iOhffVhkZSVL6Y6jne5kWwGwswpghXmvWhGt2f7
 KUult9FiC+gWIsObsgeURvrHz7e5yQFBPJne41oLyxqYrzjL+LOeiOb8yrYmrPIcOJYx8a88yiI
 vZ4S2oKj7gK5wzCs=
X-Received: by 2002:a17:907:6da0:: with SMTP id
 sb32mr4878442ejc.455.1641804409078; 
 Mon, 10 Jan 2022 00:46:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNeFgt33VeLnMH6SIHIvy6NJuZL2vmoXCCTB4iUoBQNsx266NL5pBWBQWip7qvz9YBB6Ad6A==
X-Received: by 2002:a17:907:6da0:: with SMTP id
 sb32mr4878425ejc.455.1641804408881; 
 Mon, 10 Jan 2022 00:46:48 -0800 (PST)
Received: from ?IPV6:2003:cb:c701:cf00:ac25:f2e3:db05:65c3?
 (p200300cbc701cf00ac25f2e3db0565c3.dip0.t-ipconnect.de.
 [2003:cb:c701:cf00:ac25:f2e3:db05:65c3])
 by smtp.gmail.com with ESMTPSA id j4sm3225558edk.64.2022.01.10.00.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 00:46:48 -0800 (PST)
Message-ID: <ebd01465-66ba-ca16-19cb-05bdf785f74b@redhat.com>
Date: Mon, 10 Jan 2022 09:46:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 6/9] hw/scsi: Rename SCSIRequest::resid as 'residual'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220104085431.2122999-1-f4bug@amsat.org>
 <20220104085431.2122999-7-f4bug@amsat.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220104085431.2122999-7-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.01.22 09:54, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> The 'resid' field is slightly confusing and could be
> interpreted as some ID. Rename it as 'residual' which
> is clearer to review. No logical change.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


