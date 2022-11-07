Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A7E61F3F3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 14:06:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os1om-0006oE-9y; Mon, 07 Nov 2022 08:05:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1os1oj-0006ks-Om
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 08:05:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1os1oi-00007o-38
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 08:05:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667826330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G5CPphJP0t7CeaY63af7YBDjzikyKPs2JnB9rdnPz3A=;
 b=KKS63f3mj+tGkCnjBRUn+IIy/JVgklIRNBeAC1m+0QYvPmva3DzVXmXPObhtjVufbq9B/s
 dpAEjWk4C58WTe1jhiz3pLnZAYyfQG2fL/PyOAn1+xAmXD4qOc0q/ql3C8230WdXETzNI5
 /u4S+RmqkWFswE9Z0optXkLvpuETntE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-314-X8EKarABP0KR3LWP7lAIvw-1; Mon, 07 Nov 2022 08:05:28 -0500
X-MC-Unique: X8EKarABP0KR3LWP7lAIvw-1
Received: by mail-ed1-f69.google.com with SMTP id
 dz9-20020a0564021d4900b0045d9a3aded4so8385589edb.22
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 05:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G5CPphJP0t7CeaY63af7YBDjzikyKPs2JnB9rdnPz3A=;
 b=h05lDczIEX1Q3bOXlFd6I52AdFz4yalNRCMxIXQ74ujgn6BW6sAm7CGzDMgbAr9I7S
 ifCfNuxVpoBbMKL5FXGgIAVDVVzLETGDJ4MS0C4inUyCYd+O9rAPWrjCX+1GXOu+9Sne
 ijyyjkQpx5d8zJZo9108ukYNw6A9OEATvVTWCZF5CMcg8c9f0WHUrkAyWr0sqHBN1Bxz
 xO2emPMl20YJWEOJehHm9UgYjdAGmSe/VEZnbkbqfrlV2+6W3tq/FzA+AVadm9f8cMjo
 6wQFjE3jh/ke8f04Ojz92TOaP7e5YcY4C24tWHDszBQ//EN2nfA1xjlYbtd4YSgnmHbF
 1qXg==
X-Gm-Message-State: ACrzQf0IeRlhxhFaa67gp5Tt16OPRi6K4zZnq9Lvu4PqEOmCRlit2ueV
 wmF9mANgrgSxCsXdB+iKxqn+1bmC2vHs43Ai69QcBJlYpHMt/urwbrKBJc7sfENo/nJuWliP9po
 YW7x+hdlPwgfJ7Sk=
X-Received: by 2002:a17:907:6e9e:b0:78c:5533:4158 with SMTP id
 sh30-20020a1709076e9e00b0078c55334158mr45022263ejc.417.1667826326976; 
 Mon, 07 Nov 2022 05:05:26 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7iC9sAwg0U4psjUbedi5ACJK0IbxFyJCah67qXi0eZHzRBHdHrnrFQWa9YnLIgKRGqlVT3DA==
X-Received: by 2002:a17:907:6e9e:b0:78c:5533:4158 with SMTP id
 sh30-20020a1709076e9e00b0078c55334158mr45022252ejc.417.1667826326785; 
 Mon, 07 Nov 2022 05:05:26 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 og17-20020a1709071dd100b007a7f9b6318asm3443103ejc.50.2022.11.07.05.05.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 05:05:26 -0800 (PST)
Message-ID: <5113f6de-7e6e-d633-5dd9-a66b691b1eef@redhat.com>
Date: Mon, 7 Nov 2022 14:05:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] vl: defuse PID file path resolve error
Content-Language: en-US
To: Fiona Ebner <f.ebner@proxmox.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, t.lamprecht@proxmox.com, d.csapak@proxmox.com,
 berrange@redhat.com
References: <20221031094716.39786-1-f.ebner@proxmox.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20221031094716.39786-1-f.ebner@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 31.10.22 10:47, Fiona Ebner wrote:
> Commit 85c4bf8aa6 ("vl: Unlink absolute PID file path") introduced a
> critical error when the PID file path cannot be resolved. Before this
> commit, it was possible to invoke QEMU when the PID file was a file
> created with mkstemp that was already unlinked at the time of the
> invocation. There might be other similar scenarios.
>
> It should not be a critical error when the PID file unlink notifier
> can't be registered, because the path can't be resolved. If the file
> is already gone from QEMU's perspective, silently ignore the error.
> Otherwise, only print a warning.
>
> Fixes: 85c4bf8aa6 ("vl: Unlink absolute PID file path")
> Reported-by: Dominik Csapak <d.csapak@proxmox.com>
> Suggested-by: Thomas Lamprecht <t.lamprecht@proxmox.com>
> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
> ---
>
> v1 -> v2:
>      * Ignore error if errno == ENOENT.
>
>   softmmu/vl.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


