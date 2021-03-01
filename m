Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AC8327B9D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 11:11:00 +0100 (CET)
Received: from localhost ([::1]:57248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGfVz-0005Cb-6v
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 05:10:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGfUx-0004mX-JM
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:09:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGfUu-000365-Rt
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:09:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614593389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JAUNoxdp7P1LVKhT0TqV8jQG9lP6d0fGipvcDjd0vg0=;
 b=HtbRxjcWtZJmzOmklO5qP87DVLhtRnuGsrKBYEsk1wtJMJbmB9aeqo4glyRBBlSwlh/xtm
 H7I6mPxrbdfyrq8o1NNYjd/iNyqFEMoRiaTs9nUih6YghA8U4GQyWGppjRwiQ/LYzF5OTb
 qrMg0NftdgE7GCS45hlmQpBtSqgzQlk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-tBKz9JvYNoGJDDW2kEZchg-1; Mon, 01 Mar 2021 05:09:48 -0500
X-MC-Unique: tBKz9JvYNoGJDDW2kEZchg-1
Received: by mail-wm1-f69.google.com with SMTP id v5so1216882wml.9
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 02:09:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JAUNoxdp7P1LVKhT0TqV8jQG9lP6d0fGipvcDjd0vg0=;
 b=ibPqjMTTSO/nOCW6gT6tqATeoGOe72hZknGiCfECuewx+KoSNwAIGEg39jR4X30T0k
 Q4vmoewoeb0dfAM0Cch+ykSxp3VDjeiCHxyd+25/8Z4J+vDMM2tw2rU5qzraJCHlRb8d
 1lP51Gt6iur9QvoPDFlQd8cXyI6Sn9dgTRkyShxGAQDE92kGho40d6LE7V/AhIKJieKB
 nKsDx5pEaba22Ohe/nUjZYUZ/PvT6mfgIompP0Kn0NWuLRZLVRWmYX96Ar+vQwdakOSu
 rsk9cLWEWv4tTZpcvi5MtgnAiuAM6l8nNZncFemEw7eAdoFQJKk56E9m1NGF5ei1jg22
 cfrw==
X-Gm-Message-State: AOAM531qigQYZeoV6Wem7IhyR0EZAVTIoVCj+t84o0zjfbRBr52vlWxl
 y3QWLWqWUY2RH+BQOeV4NnecwM4Vt3FRfyFqaRJ79Kt9bXXq9fIRp+JTGyOcdckT6h+ulDmcm+w
 y4mDFLIcT0tyFkBYKY4QzwJu+P7o7iHP621odazQ4xL6Azmvh3OYJ4GnxyYE1a9hNmio=
X-Received: by 2002:a1c:2049:: with SMTP id g70mr13256048wmg.7.1614593386656; 
 Mon, 01 Mar 2021 02:09:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzr/1rOJOc4hqhDFY2S2kHuAem8frZde1qH/AYwdTELCCnlZhUwzfvpFeHy+8uh+5ANHtRfvw==
X-Received: by 2002:a1c:2049:: with SMTP id g70mr13256035wmg.7.1614593386463; 
 Mon, 01 Mar 2021 02:09:46 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id s11sm22732558wme.22.2021.03.01.02.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 02:09:45 -0800 (PST)
Subject: Re: [PULL 27/29] vl: deprecate -writeconfig
To: Markus Armbruster <armbru@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
 <20210226080526.651705-28-pbonzini@redhat.com>
 <87r1kzl2vy.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <94db680f-a43f-7f94-a897-5512ceef6b98@redhat.com>
Date: Mon, 1 Mar 2021 11:09:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87r1kzl2vy.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/03/21 09:00, Markus Armbruster wrote:
>> +                    warn_report("-writeconfig is deprecated.  It will go away in QEMU 6.2 with no replacement");
>>                       if (strcmp(optarg, "-") == 0) {
>>                           fp = stdout;
>>                       } else {
> 
> Forgot to tweak the warning to "-writeconfig is deprecated and will go
> away without a replacement"?

Didn't really forget; being pretty sure that there's no usage in the 
wild and having good reasons to remove the code, giving a firm removal 
date should encourage people to speak up sooner rather than later.

Paolo


