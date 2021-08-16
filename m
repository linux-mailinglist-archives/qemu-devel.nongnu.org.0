Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7B93EDA0C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 17:40:04 +0200 (CEST)
Received: from localhost ([::1]:49550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFeiZ-0002s5-83
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 11:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mFehc-0002Dc-PQ
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 11:39:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mFehb-0006WW-Av
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 11:39:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629128342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pvc9wD1lUPZTfEZnpljO9gINIugTu0C8zAih8i4bqK0=;
 b=iU+qCABfpXil7sKcD1XRYKSPAbgnwJ0Ecye71sc0UYlOT/L/lDyps6oQTMwczvtEfmq0/t
 gI0n/siXNWKZKQL54r3esgDP0M+etREBgL53bdcAmh0Epn9nB7k8UjX/AidzwU2q8yhaTR
 j3LQH76qYmwn84kAvmZXtbMSxEXMMuw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-wL70ASeNMoOzTXXjngj2oA-1; Mon, 16 Aug 2021 11:38:58 -0400
X-MC-Unique: wL70ASeNMoOzTXXjngj2oA-1
Received: by mail-ed1-f70.google.com with SMTP id
 x4-20020a50d9c4000000b003bed5199871so2868188edj.14
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 08:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pvc9wD1lUPZTfEZnpljO9gINIugTu0C8zAih8i4bqK0=;
 b=WEyur7Tz2VM19FMZb9VdXCnXQc9oyppr7IkhhRl68NfNPDzBAQWMv5e3RwAYQUlNps
 /79ya8GWmIimcG/o1mQeg9Y1v+dCyawHpdx4+ttsqmSM9wBfLzjuBjicx6QF9Ew1Pbbj
 b/+kesCiiRG4V9RkpUHy9kikHtQYWXqJV0p9bEICXnohFpo3yngyo6D6tMRoIRQGoUkb
 b0tZxHXNtrNENSARiJ5Pwar0lr7ynIV4ZWy6xb0eZGfnF7PkhlVHFPQGTi7hfEx7c8CF
 Yu1FYXobm8DYuWpU7fJ5L1p5zFwjsx5n1prSukVtQ+SkYvjnIdWWjIFomkth6ytJvagU
 0CSA==
X-Gm-Message-State: AOAM532t2ay066MAJvSLh08p3TlThP55FBHfRGAT8BOLA5QnYwyRqX4Y
 A4/00VUjgT1rZXKN+fKo/JV1rIo9rJZRP8rd0W3dUI008mtu4/jUSav882Cw3/ZzXrCHOYpe7yA
 tGCo4kzBf9toZ1/c=
X-Received: by 2002:aa7:c457:: with SMTP id n23mr21099018edr.89.1629128337861; 
 Mon, 16 Aug 2021 08:38:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbx6t+UCiHCtE2k3BVUa1TE/xC6yoZ7+wjHEFzqAH3fHJRZmBdRJpiNntuibcz2UlNgdA5jQ==
X-Received: by 2002:aa7:c457:: with SMTP id n23mr21098999edr.89.1629128337731; 
 Mon, 16 Aug 2021 08:38:57 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id hg25sm3829443ejc.109.2021.08.16.08.38.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 08:38:57 -0700 (PDT)
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
To: Ashish Kalra <ashish.kalra@amd.com>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <fb737cf0-3d96-173f-333b-876dfd59d32b@redhat.com>
 <20210816144413.GA29881@ashkalra_ubuntu_server>
 <b25a1cf9-5675-99da-7dd6-302b04cc7bbc@redhat.com>
 <20210816151349.GA29903@ashkalra_ubuntu_server>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f7cf142b-02e4-5c87-3102-f3acd8b07288@redhat.com>
Date: Mon, 16 Aug 2021 17:38:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816151349.GA29903@ashkalra_ubuntu_server>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thomas.lendacky@amd.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, tobin@ibm.com, jejb@linux.ibm.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, dgilbert@redhat.com,
 frankeh@us.ibm.com, dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/08/21 17:13, Ashish Kalra wrote:
>>> I think that once the mirror VM starts booting and running the UEFI
>>> code, it might be only during the PEI or DXE phase where it will
>>> start actually running the MH code, so mirror VM probably still need
>>> to handles KVM_EXIT_IO when SEC phase does I/O, I can see PIC
>>> accesses and Debug Agent initialization stuff in SEC startup code.
>> That may be a design of the migration helper code that you were working
>> with, but it's not necessary.
>>
> Actually my comments are about a more generic MH code.

I don't think that would be a good idea; designing QEMU's migration 
helper interface to be as constrained as possible is a good thing.  The 
migration helper is extremely security sensitive code, so it should not 
expose itself to the attack surface of the whole of QEMU.

Paolo


