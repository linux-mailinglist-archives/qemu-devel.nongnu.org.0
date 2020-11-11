Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB752AEF24
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 12:07:07 +0100 (CET)
Received: from localhost ([::1]:52282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcnxy-0002WJ-Ch
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 06:07:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcnwv-00023c-1A
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 06:06:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcnws-0001NS-Rj
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 06:06:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605092756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ErHHJJxmk1E2nJGcGP5rY5kEdIpSFYnet/w8U6boDA=;
 b=hDX2YMsakt/VNV78+ozU//r2EpXC0XOfgFiiQifK/nnEvweYb+pQezXS9t+VAuH1M5ef86
 ifd9MWZ6tW3HekRHV9Zxu68qUVxUzwKG749hFGO64FZyXRzpPksUNokf7SZnjAs3/uFKPH
 PExWlKMnXXGkYLQcIYir5jIowmptDc0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-b67hQq0cMv-YedV1BUaV0A-1; Wed, 11 Nov 2020 06:05:54 -0500
X-MC-Unique: b67hQq0cMv-YedV1BUaV0A-1
Received: by mail-ed1-f70.google.com with SMTP id l24so708031edt.16
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 03:05:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2ErHHJJxmk1E2nJGcGP5rY5kEdIpSFYnet/w8U6boDA=;
 b=SRDPMxlcS6ArufyjT/kQK7h1uprt5RqIw8sNVQjdTTPyT+z5AQDJarKO/LX2L4y452
 owyOd7mMl78NFMCMlQeLLKg0IvQwMrv4DenVPFEq+9/Bl0eZDZdofSDtENbnGkOVlwv1
 bge3tqEOBDl1pMBLv66lX8uO0NFA0/EXD3CGLqDg6M0WkPuqtrZ3j5zGdxd8/UmJXZL4
 pElSf9IGz6MLFz9xdpZjaxPcBI7zLKIBWP7YbmWsRf29/yM8cMT9wvIJKxSUPbSsuYiY
 n1+hIA/bYhhXvcgxm2+YrCYLUk9XE+Gxqnor86eqtDQ2yXad3nqmfg6GalqBuAgfz9G1
 ri6w==
X-Gm-Message-State: AOAM533ZkFpNcKuqs5qDf6juO1V+wUk8ZhT4EHZy+2Lyj7PDTuwAJnku
 R7a4f9LOAQ/wqkQuF0f3JdyYJH4W46aPSCuTyae/QzuLM5Ed5WZXyBByGejTl1Z+bKnB6kBeSL8
 LWllqJ28dMHHcX/0=
X-Received: by 2002:a17:906:34c3:: with SMTP id
 h3mr24824982ejb.132.1605092753287; 
 Wed, 11 Nov 2020 03:05:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtZ57Nabi8I/5Ub9QwOMZuUZvFk9/JiiSe6sXegYv0HWz062icA/7G+QwC61dRsYni22sszg==
X-Received: by 2002:a17:906:34c3:: with SMTP id
 h3mr24824962ejb.132.1605092753076; 
 Wed, 11 Nov 2020 03:05:53 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o21sm715094ejx.68.2020.11.11.03.05.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 03:05:52 -0800 (PST)
Subject: Re: [PATCH 1/2] keyval: accept escaped commas in implied option
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20201111104521.1179396-1-pbonzini@redhat.com>
 <20201111104521.1179396-2-pbonzini@redhat.com>
 <20201111105353.GE906488@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0803bf79-da12-18db-7c5e-5cdbd02ce804@redhat.com>
Date: Wed, 11 Nov 2020 12:05:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111105353.GE906488@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/20 11:53, Daniel P. Berrangé wrote:
> On Wed, Nov 11, 2020 at 05:45:20AM -0500, Paolo Bonzini wrote:
>> This is used with the weirdly-named device "SUNFD,two", so accepting it
>> is also a preparatory step towards keyval-ifying -device and the
>> device_add monitor command.  But in general it is an unexpected wart
>> of the keyval syntax and leads to suboptimal errors compared to QemuOpts:
> 
> If "SUNFD,two" is the only wierdly named device, can we just rename
> it to get rid of the comma, and then put validation in QOM to forbid
> commas entirely.  eg rename it to "SUNFD-two"
> 
> Just have a targetted hack in vl.c to replace any use of "SUNFD,two"
> with the new name before parsing in keyval, if we care enough about
> back compat for this niche hardware device.

See the rest of the commit message.  The patch improves error messages 
as a side effect, and in my opinion also the code.  So it can be 
considered independent of the original reason why it was developed.

Paolo


