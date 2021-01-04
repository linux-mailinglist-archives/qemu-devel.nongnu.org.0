Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C71572E94E0
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 13:32:01 +0100 (CET)
Received: from localhost ([::1]:55070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwP1k-0003eR-SO
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 07:32:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kwP0T-00031w-0M
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 07:30:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kwP0Q-0002AH-Nu
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 07:30:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609763437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SCaiyx5ga8SM5676+QxSmbuO8CB1SJHf21b5GZZXifM=;
 b=iy7B5Haxfp5rO6KWf3Xf1tHx97y1/23m6uPJys0DXGkKDZdCOA0v73VlkVYxbW0mD0qNNn
 Ix1jk7B2YeSPOfKUBu+MSD8/KiZtqKs1Hjr3DH3L8SK0WhS2nkWzPyyg8/GZdGbvZ4BdBm
 kok9Kk+Fq7V3+tCu9a/8tI9TQF2zlgI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-rOyOps-HMQmcnZuLa7n28Q-1; Mon, 04 Jan 2021 07:30:35 -0500
X-MC-Unique: rOyOps-HMQmcnZuLa7n28Q-1
Received: by mail-ej1-f70.google.com with SMTP id gu19so6931874ejb.13
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 04:30:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SCaiyx5ga8SM5676+QxSmbuO8CB1SJHf21b5GZZXifM=;
 b=ZsI80C5FLbEq+sagparT/9g//dgmuxNJ/UyZdShqJnoKslsZIA/i5SVo+vY1CPVH++
 Wc6Txl2PS3ZNSJGmujXDSR/8AhKsWroXaNmUMadG8BAKqtvPclp+1EQWVUSPIYEV8L4x
 AWK+ixiX/Ih822FxC4toYjGz7OuWvGDAdUrn4JEXrYt/qN5nKdoGpGyZp/sej55IUltq
 x7aCDlTKaWcW6Sw/hC3rBKEBdeeCot/SkTDy0R57OwV+/pJ7DvCm/5j7mMGQl0NpkeCR
 hWZBVY09zD1tVJe48sw5r1HOCOWBfvqJzk1/I7pf4d9U+urr0SHTn9VByPxkKa41MQVE
 OiCw==
X-Gm-Message-State: AOAM532MusYON6UXmDkwlzSYw8I+P0sVdPQaj8SvFxdOM/BZLVBA7jhY
 S1T0ztPRs8Ms1AabXvmVlP4XcrxbBWsMzhh3u3FtqjxnE5haAG8S93Z1WO1pJD/zAznJgFBwxNz
 cAGiMC541u0g8Dkg=
X-Received: by 2002:aa7:d5d2:: with SMTP id d18mr73177046eds.126.1609763434565; 
 Mon, 04 Jan 2021 04:30:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfeSZz9jzv7nbnREtcaew3+Vmu1mu+dciJG3Qsv8reMnPfY+NYo3lgnXurMdKrMtG1ESJI/w==
X-Received: by 2002:aa7:d5d2:: with SMTP id d18mr73177021eds.126.1609763434320; 
 Mon, 04 Jan 2021 04:30:34 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n9sm43326924edy.83.2021.01.04.04.30.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 04:30:33 -0800 (PST)
Subject: Re: [PATCH] meson: Propagate gnutls dependency
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210102125213.41279-1-r.bolshakov@yadro.com>
 <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
 <20210104122149.GH640208@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <dbb8613e-5e84-7ac5-e3c0-84a888605c7d@redhat.com>
Date: Mon, 4 Jan 2021 13:30:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210104122149.GH640208@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/01/21 13:21, Daniel P. Berrangé wrote:
> The actual usage of gnutls should be confined to the crypto/ code.
> 
> The rest of QEMU should only ever be using QEMU's TLS abstractions
> and not directly be tied to GNUTLS. So ideally the gnutls flags
> should only ever be added in the crypto/meson.build, and anything
> which depends on that should then get the flags indirectly.

Right, see my reply.

Paolo


