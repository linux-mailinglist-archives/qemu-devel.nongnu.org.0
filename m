Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCF732023E
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:30:23 +0100 (CET)
Received: from localhost ([::1]:56702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDGAA-0007om-Rl
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:30:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lDG0v-00027q-7t
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 19:20:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lDG0q-0008UC-ET
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 19:20:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613780441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X1CmZ7dOJ8GM0oBT8SGv6AQgoEVIXWwNKA+251v75As=;
 b=LAs9bOyftdnDBilFe87Yydez2fxCyUZN+15yHCUHrQceoLeCh6JhXl0m2JxbasvSrotBE6
 pSFAJqRqV0jitnPoTC5mFTykqiIk95aPWl3WHvVhUiINUXyqvkGm9W9OaJ4Rc/Hp80RhpT
 RzbeqSjOCmhMjhhucKwHLO1oQ8i5sP4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-AyxTHRZ-NWuc_mpo8Ac2xw-1; Fri, 19 Feb 2021 19:20:39 -0500
X-MC-Unique: AyxTHRZ-NWuc_mpo8Ac2xw-1
Received: by mail-ej1-f69.google.com with SMTP id p15so2773384ejq.22
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 16:20:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X1CmZ7dOJ8GM0oBT8SGv6AQgoEVIXWwNKA+251v75As=;
 b=DUOGKokTUS07wVN5rtm7k1m4InWcrWpVdp/EbsIQryAvl1SQbvEzXLTxFbKYGH6x57
 F4DTnzLr9+9xkwGeN2VocO4ZZ1+a6Vx0bMqbWr1q/uHJAhMXJzep3/rQkQ1JQp6apmH9
 aEHvv0a7erjzdmFdP5JiczlJ32S25Kze7VYrKwzWN3ApSTsdCFOcBm1dXJZYBJqFqTbh
 xqPvFedROFeRbFJ4sobcV72Z2UlOFsbnPM+sjXmkEEKP9IUhpkxnu4HztO6LZaIA+quj
 wfAs96ExlwyOegFEOPs3VOUtA/PbWu15FIjXqUBie4+3/FAV0i6MFQZsjJ+p9jY7J6WQ
 SHjQ==
X-Gm-Message-State: AOAM533PXAlCem9XGCq6adAX/jTiTU3hQ+qIvg6xbDbX9tduNVlZ52A3
 oSSxx93XhXbSZqrpuznWcMvXwYlnWxa1xEMR1BStNY5LB0Ver7owK1e6dnqy/83FvpIRThexAYY
 KtUSxRfH5rWUeVhc=
X-Received: by 2002:a17:906:39c6:: with SMTP id
 i6mr11248852eje.433.1613780438606; 
 Fri, 19 Feb 2021 16:20:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxL/uiOyAGdgyiM875V1iDbHUPYSTPHaOTYXJ/Cf6LHFDK2pJ9NMdh0kQXgUqIBXbM3OTfQ1w==
X-Received: by 2002:a17:906:39c6:: with SMTP id
 i6mr11248839eje.433.1613780438400; 
 Fri, 19 Feb 2021 16:20:38 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x21sm5325247ejj.124.2021.02.19.16.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 16:20:37 -0800 (PST)
Subject: Re: [PATCH v5 1/5] slirp: Advance libslirp submodule to add ipv6
 host-forward support
To: Doug Evans <dje@google.com>, qemu-devel@nongnu.org
References: <20210220001322.1311139-1-dje@google.com>
 <20210220001322.1311139-2-dje@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <858a59f8-a97e-3d9b-3e19-16b73f93ca4c@redhat.com>
Date: Sat, 20 Feb 2021 01:20:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210220001322.1311139-2-dje@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Doug,

On 2/20/21 1:13 AM, Doug Evans via wrote:

When updating submodules, the commit description is a good
good place to include the output of:

  $ git shortlog 8f43a99..26ae658

See for example QEMU commit f350d78f102 ("Update SLOF").

Anyhow up to the maintainer merging your patch.

> Signed-off-by: Doug Evans <dje@google.com>
> ---
> 
> Changes from v4:
> NOTE TO REVIEWERS: I need some hand-holding to know what The Right
> way to submit this particular patch is.
> 
> - no change
> 
> Changes from v3:
> - pick up latest libslirp patch to reject ipv6 addr-any for guest address
>   - libslirp currently only provides a stateless DHCPv6 server, which means
>     it can't know in advance what the guest's IP address is, and thus
>     cannot do the "addr-any -> guest ip address" translation that is done
>     for ipv4
> 
> Changes from v2:
> - this patch is new in v3, split out from v2
> 
>  slirp | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/slirp b/slirp
> index 8f43a99191..26ae658a83 160000
> --- a/slirp
> +++ b/slirp
> @@ -1 +1 @@
> -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
> +Subproject commit 26ae658a83eeca16780cf5615c8247cbb151c3fa
> 


