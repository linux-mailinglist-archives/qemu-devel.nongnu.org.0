Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E54A68DB8E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:33:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPP1d-00014C-NZ; Tue, 07 Feb 2023 09:32:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPP1c-00012Q-9x
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:32:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPP1a-0007tS-Si
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:32:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675780365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yTUAgDGs7FNCZw9NILePMRE3OtpQtsqIo+qh5Z1toTc=;
 b=gGCWMwKpIOzhsPEvBYzKqijGolrqUpBsMcih9eBkKgCUirIuXxxvgzgXIOBNhS8ly+32wV
 /RIGjihd6rdqjBIh3nTssavdCufJwRmIr0hJjSE68iR5YxKPAEXiiPzUBrR52+nzDsfypc
 JgivMwJpkw/SC8zmXwaM42fXFKhiNnc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-110-YBAUwnCsNb2VeTsjfCsmSA-1; Tue, 07 Feb 2023 09:32:34 -0500
X-MC-Unique: YBAUwnCsNb2VeTsjfCsmSA-1
Received: by mail-qv1-f69.google.com with SMTP id
 cs17-20020ad44c51000000b0056c02b4bf4aso2033525qvb.4
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:32:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yTUAgDGs7FNCZw9NILePMRE3OtpQtsqIo+qh5Z1toTc=;
 b=sWbJDy+SaId/9fD2XkBLUAVeQqmU7byQ9O3LoiKewbSVuYDjBEg2+kun9f5FP1JmNd
 diniGISIWU89WqUQFpSk9SNOc6WinfPcGt+1T9vnPzJ2BUHmwJOx1w6zb4PrFYEYj5FN
 f4HPSKHnYGd2iV1gBuHEPUdBpFFuoOl76eX2HRL/xuwvK/ru5Est4ot1hPz4CKrUZuQq
 +15ErXUihvQlW2HBpCU+NRIZbQVoC5UwZEwXw7n049c3s1G4enK/vck/3v4NhmQChni6
 zKYxenV0uYFTANImIKrzsSObKjeFKfOfh146Yr/xypDSEETKE2D4hP9VJK7UWCmK3Td3
 QoBg==
X-Gm-Message-State: AO0yUKXGR2KssKn4/Tr2or8sTOG7hsJjjFKPcklGcXO6KRUmSXJfvNca
 NxaYW6OnIXIDRDtn8cXHfmUxffpAIS7bptlvPjoJfH4IJ0w2/8V8ZYvFRxuwKAC9bGPhzCJvOwT
 wBdSDUV8IG1TtLG8=
X-Received: by 2002:a05:6214:240b:b0:56b:f7e0:7fbf with SMTP id
 fv11-20020a056214240b00b0056bf7e07fbfmr5573119qvb.24.1675780348288; 
 Tue, 07 Feb 2023 06:32:28 -0800 (PST)
X-Google-Smtp-Source: AK7set+WyNlCoH7Dgp7NX2+NzDQlVUoSLgIvVTCr+2hQMr65LRxa4tHOF2gcu1tF6jZ834e/Z2fs8A==
X-Received: by 2002:a05:6214:240b:b0:56b:f7e0:7fbf with SMTP id
 fv11-20020a056214240b00b0056bf7e07fbfmr5573051qvb.24.1675780347543; 
 Tue, 07 Feb 2023 06:32:27 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-120.web.vodafone.de.
 [109.43.176.120]) by smtp.gmail.com with ESMTPSA id
 b19-20020a05620a271300b0071a291f0a4asm9679242qkp.27.2023.02.07.06.32.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 06:32:26 -0800 (PST)
Message-ID: <16128071-e551-f304-4824-2819d86678dd@redhat.com>
Date: Tue, 7 Feb 2023 15:32:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 10/12] tests/qemu-iotests: Require virtio-scsi-pci
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-11-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230206150416.4604-11-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 06/02/2023 16.04, Fabiano Rosas wrote:
> Check that virtio-scsi-pci is present in the QEMU build before running
> the tests.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qemu-iotests/186 | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qemu-iotests/186 b/tests/qemu-iotests/186
> index 072e54e62b..eaf13c7a33 100755
> --- a/tests/qemu-iotests/186
> +++ b/tests/qemu-iotests/186
> @@ -40,6 +40,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
>   _supported_fmt qcow2
>   _supported_proto file fuse
>   _require_drivers null-co
> +_require_devices virtio-scsi-pci
>   
>   if [ "$QEMU_DEFAULT_MACHINE" != "pc" ]; then
>       _notrun "Requires a PC machine"

Reviewed-by: Thomas Huth <thuth@redhat.com>


