Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C82E3340CEB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 19:27:55 +0100 (CET)
Received: from localhost ([::1]:53030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMxNC-0001ZM-St
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 14:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMwqs-0002t0-80
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:54:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMwqq-0002Sc-8G
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:54:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616090067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b2W4/MjWk4Gmbs7nm3MR0IPcF5vlRYdWNQ3T4yVcCUI=;
 b=dmIKa775yRg8NMkBrGvTGxJREIATgPP4vc36TGEdBwHMNdWRxb/d9rHRoVddkQSGBcsArr
 5orXLN2zpZ18E1/l+0GdAhOKSuEOTaBMONz+/Ct9Tcj+wjmwQB80E1ER8JmLsUdVSxyNaE
 av/7P871QN41cjZUDnS9N5vbg+JAgrU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-fsT_xO-FNUuaU27PfGIB0w-1; Thu, 18 Mar 2021 13:54:25 -0400
X-MC-Unique: fsT_xO-FNUuaU27PfGIB0w-1
Received: by mail-wr1-f72.google.com with SMTP id r12so20500187wro.15
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 10:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b2W4/MjWk4Gmbs7nm3MR0IPcF5vlRYdWNQ3T4yVcCUI=;
 b=qHP+TTAdS03RGb3k2vSL1Vl8Ppf9JZ0XuBgEGTzwtAuhoN9bg5zv5DQFHJVNCvBdhl
 gSxsuRBEj2qaSnCDmz4Na/qlWU3VxNPdYGSd20hRSCdmjm3roq2JSiJeIFyaBCRHUnhL
 pHlNR0Cpr0ETvOZaxYpu91laUi+lfAyodZlEz41P235ZvgHqjCm9HqPwXP2SCQcazEuu
 SuOCzBLo5M+/w2DT+kbsAgTD6zl7ZCxCpou1HBXri3spYBgJNEDE9IwMj5EU8gaSQVBr
 UEUQcELom1T+wWCOYig37lvx19hVt9pzTIaLTCnbhd6IxBTHwxya7wdXgSCwCdp14GaK
 gbVA==
X-Gm-Message-State: AOAM532g7Cpi3kdCT7JCca0XxWOAvo4F/23/8eij6kj9OV2bldo6PSlh
 Qrya3atSsL7jwaoFnlD8Dsks7CbCd3Q+YdNTiI9elliS+3ARjSRzRsNb2g+scwFSEx46zN+ocFH
 52EOF1s5NIwOH/sM=
X-Received: by 2002:a05:600c:21d4:: with SMTP id
 x20mr353288wmj.58.1616090064198; 
 Thu, 18 Mar 2021 10:54:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhvlczBKW22FfkDUFt6Hf/m1y9XH7oCDYoUvhfIa3FSDPP+SYAsRNM9FSOa9QBux06rZlEmQ==
X-Received: by 2002:a05:600c:21d4:: with SMTP id
 x20mr353272wmj.58.1616090064039; 
 Thu, 18 Mar 2021 10:54:24 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v13sm4371104wrt.45.2021.03.18.10.54.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 10:54:23 -0700 (PDT)
Subject: Re: KVM_MEM_READONLY slot flag not working properly
To: Lorenzo Susini <susinilorenzo1@gmail.com>
References: <CAHFRQs1GuB+8tw+SDK11LOLXF4H6z+6+ZbQMTABXNK3gj7vffA@mail.gmail.com>
 <f05ce059-0802-404f-e2df-f8a7ddfc43c5@redhat.com>
 <a82e8771-913c-8dc4-03cf-c6148db1e15d@redhat.com>
 <CAHFRQs1TM_j4OYMQiqqf5fAAvFPkeaV+OF2FWm=r9jHPtkyB-Q@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0064fa7f-83cd-93ec-e4ec-9ef190cf7cef@redhat.com>
Date: Thu, 18 Mar 2021 18:54:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAHFRQs1TM_j4OYMQiqqf5fAAvFPkeaV+OF2FWm=r9jHPtkyB-Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/03/21 18:40, Lorenzo Susini wrote:
> Well I'm sorry but I didn't know IDT was marked as read only by
> Linux. If it is read only, how can you register any new interrupt
> handler? I guess it's a way of securing stuff against malicious
> attacks. I was taking for granted that the IDT was written when
> registering a new irq handler, given that when an interrupt is
> raised, the new specified handler has to be called and its address
> should be retrieved in some way, that is by storing it in the IDT.

There's a list of handlers for each IDT entry.  This is because the  IDT 
entrypoint has to do more stuff before and after calling the function 
(and also it has to return with IRET instead of RET).  So the IDT entry 
does not point directly to the function that you register.

(Also some interrupts may be shared by multiple devices, in which case 
you can have more than one handler).

> I'm sorry, I'm a student and I'm trying to understand things, Thank
> you, Lorenzo

No problem. :)

Paolo


