Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2B66187AE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 19:38:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqf6o-00012C-30; Thu, 03 Nov 2022 14:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqf6l-00011K-Is
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:38:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqf6k-0005wF-7l
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:38:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667500709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zwFBCXdFpA8Y5furOHv/zwAHTraFrBMjgHozxar29wc=;
 b=YRjVaW22EuK154z5dk1mb4lvDiHs1Y0lGXPiSUFOlKcLSyaIOvZXtCGdx0Qe9M+UhIe3xf
 oTsUqM1L3b+ByOCXN+pAzWu0f3TtIKwQzfviJtGi9JL0WjNq2Ekwgv4ectiAnUDE6Kd4pM
 Wc9CAZaSX934mqlf5tFJo6UbolodsR8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-fJ7xLzG2NPmEtFLZmu8rkQ-1; Thu, 03 Nov 2022 14:38:28 -0400
X-MC-Unique: fJ7xLzG2NPmEtFLZmu8rkQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 sg37-20020a170907a42500b007adaedb5ba2so1782362ejc.18
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 11:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zwFBCXdFpA8Y5furOHv/zwAHTraFrBMjgHozxar29wc=;
 b=yaf9ZrDYWJGOiVgIr8UJTJmpgm9pg+wcLOvIaFrnFcZv8b9ZH1u9yUguPsoQLTIwRJ
 iZntaO+Uqg7wpB/Ue+mosyOdSkWTWd8Tgh4OC3zAiTlT7wvs2zqmWFpiscYHto88LRwr
 RVOu3TO5qRE1U+xy8l1hTbnDDnylvO4wRxWhaMeoqVpuKv0wqzAEPWsIy0mBoFgsA6YI
 dWZSrYNOxLoQO1wXFQfrLcTFkTLiDCAYvBMtWMMA8Oe6+rcQ07Oxvs6gX9FRvHs3FJ6C
 qU8n/yuw515ZYCe4MA7fKUhUmPRXcrAyGJjvG75Iv24pn/P2IudRYapf/fsNaLttiDAY
 1wSw==
X-Gm-Message-State: ACrzQf1pIy+h3MMp2x73L8teysNX+OTlRPI62aVXbjGBSQ1X1urW3Tzk
 ZRS26s6z21K/ZHcCQe19xYyn+tgsOhIqiI6q2Mn5S12q7ZBMs5wRPi7fEAr5ruqUt6VOmESAUvD
 5OU7srrozwdZki3A=
X-Received: by 2002:a17:907:6d1c:b0:7ae:2036:a166 with SMTP id
 sa28-20020a1709076d1c00b007ae2036a166mr3516148ejc.430.1667500707339; 
 Thu, 03 Nov 2022 11:38:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7natQQah/MQG5vvk4UxOJbuC5wU0F5OKoLlzuiMD5FqmkIkWORP+RKBuP8ARxxVgF9eeaKgQ==
X-Received: by 2002:a17:907:6d1c:b0:7ae:2036:a166 with SMTP id
 sa28-20020a1709076d1c00b007ae2036a166mr3516127ejc.430.1667500707118; 
 Thu, 03 Nov 2022 11:38:27 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 c7-20020a0564021f8700b0045c010d0584sm837747edc.47.2022.11.03.11.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 11:38:26 -0700 (PDT)
Message-ID: <05d169bf-b478-4111-0f97-a403411bdc1e@redhat.com>
Date: Thu, 3 Nov 2022 19:38:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] gdb-xml: Fix size of EFER register on i386 architecture
 when debugged by GDB
Content-Language: en-US
To: TaiseiIto <taisei1212@outlook.jp>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, f4bug@amsat.org
References: <TY0PR0101MB4285F637209075C9F65FCDA6A4479@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <TY0PR0101MB4285F637209075C9F65FCDA6A4479@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/13/22 14:06, TaiseiIto wrote:
> Before this commit, there were contradictory descriptions about size of EFER
> register.
> Line 113 says the size is 8 bytes.
> Line 129 says the size is 4 bytes.
> 
> As a result, when GDB is debugging an OS running on QEMU, the GDB cannot
> read 'g' packets correctly. This 'g' packet transmits values of each
> registers of machine emulated by QEMU to GDB. QEMU, the packet sender,
> assign 4 bytes for EFER in 'g' packet based on the line 113.
> GDB, the packet receiver, extract 8 bytes for EFER in 'g' packet based on
> the line 129. Therefore, all registers located behind EFER in 'g' packet
> has been shifted 4 bytes in GDB.
> 
> After this commit, GDB can read 'g' packets correctly.

Queued, thanks.

Paolo


