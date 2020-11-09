Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8C02AB5E4
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 12:07:03 +0100 (CET)
Received: from localhost ([::1]:34710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc50o-0000WO-E9
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 06:07:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kc4zA-0007ub-8b
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 06:05:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kc4z8-0005dm-AT
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 06:05:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604919917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RCl24dXQfOx5f0o/7DOYboEjcUgEoH/+8Jttja/SF1A=;
 b=NOPBL7Fh07lTiHmEmM3OI4oyO0F4W2Zj7Fj5HwtamWQlM8JwaBpXOPy/Io+WuP2Nq/E1HB
 wGJhOKnPIn9UHOrjOdiVFg6Mhw6iFby45aasUIr/Tsm/9bnqwvl9TC5hGHQ9QnFkLQXUL3
 bfhBckKodu7AysMc9a+TEtZRuuq8390=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-MeKRiHguPKKX5rJJY-oH4g-1; Mon, 09 Nov 2020 06:05:15 -0500
X-MC-Unique: MeKRiHguPKKX5rJJY-oH4g-1
Received: by mail-wr1-f72.google.com with SMTP id h8so4194178wrt.9
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 03:05:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RCl24dXQfOx5f0o/7DOYboEjcUgEoH/+8Jttja/SF1A=;
 b=VAF5YaMY8R4zirspJgPEF1Oe5tYE6a0Evh33l/9JQP9JTa9ZGp6diLMuk8jeCfZrCL
 j5F/blbTFMYSTZoKg9/G5UyQYxiw3ITmTX+REAQM70foUQJANgKKwvzqr6E7i4nJgiLz
 Lmzn9k2GKfh2E7L23yjyvBOGzssYh3USANgxk851p0D0j9lxQPDOiijuKukMfF5k5/zj
 Hu6it/FvX2TNHi+l8GODpEWzJRAc+sXrotwACfabNqBlBYMhPIxItCLFrqVOZ/jIJ3pU
 EucbLSnRtcdMCI4GE0D2aiO2mBALZWxUNSe2mcba9hCU+YyEZYTJTPp5+IQ2ujJvvxe/
 yy0w==
X-Gm-Message-State: AOAM53238y2DFWnGM6XOMhDLtB4PObgSu97UbtyN1qQAs42gkfXe50pd
 4a/OXdcF1NqCIH9oEzzg0lxDY/y+2VllAGrY78e+qbJoNAnLeiKzwWOFpdt/5ep0XWuPAcsVG1z
 +U1ICGMtl6yWColg=
X-Received: by 2002:a5d:6ca6:: with SMTP id a6mr17217224wra.348.1604919914006; 
 Mon, 09 Nov 2020 03:05:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJym0bezdKWSZSnXEq3sEfpmzWFTOdwBgYFxDX5wng++Z0MlN/cltRu5ZBpDl7BhgwnMFHCI4w==
X-Received: by 2002:a5d:6ca6:: with SMTP id a6mr17217212wra.348.1604919913889; 
 Mon, 09 Nov 2020 03:05:13 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id f7sm13648514wrx.64.2020.11.09.03.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 03:05:13 -0800 (PST)
Subject: Re: dtrace warnings for trace/trace-dtrace-hw_virtio.dtrace
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <87r1p2syo9.fsf@dusky.pond.sub.org>
 <20201109102556.GD684242@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2406868d-9b45-6428-8b32-59bf6665c1a5@redhat.com>
Date: Mon, 9 Nov 2020 12:05:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201109102556.GD684242@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 01:25:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/20 11:25 AM, Daniel P. Berrangé wrote:
> On Mon, Nov 09, 2020 at 09:48:54AM +0100, Markus Armbruster wrote:
>> I get this on Fedora 32:
>>
>> [12/8327] Generating trace-dtrace-hw_virtio.h with a custom command
>> Warning: /usr/bin/dtrace:trace/trace-dtrace-hw_virtio.dtrace:76: syntax error near:
>> probe vhost_vdpa_dev_start
>>
>> Warning: Proceeding as if --no-pyparsing was given.
> 
> Patch is posted and reviewed but needs merging still:
> 
>   https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg05608.html

Oh, patch is even reviewed!

> 
> Regards,
> Daniel
> 


