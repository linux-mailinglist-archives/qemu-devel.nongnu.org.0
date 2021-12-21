Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 275FC47C0C4
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 14:32:01 +0100 (CET)
Received: from localhost ([::1]:55570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzfFI-0000wv-8H
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 08:32:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzfCk-0008CJ-8c
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 08:29:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzfCg-0000Qn-Ke
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 08:29:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640093357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DuxPt4BsVyK02zIRuHn12xnQoo3XqrrwygnVpa3jR7k=;
 b=TazhT1AsB8E+u4vN9/BEIp4G84121gEUxgWp6YmDs0Ve1dXEJ2BqTTHAnPtLY9Cm+d8vhj
 lasYTihpVMVbWDG166DgUIf75RUqjglVRtA7gTwtLJeVuktL5IgJgfpUVKImQWWlqbeJ1I
 lefHZQObJFf3OYofgwbcQ/5WK+eb+u0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-pji_jQXhMnmU9kOQf9E3IA-1; Tue, 21 Dec 2021 08:29:16 -0500
X-MC-Unique: pji_jQXhMnmU9kOQf9E3IA-1
Received: by mail-wr1-f70.google.com with SMTP id
 n22-20020adf8b16000000b001a22f61b29cso4663412wra.23
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 05:29:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DuxPt4BsVyK02zIRuHn12xnQoo3XqrrwygnVpa3jR7k=;
 b=kLly/T4k//D53pK9sWOGA1SnXxzYKvtGxO31vZyS7Rf0WjI8SpO0MiIibePENV+FK4
 ormHlYoWtJZ/OI4D7lmeveFz9BKc7aKgdHeNL7fo9uK6axhJeeVSj49ibZnZ+6CSwKmR
 gULtlyA+dLIT4hmahItA/BbJmy20jXtqAkM7oOwZKfE2aFdRbMb6hKztOeid0HebAQMn
 w5dt/BUwIIQNe3Kb2+2nLC4pVrGJCrWotSH8BhbiyKnKryHezQA0sh+FRgZl5ilqKkR0
 eXiM2EzPjh1ZGOPh7NirLW2OiG6BxtHIH1GLLbkiUewmE2UO+YqTVPym/xwmxVk00p63
 cuWw==
X-Gm-Message-State: AOAM530PiZgsXCbZcLt0tTzP85YxjPwXlZhmlD78Ww0hgFh02o7P4uJ+
 fjWNhWpSzTW7SHvZ+tei/UI1zDRqhA7bWq7WFDG2SmlQHe0NO9eO7deq9DJlclJrV/QOQmMTtMD
 zeYEb4NlHfPLbhBI=
X-Received: by 2002:a5d:44ce:: with SMTP id z14mr598347wrr.383.1640093355050; 
 Tue, 21 Dec 2021 05:29:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHlbkTRGceIFXFbpsv+M3zN5o7qFEencCu5wYIodxA5l2KsXRn/2ZIB09mKZPVAxv9Dic05g==
X-Received: by 2002:a5d:44ce:: with SMTP id z14mr598339wrr.383.1640093354918; 
 Tue, 21 Dec 2021 05:29:14 -0800 (PST)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id n41sm516085wms.32.2021.12.21.05.29.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 05:29:14 -0800 (PST)
Message-ID: <e14ccd62-e9b1-3d2b-5eaf-421dc03be94e@redhat.com>
Date: Tue, 21 Dec 2021 14:29:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 5/6] migration: simplify do_compress_ram_page
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20211221125235.67414-1-quintela@redhat.com>
 <20211221125235.67414-6-quintela@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211221125235.67414-6-quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 13:52, Juan Quintela wrote:
> The goto is not needed at all.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/ram.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 4ee0369d6f..eddc85ffb0 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1341,12 +1341,11 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
>  {
>      RAMState *rs = ram_state;
>      uint8_t *p = block->host + (offset & TARGET_PAGE_MASK);
> -    bool zero_page = false;
>      int ret;
>  
>      if (save_zero_page_to_file(rs, f, block, offset)) {
> -        zero_page = true;
> -        goto exit;
> +        ram_release_page(block->idstr, offset & TARGET_PAGE_MASK);

We don't want TARGET_PAGE_MASK anymore here, right?

> +        return true;
>      }
>  
>      save_page_header(rs, f, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
> @@ -1361,12 +1360,8 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
>      if (ret < 0) {
>          qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
>          error_report("compressed data failed!");
> -        return false;
>      }
> -
> -exit:
> -    ram_release_page(block->idstr, offset);
> -    return zero_page;
> +    return false;
>  }
>  
>  static void


