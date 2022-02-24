Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 355AA4C2C75
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 14:03:00 +0100 (CET)
Received: from localhost ([::1]:60922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNDlp-0008BW-4p
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 08:02:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNDbw-00051a-9K
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:52:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNDbj-0001bZ-KH
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645707150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mSSjY1D5V8/gvDWIk2McNOUzjIYxZJ0PAGKwIWECdfA=;
 b=OXOjnVNU7WlsHv6xmZ5Re0FrpBhFRWSmZaFV0b+EMvvUiJjMOrUgfiirvkrZK2mvKt26dy
 ZkDSSOwdMWb1s0nl3xTC0F2jiNvCXsYchYJFi1QKJHJDatxo7Vd5Wx4CGSltsnKMQgy1R/
 dbuyL7bHzLVsqQfx5qVAbgOkE3wjsK4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-FFNlZ_ElM3WOLU1j1EPHiQ-1; Thu, 24 Feb 2022 07:52:27 -0500
X-MC-Unique: FFNlZ_ElM3WOLU1j1EPHiQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 qa30-20020a170907869e00b006cee5e080easo1168832ejc.3
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 04:52:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mSSjY1D5V8/gvDWIk2McNOUzjIYxZJ0PAGKwIWECdfA=;
 b=1ANVqnG9aorojvtx8CFzhtfqf1oqJqYB0mUdYChVaip745SJhfYv2isPOeAcAf+Tje
 2YsEdLFnaAF2ra09gP3uRjXWJQGBM+dgu8mn6+CfadMiSCzXRhsMggdT03240J8FSIn2
 BbjOIgb7LOITopA8U9kp6EPlIFMe/MsABE1JWqJEBs8tMNK/A4jtoLGYZHyQqijue/PX
 TbP2TJH1WZkXTemke1JNF9EBHDCS//FDg5cseIoP3syEcoQOzatzy3tzxWTm3zjOnIrW
 uKLgibBbK5lSxk4Z4zS3s+PvJ6j20uj/Yk4bxXqV526Amlmo6wq5QQxCz1tZdQhqSGVD
 xVPw==
X-Gm-Message-State: AOAM530EFjIghK+DngER+ZOLBh2CPRZfB7rOajFpIlbtSuW28x/qNVcn
 fcIm65cZgEmxriN32C1XJ8hqyeUFqF/tKh6Ulnp61I43DsPFUeEot/Sjgol5CedBNuhhOU+Sq9v
 ZDMdXFVxZXu+2OTg=
X-Received: by 2002:a17:907:8186:b0:6d0:33e6:b4c8 with SMTP id
 iy6-20020a170907818600b006d033e6b4c8mr2134433ejc.724.1645707146432; 
 Thu, 24 Feb 2022 04:52:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4hYBqvRANKWyGHZDgcDLwfFen8RG3KgNw7Jj/ZVRWZFfYPYg+nIo3ElGirhEnZl2ZJVs2qA==
X-Received: by 2002:a17:907:8186:b0:6d0:33e6:b4c8 with SMTP id
 iy6-20020a170907818600b006d033e6b4c8mr2134403ejc.724.1645707146179; 
 Thu, 24 Feb 2022 04:52:26 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id z12sm1378253edb.77.2022.02.24.04.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 04:52:25 -0800 (PST)
Message-ID: <1f402acf-5732-8df6-4d44-aac59db0f55a@redhat.com>
Date: Thu, 24 Feb 2022 13:52:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 14/18] iotests.py: add qemu_io_pipe_and_status()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
 <20220216194617.126484-15-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220216194617.126484-15-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, nikita.lapshin@virtuozzo.com, stefanha@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.02.22 20:46, Vladimir Sementsov-Ogievskiy wrote:
> Add helper that returns both status and output, to be used in the
> following commit
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/iotests.py | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 6ba65eb1ff..23bc6f686f 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -278,6 +278,10 @@ def qemu_io(*args):
>       '''Run qemu-io and return the stdout data'''
>       return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))[0]
>   
> +def qemu_io_pipe_and_status(*args):
> +    args = qemu_io_args + list(args)
> +    return qemu_tool_pipe_and_status('qemu-io', args)

Shouldn’t we use qemu_io_wrap_args() here, like above?  The next patch 
adds a caller that passes `'-f', 'raw'` to it, which kind of implies to 
me that qemu_io_wrap_args() would be better.

> +
>   def qemu_io_log(*args):
>       result = qemu_io(*args)
>       log(result, filters=[filter_testfiles, filter_qemu_io])


