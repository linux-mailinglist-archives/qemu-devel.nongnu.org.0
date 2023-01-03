Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700DC65C1F1
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 15:29:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCiGz-00082L-Pn; Tue, 03 Jan 2023 09:28:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCiGx-00082D-W5
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 09:28:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCiGw-0007v9-1w
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 09:28:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672756088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hvl3jcW5Jxle+Jc0IIxtUzOfT2Qmtu6ZOZW0PpuAXV4=;
 b=flGBn9crVbFdgc/pHr3r0BGGQp21nvIdTJvjklNsNrq6apMbHpYPTUAn/pNVVREKWMkwqk
 DYJy56v5l9KpCYCx9BkmzRK3gDew7lOvAj08flWdHm+0WQt1IHoOY66T9r7zG5GOCC40G1
 nOt3y2SDShtYXoYB667eYVHiXciods8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-ey5dQHUdN8e68QZKugEBAQ-1; Tue, 03 Jan 2023 09:28:07 -0500
X-MC-Unique: ey5dQHUdN8e68QZKugEBAQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 j1-20020a05600c1c0100b003d99070f529so10871936wms.9
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 06:28:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hvl3jcW5Jxle+Jc0IIxtUzOfT2Qmtu6ZOZW0PpuAXV4=;
 b=dp7KP0jD7+jBd52kGDABX0KmuKUxSJi0SwyNwADXNVyWsczt+Ii/beiqe//iLEJtt4
 SjJCq+NhGPmNfvOcCoLxD+oxnJomw7Kn4d6JbKKnWybuGgIUepkj7sZFeQMLhucaWcE1
 0YKPW0wuuaNxCH97hJvdPtFYIkqVccL4cBQ/HggeAur463lBctwCUWDphtFhKo1wJvWP
 CDfIOqQwcXlXMBaCDrhhHWs3DxTUe3AKZoml8u/ODaD5cKkCMw6TjSbu6nYGB8vb9GsM
 0j4IPXvOPkV1HG3ug73xPeoFUM8snZAEbzQGnTH4y9EkzqaJ0jVlv1OmgCp57yaVeo0d
 mWEQ==
X-Gm-Message-State: AFqh2krQ1WnaZk1/Re/nfLnDOz8wsbopSEhD4EsJwXAwQOHmUcF9liyl
 OsPQT4N4VuCt9rGJDaVO3xm01oiybsc+LCsj88SsZGlxyb1KP6JPZSj/f3hB62B/+RrR5uzMQrq
 WQeoPNvoC2adu11Q=
X-Received: by 2002:adf:cd8c:0:b0:271:dd0c:866b with SMTP id
 q12-20020adfcd8c000000b00271dd0c866bmr23438119wrj.1.1672756086809; 
 Tue, 03 Jan 2023 06:28:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsC77gfX/30ZaT36DZF5LlpBP381gPbjarl2N5bnEhv9blsAh97fTQgy0+FTn7SjmYVtl9THw==
X-Received: by 2002:adf:cd8c:0:b0:271:dd0c:866b with SMTP id
 q12-20020adfcd8c000000b00271dd0c866bmr23438101wrj.1.1672756086517; 
 Tue, 03 Jan 2023 06:28:06 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-55.web.vodafone.de.
 [109.43.177.55]) by smtp.gmail.com with ESMTPSA id
 e16-20020adfdbd0000000b002362f6fcaf5sm31324842wrj.48.2023.01.03.06.28.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 06:28:05 -0800 (PST)
Message-ID: <00d66c54-0f12-0760-92ff-b10306f17849@redhat.com>
Date: Tue, 3 Jan 2023 15:28:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] net: stream: add a new option to automatically
 reconnect
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20230103142247.218039-1-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230103142247.218039-1-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.103, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 03/01/2023 15.22, Laurent Vivier wrote:
> In stream mode, if the server shuts down there is currently
> no way to reconnect the client to a new server without removing
> the NIC device and the netdev backend (or to reboot).
> 
> This patch introduces a reconnect option that specifies a delay
> to try to reconnect with the same parameters.
> 
> Add a new test in qtest to test the reconnect option and the
> connect/disconnect events.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
> Based-on: <20230103110049.120340-1-lvivier@redhat.com>
>      
> v2:
> - rebase
> 
>   net/stream.c                |  53 ++++++++++++++++++-
>   qapi/net.json               |   6 ++-
>   qemu-options.hx             |   6 +--
>   tests/qtest/netdev-socket.c | 100 ++++++++++++++++++++++++++++++++++++
>   4 files changed, 160 insertions(+), 5 deletions(-)
[...]
> diff --git a/qapi/net.json b/qapi/net.json
> index 522ac582edeb..5b72c936b3ac 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -585,6 +585,9 @@
>   # @addr: socket address to listen on (server=true)
>   #        or connect to (server=false)
>   # @server: create server socket (default: false)
> +# @reconnect: For a client socket, if a socket is disconnected,
> +#             then attempt a reconnect after the given number of seconds.
> +#             Setting this to zero disables this function. (default: 0)

I think this should get a "(since 8.0)" comment to make it clear when it has 
been introduced?

  Thomas

>   #
>   # Only SocketAddress types 'unix', 'inet' and 'fd' are supported.
>   #
> @@ -593,7 +596,8 @@
>   { 'struct': 'NetdevStreamOptions',
>     'data': {
>       'addr':   'SocketAddress',
> -    '*server': 'bool' } }
> +    '*server': 'bool',
> +    '*reconnect': 'uint32' } }
>   
>   ##
>   # @NetdevDgramOptions:


