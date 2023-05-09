Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADF86FBCA0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 03:48:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwCRf-0005fv-Dp; Mon, 08 May 2023 21:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pwCRc-0005fj-PU
 for qemu-devel@nongnu.org; Mon, 08 May 2023 21:47:13 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pwCRa-0003Da-IS
 for qemu-devel@nongnu.org; Mon, 08 May 2023 21:47:12 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-52079a12451so3697057a12.3
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 18:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1683596823; x=1686188823;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kfaCzsHlaUpI1y7Fqf2sb/pwf/dIfUPFEE9iIIfsUzo=;
 b=jnGuo9emjRr1Bz8GGcPDFC4zMqqZH+tbGHpBdQnHsYt5ssxdUGLB7ixyWGwzzXk5MM
 hJB7N4VgbmDC2I61pPLqLv/LMWPNACdRPytJWnP7G6f/uBMx3Yx+SxhV4C2MrHcXYC30
 e1aQ0omOTYWRkN5BrVmXHoLCA0ttHssXb7loKQ8/y8jH5R3XGqD1d089/PBkxvw5+UKE
 77AmgPl9qrfwu315QIkWexxWsM14E8dX03Oo1AySd6GswZngo6CwwQyeqQHfyb+v4JI8
 TQLmr4MvPSey0m5KSPr38V/knGARHRkeoIMOuftQx3P52BVNZT+l6zEhnhs8xN7Rn6zU
 m73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683596823; x=1686188823;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kfaCzsHlaUpI1y7Fqf2sb/pwf/dIfUPFEE9iIIfsUzo=;
 b=TNkjINap0EjSKg4e+3kNoh4lQZe970vtQAwOWeywrCN861Bfj5kZx8ON5iz/A/tt/n
 9zlbZniQpcJ4BiUJRQFVF+p+ctN6vd09iv0fYzyTv+TxNbesWDvT98Btc3EbZBo42RYA
 HUBbEE7Ic0I3gWPQGBdLrEFhg51JiHC2q9Y7tYB8LJZw5TBLGHTjU7JS9FKLLyCKKJVn
 WW5Zp9dmABkfXHQQxa9hwzK+pKMEyn//XE+hsQgF6viiGkU6NL6713Fv0u4283yG1t5o
 GC1J4uBv98ErtuDLgCJfpnt6u2Dm1h8cLqH3urQRVteD5q6LFmRZJVm9920eAdJvfXFU
 zI6A==
X-Gm-Message-State: AC+VfDyisAIDwtCW42/OJd4DtHDWk3PGSaoh9Pul5yGOKB49/puCGLmj
 RjAFtCP2vSW4kORftirEc2xdfQ==
X-Google-Smtp-Source: ACHHUZ7rR9Nc2NMZwbYVKBgo1Hn0BYXOZP8KV+hWhj1kVxmypd2R20f3ihp+DBuuweLRqQe26JlNRw==
X-Received: by 2002:a05:6a21:99a1:b0:100:4369:164c with SMTP id
 ve33-20020a056a2199a100b001004369164cmr8027319pzb.13.1683596822920; 
 Mon, 08 May 2023 18:47:02 -0700 (PDT)
Received: from [10.3.43.196] ([61.213.176.9]) by smtp.gmail.com with ESMTPSA id
 c4-20020aa78e04000000b005ae02dc5b94sm521822pfr.219.2023.05.08.18.47.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 18:47:02 -0700 (PDT)
Message-ID: <8b7e9ad5-b4f3-8b24-c4a6-5ae6c4fcb27b@bytedance.com>
Date: Tue, 9 May 2023 09:45:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: RE: [PATCH] virtio-crypto: fix NULL pointer dereference in
 virtio_crypto_free_request
Content-Language: en-US
To: Mauro Matteo Cascella <mcascell@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "mst@redhat.com" <mst@redhat.com>, "taoym@zju.edu.cn" <taoym@zju.edu.cn>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
References: <20230508150146.1092355-1-mcascell@redhat.com>
 <f443c6c7ec2d4d2e88afeb586d5653ed@huawei.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <f443c6c7ec2d4d2e88afeb586d5653ed@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 5/9/23 09:02, Gonglei (Arei) wrote:
> 
> 
>> -----Original Message-----
>> From: Mauro Matteo Cascella [mailto:mcascell@redhat.com]
>> Sent: Monday, May 8, 2023 11:02 PM
>> To: qemu-devel@nongnu.org
>> Cc: mst@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>;
>> pizhenwei@bytedance.com; taoym@zju.edu.cn; mcascell@redhat.com
>> Subject: [PATCH] virtio-crypto: fix NULL pointer dereference in
>> virtio_crypto_free_request
>>
>> Ensure op_info is not NULL in case of QCRYPTODEV_BACKEND_ALG_SYM
>> algtype.
>>
>> Fixes: 02ed3e7c ("virtio-crypto: zeroize the key material before free")
> 
> I have to say the fixes is incorrect. The bug was introduced by commit 0e660a6f90a, which
> changed the semantic meaning of request-> flag.
> 
> Regards,
> -Gonglei
> 

Hi Mauro

Agree with Lei, could you please change the Fixes as Lei suggested?

-- 
zhenwei pi

