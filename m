Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D95336D9F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 09:19:39 +0100 (CET)
Received: from localhost ([::1]:57692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKGXi-00025X-S7
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 03:19:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKGV4-0000le-3D
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 03:16:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKGV2-0004S6-Nw
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 03:16:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615450611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e4NvwzLjYgWefBDG/uwSsBLO21463UsderpN3qQQrkw=;
 b=WgFlvPw9ezk6KsR8dpjgZVN5yDa5GKBdS+Zula9D+Dj1ZLf5Tbz0bpQRiNzRIhdVcnCBBG
 jb98ZEmipBQnKhkIYkHncKpcNme3zxZREq0Zz/krb14Sy/ihgd2PPWXnBpYLybMfuQ//98
 JYQxFs2v0DO/Iz3aOYOBWkAU5Ky4tJY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-PR5zydDRO-WYseCaHwbSUw-1; Thu, 11 Mar 2021 03:16:50 -0500
X-MC-Unique: PR5zydDRO-WYseCaHwbSUw-1
Received: by mail-ej1-f71.google.com with SMTP id gn30so8332505ejc.3
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 00:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e4NvwzLjYgWefBDG/uwSsBLO21463UsderpN3qQQrkw=;
 b=F2sIiUKOLLmNiB1cMPJb8+482VdzSVd6Tb2QoZ3drYXSl4sViO1pMXezWh/35GIHUi
 jI95nzgACvcU+MmO5I0xEcdNgLLZw5CIf6IWinoT8cFt8cr2LDVWbWY0RluG5jJRHYNf
 si8UG/IrMyogEg5UtXQn9mNxZgmHDaF1rIEwA2fGucJNspeXCrUN7pG1g/vnYwX4r5Gg
 dhsaFbgoP/6jLrp9HkkpMsOTb+dRywqoo2gM7Rufsdc1J7Co4wQqr3K61heJkqqOH4Nf
 Fkm5iB0KY7Vd6gqhDNXz2KEI/Fu9w9a+DfUH2MkOrc3ZSTIiBoo+e7UD1tC2Vc1ccjc3
 XKRQ==
X-Gm-Message-State: AOAM533/dabQyT8hVpLgwzBqoEnPBw35BaJkdmV0PwSmgq5cnM75U8S7
 DAfpUBNqPib6MNNmFW57R4y1UUuySvabfxeyZcUh8StrGVOUx+DvlVTWWtTkclrBuil2HLtWaLq
 s8c7QQYLhVvxNYps=
X-Received: by 2002:a17:906:78d:: with SMTP id l13mr865528ejc.97.1615450609109; 
 Thu, 11 Mar 2021 00:16:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztz7dTWL6sfzv5HABCsj+iphC5cHtZRPngeZvWO4sgkpSxtdEHgmaXS2WRxLGAUZz4wSEAJQ==
X-Received: by 2002:a17:906:78d:: with SMTP id l13mr865509ejc.97.1615450608941; 
 Thu, 11 Mar 2021 00:16:48 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id 90sm855412edr.69.2021.03.11.00.16.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 00:16:48 -0800 (PST)
Subject: Re: [PATCH v3 00/30] qapi/qom: QAPIfy --object and object-add
To: Peter Krempa <pkrempa@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <YEjWQnWKbr5teciB@angien.pipo.sk>
 <90130a0c-7f96-f344-b185-b790c5d6b78a@redhat.com>
 <20210310173044.GF6076@merkur.fritz.box> <YEnK9rgRRz+0qyGh@angien.pipo.sk>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7384fb64-49aa-2b20-34cf-794f642e558e@redhat.com>
Date: Thu, 11 Mar 2021 09:16:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YEnK9rgRRz+0qyGh@angien.pipo.sk>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/03/21 08:47, Peter Krempa wrote:
> And for an interleaved list:
> 
> -object memory-backend-ram,id=ram-node2,size=24578621440,host-nodes=1-2,host-nodes=5,host-nodes=7,policy=bind

Uhm, I doubt this works?  I would have expected "host-nodes=1-2,,5,,7" 
instead.

Paolo


