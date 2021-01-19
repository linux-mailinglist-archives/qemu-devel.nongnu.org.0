Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1062FBD02
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:56:09 +0100 (CET)
Received: from localhost ([::1]:52196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1uIa-00019h-K3
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:56:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1uCb-0003YI-50
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:49:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1uCZ-0001fr-3c
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:49:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611074994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sA4ZZkN2xSKb85MJIOSiQ3ffKW2CbzVziKVAKDlIse8=;
 b=IGpW9XdVRCeX59EsSztN6FDoN/LfZ/hTty/nqQruio4meDMf+7V5q2UupDBM0UMmuy+NVd
 snNgiXyW5HXbH0yxGSCLqLrAz/RApeIZOH2aJ8Uzv1VzYdbYaENk5Uhz5CR+zvussbtHzX
 6617ngDzFjkmAE2S7JB90l97riW4T2A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-kDP0E5MjOuSnv_PCkajO4A-1; Tue, 19 Jan 2021 11:49:51 -0500
X-MC-Unique: kDP0E5MjOuSnv_PCkajO4A-1
Received: by mail-ed1-f72.google.com with SMTP id f4so3839178eds.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 08:49:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sA4ZZkN2xSKb85MJIOSiQ3ffKW2CbzVziKVAKDlIse8=;
 b=iws3pj6ytMyS7u8l1NcosNwMlX4onOBm0qiyGqH4hUjXlRTyvUV/JmnPRPgTzAJRN7
 C6mZmjRA2hhi54vHwTOMQJTabhYzMSzF11wTAOP35ekK/NWCpRUI5mWuaSP7U2wkLEim
 ZDKZdDRRSufKktXQCUe28lD38gm7giz756B54ugTkLMsHEbn31UXYb6WczmYZzuiwbxF
 BHwD0iagmM+fhsk0LwnfSsj9yu+SdYyCw8yU2mefOtyVzbvKCiyAH/JeaFa4ubpEe0cm
 jcria6h9sfLYURtrW4GHIrP9kR/rwffSxE6yr6eGQjV+w6evxThbcYVoi/7J7gNr8gND
 ENKg==
X-Gm-Message-State: AOAM531Ei4tJOVQuBTgcamjCRBzqPp7TAz426snYhXdgMaZ5Zj8QbZXW
 05MJf14ng+B9sVZdyC8A/epTNqHBJxyxHzoqX8LEUBlCb7/6lUU7eUYLRy8dKf9HhcCP4Uf+8e+
 t3heeBIjEnNFul5c=
X-Received: by 2002:a05:6402:1422:: with SMTP id
 c2mr4076501edx.280.1611074990818; 
 Tue, 19 Jan 2021 08:49:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyP2JEVftyssrO8XSYTcl+rlHelYQK8Jh0vUhLZldBHm+UOdgoJQL0eR1/iNul5nTyTTOQSCw==
X-Received: by 2002:a05:6402:1422:: with SMTP id
 c2mr4076487edx.280.1611074990654; 
 Tue, 19 Jan 2021 08:49:50 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id l17sm10995226ejn.122.2021.01.19.08.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 08:49:49 -0800 (PST)
Subject: Re: [RFC PATCH 0/2] hw/usb/dev-uas: Fix Clang 11
 -Wgnu-variable-sized-type-not-at-end error
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210118170308.282442-1-philmd@redhat.com>
 <20210119164121.7kbyqjfgmutjtnj3@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9da88053-565c-5282-2daa-75ef64133468@redhat.com>
Date: Tue, 19 Jan 2021 17:49:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119164121.7kbyqjfgmutjtnj3@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/21 5:41 PM, Gerd Hoffmann wrote:
> On Mon, Jan 18, 2021 at 06:03:06PM +0100, Philippe Mathieu-DaudÃ© wrote:
>> Another attempt to fix the following Clang 11 warning:
>>
>>   usb/dev-uas.c:157:31: error: field 'status' with variable sized type 'uas_i=
>> u' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-vari=
>> able-sized-type-not-at-end]
>>       uas_iu                    status;
>>                                 ^
>> If a guest send a packet with additional data, respond
>> with "Illegal Request - parameter not supported".
> 
> Why rfc?  looks good to me as-is ;)

Sorry I forgot to explain. RFC because I don't know enough SCSI
to be sure than the device returning sense_code_INVALID_PARAM_VALUE
on the bus is appropriate. This is the best fit I could find.

> 
> thanks,
>   Gerd
> 


