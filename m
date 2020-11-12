Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91DA2B06EF
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 14:48:41 +0100 (CET)
Received: from localhost ([::1]:55534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdCxs-0001Gj-Qm
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 08:48:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdCwf-0000pr-9B
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 08:47:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdCwd-0001aJ-JJ
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 08:47:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605188842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aV9QrEO3ieryGRIh+PtUn5M2XdGC8Dp07awEuR9Ijys=;
 b=LiC4V8oG1HmIx2vGeTQ3cgdgislvghE6QxFOttqAnzYCdLAuWHRvpybIuehNSUMMWpYGMm
 ZHh7TwumHO5/6r4CkmhqbKL8VRzoQavpQfWFXZper7kLJHotG4RYTsWQgjJe2O4NgP4EyM
 Jhc4Sbq99CH5lqi/n+NrXANwRVOXQcA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-nhkC7D9tO7iwQgXZKxGEJA-1; Thu, 12 Nov 2020 08:47:21 -0500
X-MC-Unique: nhkC7D9tO7iwQgXZKxGEJA-1
Received: by mail-ed1-f69.google.com with SMTP id l12so2309173edw.11
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 05:47:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aV9QrEO3ieryGRIh+PtUn5M2XdGC8Dp07awEuR9Ijys=;
 b=hFU64fEqi06MlAA1t6r95ej7X5MyEAy+F6vFMSvt410VdFcIGhcMxZ5tle0z4upqhY
 BsQLhYMGE2/nkI1Fj1vNFPF1eZAeUkZPDU139/6NJm/M9oQI9oB8A8nsysTh1YlusvLY
 W2S+1hFGzw2y7jMT3I/yh54iKXSfQzWyFFh9xRO+YwKVtnEe4roxrqt/IEZo+dQ20fLN
 IaBfdhJFY5BZ7j/jhrwFdlNuMPuKPv34xRotzzMiR73KkPzR9a40GDyx4kHAq9lQMODJ
 Ok0B7BSQrAFOBbNLOALCM3gsr/wlCu5z4RGDciGe808mFMkmENJToHv1wfA0WW22B7Ch
 ON1g==
X-Gm-Message-State: AOAM530GGduikTJ7tHECif6NfOWr2lUzK5h80JZWZTTvOMD7Igk7TczD
 b5SIZ6uIsPMwby/8CSb5zoz0WdvV3A8YrnlcMjXnsCVsVZHThIs01gIvKAWTDRomJsRXqNMNVBC
 ZXnE89ibUgWg76ZAnj+F/r4AH9fZD94NC0q78Ri+0v7KBFAsXqDowPgTiKXvNNGa6Fvo=
X-Received: by 2002:aa7:cd90:: with SMTP id x16mr5047577edv.302.1605188839360; 
 Thu, 12 Nov 2020 05:47:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjHFB8/K4yyXoYMoyToqZA0eMXoAEeXlEkb4EcU2JNa5uLFUqWav4+TzkQHba1T2+aVVAgyg==
X-Received: by 2002:aa7:cd90:: with SMTP id x16mr5047557edv.302.1605188839135; 
 Thu, 12 Nov 2020 05:47:19 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y18sm2152274ejq.69.2020.11.12.05.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 05:47:18 -0800 (PST)
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20201111135716.1209421-1-pbonzini@redhat.com>
 <20201111150336.GF906488@redhat.com>
 <20201112112656.b2mou3jt74afods3@sirius.home.kraxel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] vl, qemu-config: remove -set
Message-ID: <e6383cfb-de65-654c-25ac-60f43c5d1ddf@redhat.com>
Date: Thu, 12 Nov 2020 14:47:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201112112656.b2mou3jt74afods3@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 12:26, Gerd Hoffmann wrote:
> Yes, that is quite useful for setting device properties which are not
> (yet) supported by libvirt, like this:
> 
>    <qemu:commandline>
>      <qemu:arg value='-set'/>
>      <qemu:arg value='device.video0.edid=on'/>
>    </qemu:commandline>
> 
> Grepping through my libvirt domain config files I see 90% is
> indeed "-set device".  But I've also found netdev (set tftp+bootfile
> for "<interface type='user'>").

Hmm...  Looks like I will move -set from config-file to vl.c and handle 
both QemuOpts and keyval-based options.

Paolo


