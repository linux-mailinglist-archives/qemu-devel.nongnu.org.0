Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6590647B445
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 21:19:35 +0100 (CET)
Received: from localhost ([::1]:58882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzP8A-0005d5-98
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 15:19:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzOt5-0005Ee-5u
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:04:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzOt3-0003YU-9t
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:03:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640030636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=93TaTbGjOIDFRdkVJrLssQTGE49G1MP2mKrt1MVJENE=;
 b=iftSFfrxqccM5xsj1r1c3B5EtVPuVo7SgydcDin9M17HxZ/0h90H8Bvry0YOgTD2jBZYf7
 StlfSyvQ84irR3h0mqVmspSZv8uYEBHxZsrxXj5hNORnJAnPlyMfQeWQIMMW2jF5XMmPCQ
 ojbfdqxAcMMGEryt3L/QYdcu7l3UBXw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-mOFAajsIPCWXY4fXLtQP5A-1; Mon, 20 Dec 2021 15:03:55 -0500
X-MC-Unique: mOFAajsIPCWXY4fXLtQP5A-1
Received: by mail-ed1-f70.google.com with SMTP id
 h7-20020a05640250c700b003f800db4193so8499685edb.1
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 12:03:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=93TaTbGjOIDFRdkVJrLssQTGE49G1MP2mKrt1MVJENE=;
 b=xdYpqQE7MpgKrvsVLG4HEMGafgnEd1mHIOQs8MVsfnTPb4t6R/NSHtoLBvgqgR389G
 wPwNV0uaZLWywOAZQwnG3Pl2xtdDBgobD2aakXRsZuxRngQyFjnZaTpsq1CodmDuh3qB
 OPqP3Ymp0oU1W+UOngOKv0M+PZBMOJ22EMx5CPLKJ73CflDbgbPofiltEmDLgBxE58Yt
 McCoYUraphJX2Yh5F7Y1ru7e92pTtzWhFYMXch5QRRhDz9AGMi8u+DAi6UR5Q5Y4HyZf
 b59hEBhDqu8A2n6RoghI9Lq6t/RGpuUsnflgJOzd1k1GSk5XQLYob7vdqD7V8XI0n+A3
 9V5w==
X-Gm-Message-State: AOAM533mqqJKN/QGiRz2vRYbgzfQRpXAlbjzuYDv/glFPzHZRO81i28E
 WBohbywCdZ6F5tIEcEtJhDQ90XMvivmdvvbrFYdhIR20uCGrPEDHImkvHCwM7rk794jE6hjU05S
 VMQBpWBp6G7H1wVc=
X-Received: by 2002:a17:906:9b8e:: with SMTP id
 dd14mr14750509ejc.337.1640030633960; 
 Mon, 20 Dec 2021 12:03:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3PjjC4dwz51l/Rtoe5kGa7LBAIrD2xbdzD+coMb882cTZ0nmw3DnfvClCEzWJJM+C/QdtBg==
X-Received: by 2002:a17:906:9b8e:: with SMTP id
 dd14mr14750502ejc.337.1640030633815; 
 Mon, 20 Dec 2021 12:03:53 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id p4sm5659648ejn.130.2021.12.20.12.03.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 12:03:53 -0800 (PST)
Message-ID: <e703d26f-a862-a239-e146-32aac5b9011a@redhat.com>
Date: Mon, 20 Dec 2021 21:03:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] tests/qtest/boot-serial-test: Silence the warning about
 deprecated sga device
To: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-devel@nongnu.org
References: <20211220164042.397028-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211220164042.397028-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 17:40, Thomas Huth wrote:
> When running the qtests, there are currently a bunch of warnings about
> the deprecated sga device during the boot-serial-test. Switch to
> "-M graphics=off" to silence these warnings.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/qtest/boot-serial-test.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


