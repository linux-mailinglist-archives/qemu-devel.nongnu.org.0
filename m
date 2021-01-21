Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F932FE991
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:04:58 +0100 (CET)
Received: from localhost ([::1]:38482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Yht-0003Xb-Do
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:04:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2Yfy-0002jd-Vm
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:02:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2Yfv-0007bc-MG
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:02:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611230573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RqNun0FPd5wjYz83943/a69D6T1O1EoAwLcHkrv00ZM=;
 b=VBbCLf3dFrjRO1Q5iXpnCohVFqTdB5ymnTdfqJPOEApSNkm0/YgVkBBEY1WR1qQ2YxE8Tb
 ERmoLqh/LZzdqt4PoXmg/9UgQCQmi31PZkGmD+lBJu+/9jjc6qATVZGzA8NYKjsw5KRafc
 erwSn9qR3XogAFuqls/Av0r9DnsP3xE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-jEWfDNFSNUGimhY6Kw6zXw-1; Thu, 21 Jan 2021 07:02:51 -0500
X-MC-Unique: jEWfDNFSNUGimhY6Kw6zXw-1
Received: by mail-wr1-f69.google.com with SMTP id v5so853394wrr.0
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 04:02:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RqNun0FPd5wjYz83943/a69D6T1O1EoAwLcHkrv00ZM=;
 b=ELdBfCcmjrLxEtuiqxituxmzPhVhXGXv8u2nPbo2/04Owz9uitdpWpmCVFbon6ScDs
 vyoQra+1/ACRJS9L2ZEuSTCVhCQ+UmGlP0qaXiM1nmLLBNDh01IunM4cWtLvNqSfItRL
 cah6sEXfidg8MeceYMQu5l4rVSbzpjJC+hDP9Ntxd++TvdHWNvpj7oZ5hjI35rHR75Gi
 Whtf54xBFBKwhl9X0F/G5pSdJQ6snc583PNo3HJp4F7wWibFLgHZO7gLW9sqiUCJwUBY
 9U7MiJ1d2yAJj+0I+GLy5tUJd5HY4f6eyupsM2E/jEVnaLOtb541xa34+SearnrLGq8u
 l4PQ==
X-Gm-Message-State: AOAM533Rax/+BVZlVb0+W9yoa77DbBus59HafXjFij+E1ciTxv4cY4AC
 xdDYxZpobJDVXOTOrOyzK/Vt+CSyU3m6ltRimyDK2ZRkFKGtWMP22QyojMR9kXXrJyFej/VOQYt
 cg8JJAW00vkk4NBM=
X-Received: by 2002:a5d:4307:: with SMTP id h7mr14117712wrq.353.1611230570604; 
 Thu, 21 Jan 2021 04:02:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+izbBCLVCoMKbVvxYoszxW2WrxUyconA21HXkyFHj6bgsFXeKbQiHeS7Rx7LCxD3X0N3MnA==
X-Received: by 2002:a5d:4307:: with SMTP id h7mr14117695wrq.353.1611230570441; 
 Thu, 21 Jan 2021 04:02:50 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id m8sm5693895wrv.37.2021.01.21.04.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 04:02:49 -0800 (PST)
Subject: Re: [PATCH 0/3] vnc: remove "change vnc TARGET" and QMP change
 command, support "-vnc help"
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210120144235.345983-1-pbonzini@redhat.com>
 <20210121103831.pb22ib52z5g5onjq@sirius.home.kraxel.org>
 <20210121105204.GI3125227@redhat.com>
 <20210121111317.p7vwmau52odrrtwf@sirius.home.kraxel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9b08b0fd-f703-bd2b-ab9a-50be38a10bd2@redhat.com>
Date: Thu, 21 Jan 2021 13:02:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121111317.p7vwmau52odrrtwf@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/01/21 12:13, Gerd Hoffmann wrote:
>    Hi,
> 
>>> So, all in all I feel a bit uncomfortable dropping this without the
>>> usual deprecation period.  No strong objections though.
>>
>> Well we did deprecate the "change" command in general in 2.5.0.
>>
>>    https://qemu.readthedocs.io/en/latest/system/deprecated.html#change-since-2-5-0
>>
>> We gave illustrations for replacement for vnc password and CD
>> media change, but no replacement was provided for changing
>> VNC server config.  That's ok though, as there's no requirement
>> that we provide a replacement when deprecating stuff.
> 
> Fair enough.
> 
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> (assuming you want queue that with other qemu-opts changes,
>   but I can also take this through ui queue if you want).

I'll queue it myself, thanks!

Paolo


