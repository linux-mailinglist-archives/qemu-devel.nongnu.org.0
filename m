Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81D52F3B8E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 21:38:30 +0100 (CET)
Received: from localhost ([::1]:40980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzQQv-0005Fm-09
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 15:38:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzQOo-0004B3-0Y
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 15:36:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzQOg-00074L-2q
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 15:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610483767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BqCCUCWWHpZtfBK55+rhynC3iVExoFkueIzQVti/v8U=;
 b=KyuOYPONEf+XimWjugN3jpTnnQw1Oa9NMkCM7x+nI6CFVEMdNAAjNFyiszKT2WcfqQ33ug
 PW7Uy3RpV1sZjCW2yjbDLSt1p/nY35zclexrrjomY5zALbfQlxl7MTqmpqeXf/0Br7QAU9
 JcYj7/wTY72+qCVHX+PDxNwuW/dghqw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140--VzBQ8S-NCWCJDW9o6oYHg-1; Tue, 12 Jan 2021 15:36:05 -0500
X-MC-Unique: -VzBQ8S-NCWCJDW9o6oYHg-1
Received: by mail-wr1-f72.google.com with SMTP id g16so1701490wrv.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 12:36:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BqCCUCWWHpZtfBK55+rhynC3iVExoFkueIzQVti/v8U=;
 b=TYlqmWrhocnMDOwH+oXZ9li/5IcntQhHfgCgrs+D9/PTvcPiyxDJfSTWiZPbPQC+Ga
 3GREpQHN9Qde9tjYqYnQJDrgmvaPJZLfiE8YRQtlOevSBnTYPO1KHsF6F2RVwuMw8222
 2DNvY2H9ttGAGqiElv5C65NDdzyXLF9GCNO3qU2oXffJgYk4e25mgpl3+8bT2PFZdscA
 SueBCYgutGlCWRs+dETutv/++FdGNyoIrTb8+dX2tRpksPCKnQviXvblR3HdbZg2zOfg
 XptLotay7I493e4x9mtMrEF805KTuZoaFHpRW3OVNySZgqRcsih0GWYzSzwVDqHedwkr
 AAvw==
X-Gm-Message-State: AOAM532YebUMJx2IOMj0rHnw2gmTtWcXhQABlw7YA3obTx8ZQvEgOjt0
 iWvut1tsHnor/RzAWH8LF7vcOswjQSiTOjaDVYvmngYF+H2HJAEXjV0htJNFCQ6yTRS6r/nCpHQ
 48KEcs0FlOYoYM2M=
X-Received: by 2002:adf:9525:: with SMTP id 34mr572183wrs.389.1610483764147;
 Tue, 12 Jan 2021 12:36:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXtdgJ6Q78WQ8BMxY1pt7MRrKf58k59WJ7Xp4Z16TJg8kuYdbTueoEEVnUPKrO95xg3AwYMA==
X-Received: by 2002:adf:9525:: with SMTP id 34mr572158wrs.389.1610483763847;
 Tue, 12 Jan 2021 12:36:03 -0800 (PST)
Received: from [192.168.1.36] (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id r13sm6425400wrt.10.2021.01.12.12.36.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 12:36:03 -0800 (PST)
Subject: Re: [PATCH 1/3] tests/acceptance: Move the pseries test to a separate
 file
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210112164045.98565-1-thuth@redhat.com>
 <20210112164045.98565-2-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9abfea47-e1d5-72d1-57c0-fa1132811dcc@redhat.com>
Date: Tue, 12 Jan 2021 21:36:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112164045.98565-2-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-ppc@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 5:40 PM, Thomas Huth wrote:
> Let's gather the POWER-related tests in a separate file.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS                            |  1 +
>  tests/acceptance/boot_linux_console.py | 19 --------------
>  tests/acceptance/machine_ppc.py        | 34 ++++++++++++++++++++++++++
>  3 files changed, 35 insertions(+), 19 deletions(-)
>  create mode 100644 tests/acceptance/machine_ppc.py

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


