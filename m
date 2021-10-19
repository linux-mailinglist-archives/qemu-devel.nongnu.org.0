Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E63433492
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:21:23 +0200 (CEST)
Received: from localhost ([::1]:38888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnBK-0007Q3-Qn
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcn78-0005KP-Sz
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:17:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcn77-0004ok-2v
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YP6AYwdn+Z6MF0evpvAlUIvgrrbHdLebz6yiWHi64vA=;
 b=c4fuw1lhlSiFmfkVu/K7yeKdYauXSF1GctjKOhz/6hI5AtjR/gVzuLvll6kHlDolacRGwL
 0zJdQctpf3QulOT59GEd/Lshn0b3h394WjzsvbCu5VYX3651lwVlbKzRK+oRtGm6N/c6lH
 G93JmojbCOmJwi56dt4vi0AqBoaROCU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-aBcF2N-cMSqfquMN4S9H9w-1; Tue, 19 Oct 2021 07:16:56 -0400
X-MC-Unique: aBcF2N-cMSqfquMN4S9H9w-1
Received: by mail-wm1-f71.google.com with SMTP id
 n9-20020a1c7209000000b0030da7d466b8so1026787wmc.5
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YP6AYwdn+Z6MF0evpvAlUIvgrrbHdLebz6yiWHi64vA=;
 b=zlqMfm2YTfaQavVliAEbh1wrZ7OalLC1vPxgbtG/dYqeAM+MapIyx/1xsSxxxEtgj6
 9cqUUkbInJkVdqO6l/jWyPFidlrGuS1AjJnsLuA5WOCYb98DTLznGjIyY2L2/t7e2cNG
 mieXO3993KyuS0lH6A//XaE2nwb9xzsCtql32bigmhE5lclmn2jyX4H898E4TVnZc/h1
 piw6YsyeGWg7WaKh5r4FBGpnmJZjPhXMZIuHzvcz1rbVT2QZEUA7maHEftZ+hn23uzfe
 +vG1RaxT4FNvjUYkyUZS5tKIBufJE6bvsxXEivSljs30MlmZ8V6OzbOI/hqEGbdt1e72
 clww==
X-Gm-Message-State: AOAM530UQ7s8pRJBAp1w8azMyotjxijsyWRbWEXzENKM//3ONUi3dUsx
 YAH6tA7sSwbdHBbPfaZQYg7ZOGjIjcTWAgKhHz1JmWkCUcPitMtcNEBdW8AA5Wz2B0sY48cKjdH
 anwcWbOYSKKbuRS8=
X-Received: by 2002:a05:600c:4103:: with SMTP id
 j3mr5371708wmi.30.1634642215523; 
 Tue, 19 Oct 2021 04:16:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVXk+J1yiUnYWUNjqkL19sIycJyNcLUclxhBE92KsnA6pk+6H5NskQ9vMNebMGZiYAS9vmGA==
X-Received: by 2002:a05:600c:4103:: with SMTP id
 j3mr5371681wmi.30.1634642215357; 
 Tue, 19 Oct 2021 04:16:55 -0700 (PDT)
Received: from [192.168.1.36] (121.red-83-53-160.dynamicip.rima-tde.net.
 [83.53.160.121])
 by smtp.gmail.com with ESMTPSA id t1sm5183516wre.32.2021.10.19.04.16.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 04:16:54 -0700 (PDT)
Message-ID: <236403cd-2454-9a02-e1c3-8103618c0eb1@redhat.com>
Date: Tue, 19 Oct 2021 13:16:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 2/6] docs: rSTify the "SpellCheck" wiki
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
References: <20211019090344.3054300-1-kchamart@redhat.com>
 <20211019090344.3054300-3-kchamart@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211019090344.3054300-3-kchamart@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
>     $ pandoc -f Mediawiki -t rst spell-check.wiki -o spell-check.rst
> 
> As part of this rST converstion, I've removed the dated and `codespell`
> invocations, and linked to the GitHub repo.  And cleaned up a couple of
> external URLs.
> 
> [1] https://wiki.qemu.org/Contribute/SpellCheck
> 
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
>  docs/devel/spell-check.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 docs/devel/spell-check.rst

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


