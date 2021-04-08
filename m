Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1369D358072
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 12:19:54 +0200 (CEST)
Received: from localhost ([::1]:56614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lURlQ-0000ST-RE
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 06:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lURjc-0008Rc-MH
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:18:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lURja-0002YJ-Bv
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:17:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617877076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5W5+wZad+pGYslVWQkcz9erOcEVZL56ZEsGuZHWDefY=;
 b=B0c49SzmN7KjysZ+L1VsqC4cE+YAMhFSfkv643o2jkMWZG+h8TKz/Lsqxz4EfKm+Vp2daH
 gDbvjTSiAN/8rwaq1N3j46r7YyUZJSpEFNBFRwUZGaUWOL2NwmMRQiNprTZ37qZjOAbM0x
 XBjAFE+WpDkGCP5bwaX40geoRYe07Oo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-TBnUQV2POrqkWbRnzgLSSg-1; Thu, 08 Apr 2021 06:17:54 -0400
X-MC-Unique: TBnUQV2POrqkWbRnzgLSSg-1
Received: by mail-ed1-f72.google.com with SMTP id w16so777947edc.22
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 03:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5W5+wZad+pGYslVWQkcz9erOcEVZL56ZEsGuZHWDefY=;
 b=leeRyXIz7EKHyWwE/+Y/51rsbj0GR7DpBGNUCXDCzS2AaNYFK2IRdR+zC/JwN+t2wh
 a8osLfhJTGzzz1B8i38Lvcmui+TFimceCb6qpiGraWLUAgIV0fFxjJsOa6AHecl1RYz6
 6oD9Dryz913v6POR7HgPlTx9jS4x3Vvb4j4hAiZX1DeLpFXXABVGocAdT/xExPVduiWb
 aEfF0NSqQA22miMBbfNN1QZ9EjmB81BvtGy91jcSuAhaUqTzAFVhzNFfHBTVvQiVnSAW
 B1Vw0jI5V+AexG5uaunEWYS2IxkRb7E1pfQMdYWqhMchMLq1PUX9IiNzMWl+/EfwUkvy
 FxoQ==
X-Gm-Message-State: AOAM530SQ9WRgX2jAT9Y7Du4gPLCBitoeZOYrka+00I4A5uX1E0fV01P
 OqKVBS9ouuf8Sdc59d3bAwU5+QniHnNrGcnNVRy9WJlHCRdO2AAlGvQuSjpx7IfHroO5TORyxXs
 nnVvDcJTzNzblCTA=
X-Received: by 2002:aa7:cf16:: with SMTP id a22mr10320263edy.267.1617877073765; 
 Thu, 08 Apr 2021 03:17:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+yW0mVJUL/uUeGEA1typmdkqi/5M2mn6hEerl278LrIqxL+8habL80qG4hi3I2SIhI3M4wA==
X-Received: by 2002:aa7:cf16:: with SMTP id a22mr10320241edy.267.1617877073532; 
 Thu, 08 Apr 2021 03:17:53 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id pj18sm7424491ejb.101.2021.04.08.03.17.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 03:17:53 -0700 (PDT)
Subject: Re: [PATCH] docs: add nvme emulation documentation
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210408095028.382751-1-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <177d588e-f423-69f8-2b47-b7bbf9ef701d@redhat.com>
Date: Thu, 8 Apr 2021 12:17:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210408095028.382751-1-its@irrelevant.dk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/21 11:50 AM, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Remove the docs/specs/nvme.txt and replace it with proper documentation
> in docs/system/nvme.rst.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  docs/specs/nvme.txt   |  23 -----
>  docs/system/index.rst |   1 +
>  docs/system/nvme.rst  | 212 ++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS           |   2 +-
>  4 files changed, 214 insertions(+), 24 deletions(-)
>  delete mode 100644 docs/specs/nvme.txt
>  create mode 100644 docs/system/nvme.rst

> +Simple Copy
> +-----------
> +
> +The device includes support for TP 4065 ("Simple Copy Command"). Copy command
> +limits may be set with the ``mssrl``, ``mcl`` and ``msrc=UINT8`` ``nvme-ns``
> +device parameters.

All parameters are described except mssrl/mcl/msrc.
Any particular reason?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


