Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6946B3D9F26
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 10:07:06 +0200 (CEST)
Received: from localhost ([::1]:40480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m914L-0002Il-Fn
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 04:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m913O-0000w9-KO
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:06:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m913M-0004g7-Uf
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:06:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627545964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RsSoYdVksIUWckZZZ+J9cHXMeThO9NWXcnzQgV5C+oM=;
 b=jKgkussFmulJxON7ysFxrXJrvpVThqg+Et/3kv/C1XWLMG3tM1uO9X4H6TaSxVrxq3MDhX
 mNR2xmN/lZzZwSyYzM7a9C1FfA4DImS0BdmJmd5OcrlBNJMOZT9cr6F38A5bAspudV3My/
 ex5iRlOw+Qk5aq94UYYyP71FDrN9X1s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-QI5B-rmzMlaVkCPtfBxW8w-1; Thu, 29 Jul 2021 04:06:01 -0400
X-MC-Unique: QI5B-rmzMlaVkCPtfBxW8w-1
Received: by mail-ed1-f72.google.com with SMTP id
 h16-20020aa7de100000b02903a6620f87feso2561136edv.18
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 01:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RsSoYdVksIUWckZZZ+J9cHXMeThO9NWXcnzQgV5C+oM=;
 b=X9aCSB+lvgnb1AM59TxqPC6SXkXe37OX7pe2KApJCH+uu9DPieEcPUw+1zyxFyp08O
 zKF4s+ZfUZ4XXa2FkQZ5/rZQHQWIrSRztebkj/Cm+vwokL1Vq4xrBo4dbU0q4FNimoGO
 Adv4TWIvjbIjtzn/K3h7Ep2cQ2cUMHjQSXo4uzPeqYLTdHWf0iRj2+QvHLFPl5blC0zC
 9jqkZfok/FrtkG/THU6Z2STw3Uvm/Y4NKQ6UvsIcPcH9F7uKu7d74BWafSdLvOgqWzLH
 8bEfkPFYNT1ABxuvu5e513JkZ5+nuh2U124rFK2Ps/xh1Rf7ectDZxiun3zff9YZVfmy
 PcTQ==
X-Gm-Message-State: AOAM53111T9Y3OMq7Y0fbP3Cf/o9+A9r1QoSv8DJ2/ZE1TQlAhhtLU/F
 B1tR7VZdy/JDnHEoEVvbOx7EYatder93Om/AfI2tW539LVRE5VsxGkRBcjiHNQ2PlDPSLvKwKms
 Wz0aKsscWTOP+qdsawHc4Ot9v1o+qq60NUB0zZkW4xOH/fBhbMAuaKGjq2T1sXRi2IQs=
X-Received: by 2002:a17:906:c342:: with SMTP id
 ci2mr3532774ejb.122.1627545959575; 
 Thu, 29 Jul 2021 01:05:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxenYt9UGOA/nwEG80I/uxC+ckdBhJyfXcqghnbK7osXQLGx1AGA5Wjg+QH4MSyrnlmzfcBRQ==
X-Received: by 2002:a17:906:c342:: with SMTP id
 ci2mr3532759ejb.122.1627545959413; 
 Thu, 29 Jul 2021 01:05:59 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id t15sm682169ejf.119.2021.07.29.01.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 01:05:58 -0700 (PDT)
Subject: Re: [PATCH 2/2] libvhost-user: fix -Werror=format= warnings with
 __u64 fields
To: Stefan Hajnoczi <stefanha@redhat.com>, marcandre.lureau@redhat.com
References: <20210505151313.203258-1-marcandre.lureau@redhat.com>
 <20210505151313.203258-2-marcandre.lureau@redhat.com>
 <YJK72YzBwoLyTyK5@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9ee74a1c-7ddd-ebed-f2e3-e23220b04a9d@redhat.com>
Date: Thu, 29 Jul 2021 10:05:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YJK72YzBwoLyTyK5@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/05/21 17:38, Stefan Hajnoczi wrote:
> On Wed, May 05, 2021 at 07:13:13PM +0400, marcandre.lureau@redhat.com wrote:
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> ../subprojects/libvhost-user/libvhost-user.c:1070:12: error: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 3 has type ‘__u64’ {aka ‘long long unsigned int’} [-Werror=format=]
>>   1070 |     DPRINT("    desc_user_addr:   0x%016" PRIx64 "\n", vra->desc_user_addr);
>>        |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~              ~~~~~~~~~~~~~~~~~~~
>>        |                                                           |
>>        |                                                           __u64 {aka long long unsigned int}
>>
>> Rather than using %llx, which may fail if __u64 is declared differently
>> elsewhere, let's just cast the values. Feel free to propose a better solution!
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> ---
>>   subprojects/libvhost-user/libvhost-user.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> Looks good to me:
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> 

Queued both, thanks.

Paolo


