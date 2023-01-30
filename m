Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1F06816C0
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 17:45:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMXGP-0004nh-Ts; Mon, 30 Jan 2023 11:44:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stephen@networkplumber.org>)
 id 1pMXGN-0004jH-5u
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 11:44:11 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stephen@networkplumber.org>)
 id 1pMXGK-00058X-As
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 11:44:10 -0500
Received: by mail-pj1-x102a.google.com with SMTP id mi9so2447740pjb.4
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 08:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=networkplumber-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+5F5fQasY2knrlDtI2BNHfCmbgFGbRAs6WPq4vrPRN8=;
 b=IK1myP9a4EzWfedDd4P4GXsqpnZq5jZia2pChEnp3WDS/Ib+EFuFiu7WWeNtoh7cfr
 Ndhf+4cZqOi+z4i5kngi5uMWyLE/JHCHbDFQeVr+n9IJQzUK94tfCoxXnYRHNWRoGDk4
 A8FM/u61wMhcQipoxHl7rx5O+Ekt35eO8ORUDHuWZieIbrXgz9dqnBLQIiMO9qTLX+bn
 wtUlEayp5hBLgMxs1rHOgZi2nlmtkZyKtLCtr3CnObAdH8BD6xxUb4Mdmf03AkH0o99G
 fhzN0ChUIMvspe88RAVwP4Cg/pXkFSXxQkKHf001IwjkWH8nW+mYiDnGFsjDfmkD+ax8
 0/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+5F5fQasY2knrlDtI2BNHfCmbgFGbRAs6WPq4vrPRN8=;
 b=0c7UCEpLMj4H5kyxsrme1YGgqP1wtKhBXUHGpdxrqKB+RzQrFJCRoSWIVM2r/KI70x
 +WPjirCRohlegJBKF1q2BWE+Oi/BAfXlsGP4Q4JuJ/IbHk+Dk9GSZ/I1FeZd4AzwMlzb
 2VTE5jnuPM5WY98TPY+PkJWTWDagcwFyeWHKRuS+1nsZH4rA31XYutAiEiiIpTBLYfj4
 4ggi96ggEYrGmxLOp+XLHemfWbFssEi2su+x0A5cOj3EOO68bDqnlzK67l4jTpOy8kCi
 Hiz61XdyU0Fi9CmhJPgfgpYfGqjppB/1w40woe6hRh0llwStxnNzCzGxVSll9SDNAkuj
 xHlA==
X-Gm-Message-State: AO0yUKXQItQLgYbp52/LbHof25SbGh8uzRD1rsC7tNs4Lye73vwETVjc
 W5PZEATCjXAEjrrzU95r5crg0w==
X-Google-Smtp-Source: AK7set8VhhIkkd65+23Avc/47Teg+vbcUd2AEARuVysng4bqQ5lrbQ9OUR0pK6Bfsty1ptgEvpePig==
X-Received: by 2002:a17:90b:1d91:b0:22b:ed4a:c46e with SMTP id
 pf17-20020a17090b1d9100b0022bed4ac46emr26291949pjb.30.1675097046431; 
 Mon, 30 Jan 2023 08:44:06 -0800 (PST)
Received: from hermes.local (204-195-120-218.wavecable.com. [204.195.120.218])
 by smtp.gmail.com with ESMTPSA id
 e185-20020a6369c2000000b00499bc49fb9csm7097487pgc.41.2023.01.30.08.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 08:44:06 -0800 (PST)
Date: Mon, 30 Jan 2023 08:44:03 -0800
To: Maxime Coquelin <maxime.coquelin@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, pbonzini@redhat.com,
 chenbo.xia@intel.com, thomas@monjalon.net, dmarchan@redhat.com
Subject: Re: [PATCH 0/3] Vhost-user: replace _SLAVE_ with _BACKEND_
Message-ID: <20230130084403.42733587@hermes.local>
In-Reply-To: <20230130104548.13262-1-maxime.coquelin@redhat.com>
References: <20230130104548.13262-1-maxime.coquelin@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=stephen@networkplumber.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-to:  Stephen Hemminger <stephen@networkplumber.org>
From:  Stephen Hemminger via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 30 Jan 2023 11:45:45 +0100
Maxime Coquelin <maxime.coquelin@redhat.com> wrote:

> This series continues the work done to get rid of harmful
> language in the Vhost-user specification.
> 
> While the spec texts were changed to replace slave with
> backend, the protocol features and messages names hadn't
> been changed. 
> 
> This series renames remaining occurences in the spec and
> make use of the new names in both libvhost-user and the
> Vhost-user frontend code.
> 
> Maxime Coquelin (3):
>   docs: vhost-user: replace _SLAVE_ with _BACKEND_
>   libvhost-user: Adopt new backend naming
>   vhost-user: Adopt new backend naming
> 
>  docs/interop/vhost-user.rst               | 40 +++++++++++------------
>  hw/virtio/vhost-user.c                    | 30 ++++++++---------
>  hw/virtio/virtio-qmp.c                    | 12 +++----
>  subprojects/libvhost-user/libvhost-user.c | 20 ++++++------
>  subprojects/libvhost-user/libvhost-user.h | 20 ++++++------
>  5 files changed, 61 insertions(+), 61 deletions(-)
> 

Thanks for doing this. LGTM

