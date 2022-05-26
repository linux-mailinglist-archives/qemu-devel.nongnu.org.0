Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BD1534F06
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 14:19:28 +0200 (CEST)
Received: from localhost ([::1]:59130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuCSd-0007p5-CX
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 08:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuCJD-0006Mj-HD
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:09:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuCJB-00075R-3T
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:09:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653566980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=en8P0Lr0PkyxVlZ/TdhX2j6CK8DTeryYvnIhJa9cWcw=;
 b=cl1QVaDoL/quIPfB5Kb0w2odevf5rwFo/nK5kHeEQH3SlS6ztYO1eolaOe16KW3KatGXps
 Y9zrUdLTwN0HfMCWKUQFCtGA883wncEm/5488I3hS8sjvRYnvxgikJ8I0o7TutQF3L/ert
 BWXaZ8yl8LERdI7DZ9OorskH16Iousg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-7HWOCjLmOz2I0uyWImGQpg-1; Thu, 26 May 2022 08:09:39 -0400
X-MC-Unique: 7HWOCjLmOz2I0uyWImGQpg-1
Received: by mail-ed1-f71.google.com with SMTP id
 u1-20020aa7d981000000b0042acd1f2253so957711eds.4
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 05:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=en8P0Lr0PkyxVlZ/TdhX2j6CK8DTeryYvnIhJa9cWcw=;
 b=2yKCXxq1W2V04k1KJFzxYjzC+5QtW7d91zoDEMArX+X9PnM0sKiW0bYrqGILEkqgv/
 qJB/UsRlUmWl4ZJX26hHVfMGcdooUpdqfOqyxnUTy1fndL2dRZlevw7MIJPPbc93v24f
 5MJDepWkkMKwnJ3DvwPJ3u1k/csEgobkBWljNjCepn7XlSSY8bfikAw9nDKzaNE3lba5
 dvUqji1xxrq8MzHHDIaMo4U1JrKC5m8SnLlPLbqDGdCsBp45sE4yit8TSQEA5m1fspLB
 lViG6NdmiZjLnKDMsNSpteGBJOXk3ZRvr7BdxmZ5rM8glC7voE1KDogMlrhv1t5mYPQi
 LKZw==
X-Gm-Message-State: AOAM532qJdFkaSokaeowAc5Mhc4w8+8VmYmi5YpVMnp3PBeBzaVWxCT6
 yz/r1gCjlqoiBItRJMibYIZlEIfnexzYMWooGgxiYO0tsFeJHplhe+6CZ9I25zVSnDsHpFtZxNp
 ArrmXKUYgoW1Fhmk=
X-Received: by 2002:a05:6402:4381:b0:42b:2dc4:bf16 with SMTP id
 o1-20020a056402438100b0042b2dc4bf16mr31926061edc.73.1653566978041; 
 Thu, 26 May 2022 05:09:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxX2vpCM9DnllCXa8ycSS0imDvsV8icJ1bngcAVe5P9VThRxbF0J9aMGHzu5B1yqIvOGA4D5Q==
X-Received: by 2002:a05:6402:4381:b0:42b:2dc4:bf16 with SMTP id
 o1-20020a056402438100b0042b2dc4bf16mr31926041edc.73.1653566977839; 
 Thu, 26 May 2022 05:09:37 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 m11-20020a056402510b00b0042b6a84b230sm708748edd.90.2022.05.26.05.09.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 05:09:37 -0700 (PDT)
Message-ID: <0d594cc7-9b67-0314-cf68-a87ea548156b@redhat.com>
Date: Thu, 26 May 2022 14:09:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 00/11] scsi: add quirks and features to support m68k
 Macs
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 fam@euphon.net, qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
 <7bcd69db-eee5-e67e-275f-1d79d7888f2f@ilande.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <7bcd69db-eee5-e67e-275f-1d79d7888f2f@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/22 16:16, Mark Cave-Ayland wrote:
> Ping? Anyone have any further thoughts on this?

Just a couple question, thanks for the reminder!

Paolo


