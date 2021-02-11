Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB87318EC0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 16:37:25 +0100 (CET)
Received: from localhost ([::1]:60020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAE20-0007P8-QD
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 10:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lADzn-0006Y5-Mv
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 10:35:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lADzl-000174-De
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 10:35:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613057703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p1NRHXOOHBlSLyPaPBKtmZATUbmd9wQvZfCPR8qUreA=;
 b=TpyZ0rDeChlX2SjZiHFFey8XaW11JfNfbTVN6qJHT+YUbCzDevBy+0vKlV2HEOLmgs8K/i
 jz5qkWueSNlw/1vfeTBMHdbZbjdUh194gmL3W8o3k0Tgy6mFMY/kb8jgA2WioLk+VLApyt
 kQiMSQgBQZwSahDCINA1hHiSzmsIB0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-lRJiIkZRNXiTmAnvMqvJsg-1; Thu, 11 Feb 2021 10:34:58 -0500
X-MC-Unique: lRJiIkZRNXiTmAnvMqvJsg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1625107AFA8;
 Thu, 11 Feb 2021 15:34:56 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-199.ams2.redhat.com
 [10.36.114.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5EC619744;
 Thu, 11 Feb 2021 15:34:42 +0000 (UTC)
Subject: Re: [PULL v4 14/27] io: add qio_channel_readv_full_all_eof &
 qio_channel_readv_full_all helpers
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210210092628.193785-1-stefanha@redhat.com>
 <20210210092628.193785-15-stefanha@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <7a12b897-3157-7a2b-115b-cb6b263b147d@redhat.com>
Date: Thu, 11 Feb 2021 16:34:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210210092628.193785-15-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 thuth@redhat.com, Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.02.21 10:26, Stefan Hajnoczi wrote:
> From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> 
> Adds qio_channel_readv_full_all_eof() and qio_channel_readv_full_all()
> to read both data and FDs. Refactors existing code to use these helpers.
> 
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Acked-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-id: b059c4cc0fb741e794d644c144cc21372cad877d.1611938319.git.jag.raman@oracle.com
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/io/channel.h |  53 +++++++++++++++++++++++
>   io/channel.c         | 101 ++++++++++++++++++++++++++++++++++---------
>   2 files changed, 134 insertions(+), 20 deletions(-)

[...]

> diff --git a/io/channel.c b/io/channel.c
> index 0d4b8b5160..4555021b62 100644
> --- a/io/channel.c
> +++ b/io/channel.c

[...]

> @@ -135,20 +193,23 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>       return ret;
>   }
>   
> -int qio_channel_readv_all(QIOChannel *ioc,
> -                          const struct iovec *iov,
> -                          size_t niov,
> -                          Error **errp)
> +int qio_channel_readv_full_all(QIOChannel *ioc,
> +                               const struct iovec *iov,
> +                               size_t niov,
> +                               int **fds, size_t *nfds,
> +                               Error **errp)
>   {
> -    int ret = qio_channel_readv_all_eof(ioc, iov, niov, errp);
> +    int ret = qio_channel_readv_full_all_eof(ioc, iov, niov, fds, nfds, errp);
>   
>       if (ret == 0) {
> -        ret = -1;
> -        error_setg(errp,
> -                   "Unexpected end-of-file before all bytes were read");
> -    } else if (ret == 1) {
> -        ret = 0;
> +        error_prepend(errp,
> +                      "Unexpected end-of-file before all data were read.");
> +        return -1;

This change breaks iotest 083 (i.e., it segfaults), because 
qio_channel_readv_full_all_eof() doesn’t set *errp when it returns 0, so 
there is no error to prepend.

Also, I think usually we don’t let error messages end in full stops.

Max


