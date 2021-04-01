Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFA63516A3
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 18:11:56 +0200 (CEST)
Received: from localhost ([::1]:41814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRzvH-0004RR-Mo
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 12:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRztB-0002i7-86
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 12:09:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRzt8-0000Oi-P2
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 12:09:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617293380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xv+Pbo9BsDaxHEPqTaSp/17FWyhcUzyTO3hRFKXF7lA=;
 b=HqihTCxT7kX+vHuIyEYmpjVDU6LmBRYwTsqwL4vMotARixQ3EnjCRxXidhvpQEj26J7Qdb
 O5m9nSpVfdALmWKAG59rrPApaVaCgpZG25625YUU4H/3+VgixJ/o+Z/NAsE2qV5XP2e+HV
 2DtW5AA6BOLEuQbqdx7ho3HsR54YC+s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-CZngx_r3PXWBMBPMx6M_1w-1; Thu, 01 Apr 2021 12:09:38 -0400
X-MC-Unique: CZngx_r3PXWBMBPMx6M_1w-1
Received: by mail-ej1-f72.google.com with SMTP id k16so2425525ejg.9
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 09:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xv+Pbo9BsDaxHEPqTaSp/17FWyhcUzyTO3hRFKXF7lA=;
 b=OcBsRUMqxUHv7gDkcfijkIIlg6LVPBj6fCw/iKp/jV65GXuwNbR8RN+Il8FlKLBgAW
 MWzzKOWmFjV9AJsymuqiXcCnzqsY9tioj8FpU0Q5Dke0Nz6Pj6Gf/n9ZNV7pZDV8OqjU
 G9IkZeEbio4503bY3x3cLqlKnNPrjphlzbr1ooq7ZNV7JVatrTfZi/SXJsv68TwlEOFu
 JQR6XmGAv2FfHWYy/DFKo5Js6D+n49vLVlOhGeYsbzVo+f+VJwVW/IGkQImao61U1Eko
 GVnAtpZ38s+f6jNxhMFLobbeog6VKNXzo7LEmgdFbaGDCHwvI+9/UP68i/5HT/U3VcSK
 VdRQ==
X-Gm-Message-State: AOAM531jkAM7FZ5RjmRWxhDGMAo0v1+rTpBD0HsZ3maNMpEjJiutGo8q
 Z4Qds3Z3wyor6znEWssGYoV4bCipqIad0pLArVPgsscqQTBDQavcAY5IoqmdHp+Qyrw19yplGaj
 RJYlRLTwaaQpHtm8=
X-Received: by 2002:a17:907:2642:: with SMTP id
 ar2mr9862358ejc.145.1617293377248; 
 Thu, 01 Apr 2021 09:09:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6ppL5P4P36VnMm3WCMH3+54G3YlZIPmCnjq1u92MAzaaE8C+iDAmQ6kDVnaAmAvTAyAJtqQ==
X-Received: by 2002:a17:907:2642:: with SMTP id
 ar2mr9862335ejc.145.1617293377065; 
 Thu, 01 Apr 2021 09:09:37 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s20sm3805227edu.93.2021.04.01.09.09.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 09:09:36 -0700 (PDT)
Subject: Re: [PATCH 2/2] KVM: use KVM_{GET|SET}_SREGS2 when supported by kvm.
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20210401144545.1031704-1-mlevitsk@redhat.com>
 <20210401144545.1031704-3-mlevitsk@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d221fa13-8e3b-0666-ff15-8c86d4e08237@redhat.com>
Date: Thu, 1 Apr 2021 18:09:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210401144545.1031704-3-mlevitsk@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/04/21 16:45, Maxim Levitsky wrote:
> +
> +    for (i = 0; i < 4; i++) {
> +        sregs.pdptrs[i] = env->pdptrs[i];
> +    }
> +
> +    sregs.flags = 0;
> +    sregs.padding = 0;
> +
> +    return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_SREGS2, &sregs);
> +}
> +

This breaks when migrating from old to new kernel, because in that case 
the PDPTRs are not initialized.

Paolo


