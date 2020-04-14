Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4251A757D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 10:09:41 +0200 (CEST)
Received: from localhost ([::1]:54162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOGdY-0000rm-Ho
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 04:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50029)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcel.apfelbaum@gmail.com>) id 1jOGcl-0000Nz-7w
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 04:08:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcel.apfelbaum@gmail.com>) id 1jOGcj-0004pK-C2
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 04:08:51 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45535)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1jOGcj-0004oy-5I
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 04:08:49 -0400
Received: by mail-wr1-x444.google.com with SMTP id v5so13189889wrp.12
 for <qemu-devel@nongnu.org>; Tue, 14 Apr 2020 01:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Gsw9CNo+lbixa8HPYDLJ8n1U6vKh+QcXOvUgOww2G3c=;
 b=i1SDeeqQTkj4vrAyt4bbsCqkWI0KpHod3Mw9ZVKi9ZuNdrB9H7oQ5eEAgkUovfjo4F
 lc3wUQ8jUynhKQGUYZVyWJ0w8bdC9guSimm8hwUsGyFaO5Rnc2xcaCLK1hhuntwkX+VX
 9UBf7UtlkTCUxfEL/fDQ/BGYhX/H0NoZe8q6ihxVzyeR9S4YsUG/KL02gC6fEcJ7FXlH
 F5cPswjmqG+KZOm3496GMRZJ3RdS5pFR+z4MwdFPxKWoDQle3vX+U7zOFJ/YT2MgojDO
 o3JlFWYLVxFgXayDj7+v9HEoBxvWlfKcsK90DAlcWL+m+s/ILLzLB4eQPO4Wum//IdP3
 fmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Gsw9CNo+lbixa8HPYDLJ8n1U6vKh+QcXOvUgOww2G3c=;
 b=NYhtP3HL6q2RgzLBwuG0vSml/1OecArMYv9Y6RC7nY9sRYVnBCKP5B7HAgtnNfiLhk
 KaRQLxo/VQwtpESuppT47kFcD9b8dxDZYJbB0sMHah+2D8D6zP2gS78y+omN/neEMYHT
 yiRWcVV9OMKR+sRvjm6VzjvU9hXRIp9VVbQOc5YvoJ8FMk49+/LctpMo/yxjrVhkasiC
 9i+0GbGF49FW2pshXoIekdX/1S8k1GWVFuuDrbqHdTDZ6Y/hGbyZ2kEUzI0yrum48mGD
 dRirC6nWG+SLB44AsEBtYIbUBmEzS1l74HMMI/dX711MmWCSh3hAcAwBkBDdCllZo+jb
 pr1w==
X-Gm-Message-State: AGi0Pua5EYr4VHS5Lv22A9263P8vfBTfSmTD7ECah0lvyIbjCFQ4w2TM
 Ktczqqyrxzm+iC5tRtw6Up8=
X-Google-Smtp-Source: APiQypK5dbnAcF1bIKR82pyZ5qI1MQDeFlszR3XhrxdP2AeJotmFUuPxVkQFvtVTMmE1GL6IMl2e3w==
X-Received: by 2002:adf:e3ca:: with SMTP id k10mr5338239wrm.53.1586851727728; 
 Tue, 14 Apr 2020 01:08:47 -0700 (PDT)
Received: from [192.168.86.37] ([37.142.144.12])
 by smtp.gmail.com with ESMTPSA id v1sm13376161wrv.19.2020.04.14.01.08.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2020 01:08:47 -0700 (PDT)
Subject: Re: [PATCH] hw/rdma: Destroy list mutex when list is destroyed
To: Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-devel@nongnu.org
References: <20200413085738.11145-1-yuval.shaia.ml@gmail.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-ID: <c9475168-ee93-f9f4-a62b-9c651f376aea@gmail.com>
Date: Tue, 14 Apr 2020 11:09:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200413085738.11145-1-yuval.shaia.ml@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Yuval,

On 4/13/20 11:57 AM, Yuval Shaia wrote:
> List mutex should be destroyed when gs list gets destroyed.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
> ---
>   hw/rdma/rdma_utils.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/hw/rdma/rdma_utils.c b/hw/rdma/rdma_utils.c
> index 73f279104c..698ed4716c 100644
> --- a/hw/rdma/rdma_utils.c
> +++ b/hw/rdma/rdma_utils.c
> @@ -100,6 +100,7 @@ void rdma_protected_gslist_destroy(RdmaProtectedGSList *list)
>   {
>       if (list->list) {
>           g_slist_free(list->list);
> +        qemu_mutex_destroy(&list->lock);
>           list->list = NULL;
>       }
>   }

Reviewed-by: Marcel Apfelbaum<marcel.apfelbaum@gmail.com>

Thanks,
Marcel


