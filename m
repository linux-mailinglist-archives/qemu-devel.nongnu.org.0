Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5651B324D81
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 11:06:26 +0100 (CET)
Received: from localhost ([::1]:46394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFDXN-0002i1-4i
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 05:06:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFDWI-0002HF-E3
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:05:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFDWG-0002tQ-8M
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:05:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614247514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qgNKamczjgEJyyL4QUzcHd3eKjeY9gccVK+M6JZFmbQ=;
 b=UXqUuQ8vJvcI7PQX8tB9KB5Kwn13dScqGnNWZ6kp3HzfuCdokrSSAt8y4Asw6qkU3sfHMN
 DQ327M5WFjjYE0y6ho06JSrF6Gxj6hEd4d9bStglyQtXZTYVhoTqhvcbp+M7AGNFOEZkt+
 nM1Pa4P/dwkz3kGpfVYmjvI0RTAcSKU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-zYMxrX3yO0i4GeSEbw53Ug-1; Thu, 25 Feb 2021 05:05:12 -0500
X-MC-Unique: zYMxrX3yO0i4GeSEbw53Ug-1
Received: by mail-ej1-f69.google.com with SMTP id rh17so2207244ejb.19
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 02:05:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qgNKamczjgEJyyL4QUzcHd3eKjeY9gccVK+M6JZFmbQ=;
 b=RNcIrWFIeQTGF+OlX8ROMqMjtxH341hcm0cUQgOxDdT1jsiBMBWsB68Rsspw20cS3g
 NrFBDb/fLomDvb/BFdNNJvX4W3TX8rTgsOamG8sOcm1spTiWIKj8d4/mgpNK9kbIvMRS
 ghS8PqYW/heE7uQNlj5hZeNZzs7H8Q7S4+Eq8od27rNOuSqOdeFGmYjwO572AYt9BDvG
 ih1UW0A0Hw0pCYQHMr1cbmq/U81M4i76wrBC+JSr60NT/Ykdfs2A2W81NwSihMwNi1h3
 d3R183l7Uy4RVofTTuZDNZNoZ5xWoSv4DuSDpmQZYDLHdIOC2k0op5zSLIG75KpiokjL
 8JNA==
X-Gm-Message-State: AOAM533TB7vKeNyFUMQMOES3gSH98qnJIryQL/muUm3kp1r8z379OCAc
 0GxSyRWLslERNwohlffd8QTK2PthY6bJpgZ3ogBjyQVqtdnQ0o9VymLJhqgBMbTFk24azl+Q/Tp
 gQFtg8bFa4AoeXGo=
X-Received: by 2002:a17:906:4543:: with SMTP id
 s3mr1928014ejq.258.1614247511476; 
 Thu, 25 Feb 2021 02:05:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9eoAsGL8j2CJm2KIlIHc1cVgHS6jnMgBakFP2ozaY7BZQOvxyz2bDnMuM6CQ/6Js4Y/x9AA==
X-Received: by 2002:a17:906:4543:: with SMTP id
 s3mr1927998ejq.258.1614247511322; 
 Thu, 25 Feb 2021 02:05:11 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y13sm2745116eju.75.2021.02.25.02.05.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 02:05:09 -0800 (PST)
Subject: Re: [PATCH] libqos/qgraph: format qgraph comments for sphinx
 documentation
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
References: <20210224101810.52851-1-eesposit@redhat.com>
 <ec53c449-b719-07cf-0993-352bdbd32725@redhat.com>
 <919d2c24-92f8-53e8-5598-97166add3083@redhat.com>
 <6ac6ecf9-ea88-56f5-43c5-645627ff5d9e@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fd5ba2a9-c18f-7679-f633-a4ad6a4b33de@redhat.com>
Date: Thu, 25 Feb 2021 11:05:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <6ac6ecf9-ea88-56f5-43c5-645627ff5d9e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/02/21 09:22, Emanuele Giuseppe Esposito wrote:
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index 1dcce3bbed..f0038f8722 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -12,6 +12,7 @@ Contents:
> 
>   .. toctree::
>      :maxdepth: 2
> +   :includehidden:
> 
>      build-system
>      kconfig
> @@ -24,7 +25,6 @@ Contents:
>      atomics
>      stable-process
>      qtest
> -   qgraph
>      decodetree
>      secure-coding-practices
>      tcg
> 
> -------
> 
> Allow showing the hidden toctree in the docs/devel index, so that the 
> link is visible
> 
> End result:
> - no visible change in docs/index
> - qgraph link visible in docs/devel/index
> - qgraph linked as text link in qtree

Makes sense.  Did you also try increasing the maxdepth?

Paolo


