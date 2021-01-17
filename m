Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E532F94B8
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 19:50:12 +0100 (CET)
Received: from localhost ([::1]:60368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1D7q-0000RP-QF
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 13:50:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1D5f-0008KT-DQ
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 13:47:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1D5c-0000zV-Rx
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 13:47:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610909270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NdslTc1+YflLRsnXwX3+LOi/U8eCVZ+j3W9KREdE2iY=;
 b=c5HNGtPIVcHPcT65+Vy+YqqXBux++bGwe8uF0aqRtBdlWI58UCuUqt9xnFjJx4Ka5Qy3xq
 7czXr+FukmOKLYD2wcY4hOWPWNDInejbt2Wm+/aXNBZ9JgeiGk8aBD+C+4cxm65UPNowzu
 GROiZWrZNKC2UdfxlipRPZU6Lo+4iAc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-OQU24iiuNbW7yxOJ2NoA5w-1; Sun, 17 Jan 2021 13:47:49 -0500
X-MC-Unique: OQU24iiuNbW7yxOJ2NoA5w-1
Received: by mail-ed1-f69.google.com with SMTP id f21so6477955edx.23
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 10:47:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NdslTc1+YflLRsnXwX3+LOi/U8eCVZ+j3W9KREdE2iY=;
 b=n1Ns+tcHL+IGz7o5jx6tQiCJ1tESQMU9xuBoxvLWZqObJVw04RPYIa5paQ4lsf8X4K
 OYOL4e8YSX+BCDbgUh8F/3IGyhjwmWmftNc/T17T451IRUpO+itXITCYb+FXAUdQoR12
 Ney/6egl81rTD0yFcf4Gon1LGHz83Ytn7iOmauC0QLm7iubfP7AjHYJnu10ItEUrxI0Y
 PkniHazK/oEI81T5sfsFq9+uJwjq6WyVq3C0+ywoPc4wVBCIuVMlDN9+eK6PZPmIIapG
 12qcDi5xWqFop4LdvRSIh02DhjXVhfzm4mthsKPVZCRg2xdEVZFBJvRFdxsv8LmsMec5
 9AgA==
X-Gm-Message-State: AOAM532a7k1Z84rDF1h1AiYrLJc7L0q4TFawFK/Z4yAV9pcw5tK9jVny
 hklFoha3zo3Xi9aQ2tLflPqtBxLGWthdQPadqnMESGSPNueG0uHT/bFuc3KnrTf7N5SXD09c8Oc
 3gpEt30rzcJzf2UI=
X-Received: by 2002:a05:6402:3582:: with SMTP id
 y2mr3454864edc.345.1610909267747; 
 Sun, 17 Jan 2021 10:47:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwu3exTlnfmae6xUtDaFwpNi/Wl6jUr/dE8mRMUVAZtvu+VH1chnyDHcalNVwUGEAf4DmDvEA==
X-Received: by 2002:a05:6402:3582:: with SMTP id
 y2mr3454853edc.345.1610909267580; 
 Sun, 17 Jan 2021 10:47:47 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t9sm8453609ejc.51.2021.01.17.10.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 10:47:46 -0800 (PST)
Subject: Re: [PATCH 1/4] tests/qtest: Remove TPM tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210115150936.3333282-1-philmd@redhat.com>
 <20210115150936.3333282-2-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d26e4d3e-b20b-75f4-3c0a-6409ce91e2f4@redhat.com>
Date: Sun, 17 Jan 2021 19:47:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115150936.3333282-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@gmail.com>, Hannes Reinecke <hare@suse.com>,
 Alexander Bulekov <alxndr@bu.edu>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/01/21 16:09, Philippe Mathieu-Daudé wrote:
> |The TPM tests are failing, and no further tests are run, making the 
> rest of the testsuite pointless:|

Just use -k when running tests, it's a good idea in general.

Paolo


