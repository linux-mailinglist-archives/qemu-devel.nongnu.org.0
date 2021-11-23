Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0DF459EBD
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 09:58:34 +0100 (CET)
Received: from localhost ([::1]:57134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpRdJ-0003JU-T6
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 03:58:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mpRcF-0002PI-KB
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 03:57:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mpRcC-00044W-Ce
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 03:57:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637657842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e5g6MjYfLtMY7i4qx7QioOLeniOsTnAMs0q1RrJt7Tg=;
 b=dwPbRJ8UftQjTXzPCCjVVsNbJB3dK3BYH9chH5Uxli112JzhimhDBQtkyvpp1L1x/09Ybx
 TLvaXI2oLcmrf1TkP3UkcfNF4UbpCk5NzDSBN8vha1jmYGH0iiyLm+KxB9bdUpMEbKVJfk
 7xUYGdp/gpuMkyaFojFvMqu1hd6sKpw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-gD-K6DmXNSadgrAxRGcT3A-1; Tue, 23 Nov 2021 03:57:19 -0500
X-MC-Unique: gD-K6DmXNSadgrAxRGcT3A-1
Received: by mail-wr1-f71.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so3546559wrd.1
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 00:57:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e5g6MjYfLtMY7i4qx7QioOLeniOsTnAMs0q1RrJt7Tg=;
 b=VzevqLKO5HmBFuU9CsOGrJBU5A3Gc6EJwtAPhIxqhVitDQcHYze6r9CwlblK1HOYIe
 um+XpNLHqT5vxbYRBubbjkDb5YWYk6ZFZ8k5JZBLXLMT7f8b4Qz9V+X2HnKqK09xD5FU
 BwyVGdBu41DBUEn23yhrEXjLzjZBRGp1ZhAvZoZJt8JpFTiKb7pqFq1HN4waboaOVGIg
 7MfrEsKMCea+sk34XJgs6Le5jtFAwRVdKnWbjTFsUv+cTjjHtb4liBJGlLtJ5Hts1/Lp
 pLvZrPSGTx7SGaFapZW8K8HkdnYhVFutB2n3PYCYW3IFJT36f3N5A9tLO1FOw9wxUzlj
 XaUw==
X-Gm-Message-State: AOAM530efcNmMjtDWSobBnT6TF4ACf8lGVuk5lMR5eK/6UBfZZm1kf9S
 QXBeISQrRAHHXJNO1qkqVtb5JJWpZj0enymW4Z4kBhspixfIzNrx/FrNdBiPGdB5YvPoFp54Z9Q
 bV9FuxYcVaCYJ1FE=
X-Received: by 2002:a5d:424c:: with SMTP id s12mr5066452wrr.370.1637657838456; 
 Tue, 23 Nov 2021 00:57:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGEhfzKSO7OQ5L3pZ37Huir8NpCe1d0AYDH7c/ysg7t96ciRe+J+rb7t58YI0ychx7oR7bng==
X-Received: by 2002:a5d:424c:: with SMTP id s12mr5066428wrr.370.1637657838268; 
 Tue, 23 Nov 2021 00:57:18 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id z6sm11310711wrm.93.2021.11.23.00.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 00:57:17 -0800 (PST)
Message-ID: <977ab3f7-89d0-6304-d2a7-a13fc916e0ce@redhat.com>
Date: Tue, 23 Nov 2021 09:57:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] block vvfat.c fix leak when failure occurs
To: Daniella Lee <daniellalee111@gmail.com>, kwolf@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <d02640d5-7c6c-f78b-da6a-0cad1d53d80f@redhat.com>
 <20211119112553.352222-1-daniellalee111@gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211119112553.352222-1-daniellalee111@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.515, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pai.po.sec@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.11.21 12:25, Daniella Lee wrote:
> Based on your suggestions. I made a new patch which contians:
> 1.format detection
> 2.replace calloc with g_malloc0 in enable_write_target function
> 3.use g_free without null pointer detection in vvfat_open function
> 4.delete line "ret = 0", use return ret directly in vvfat_open function
>
>
> Signed-off-by: Daniella Lee <daniellalee111@gmail.com>
> ---
>   block/vvfat.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)

Thanks, looks good to me!

Two remarks for the next time: When you send a new version of a patch, 
you should mark it as “v2” (and then “v3” and so on) in the subject, 
e.g. “[PATCH v2]”.  This can be done e.g. with `git format-patch -v2`.

Second, for a new iteration, you should generally keep the commit 
message from the previous one and not replace it with a change log. 
Having a change log is very nice, don’t get me wrong, but it shouldn’t 
be part of the commit message.  Once you’ve formatted the patch with 
`git format-patch`, you can edit the file and put the change log below 
the “---” line, e.g. like it was done here: 
https://lists.nongnu.org/archive/html/qemu-block/2021-09/msg00453.html

No need for you to respin this patch, though, I’ve just replaced the 
commit message with the one from v1 and applied it to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block/

Thanks again,

Hanna


