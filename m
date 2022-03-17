Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BB64DC46B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 12:05:07 +0100 (CET)
Received: from localhost ([::1]:59006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUnwH-0007qW-Uf
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 07:05:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUnqr-0005ct-M8
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:59:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUnqp-0003Sn-5r
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647514766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CjRSyUSytTl09r6zCZBH1m7NoHLdu2+Q+Lhr9BVq42s=;
 b=CJmMIIKLiurdjGVO35ery6gz9Slu3rDBm7Tu4fRoGrQGyJcQ8rlElvqpHYYpRdcuOg7Ibq
 rv1GQUW8QE/S8rx2dWUzTQwr5xWoiLwJEt8nZ+k48R3GJlq0UVNEBgnPy6/GX4tCHg6mcc
 Woo+ntP7ziYgSlwwL5T4nLlkOb2emds=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-2cQ5uqQ4Mn-RsG73mVoazA-1; Thu, 17 Mar 2022 06:59:23 -0400
X-MC-Unique: 2cQ5uqQ4Mn-RsG73mVoazA-1
Received: by mail-ej1-f71.google.com with SMTP id
 13-20020a170906328d00b006982d0888a4so2698624ejw.9
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 03:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CjRSyUSytTl09r6zCZBH1m7NoHLdu2+Q+Lhr9BVq42s=;
 b=NntHsIZZDc/+3eAHCE+kI9RTnvTzaAzE4fKEwaaKq1OC+rwgmkdNOffBt6SLwh90pi
 Sb8vy+sHYrbTZ4HcSLMVYQCUtgFZvno+FO2uMHjUTf7A228n9FgcD4KkI1oF8PmwnHF4
 s7XOsXdr5UPByrlwoKDUPMdRJIQ8U/E1QOW2ndmRw2k8EutYWOLW418nNzqNMWwvOmXV
 6bpzrThIyHazu7OCxlWnH94MsyyYyOslzIRo34TErtn5d4CK2m3NZptMBcpiEwsALamh
 2Tj3zfOrzf3uuDl++oqTo2vWnc+OFUE+sJjS56ODz4719jiBRHOG3XbscogDZ4Ixo7z4
 CXhA==
X-Gm-Message-State: AOAM532WIKw8V+YB/57jtf4hz+h6LiMzgS505k/+X6Gune3kdgYvoujY
 hcXXk1rkW4AnRvdTdgT/ga3uIA+4ZULg6MTm6weeyjc/UwpUWEYV/U+1j4GHTyUScYQRx/qm808
 LTSNWZtQR/8Pn1Eo=
X-Received: by 2002:aa7:d7c5:0:b0:418:e694:77d5 with SMTP id
 e5-20020aa7d7c5000000b00418e69477d5mr3798516eds.150.1647514762039; 
 Thu, 17 Mar 2022 03:59:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFX7ob/cp4nrnrXwhfniJrnJ9ak6NvdrMXDpUw7Cdr2FFpe/yfp7RQ7WTWPqOhjtNmBqeetg==
X-Received: by 2002:aa7:d7c5:0:b0:418:e694:77d5 with SMTP id
 e5-20020aa7d7c5000000b00418e69477d5mr3798493eds.150.1647514761781; 
 Thu, 17 Mar 2022 03:59:21 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 g23-20020a17090670d700b006ccfd4163f7sm2134379ejk.206.2022.03.17.03.59.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 03:59:21 -0700 (PDT)
Message-ID: <18c487ab-a00c-25d4-8319-e8ab4cd0d17a@redhat.com>
Date: Thu, 17 Mar 2022 11:59:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/14] iotests: use qemu_img_json() when applicable
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-3-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220309035407.1848654-3-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.03.22 04:53, John Snow wrote:
> qemu_img_json() gives better diagnostic information on failure.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/iotests.py | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


