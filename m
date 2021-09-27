Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86209419622
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:19:55 +0200 (CEST)
Received: from localhost ([::1]:54040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUrU2-0005XA-IO
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUrNg-0005Vk-DX
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:13:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUrNX-0006U1-6P
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:13:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632751989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AkDVHnzPBj3MObyhee+TcgpEOfgxkMwd9BIyBknAqPE=;
 b=Y6JOA3V+ATNHqM8qAUOew2dA+ZGx13NDbhJsYbuC9OJCl32VtdpfO5Ewehr1GV30B9ojkE
 nIW0Gw8nxOaPLqtl52CYXkBbegl5+jWx9K2u3/QEK2IwnlZjzKq/DY90hxoB2KY8oJmnMy
 bbBKq6YmCwBGDIdZAQkDIWDnqvHOiUY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-W-Q49_YWOsaCjblPp_OGTA-1; Mon, 27 Sep 2021 10:13:07 -0400
X-MC-Unique: W-Q49_YWOsaCjblPp_OGTA-1
Received: by mail-wr1-f70.google.com with SMTP id
 p12-20020a5d4e0c000000b001605e330b62so4331549wrt.5
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 07:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AkDVHnzPBj3MObyhee+TcgpEOfgxkMwd9BIyBknAqPE=;
 b=B2ZtXjdi+YapGEccucII9aat51tchZ1xlGs0eZdlpy4PylJ9zs1uw4N+ybs0FP0a26
 sFum4juxcD4eMqDrp4PPk/OEaaaCtyB/J0+IXp2R2aK3q4MVIHVr8fca372SzKx2SPm4
 O3CdLa+bhtSbbTWdZYoiqUnFvOXNylb4x09/Hfnu33mn2B/Km5cAT0mzYG9kOAtoLlQQ
 3UEzP76IrkNTUyDkwSyOdTSdFKnL7TEFX58u5y+EPZkqYW46B9+o++F9AV61Y7APyTEL
 CE3+Jaa545hmBi0FzTuPMULVp4RprREpuoeJcqhIMCDPyMpGnY5qgjUs9i8J4Q8vAqBS
 +DLw==
X-Gm-Message-State: AOAM5305N8aWq23xrESrP0am43zK82X5smV7muqgdXN/fCJNlHeO9hG5
 8zzZOt3ci7iKFngdWSyT9bS+8jZqrfbZg6g6kqw4ssS1v58unEmFSXwUvUp/HANEj5t8pe+Aj3O
 Om0Vz1SbxeDsGj5o=
X-Received: by 2002:a1c:98c6:: with SMTP id a189mr2068553wme.59.1632751985907; 
 Mon, 27 Sep 2021 07:13:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw18/bAJX8QgmyosWXafDXTae4V1uMssbCl4ElQbuQuCqrq3bZOmoD/IlqL3HSXgsMjSOUK0w==
X-Received: by 2002:a1c:98c6:: with SMTP id a189mr2068529wme.59.1632751985685; 
 Mon, 27 Sep 2021 07:13:05 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id l10sm281548wmq.42.2021.09.27.07.13.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 07:13:05 -0700 (PDT)
Message-ID: <2ec1f20b-afc2-8a58-60ae-5b53e5fd7ac7@redhat.com>
Date: Mon, 27 Sep 2021 16:13:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/6] avocado_qemu: small fixes and tweaks
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20210920204932.94132-1-willianr@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210920204932.94132-1-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 22:49, Willian Rampazzo wrote:
> Standardize the super() calls according to PEP3135; fix import order based on
> isort; fix and tweak the ssh `connect` method; explicitly return None on
> `pick_default_qemu_bin` function to avoid linters R1710; and fix inheritance
> order on `LinuxTest` to avoid future problems.
> 
> Note: borrowed https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg05117.html
>       for completeness.
> 
> Cleber Rosa (1):
>   Acceptance Tests: add standard clean up at test tearDown()
> 
> Willian Rampazzo (5):
>   avocado_qemu: standardize supper() call following PEP3135
>   avocado_qemu: fix import module based on isort
>   avocado_qemu: tweak ssh connect method
>   avocado_qemu: explicitly return None to avoid R1710
>   avocado_qemu: fix inheritance order on LinuxTest class

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


