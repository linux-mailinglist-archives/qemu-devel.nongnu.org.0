Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 411363D24EF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 15:57:36 +0200 (CEST)
Received: from localhost ([::1]:47566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ZCh-0004fF-06
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 09:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6ZAz-0002pT-L1
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 09:55:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6ZAv-0002Cl-VL
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 09:55:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626962144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0DeoZNCUh4e9MTHM5V0H/JyX/8PbaVJ+KNBBq7vatDs=;
 b=h3iYzcLrpJX1FfaHhzlBToLeQ7h8GgbguufTLAhGYxCW85Gm/C0TMZF8i9jth12s+vFZMe
 FakGpHb1sg8L4CXuEl2xsLI/Eig9P34Leet+xZZDxb7VCMhSGRKTRzBu0L237QbBJUzclQ
 wxRpe9Di3TLkT/AVh/xZRH2DykAKD/w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-ZOZP6SKjN7e3wEJfP2p12g-1; Thu, 22 Jul 2021 09:55:43 -0400
X-MC-Unique: ZOZP6SKjN7e3wEJfP2p12g-1
Received: by mail-ed1-f70.google.com with SMTP id
 v2-20020a50c4020000b02903a6620f87feso2836354edf.18
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 06:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0DeoZNCUh4e9MTHM5V0H/JyX/8PbaVJ+KNBBq7vatDs=;
 b=gvxHO96PNj371B+zG3w9x8HXg8RaY/h/6rZdzy95YVTI2Dz/8SzsX1RH4K2RWxn1Bn
 5P7HG/4Vmo4M4C0AGYO6ozr+jzff5nR3mDluhuY7ubhHaqHheTX87tNBI0gvojTCXPyd
 gmV7ubQ1tyT+0sItC8QgU7VchsBr4ZvGvg8TxtMIttPzcsA1K69nAclfika3RxU8W+YW
 MMRdAI8hp5mQksJ7jAmTg/1b58uGw1YKTQHvbqWo8I8NNSfVE/apkq6XuBuyjJ9CNjWJ
 LjtNADK80Y3eWylJSjFeq2/3EFEyOOh0JLt+Ib8fnV/hclnxabhPQkgSVkjdfShuWkQM
 Ov3Q==
X-Gm-Message-State: AOAM532+iCF5aA+Hmesj1qG2t3/2KX4Dm2wsuRM2SelG9xGO/zcUUGXX
 59VwNbI/h38fSdRArNXUgwX6WNVhy7G44HheotmXnLu+l6hBrczp7vCgtBdLGz2gyIOtOJdQoW/
 +aUSN5mA3d6u5OUo=
X-Received: by 2002:a05:6402:7cc:: with SMTP id
 u12mr54616065edy.156.1626962142333; 
 Thu, 22 Jul 2021 06:55:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznSStMxIkvi09hJiwroy2+4vOYrF54NMTPjjQNvx44YvsojbC9OWrsQ33gMlWIkxNBRFzZdw==
X-Received: by 2002:a05:6402:7cc:: with SMTP id
 u12mr54616030edy.156.1626962142094; 
 Thu, 22 Jul 2021 06:55:42 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m3sm7908936edb.7.2021.07.22.06.55.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 06:55:41 -0700 (PDT)
Subject: Re: [PATCH for-6.1 0/1] machine: Disallow specifying topology
 parameters as zero
To: Andrew Jones <drjones@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <20210722021512.2600-1-wangyanan55@huawei.com>
 <87y29y7uon.fsf@redhat.com> <20210722133759.db2kjcoucf6rsz4o@gator>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <672e17d7-bfcc-8022-044a-54a482e3c5ee@redhat.com>
Date: Thu, 22 Jul 2021 15:55:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210722133759.db2kjcoucf6rsz4o@gator>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/07/21 15:37, Andrew Jones wrote:
> This doesn't mention zero inputs and even implies non-zero inputs.
> 
> I'm not sure if we need to worry about the odd command line that used zero
> for some parameters. What do you think?

I think I agree as well, however the patch that Yanan sent has 
unnecessary duplication between smp_parse and pc_smp_parse. 
machine_set_smp is a better place to implement this kind of check.

Paolo


