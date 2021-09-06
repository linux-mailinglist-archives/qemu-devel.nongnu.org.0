Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D9E401AA1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 13:36:32 +0200 (CEST)
Received: from localhost ([::1]:38214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNCvP-0001F6-Ge
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 07:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNCtm-0000K2-Er
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 07:34:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNCtj-00087N-OP
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 07:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630928086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BUj1JbQWjsSOoouppYCpQSpoL1YQ5jl2sbpzyGQGt2E=;
 b=UhVoj3Jy+xjQb4sRkzkCe4Rpr4/xIpBCsnUWmpmDTx049gxPhXl4EPLzOjW54yKsQSHA+d
 SISNV40TbU68ROJCnya1QdHWI7asWSuLg1jgD+WBcnUXZxoqRGwUVvKhecU6p22YFzPiEm
 XTgk0SlPcjIFRGorbm8eXgyu0ayZ8w0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-AgQyqCzjN3CI1HbSQ5ChjA-1; Mon, 06 Sep 2021 07:34:43 -0400
X-MC-Unique: AgQyqCzjN3CI1HbSQ5ChjA-1
Received: by mail-wm1-f72.google.com with SMTP id
 v2-20020a7bcb420000b02902e6b108fcf1so3788536wmj.8
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 04:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BUj1JbQWjsSOoouppYCpQSpoL1YQ5jl2sbpzyGQGt2E=;
 b=Q/sAmV4mdztpORc1IfNYatFLMV161NdDuuxoppubGbui7gL4r1WOyOnU7/xaudcl4G
 WhyTYhzO6vNqxakByVDtAgsMWf9tW281FrP45BIyinuJMqKnyr7719nmcNywhvSvHnb0
 5ydoieSoDXl9V1LG21ZrpdMqyI6JX7COJ8x45GCJc6gdXz7J83ydj70l/D4BdL1vrrNU
 KGSWPZYZjPX0tcDTWRVTynhYZr8iBdAl5jNCONJqVl3LHKlK4YQt7IBzraOAaGRVxXBG
 A7vqstxGJ0beiAGx//caoSRWk5ldJeBrBp3zdq9BYUCOsVOyu1N1cbfPpZCHpC9ooLiX
 mn7g==
X-Gm-Message-State: AOAM5336A9mFltJLSq8zBSnqRifOJuEN4y4UGwk8w7aL2WnSDOWyZ/on
 4ULQTZaeDyxDzk+AHPp4fLk4oFxW18j5o3MoFZ5PXGPY9uPLWmiVg29hOqDiGbeQY48QsR3MFFO
 pzUBr+SAMvwJSilQ=
X-Received: by 2002:adf:d193:: with SMTP id v19mr12879556wrc.377.1630928082480; 
 Mon, 06 Sep 2021 04:34:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfqGhhQdVKn9eqyOFxCG+9kHfSqf0OUauKa8kMv+YT9bH3rbhLeAj9xS/i5D8LLT7HsBFlLQ==
X-Received: by 2002:adf:d193:: with SMTP id v19mr12879546wrc.377.1630928082294; 
 Mon, 06 Sep 2021 04:34:42 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id n5sm6924234wmd.29.2021.09.06.04.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 04:34:41 -0700 (PDT)
Subject: Re: [PATCH v3] qemu-sockets: fix unix socket path copy (again)
To: Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20210901131624.46171-1-mjt@msgid.tls.msk.ru>
 <CAJ+F1CLcSZ_zE8oMZz3k_WCSOvf50hapGCu-dfSd9RxzzVhumA@mail.gmail.com>
 <165d60fd-c91e-7b03-3ec1-21f50760ec05@msgid.tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8929531a-c763-f01b-4a3a-70c1a0dd97cd@redhat.com>
Date: Mon, 6 Sep 2021 13:34:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <165d60fd-c91e-7b03-3ec1-21f50760ec05@msgid.tls.msk.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/6/21 1:25 PM, Michael Tokarev wrote:
> 03.09.2021 19:04, Marc-André Lureau wrote:
> [qemu-sockets.c unix path copy fix]
> 
>> Daniel or Michael, or someone else queued this already?
> 
> Nope, at least not me. I can send a pull request with a
> single fix. Is it okay?

Certainly, but you could also pick the latest patches
sent to qemu-trivial@ already reviewed ;)


