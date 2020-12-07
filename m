Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 450FF2D0DD1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 11:12:15 +0100 (CET)
Received: from localhost ([::1]:56446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmDV8-0003lR-Az
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 05:12:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmDTK-00032f-Lx
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:10:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmDTH-0006oi-3l
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:10:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607335816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Ddxe4xvUIGJJMeynby9uaDyu2BewimwNMpz5+/BwHs=;
 b=O3j1fFDKRO1CMbRgpPwMJtyN9Oh4hhYVeKYjyDJuppHBXatdpHYYzdnjMGVEuCPd713Y1G
 WlbcHuD/6Kj0COS9Tv8QV0QML1cvhD/pXfidbIVGf11O3ppdArJZ9krKaFRo+oc4xAoyOC
 C7llD2Wk2qkAXmgfCH1ymEkbIks3J50=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-SQqfn9myPgOkkoiMu-KmZA-1; Mon, 07 Dec 2020 05:10:13 -0500
X-MC-Unique: SQqfn9myPgOkkoiMu-KmZA-1
Received: by mail-wr1-f70.google.com with SMTP id n13so4684779wrs.10
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 02:10:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2Ddxe4xvUIGJJMeynby9uaDyu2BewimwNMpz5+/BwHs=;
 b=iwKv9y4JrGHXAzamDWs31scLAhIp8daSIk1sxlPBksUxty+5LeGNVNern/K7D0D71P
 nHWG5FI9qvho7NpZQW/uiJanP84dGF4buEAXwX+YbvBQCwIq5IBmpCKnrWmxlAUl0xY+
 6f9a2KaaSQmTim7QkWT9VknwaxZrCCu0f920o7z3SA/2VIcyl1H5VYjI7lossxCIBSwg
 jvxjNDof5azcQ25V+w8Ova8JZBxUOohHZfNPec8D9U2h63qA3D8AdDIweLzE9XcIhsEO
 kNLF38IEiuqJs+f40HGj/VK3uW0KUMCApoMzFzUn8LhUvalesSRt0NgcfeFwl8dfp6jR
 e7Jg==
X-Gm-Message-State: AOAM5301tCf6oAv81TikUyVYlhcFns+kwMWaJm3UUpOUYt/J1z0kZZFh
 iUlMGow6F72kX9jQvNuDpyG0m1pMTFe3fcMrQZvulJ6a3WtReRoEc5kBHQXnMUC/ZEEsbN5CqiT
 z9e3sw8MWg5qcCaxRJ+ibnpOHmcNnxYYG8G/UdOr4yCUYKFbmcqnqmoiZB7JBGyD0
X-Received: by 2002:a5d:65ca:: with SMTP id e10mr18883675wrw.42.1607335812388; 
 Mon, 07 Dec 2020 02:10:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxptT3ox+Pz5ZNsOFSVweensKf8YOstLhbVYSAg/aiOLCaAIn06pl5xA6UldXZomKJEO+Yn8A==
X-Received: by 2002:a5d:65ca:: with SMTP id e10mr18883641wrw.42.1607335812077; 
 Mon, 07 Dec 2020 02:10:12 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id z17sm7819764wrh.88.2020.12.07.02.10.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 02:10:11 -0800 (PST)
Subject: Re: [PATCH] crypto: Fix some code style problems, add spaces around
 operator
To: shiliyang <shiliyang@huawei.com>, berrange@redhat.com
References: <eec07863-d8fa-1ad0-5b64-4683d48478ab@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d0196f04-a286-c36b-d88e-0a3f8de8f599@redhat.com>
Date: Mon, 7 Dec 2020 11:10:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <eec07863-d8fa-1ad0-5b64-4683d48478ab@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, PDS_TONAME_EQ_TOLOCAL_SHORT=1.999,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.chen@huawei.com, hunongda@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 9:37 AM, shiliyang wrote:
> This patch fixes error style problems found by checkpatch.pl:
> ERROR: spaces required around that '*'
> ERROR: space required after that ','
> ERROR: spaces required around that '|'
> 
> Signed-off-by: Liyang Shi <shiliyang@huawei.com>
> ---
>  crypto/aes.c          | 2 +-
>  crypto/desrfb.c       | 2 +-
>  crypto/tlscredsx509.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


