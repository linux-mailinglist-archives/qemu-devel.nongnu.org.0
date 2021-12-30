Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8144820E4
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 00:46:25 +0100 (CET)
Received: from localhost ([::1]:52528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n357n-0006d3-KU
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 18:46:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n355s-0005ob-5H
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 18:44:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n355p-0005v9-3U
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 18:44:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640907859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WuQrebXlWYvPYnP3xtEE5R+lHpPs6twXsULRdhshnz4=;
 b=HeCEtdmYh+5FG+7WtdHtVvPInbJkS7niIok1AQMt7h5ID5pcJbBK0JY4094/fAm7bzbA8s
 2k6LjNjh2vl0pQeX2f9ZIsmdmJL5gGPRx2aIYg6LXNHOJVk9Ogihb3VVFixaU3PtIGWBkD
 TD25Yy0Bjiv/jA6boKMJWhEfLwEgJbM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132--cJj0_N4OBiieHQteASPgg-1; Thu, 30 Dec 2021 18:44:18 -0500
X-MC-Unique: -cJj0_N4OBiieHQteASPgg-1
Received: by mail-ed1-f70.google.com with SMTP id
 b8-20020a056402350800b003f8f42a883dso10733696edd.16
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 15:44:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WuQrebXlWYvPYnP3xtEE5R+lHpPs6twXsULRdhshnz4=;
 b=Rfsknx/d2/HwayTtHAn5AyxqiXODHMBiWcnnJRsiTQBUxWLoMuWciUBS+gjuH1QVMQ
 dBVBWaTy/QX+mk6Gu6E08lqDVCdfayQGiuZlMlujY4mhdJ9JSixN30XJejg2ypFzT1I+
 bmbQzDMP+QiVa/0tusbjWN0H1apKGjpd3txcFkU+ZHtCvMbK1TeZF81PsbqeJZbtXoRf
 2MN6oPdyXKvkLj4V5b2HPE1zAN6DFhiXCAd97H2xhdY4lvpFYSd21sxWYMXlA2Y2hy6H
 ZVvVpH/+66J8KGt61a/TSWUxfndczISBdNK1rXCZphwFw23lWmFmJqpKzeRWdLaI5xSu
 h1Qg==
X-Gm-Message-State: AOAM532kIMoNLykVLjnpw3NXokTA9jrRlpCLFQ1LJlXpQDTuT7IT1LPd
 NMR/rKtXYKGFrsBo8jLgzrXsz9h9YzsuEIkAofYi1iHE8q58NMCt/vrQ4pTxU2/KXE2LXyE/BGT
 b+tDnp2mPWL8uTAM=
X-Received: by 2002:a17:906:eb04:: with SMTP id
 mb4mr26031021ejb.27.1640907857511; 
 Thu, 30 Dec 2021 15:44:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdrommw9ud+rlhWsLKIJ+l63GhFOhfErrfOJQ53M7ht/6uq8IrV85jat9d8Z0IsufZ855VNQ==
X-Received: by 2002:a17:906:eb04:: with SMTP id
 mb4mr26030989ejb.27.1640907857199; 
 Thu, 30 Dec 2021 15:44:17 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id hb17sm7928654ejc.195.2021.12.30.15.44.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 15:44:16 -0800 (PST)
Message-ID: <20f8a371-53ae-ec92-1d44-f8fa530934e2@redhat.com>
Date: Fri, 31 Dec 2021 00:44:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] MAINTAINERS: Change philmd's email address
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211230145822.441358-1-philmd@redhat.com>
 <a626e131-fc12-c787-e21f-84fbe6be0898@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <a626e131-fc12-c787-e21f-84fbe6be0898@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Kashyap Chamarthy <kchamart@redhat.com>, David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/30/21 23:00, Richard Henderson wrote:
> On 12/30/21 6:58 AM, Philippe Mathieu-Daudé wrote:
>> +Philippe Mathieu-Daudé<philmd@redhat.com>  <f4bug@amsat.org>
> 
> Actually, it looks like the mailmap is backward.

Doh of course >_<

Thanks for catching it.


