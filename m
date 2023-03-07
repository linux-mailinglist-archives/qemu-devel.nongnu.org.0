Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 607856AE361
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:55:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYii-0007Oq-SR; Tue, 07 Mar 2023 09:55:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZYig-0007Nk-7W
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:55:14 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZYic-00041C-VC
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:55:13 -0500
Received: by mail-wr1-x42d.google.com with SMTP id g3so12397362wri.6
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 06:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678200907;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XA/NAYD6pwc+pXkUFmmZy5IGkzSi/8bTC+EPVMws5nk=;
 b=ncg2aoY2EtLcVn6fo/2NGzUYpVCilRwl86dc60WpdJhLQZzCfwxskpTYg3Ok2eTGbp
 tsOoazvPDdkJ0tqhgHKrFVLMXHJPSjRX4eo49yViq3xsaGeLeRlGWmtyyybfbG3EHB/4
 DtE/O4zxUMD2yLJonrXV1kGd3cggml66/DyNVLE2XrR2gMUyOBh3hpE9GFK83kF+5b6X
 ffQQEHVlbQU+oVWoTsEj+3H3SN7GYcPRJOjw97ngONxUofCl5Pdo+1s2wmCsI0kNOLXn
 UNxHgGjReRkhlxKTN7G3KVdAe5dDPwE3OKRCfi48KElCekxqfE6TAMSG2OwZwXjMUEtk
 H9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678200907;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XA/NAYD6pwc+pXkUFmmZy5IGkzSi/8bTC+EPVMws5nk=;
 b=DI7BpyiZZJH7pEdvypHI9AncLK5F2sj5s8311dnUzix7y+plkYCvfGrVWZCkmOMeOz
 Vr9T3XMTJ3XJPMEEwOxaQVJoxCVosxbWIRsQ9YEZok/FDxaAa83SZnrY3jB9yS29ZGB6
 38pQAuPLaU0AgMO9XCO3iZra+1eodBc0n1CfHsi9e4Z+ymIAhby9OZVyvNjtsknPBSZc
 JvFiRhBaWZuCEl1aVGag64z8x5Ngl74bJ4KvTjlo/lDx3BXta7jOc6PMjUnHlDeKa23q
 lSCp3TLlPEzhELsii2tk21QJe+hW5FmTMxL8d8Lvxc0oDxb4mXN8/D4R5/CvJCbkshhT
 HQJA==
X-Gm-Message-State: AO0yUKVw3hTk7kKsRcBd1GgQMne+lOIVUOAaoHAck3szHGwTlgUFxzTv
 j4eHACnxo4XSYW8xGZvVjaA=
X-Google-Smtp-Source: AK7set+5Et3zAvZoLz5mLfpED4oVxVuf2t0dm2UaCbjRw16qwccO+sPSw+JpiagnXH9otWDv9Gy9vA==
X-Received: by 2002:adf:dd8b:0:b0:2c7:62c1:f09c with SMTP id
 x11-20020adfdd8b000000b002c762c1f09cmr8259135wrl.50.1678200907465; 
 Tue, 07 Mar 2023 06:55:07 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 b12-20020adff24c000000b002c556a4f1casm12617551wrp.42.2023.03.07.06.55.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 06:55:07 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <dfe013bc-c55d-d1ea-cb5c-a90d51f812ee@xen.org>
Date: Tue, 7 Mar 2023 14:55:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 13/25] hw/xen: Add xenstore operations to allow
 redirection to internal emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-14-dwmw2@infradead.org>
 <71e68af5-1528-f5c3-221a-5166af9396c6@xen.org>
 <a5321652a4f0742edfbe8d14154959176d2538a5.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <a5321652a4f0742edfbe8d14154959176d2538a5.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 07/03/2023 14:52, David Woodhouse wrote:
> On Tue, 2023-03-07 at 14:44 +0000, Paul Durrant wrote:
>> On 02/03/2023 15:34, David Woodhouse wrote:
>>> From: Paul Durrant <pdurrant@amazon.com>
>>>
>>> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>> ---
>>
>> Reviewed-by: Paul Durrant <paul@xen.org>
> 
> You're reviewing your own code on some of those... :)
> 

Just making it clear I'm happy with the final version, since it's a 
joint S-o-b.

> Do we need to get review from *another* person listed in MAINTAINERS
> for Xen? Or shall I add my own R-by tags for those ones too?
> 
> 


