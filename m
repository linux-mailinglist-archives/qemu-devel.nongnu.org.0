Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795CA296112
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 16:42:27 +0200 (CEST)
Received: from localhost ([::1]:55844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVbnO-0007QR-Iv
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 10:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kVbm5-0006n5-Am
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 10:41:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kVbm1-0005W3-OE
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 10:41:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603377659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8WvqbHVYogtLzlHc/a3Kgy8w9owMRFq4ObfFfOYCJlQ=;
 b=TNGTh1BXmlmzEtYxkhiVwQFfNBskCBUKiYgS8Amq3sz1ugM9beeb0k8X6v2R6bhns70VNl
 2K2ShO/rV6SKxwoS1bZKTYqtcJMe6OmP5KiS2e6Ckb/cwp0WTmaR5yY2q3HYGLV7BluX5O
 jS9mtUmJXlilCMwVjyFCgQ4yFitpfZo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-oM9Bl81GMiihA7jaULC4CA-1; Thu, 22 Oct 2020 10:40:58 -0400
X-MC-Unique: oM9Bl81GMiihA7jaULC4CA-1
Received: by mail-wr1-f71.google.com with SMTP id v5so721363wrr.0
 for <qemu-devel@nongnu.org>; Thu, 22 Oct 2020 07:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8WvqbHVYogtLzlHc/a3Kgy8w9owMRFq4ObfFfOYCJlQ=;
 b=kUBANr115IuaVx5j2TCiPtfE18dpC7QKSj9zuzFB82lVPFL/KuSo+my82i25AIHanx
 F7uwMkZWgW1G32VbY2NIxZ5y/hiAmpkn24Yb+BvPh6w9lxUlVujFHLbXaeyKeBtjOa5V
 +WG4lvLTAe760X7G1tdLVeGBlCfeevpiOKkgzQ7DUXRJk18+WB3jziFPQe77X/TOyy7Z
 k3vAEGjB41nfTShciSXwzmi4VZzoYZMxBpTPia9WhXllT/8TjCimVBwVNcHCyKu1DxDB
 Tm4RJmnBhdfFRh/7JfN/n/fByTnreOo/YgLXP+4KWnLfjgEiYgNLVN2lJbj8m+omDCs3
 mbvw==
X-Gm-Message-State: AOAM531SL6GbTAsslICM8O2B9MPlIJlg3y3mtXBZmAPMYDsHEWT3gJo9
 dVKWGmdTPsyOmNre2rDid9glCH1irs+c285Dzoqqad+VUrZ/dqwoAuVIku6ZGdW2oGJNieWIGbU
 q3wKHpZZsYol6VgI=
X-Received: by 2002:adf:9c19:: with SMTP id f25mr3041471wrc.366.1603377656927; 
 Thu, 22 Oct 2020 07:40:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxa4FL98fkGVyL7mwGAoI1dwHbhQjOUjxEdq2m+u2fzW+0UUblWr8HNfC10UITJTrmLzOybtA==
X-Received: by 2002:adf:9c19:: with SMTP id f25mr3041444wrc.366.1603377656600; 
 Thu, 22 Oct 2020 07:40:56 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id x1sm3900666wrl.41.2020.10.22.07.40.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2020 07:40:56 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Cover "block/nvme.h" file
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200701140634.25994-1-philmd@redhat.com>
 <ccdce593-67fc-1ed5-c05c-c64d45cf5515@redhat.com>
Message-ID: <9dba9f82-4a08-ce73-61d7-0a5740df42ef@redhat.com>
Date: Thu, 22 Oct 2020 16:40:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <ccdce593-67fc-1ed5-c05c-c64d45cf5515@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 08:09:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.107, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Niklas Cassel <Niklas.Cassel@wdc.com>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/22/20 4:20 PM, Philippe Mathieu-Daudé wrote:
> Cc'ing qemu-trivial@

Bah it doesn't apply anymore, I'll resend.

> 
> On 7/1/20 4:06 PM, Philippe Mathieu-Daudé wrote:
>> The "block/nvme.h" header is shared by both the NVMe block
>> driver and the NVMe emulated device. Add the 'F:' entry on
>> both sections, so all maintainers/reviewers are notified
>> when it is changed.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>


