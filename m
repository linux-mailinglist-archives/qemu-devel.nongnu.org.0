Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B706AE165
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:53:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZXkD-0006xM-C3; Tue, 07 Mar 2023 08:52:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZXkB-0006x3-EK
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:52:43 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZXkA-00087S-2r
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:52:43 -0500
Received: by mail-wr1-x429.google.com with SMTP id t15so12181733wrz.7
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 05:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678197157;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IxFlqZr0mGRhmULnOKeJqsxe48v70ZBxJnmwKGFTiO0=;
 b=VBreMLSBQBTjpHLmYWqbVCZ6vDGTcBjMf8fz7qnwbbAc+FcP7g2m2aPAGuB6WWygHa
 IPM+YL7p5fjWDzGkwbdqDwb5UzO0mOhcZKK0e1gW6CDlaqdMbJDnKSz2yi8nQt0GUNvr
 MBHmtWXum96/Gb6aBkLO08EYK/hoQsHHvt94Pq7Oj56MQW0oA22VKmbgBHQc/U66gBfr
 p1Rk9+qeXSzLmmJ0/F3iAOd30WvBiEMYBq+0fiee22jNeCZeSYqEGCVh9ZmZMJQ3qRQR
 eMBY6K2G8+h//Gf22KXyG06Z3awpR2GhcYnnr3QhkLNOt2pg5d0up/8VDUU2u7ClGFoc
 Tyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678197157;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IxFlqZr0mGRhmULnOKeJqsxe48v70ZBxJnmwKGFTiO0=;
 b=UAD/bfPsaBXttVDdj/sJ3jCE0esDunMycxOqnlJHZzEuQv4RXrCB15UYmliW31+hFo
 jE4CLetycpGp8vWq3sXs7OldMCAK0RTpSCPvTXPIL3rGGdWu4BkXPm3ng9Aph7M88SoL
 0ArqVA4SNb/t/Zvbzw4b+SwKfB06iKdPWHfwCQxlVtCOYN48CE2t7jn641yZeQL14WZO
 axf4wDtdbFMqd/YAREoiKU/u/tNR1+s0S4jGHjza9wKeiPnH9UhqXNu1jU0g7Un4FyEU
 EPRu+doAlHfBi8t6izjqG0LtJ3M4JK3ZzfvKvw0/6/bRBKXisuu236IF4QAsT4sEY5NE
 4T7g==
X-Gm-Message-State: AO0yUKXKPmDJgZ/DypuMyjVIfRtWUBUYku2/mAsixJJ1mpcQaZSv/WAk
 z0PCYyua01mZegU+GuMV25M=
X-Google-Smtp-Source: AK7set+P/VN1nCeaWEXutY2mF6tnycVncnjJOoM/2Q3o42A0amwIajwY37PDToy2KIlE9qMpN1Hwqg==
X-Received: by 2002:adf:f68a:0:b0:2ca:175b:d850 with SMTP id
 v10-20020adff68a000000b002ca175bd850mr9346152wrp.11.1678197157288; 
 Tue, 07 Mar 2023 05:52:37 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a5d654b000000b002c70f5627d5sm12559129wrv.63.2023.03.07.05.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 05:52:36 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <b5d3d99a-6d33-1336-7f21-6b7277827d54@xen.org>
Date: Tue, 7 Mar 2023 13:52:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 08/25] hw/xen: Create initial XenStore nodes
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-9-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-9-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x429.google.com
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

On 02/03/2023 15:34, David Woodhouse wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_xenstore.c | 70 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 70 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


