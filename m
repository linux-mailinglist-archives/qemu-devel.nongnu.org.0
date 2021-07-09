Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 265393C276B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:19:06 +0200 (CEST)
Received: from localhost ([::1]:47192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tDV-0000He-5Y
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m1t28-0003jf-W4
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:07:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m1t27-00088e-50
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:07:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625846837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bCv1N2Mg2+aOVW/aMiZ1OcatZGOEFoRKlzf0XlTfvUo=;
 b=ifaplWfTExEZHmXSIY0zy1+ignKz1UJfdw7y5uKQahoDF7FldrRoY3Lc3b99TKAfZ26HO8
 OX+FtHwJbAYS/8qyfCpVVh4P8NXpd8AwwL/7DxkgE4y/1wjdZle686wL3/LgATBxT77ih2
 wV6F1SmMeY6KATHRTIVc6fhpzHyScZs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-4bp3EYmXN0KUDDUqkMWmmA-1; Fri, 09 Jul 2021 12:07:16 -0400
X-MC-Unique: 4bp3EYmXN0KUDDUqkMWmmA-1
Received: by mail-ej1-f72.google.com with SMTP id
 q14-20020a1709066aceb029049fa6bee56fso3329506ejs.21
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bCv1N2Mg2+aOVW/aMiZ1OcatZGOEFoRKlzf0XlTfvUo=;
 b=icWoecQf1YWJHky4rDsP3rcq11BEuQ/Jw2YuSfKCNTpVDzdiolt1dLMfC5yJAl3RNR
 fgZR3qyeLGSZgY6alU01JrWvWJjSo/JRiBAXui5Y0DjiUA+dgC4uoDoZW1rg9VjyI2vA
 bIuRdbmz2FsJ8Gmy9oJ6VU6fcK7sXzIQdSs3MNlfU4zyz0SsmMec+NU+ctojqjwPKAXc
 7G4hUPNqy8Togfk1TUu/h1J36k4+/CZNXWSPbTgRSCMuXcWMh55dFyFJGbUGS3VQ0DfQ
 hpCRgkL1T8mcTTTWDspbr/XAE757Y2xnYXN3Yr5wqPNDu+PXKar9c2NqnP1VydyrL5xW
 8AVQ==
X-Gm-Message-State: AOAM531Qh9nm+eq+N9CTsktTNWLX+OLTZct396YoohFl19oWWBwpbVKe
 E9069a4GbEU4KXljqO34/TOYQJM2NBsa0SlYipkD/E7DnhEp1KlOBg/JgkFT9J6nX2TOJgrGbKC
 ciJuDE30sU7j4+ak=
X-Received: by 2002:a17:907:1b11:: with SMTP id
 mp17mr38785735ejc.1.1625846835500; 
 Fri, 09 Jul 2021 09:07:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxV/LYC1lRmFo+M4ptzCYF35QtYYfBIQjYRGucCTyvbQr+n3DObg+WGMEgb611XDcy9NoVBLA==
X-Received: by 2002:a17:907:1b11:: with SMTP id
 mp17mr38785715ejc.1.1625846835281; 
 Fri, 09 Jul 2021 09:07:15 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dd24sm2567849ejb.10.2021.07.09.09.07.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 09:07:14 -0700 (PDT)
Subject: Re: [PATCH v3 05/33] vl: Add sgx compound properties to expose SGX
 EPC sections to guest
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210709110955.73256-1-yang.zhong@intel.com>
 <20210709110955.73256-6-yang.zhong@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a14c4d43-f197-a25e-bf53-01489427c792@redhat.com>
Date: Fri, 9 Jul 2021 18:07:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709110955.73256-6-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: seanjc@google.com, kai.huang@intel.com, eblake@redhat.com,
 jarkko@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/07/21 13:09, Yang Zhong wrote:
> +    sgx_epc = g_malloc0(sizeof(*sgx_epc));
> +    pcms->sgx_epc = sgx_epc;
> +

No need to malloc this, it's small.

>   }
>   
> +##
> +# @SgxEPC:
> +#
> +# Sgx EPC cmdline information
> +#
> +# @id: device's ID
> +#
> +# @memdev: memory backend linked with device
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'SgxEPC',
> +  'data': { 'id': [ 'str' ],
> +            'memdev': [ 'str' ]
> +          }
> +}

Is the "id" needed at all?  If not, you can make the property just a 
string list.

If not, you should still make the property a list, and SgxEPC can be 
just the id/memdev pair.

Also please place the compound property in PCMachineState, not in 
MachineState.  You can call the field something else than sgx_epc to 
avoid conflicts with the SGXEPCState, for example sgx_epc_memdevs or 
sgx_epc_backends.  Later it can be moved to X86MachineState if needed, 
but in any case it should not be in common target-independent code.

Paolo


