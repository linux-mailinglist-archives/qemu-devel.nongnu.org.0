Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5E744C477
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 16:35:43 +0100 (CET)
Received: from localhost ([::1]:44624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkpdW-0003FK-Kv
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 10:35:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mkpcT-0002YT-Mf
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:34:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mkpcR-0005Vp-Gb
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636558474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cPlRjn3y1KpbyOe+KXm1ku0oHkgwrXnzCcLSvMwVYVc=;
 b=O+emVWxWAHfHwYmCXAgfuLtBEaJjI+VrQtWg6hnUt0DqNZNo+W1uyIBTTL36b1h74/WT0O
 8SOnNYdLoUlK8q6kLRRiqhfuiK0wp2b7RPhJWk0Uj/ze8PjTnGplkeB2qJ7SoHXuA8tiRR
 67U6PQNaSQM+04rH3HtJgvdp5ospwjw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-3ak8pmINNL-h5OVt90lcZw-1; Wed, 10 Nov 2021 10:34:29 -0500
X-MC-Unique: 3ak8pmINNL-h5OVt90lcZw-1
Received: by mail-wr1-f70.google.com with SMTP id
 d3-20020adfa343000000b0018ed6dd4629so466289wrb.2
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 07:34:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cPlRjn3y1KpbyOe+KXm1ku0oHkgwrXnzCcLSvMwVYVc=;
 b=wMxYVlCQ2iidMTlUDS0Nss7OyoQVIC/EZiyo37SfMPi9rvpUbVUbzjIbVtKfsOJ5c5
 m7Ha7rsFbH0QveeCTGSwqZpZXWeBXGthyEkuykioi/+/azs38dA4++85MbJtGQxnLyh4
 8RBXjwErqKZpV/GWiAAQPipDaRuEtU/MMWC68ys8HzPTRA0RDPRIdWvptTBFwyCds2IE
 Vv3+MvwnE/2ORolG2/liayeSqrB319bg8RBJnPjuiDJ5VZR7t9lsGvoWun5Jz5yDNX4n
 24dltlYm4zmuOKwnjJaHP1MHfYDQ5JJOqWzbp/7g1rgjLDoLe5WQVpj6KCP6MAJlwkZ7
 1Z5w==
X-Gm-Message-State: AOAM530uuCOKm4YbCm8CLm+lLhgMyzfRe6D4VK4eAKUDEpGHEpyexuRu
 6dADPWASk7XTJ1Qr6gHDiQcgRRwXFl+8Mb+pYmkxwFi9enzxa08wu2I8EpFIJVfJR1EvCs/qlKs
 UJaA53pZvXgzwv+Q=
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr22590wmk.51.1636558468019;
 Wed, 10 Nov 2021 07:34:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzu8fc0700T+eUZ2I98csw2w4VSq073uU0QzdzYKKjT6nYNLKepOKWf1Ba38jLhUoX2JnOt5g==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr22551wmk.51.1636558467747;
 Wed, 10 Nov 2021 07:34:27 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id h7sm182608wrt.64.2021.11.10.07.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 07:34:27 -0800 (PST)
Message-ID: <8bbef930-ce62-cfd1-845c-93af2afc2f3a@redhat.com>
Date: Wed, 10 Nov 2021 16:34:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 0/3] rSTify contribution-related wiki pages
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
References: <20211110144902.388183-1-kchamart@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211110144902.388183-1-kchamart@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.678, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 15:48, Kashyap Chamarthy wrote:
> My main motivation was to convert SubmitAPatch[1] based on a chat with
> Peter Maydell and Dan Berrangé on #qemu channel (on OFTC).  But the page
> also links to a couple of other contribution-related pages, so I
> converted them too:
> 
>   - SubmitAPullRequest: https://wiki.qemu.org/Contribute/SubmitAPullRequest
>   - TrivialPatches: https://wiki.qemu.org/Contribute/TrivialPatches
> 
> [1] https://wiki.qemu.org/Contribute/SubmitAPatch
> 
> I built with `configure --target-list=x86_64-softmmu --enable-docs &&
> make -j8`, and verified there isn't any breakage in the rendered docs.
> 
>                 * * *
> Changes in v3:
> 
> - Update index entry as part of each individual rST conversion patch
>   [PeterM]
> - Drop the SpellCheck rST [PeterM]
> - Drop the KeySigning rST [ThomasH]
> - Drop mjt's Git repo from trivial-patches.rst [LaurentV]
> 
> Changes in v2:
> 
> - Consistently use the preferred rST headings: ===, ---, and ~~~~
>   [Paolo]
> - Add entries in the devel/toctree.rst [Paolo]
> - Clean up the SpellCheck wiki [Peter Maydell]
> - In trivial-patches.rst, keep only Laurent as the active maintainer
>   [Philippe]
> - Convert the wiki SubmitAPullRequest to rST, because this is also
>   linked to from the SubmitAPatch wiki page
> - Convert the KeySigningParty wiki to rST
> - Update the links to point to the rST-generated HTML files, instead of
>   wiki
> 
> Kashyap Chamarthy (3):
>   docs: rSTify the "TrivialPatches" wiki
>   docs: rSTify the "SubmitAPullRequest" wiki
>   docs: rSTify the "SubmitAPatch" wiki

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


