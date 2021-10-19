Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F7143348E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:18:38 +0200 (CEST)
Received: from localhost ([::1]:36634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcn8f-0005tw-PH
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcn4L-0003Oo-U2
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:14:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcn4K-00031O-BS
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:14:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PY1UBN+z0IyXg5lfdapdgy4zMHImy9GZ7yuSsld5Gwo=;
 b=atXGGw/Qf42Zuh9Par/HMQ0y3Lq21RQf458biUH2vT04WJvKdR/URCefIu6gv/jegLjxsb
 f8Sdx4ALAwr/7d/I3fIEji0xwkqJmyqCM00IpxsCcbZE0UJlr2Noa1S3PyZydznHi3RP+t
 TLhbv5sgp93/Q3Z46z8jJGBJ+7nIL9s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-leb4IlhpMnyBpMxxl_MwkA-1; Tue, 19 Oct 2021 07:13:57 -0400
X-MC-Unique: leb4IlhpMnyBpMxxl_MwkA-1
Received: by mail-wm1-f72.google.com with SMTP id
 s25-20020a7bc399000000b0030da0f36afeso1029168wmj.1
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PY1UBN+z0IyXg5lfdapdgy4zMHImy9GZ7yuSsld5Gwo=;
 b=tEGnrKTh91jsc59kprw6HRoPd41qWCBqJlHeC9KJ9CSpJqOz8k/mukv1xbMAfe1c3z
 Ek5UecsJOiWlohH7uGMEOK8blutxV/ixGFBbwrnFRS6+pNVO+B4SXLfOQmgHLwuVGk0X
 XtJHu913VvYXyu+Sh5k+BlafBeDbh5a5i5UijkFetLXhlnc/uLGvloei9KdtF1aXXLDp
 haSXpmGE3srkLZG+hAGpBxl5jfxoH1wa4sDPIauO9wXL4VU23wWqUBZZyQMTBMmNaRBy
 JcCMcxj2/HkEMBC55AOVhTeTKUXjWctdnritE+wAZkKTj49HJCOjB9jGd/tR+2s74ms+
 Po2g==
X-Gm-Message-State: AOAM5320X4vx3bVNM09iE3rEnpJhiTai+4diVeeKRcyhy/A2xWB5CRMC
 ls1Py6Ppb68Wuv1rYkS6dW31OhWcR5oenguYboyzxvgn3FUk6zxfLmbCO5eeeSeFTO7WAo8TFP7
 KmGVSD0BTKKsbSJY=
X-Received: by 2002:a05:600c:4fd3:: with SMTP id
 o19mr5267245wmq.147.1634642036004; 
 Tue, 19 Oct 2021 04:13:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxurVvDePB6ObfEDgYD+Q0mqbiMq6SRmWSLWvu1ZlLsi53820I4x4KdOCXLY8Wdm4LauDfoiA==
X-Received: by 2002:a05:600c:4fd3:: with SMTP id
 o19mr5267223wmq.147.1634642035849; 
 Tue, 19 Oct 2021 04:13:55 -0700 (PDT)
Received: from [192.168.1.36] (121.red-83-53-160.dynamicip.rima-tde.net.
 [83.53.160.121])
 by smtp.gmail.com with ESMTPSA id k8sm1272545wms.41.2021.10.19.04.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 04:13:55 -0700 (PDT)
Message-ID: <7fe8ecee-167a-86a4-5f65-6b08c29194f6@redhat.com>
Date: Tue, 19 Oct 2021 13:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 4/6] docs: rSTify the "SubmitAPullRequest" wiki
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
References: <20211019090344.3054300-1-kchamart@redhat.com>
 <20211019090344.3054300-5-kchamart@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211019090344.3054300-5-kchamart@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 11:03, Kashyap Chamarthy wrote:
> The original wiki is here[1].  I converted by copying the wiki source
> into a .wiki file and convert to rST using `pandoc`:
> 
>     $ pandoc -f Mediawiki -t rst submitting-a-pull-request.wiki \
>         -o submitting-a-pull-request.rst
> 
> This is a 1-1 conversion; no content changes besides updating the
> "KeySigningParty" linkt to the rSTified (HTML) page.
> 
> [1] https://wiki.qemu.org/Contribute/SubmitAPullRequest
> 
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
>  docs/devel/submitting-a-pull-request.rst | 79 ++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 docs/devel/submitting-a-pull-request.rst

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


