Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0AD37F4F9
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 11:43:17 +0200 (CEST)
Received: from localhost ([::1]:47374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh7sC-0006CR-CM
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 05:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lh7pc-0003lz-Qs
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:40:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lh7pb-0005dQ-Bc
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:40:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620898834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j82ZkLzh/D7kzd1upQ/a9mFg58NnlifBLHCZV9jMksE=;
 b=SsEmqSgTot8xKz0n6XO3XjPQzdqqd3HcSvyuhGE293uGEu8DKqTRlJaX0V0pwr31zfekCv
 lairU61WArHcmQ8k/JwOFFUMaH5LSCWWRo7ecm8nwgbFPQlIMOKDIHZ7NiSTpu2ejK8vhv
 ATCtqrM2QDP0O+q9sv1atkGaBcfMHgw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-ecv1XyvONDKHofSPtKrxWw-1; Thu, 13 May 2021 05:39:52 -0400
X-MC-Unique: ecv1XyvONDKHofSPtKrxWw-1
Received: by mail-wm1-f70.google.com with SMTP id
 r10-20020a05600c2c4ab029014b601975e1so543448wmg.0
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 02:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j82ZkLzh/D7kzd1upQ/a9mFg58NnlifBLHCZV9jMksE=;
 b=CjFncc0tFw4TQ+5Pz4XevchY9yd4X0szm1A9SzVOagO85yNKnPIVNcqRB5CYGkSeH8
 TgEgalzAU23katDAbD8fDjWHlYZ545UDf4nW7FJNPApLUqcYAYAgmHN7tZ4m/fTkqNH0
 HcpZc+f+OdDdK1/gpb1uE/wKn+b/gOilT45F1CO8Ax/fT41RLd43xHzNyrhPoiyTX13k
 RB+6FG+CpV1Wgqzvc6xJ9UeDH8kcQ0tXS+nuURL2L+5Rwnpp665MIo0atbAUQYJeqxLK
 US88aVLE/9aDz7frq5d6PGboBrZKT0De6jwY0cM10FaqSR8vxWNLo0au0YmusHNqZCL9
 iopg==
X-Gm-Message-State: AOAM531PuNqhI6GhzAWW59y3JyZgdW/7MV5WHg6NaaCDIwqY25XIa157
 dnswOwdiCIXCe6qzV70CIQna+rtbsyg/IwLZMkPAgNWXRkercC/5W2PUG0vollVCNFNcJWEwizz
 Cz4gPhhTTdhfRsOk=
X-Received: by 2002:a05:600c:4e8e:: with SMTP id
 f14mr406029wmq.65.1620898791669; 
 Thu, 13 May 2021 02:39:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRWjDIMQXi4Lx7clRDwrPXeXp/5gMzv7Vir+AQrD8z8t9Xl2nFOYzf6EFySKcrEByVcQqdeQ==
X-Received: by 2002:a05:600c:4e8e:: with SMTP id
 f14mr406024wmq.65.1620898791551; 
 Thu, 13 May 2021 02:39:51 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id k7sm2354713wro.8.2021.05.13.02.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 02:39:51 -0700 (PDT)
Subject: Re: [PATCH 02/10] python/machine: use subprocess.DEVNULL instead of
 open(os.path.devnull)
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210512214642.2803189-1-jsnow@redhat.com>
 <20210512214642.2803189-3-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d917e1a9-3a80-8274-4f9f-4dbae0e637d1@redhat.com>
Date: Thu, 13 May 2021 11:39:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512214642.2803189-3-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 11:46 PM, John Snow wrote:
> One less file resource to manage, and it helps quiet some pylint >=
> 2.8.0 warnings about not using a with-context manager for the open call.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine.py | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


