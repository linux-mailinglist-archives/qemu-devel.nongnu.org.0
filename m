Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28396286EF7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 09:04:50 +0200 (CEST)
Received: from localhost ([::1]:58808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQPyr-0002fj-5o
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 03:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQPxa-0001ox-9V
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 03:03:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQPxY-000378-J0
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 03:03:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602140607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T6r5IcrvRAExtP5GBvZoHU+VNmaV4IjXErY1ALzgevs=;
 b=hu7/pa3yF14M9I+unNl73RdfwX8wv4pCUo92B7WITtn7fh8lOosTiusP233iseyPmo9RTO
 bgDavdkIJyZp7Cfo9LFDYH1548iUdtswG3kxoHQohnIys1OWbWccl0s+fkbHi3a/FV9xQ9
 u1kdk5X7fshSyv9UlVTP/g6ej/YXluY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-eFbzYNGDPWek3Q0uUIf5Hg-1; Thu, 08 Oct 2020 03:03:26 -0400
X-MC-Unique: eFbzYNGDPWek3Q0uUIf5Hg-1
Received: by mail-wm1-f69.google.com with SMTP id d197so2813947wmd.4
 for <qemu-devel@nongnu.org>; Thu, 08 Oct 2020 00:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T6r5IcrvRAExtP5GBvZoHU+VNmaV4IjXErY1ALzgevs=;
 b=ehrmFFgIMHQ8vgnJJqocrrWA+SLSVbx30y9WT7ER496YUJIw8/WaXm4+TcVXTTxVac
 Bd+vDh3LfVxtOf1eD3RJbvJbN4t6rHHXulnG31M0KQ9JK2SIe9jHTYIhuW/O4WJUBv9r
 +4CwqeIsrUL+wgKRypeC3hxSGKODnxxHDg6Eam58IznUeUiAwGegOdHHrqfB1Z5pg+Ba
 r9Y3BnqBv+uerx1Q5W6PcVDouNLaeNN+F08+IKQQWSME4Iiu3dKOtFTdJl8/PmYKVmKz
 VBqSVGSsELskCgmNoXlZlPCckFKW0PK6JUXM/xJngji14uk/29iS81YAqltWi7+DGQQu
 cfRA==
X-Gm-Message-State: AOAM532b6SevCW4kjPlVUcUk/SCLFn8jh1uMCG7rrKebq8BGe5A9/BcU
 oKU9UpXfJ7w2VfOYBHDcKzzawPbjukVAPfTpYZAAJuoP7OogC/hpuWBo73B9/XaeEEn/y7a8ebf
 RvrxqxWKIfVlF7V4=
X-Received: by 2002:a1c:4056:: with SMTP id n83mr7051281wma.186.1602140605168; 
 Thu, 08 Oct 2020 00:03:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4qNTMsJIfn+OZ8nU3fzyCuf1lUE/rR6+mw151HFa+CC15xf2zOYWa7G9qhaK0bZyWjxxcOA==
X-Received: by 2002:a1c:4056:: with SMTP id n83mr7051254wma.186.1602140604910; 
 Thu, 08 Oct 2020 00:03:24 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:bb8c:429c:6de1:f4ec?
 ([2001:b07:6468:f312:bb8c:429c:6de1:f4ec])
 by smtp.gmail.com with ESMTPSA id p21sm5606425wmc.28.2020.10.08.00.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2020 00:03:24 -0700 (PDT)
Subject: Re: [PATCH v3 02/16] fuzz: Add general virtual-device fuzzer
To: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20200921022506.873303-1-alxndr@bu.edu>
 <20200921022506.873303-3-alxndr@bu.edu>
 <63ca7622-557b-4217-f15e-ee9b024fbd77@redhat.com>
 <20200921143405.3taiymgzwvscxsry@mozz.bu.edu>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <74511624-33ed-ff5d-62c2-f9b2b632b39a@redhat.com>
Date: Thu, 8 Oct 2020 09:03:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200921143405.3taiymgzwvscxsry@mozz.bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 02:56:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, darren.kenny@oracle.com, bsd@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/09/20 16:34, Alexander Bulekov wrote:
>> Can you fuzz writing "FUZZ" in memory? Like:
>> OP_WRITE(0x100000, "UsingLibFUZZerString")?
> No.. Hopefully that's not a huge problem.
> 

Instead of always looking for a separator, can you:

1) skip over it if you find it naturally at the end of a command (that
is, "FUZZ" is like a comment command)

2) actively search for it only if you stumble upon an unrecognized command?

In that case, if you have

  AbcFUZZD0x100000UsingLibFUZZerFUZZ

The first and third instances would be ignored, while the second would
be part of the input.  On the other hand if you have

  bcFUZZD0x100000UsingLibFUZZerFUZZ

"b" is an invalid command and therefore you'd skip directly to "D".

Paolo


