Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679534B86A0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 12:28:58 +0100 (CET)
Received: from localhost ([::1]:44904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKIUT-0001kM-HK
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 06:28:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKIQH-00085q-6B
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 06:24:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKIQF-0000O0-Ln
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 06:24:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645010675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i0gBli2GOHDrvWX2CiFGw7ZTSBznlK+xVEnB8LRtdcs=;
 b=BZ0MFUrCBwFPFC5LLUyjfQnjhHU8TDx47Ulg9YTD6evlHclG2kZJkxBq3QPgWLsdPkrDOm
 NEf/8Q9SDSF0IIn1eXh5UXl8ZBBht0wExsfA2ENThfTJVBx7IMaRXgScTMIMSbsCbWX9yv
 vfvBm9hoGQFTMtuZKtaQpplh8JFAFhc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-tWiaKbVgPJ-0d0prz5d4Og-1; Wed, 16 Feb 2022 06:24:34 -0500
X-MC-Unique: tWiaKbVgPJ-0d0prz5d4Og-1
Received: by mail-wr1-f72.google.com with SMTP id
 v17-20020adf8b51000000b001e336bf3be7so980135wra.1
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 03:24:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i0gBli2GOHDrvWX2CiFGw7ZTSBznlK+xVEnB8LRtdcs=;
 b=Mk43hJEUZulhoE4UH6M6h6ef9VhczSgflFxT5n8v2tmeptPhd0X1XmTX9KSb/NMzfu
 vyicWZ8Nj+BE9wo0D6IlwOsFYCJ+HRyJDBtz4Ho503DthADHPv8gap4nXP562pFPl5hY
 Ki6yNUgN0Kw5+3GqvnZcYEo7pOXycOwjKg4RHeeG7ta2XVn5bm2OmGOUKyWaoixfuSUi
 55qZ8cIHpajdtX2wLjbD+4z469gHO3HPfNZmtoo99/OQlk+iKwL37BVWKubmEkOVxh04
 4VS7FWIwuo05lqZy42Bnkg69Sq7z2Y32lnyPCpjBE6EelUAfcbmK7aKwU7WDHUf7rDkA
 dmvw==
X-Gm-Message-State: AOAM531FGqRHNTMBiUg1zjj48279QepbjZGOavWdmqxzdbTsh1D1D4wU
 kQ/rh1kJlwZpCzE4XMvRD5kUzEA7Ump+FOABYAwhdyhMUO6/l2AzZt/c1ZQrzIkFU933erBWedO
 tcOyE1PaCVHD2UMc=
X-Received: by 2002:a5d:5701:0:b0:1e4:ab98:74c5 with SMTP id
 a1-20020a5d5701000000b001e4ab9874c5mr1888620wrv.704.1645010672971; 
 Wed, 16 Feb 2022 03:24:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcICFE3xxhVvVB9ndieLMJOoC6urrB47+IXHlte+BdbnR4dxTNF6+tSLsZOdmPsdTrdxmolQ==
X-Received: by 2002:a5d:5701:0:b0:1e4:ab98:74c5 with SMTP id
 a1-20020a5d5701000000b001e4ab9874c5mr1888601wrv.704.1645010672770; 
 Wed, 16 Feb 2022 03:24:32 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id p7sm10965566wrr.95.2022.02.16.03.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 03:24:32 -0800 (PST)
Message-ID: <db583712-cd6e-d67d-ad98-989a9867499a@redhat.com>
Date: Wed, 16 Feb 2022 12:24:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] x86: Switch to q35 as the default machine type
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20220215162537.605030-1-dgilbert@redhat.com>
 <20220215162537.605030-4-dgilbert@redhat.com> <YgvtLmoJcv+ZSW1S@redhat.com>
 <20220216105808.77kqhmsagz3ej74h@sirius.home.kraxel.org>
 <YgzZhHKSAFYTYFDc@work-vm>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YgzZhHKSAFYTYFDc@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>, mst@redhat.com,
 quintela@redhat.com, qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/2022 12.01, Dr. David Alan Gilbert wrote:
> * Gerd Hoffmann (kraxel@redhat.com) wrote:
>>    Hi,
>>   
>>> Given the semantic differences from 'i440fx', changing the default
>>> machine type has effects that are equivalent to breaking command
>>> line syntax compatibility, which is something we've always tried
>>> to avoid.
>>
>> And if we are fine breaking backward compatibility I'd rather *not* pick
>> a default, effectively making -M $something mandatory, similar to arm.
> 
> Oh, that's probably easy to do;  what are other peoples thoughts on
> that?

I agree with Gerd. Getting rid of a default machine on x86 is likely better 
than silently changing it to q35. But I'd maybe say that this should go 
through the deprecation process first?

  Thomas


