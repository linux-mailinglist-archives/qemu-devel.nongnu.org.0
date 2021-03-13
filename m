Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF987339CA1
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 08:48:28 +0100 (CET)
Received: from localhost ([::1]:59468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKz0d-0002JD-PM
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 02:48:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKyzX-0001rb-RH
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 02:47:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKyzW-0002s2-36
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 02:47:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615621637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8QRxCuTXkiweQREi9Pz+lo9WleL3Kgtd9GcZXLdLvY8=;
 b=KEYPBXhvgefWGTu2MiS20CwKe3sT+awzUATMbkkzb8n+l53Glz/xcHYzKHhgbMpMryqUXK
 B0quc3d+x3b9ybniwrl/4qCC0p7Sa1zaIeCMWrzqZXp1oZiSz+A4pCI/8+ROoTp42QoAQX
 GxdHi/iCOLW77EtmIBAcXdD/Npvv6/A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-CJy0s1hHPRimILSLLvMBGQ-1; Sat, 13 Mar 2021 02:47:15 -0500
X-MC-Unique: CJy0s1hHPRimILSLLvMBGQ-1
Received: by mail-wm1-f69.google.com with SMTP id s192so6200054wme.6
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 23:47:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8QRxCuTXkiweQREi9Pz+lo9WleL3Kgtd9GcZXLdLvY8=;
 b=d2xtIJS/l7MngAq47/4JHa7tekfbsw672fjQhxPC+FJuHHRqtrTpC+SB+u6zGP0gDk
 gh6sL407nFq1CXaEtGYpCwRlLOwv5GvzQO7++oD22dI3AmTN2bOAzu9517QQJTGJdSM6
 NMBMDSRoo2mdOXrTsnnOOBKxCBatKgWOdXyZg8FedO/1jsKiRnV3A0WCgu7nTMWvi0Wg
 x0J3p7p0k0TPd4sGcU/LuOHGCoRoH2DLHI5U5bDgHxaQUXXE5oPoLKJRHBSQiWRVz2Km
 2cDm4vogL/cNApWCShrL0UhG0IYogQsL3CwlJSkKQFU6KCIPkkdG3/ptlO3l5jPrUxS4
 uTvg==
X-Gm-Message-State: AOAM532HAcF9oyPDsx8J5cg4vRrjz0U+XZ7bWERgAQ4VzU3DXlwZb30e
 Yu0fA3sBTUWHG0Jy5l8q1ECm74q6nujBlR2XyG7dMAqNCmibf8/RUpytxOCPkqFB834pQ3gYoqt
 QhfA8cDHQyGeH52k=
X-Received: by 2002:a1c:1bc7:: with SMTP id
 b190mr16833377wmb.115.1615621634595; 
 Fri, 12 Mar 2021 23:47:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJs/tcqmCODdhC7C+2v+TYxTfq8KcF5eAwwxBuRzIADsHzTnPXFqG1U0G3N8HEtWWnlbH9Fg==
X-Received: by 2002:a1c:1bc7:: with SMTP id
 b190mr16833346wmb.115.1615621634316; 
 Fri, 12 Mar 2021 23:47:14 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id p18sm13834613wro.18.2021.03.12.23.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 23:47:13 -0800 (PST)
Subject: Re: [PATCH v3 26/30] qemu-img: Use user_creatable_process_cmdline()
 for --object
To: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <20210308165440.386489-27-kwolf@redhat.com>
 <87k0qby00g.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <95899a3d-ae3e-c635-d381-502da7d1bc5b@redhat.com>
Date: Sat, 13 Mar 2021 08:47:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87k0qby00g.fsf@dusky.pond.sub.org>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, kraxel@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/03/21 08:40, Markus Armbruster wrote:
>> +                if (!user_creatable_add_from_str(optarg, &local_err)) {
>> +                    if (local_err) {
>> +                        error_report_err(local_err);
>> +                        exit(2);
>> +                    } else {
>> +                        /* Help was printed */
>> +                        exit(EXIT_SUCCESS);
>> +                    }
>> +                }
>> +                break;
>>               }
>> -        }   break;
>>           case OPTION_IMAGE_OPTS:
>>               image_opts = true;
>>               break;
> Why is this one different?  The others all call
> user_creatable_process_cmdline().
> 
> 

It's to exit with status code 2 instead of 1.

Paolo


