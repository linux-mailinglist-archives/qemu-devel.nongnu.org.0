Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D1C625924
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 12:15:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otRzV-0005ya-IP; Fri, 11 Nov 2022 06:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otRzR-0005xu-UX
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:14:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otRzQ-0000CJ-BH
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:14:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668165267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sxbA1JOgncvfvrXTq2BG2thTIg/F1ve70VZ1abzqDm4=;
 b=HcPILtJMpf0n/b2Ttz1Q3NvqoBjp8fUdrbbkbcL+KdOJilQ9s4Xmumk9SDykOrnpw1+tSk
 PFlBQqYm5XBd1AeJ9lo+ugP8hd9PxFLzXqEPH2x5EdkveAvFgc6w1sJwfpzf5e/Hjug06t
 fo6W6zFJdylMi/q7i2Uxse1Q/Y1z4jg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-465-y9DB6iYTPqyvk2NKhm0qGg-1; Fri, 11 Nov 2022 06:14:25 -0500
X-MC-Unique: y9DB6iYTPqyvk2NKhm0qGg-1
Received: by mail-qk1-f199.google.com with SMTP id
 x2-20020a05620a448200b006fa7dad5c1cso4505727qkp.10
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 03:14:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sxbA1JOgncvfvrXTq2BG2thTIg/F1ve70VZ1abzqDm4=;
 b=f+FnIZ6wjdCY0rm5C3+LLD+/61Ji38BpWpbzBeXXSZF2N2Czhe//Mc2oM7zCKVcl49
 Ox2cJtvdQw1E3Y0b6U54Y6bMjCmukvUwlPE7dv1hi+AF1XibvoMqHgpTnl8AuIGb+Ui8
 nyBULnvC4PIavnIURV8ku9zpGbYyHdeAbHETitoPEgUUFXGb3PvUJc+939XxZ0kIeNzB
 29pMNNwuIDWhbSjHQGGAgLFlkcQYGFtKPGlVCi8KiJRMJSaIiHN0b89VXuZfIfvhDHWW
 hp/kr3C+1xZjM3pFd4diLOnGbU4Cp31t2jTXP8cpKvw6uHvY1+93ePmDWyjVxqSOsKn3
 lHsQ==
X-Gm-Message-State: ANoB5plrRwbDmff9dN8m2j3EdtjVYf1AUoz4lJCT+HXxM0v3voSb/13N
 L5bpltymW8V8gevGFtlKX7ddU8BwYvb20gYS7f0fMC8x4Ksdyg/Izbqe6rc5NVAlvgw/uVBpMry
 IdLFAM5fQEAXAQsc=
X-Received: by 2002:a0c:c3ca:0:b0:4bb:5c8d:e016 with SMTP id
 p10-20020a0cc3ca000000b004bb5c8de016mr1413982qvi.101.1668165265240; 
 Fri, 11 Nov 2022 03:14:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Vs7TgMRvKELDnRSiEa9tVhF6HrQLkyRJn+Sw7rIZbGcgqEbQcUi81VQIlFQvgurwMIL9Clw==
X-Received: by 2002:a0c:c3ca:0:b0:4bb:5c8d:e016 with SMTP id
 p10-20020a0cc3ca000000b004bb5c8de016mr1413973qvi.101.1668165265034; 
 Fri, 11 Nov 2022 03:14:25 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a05620a400c00b006b949afa980sm1251920qko.56.2022.11.11.03.14.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 03:14:24 -0800 (PST)
Message-ID: <70ac7c62-b536-ffe9-e09d-67493068e458@redhat.com>
Date: Fri, 11 Nov 2022 12:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 01/13] qed: Don't yield in bdrv_qed_co_drain_begin()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: stefanha@redhat.com, hreitz@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-2-kwolf@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20221108123738.530873-2-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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



Am 08/11/2022 um 13:37 schrieb Kevin Wolf:
> We want to change .bdrv_co_drained_begin() back to be a non-coroutine
> callback, so in preparation, avoid yielding in its implementation.
>
> Because we increase bs->in_flight and bdrv_drained_begin() polls, the
> behaviour is unchanged.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>


Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>



