Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27FA334068
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 15:33:56 +0100 (CET)
Received: from localhost ([::1]:49142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJzuN-0008Dl-CD
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 09:33:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJzsk-0007i4-ST
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 09:32:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJzsc-0001Wk-Ly
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 09:32:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615386722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/TdZ3NfJ2Zm5V4X4oVByKT6PJdA7UB7z3MDvSFqIfOg=;
 b=NVUXoySUnbBtRqfQdjvNc41s578t6qJYbDmFNCBTS74Ds+K3BP5fGZgnlYkoL0H/YNRUkz
 sRR78EUOK4Y92faPomzB6k50h4WM9psMUbLkgJC/UmxYwawSSE8I0RNSZjr1t3t3IXkSM5
 E3vIAkW31KAVJe6FJZWpDkwvMDB/RGo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-_5JNFb_tP1W-XfA72R-__w-1; Wed, 10 Mar 2021 09:32:01 -0500
X-MC-Unique: _5JNFb_tP1W-XfA72R-__w-1
Received: by mail-ej1-f69.google.com with SMTP id li22so2777752ejb.18
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 06:32:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/TdZ3NfJ2Zm5V4X4oVByKT6PJdA7UB7z3MDvSFqIfOg=;
 b=uUhDsdtqBlZAO3CsiCpmDPeQ5aVsM1mVLj8/SKhn1lU5/sF4TMdFrLSnmLu1OuEksW
 GtQdOnZlfwbopeusjoIrdgVKAuXXkts4u9f21LJqTJKkdCMYMAgn4pxOJDmkNIZTDx29
 pOaZVjQFbqj3Ziz25MgF05oIgTViW2KTNq60hD+K68hicH935ogbF1X2SCGifQEpkbsf
 5/cgbRfIrVMfXVOYeiiFA3UoSzh3lXUOCcbaUq1+J+Fx72dgv0gN91p9wUV3HV8IBq1H
 zXzICBXe4vkCM6MFEQTemT1NZ0xJ+NPim5C1WtrfUW2wLCDB5loGpRETwniV0kEIwSLn
 gOjg==
X-Gm-Message-State: AOAM531QampbNlJEbsA53dSCm3mK2J7YySQZQSSMFNGHPMMYAfW4Uckb
 z+ml5UBaTstf+9H7cWyuSjLJaq3FUchj4CTyoKrRijA510NBwSuPR7PuymJAH/o9HlpcCIL7q0B
 LijNW3IxQCI1cIzs=
X-Received: by 2002:aa7:de8b:: with SMTP id j11mr3590764edv.363.1615386719907; 
 Wed, 10 Mar 2021 06:31:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxB9Q2MZCDMkP8GNzUNKTCSD0BtynKtoX/x1fvJwKR1dmw/24gPPsGjSHKmAwmDCrSFBkeRA==
X-Received: by 2002:aa7:de8b:: with SMTP id j11mr3590720edv.363.1615386719574; 
 Wed, 10 Mar 2021 06:31:59 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u15sm11278072eds.6.2021.03.10.06.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 06:31:58 -0800 (PST)
Subject: Re: [PATCH v3 00/30] qapi/qom: QAPIfy --object and object-add
To: Peter Krempa <pkrempa@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <YEjWQnWKbr5teciB@angien.pipo.sk>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <90130a0c-7f96-f344-b185-b790c5d6b78a@redhat.com>
Date: Wed, 10 Mar 2021 15:31:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YEjWQnWKbr5teciB@angien.pipo.sk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com,
 Markus Armbruster <armbru@redhat.com>, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/21 15:22, Peter Krempa wrote:
> I've stumbled upon a regression with this patchset applied:
> 
> error: internal error: process exited while connecting to monitor: qemu-system-x86_64: -object memory-backend-ram,id=pc.ram,size=1048576000,host-nodes=0,policy=bind: Invalid parameter type for 'host-nodes', expected: array

This is the magic conversion of "string containing a list of integers" 
to "list of integers".

The relevant code is in qapi/string-input-visitor.c, but I'm not sure 
where to stick it in the keyval-based parsing flow (i.e. 
qobject_input_visitor_new_keyval).  Markus, any ideas?


