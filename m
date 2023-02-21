Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA27569E1E0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 15:03:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUTET-0001Kk-UN; Tue, 21 Feb 2023 09:03:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUTER-0001KV-R7
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 09:02:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUTEN-0005I7-E0
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 09:02:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676988173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j93QK3n5wSKgj9X3TeDcdr4F7kUWSl+sg3vB9Jn4ijA=;
 b=EBrnYAQW2Boq9vrXUaiEF74fiW9Ck9i8J5SS5pVGnGkRCSaUl5jI0GR0OwPHcoEC/cySw4
 7oFRu/Mzz97SPToljFj+aToRQKr+rQ9D2EMhDM9nXCajR9OQdQ8Glh5Q+cBNlzk7TYh9yZ
 MWHch7ow3F3buj6brH5WuQCNrO/cxQE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-91-GXd_SHdENcaLCDnE_atccA-1; Tue, 21 Feb 2023 09:02:45 -0500
X-MC-Unique: GXd_SHdENcaLCDnE_atccA-1
Received: by mail-ed1-f70.google.com with SMTP id
 co14-20020a0564020c0e00b004aab4319cedso5628338edb.2
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 06:02:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j93QK3n5wSKgj9X3TeDcdr4F7kUWSl+sg3vB9Jn4ijA=;
 b=1ovTc/QTAXwjDnP3RWFjPTL6PiHBpI0aj/+9XTzGOLQr2Wgn7+6zYLNOuUSzQBLKr7
 9WWv4VuEzwKdB0/TFaJUHP7YR/cQEsrwwo/u8jQoqSrbqI3u6f8apsUHDZYyjt4k6PXn
 VqDKlXkCKcBT2aLOlF8uXpzQ6cD3XtJAFw14Yca+vaAYW1dMl6bDKpAEGXtu8Y/yyoAx
 fYCqMlqkYVsRD745TOyRuPtBlYLtMAkm42U3Jsonzy1UCbAx+xQiUQZe91OcZZNDjAAj
 uLuO2mrWV0EH/hPJRNDArj969lj+pDZCeaE0C1lxFS7+HCBmXUx5L7YKlsdL8t9tit4E
 vb8A==
X-Gm-Message-State: AO0yUKVsE2w/xj7zbQ6kF76/wteJx2PcT9TETwGDnfvlfAVcLlH2hFJm
 XqKkMBPQgAFY8SR/cJ5tEAAIzgUe5p4w/vlvZWBpMJ+6tkvdXJA99yOoDpTDCf6utEL4ifUlIWv
 jDmEPutrpbb3ZsIM=
X-Received: by 2002:a17:906:ecb2:b0:8b1:c5aa:4c8b with SMTP id
 qh18-20020a170906ecb200b008b1c5aa4c8bmr14159730ejb.77.1676988163843; 
 Tue, 21 Feb 2023 06:02:43 -0800 (PST)
X-Google-Smtp-Source: AK7set9ezDI8sxI9/58fMlLODgfT3lSNyFegnK0dnBFrtlJIlEEyQnbPGZiu2pQ2gMAkKPppeE9adA==
X-Received: by 2002:a17:906:ecb2:b0:8b1:c5aa:4c8b with SMTP id
 qh18-20020a170906ecb200b008b1c5aa4c8bmr14159714ejb.77.1676988163570; 
 Tue, 21 Feb 2023 06:02:43 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 zc18-20020a170906989200b008cae50b0115sm3488005ejb.87.2023.02.21.06.02.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 06:02:43 -0800 (PST)
Message-ID: <c465a44a-1ff6-5118-516c-56a8f99b9509@redhat.com>
Date: Tue, 21 Feb 2023 15:02:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20211108130934.59B48748F52@zero.eik.bme.hu>
 <b0787bca-8321-059e-d360-1e0a0af31228@redhat.com>
 <a7992420-e2e3-7859-b2de-f9aa88c94945@redhat.com>
 <d03380e9-b6a2-5998-cc72-6443cfdc46b5@eik.bme.hu>
 <d9fcba9d-c2c6-5be3-ce5f-baf5a116bbc4@eik.bme.hu>
 <20220119041842-mutt-send-email-mst@kernel.org>
 <20220222094021-mutt-send-email-mst@kernel.org>
 <f9f183c4-b0b8-22c6-57f9-1b6b20e8e5a5@eik.bme.hu>
 <20230220172659-mutt-send-email-mst@kernel.org>
 <f4e755b6-051e-103f-b8bc-2765d277633f@eik.bme.hu>
 <e3a19d91-b9ef-9352-8f60-35432fdf5d1e@redhat.com>
 <c2bdd618-5077-3b3f-12d0-974cf9757692@eik.bme.hu>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <c2bdd618-5077-3b3f-12d0-974cf9757692@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/21/23 13:48, BALATON Zoltan wrote:
> My patch works and don't see what else could it break.

I strongly suspect that your patch, while fixing access to one byte of 
the (2-byte) registers, breaks access to the other byte.

Thanks for the reproduction instructions, I'll take a look.

Paolo


