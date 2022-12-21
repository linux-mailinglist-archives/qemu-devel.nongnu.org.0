Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDD96535AB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:56:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83J7-0004OE-Pq; Wed, 21 Dec 2022 12:55:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p83Iz-0004Lk-Uo
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 12:55:01 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p83Iy-0002vo-F6
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 12:55:01 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 131-20020a1c0289000000b003d35acb0f9fso2143119wmc.2
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 09:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VjKtTEjEVvnhR/CGz17+OsPuAdMuXP+vD1g8lZsT8h4=;
 b=Qxn5wK4F2r88R+uuR51UrZ5uMM4DIMxTx6KmTNLlkWNvp34tivScpBlsvsVVDh0Xnu
 WbpETsqT6u0BhgOKAvLEMmzxQBvuBuWmNNY0Jh2HjEBfMoGzAp4oBNiE6eRHqe8l/Lgw
 PvldHsF3Idpy+M/j3pvdVK2BVzUQOn4fFx8EVmKhEK57aUgweOrbVFyNf+a0iw1gNX60
 OapPXcZI1OKXRgv1v0TOllGuheMUpPN+QDQbCPdPe4RyJZO0Xw5a+mqXbvy2cfqYipNT
 hqvSOVJPYyltqVxniVbi1c5TGpf3te702BeZDIE7hlbTChgeyuf3JZCKn93CkmlI9zKZ
 tYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VjKtTEjEVvnhR/CGz17+OsPuAdMuXP+vD1g8lZsT8h4=;
 b=0jG/E/rGzPUw2PihQkFkUysW+Fk0PTOMqVbYVqRE6tadrwuznaZwwXuoxSCNauRf94
 IS3BUtiQVJZ+AfQvqBn3qJytNJ1PXDfY5LRe7msA1eO132rBPGJUMSyZcCIsk+iH2RZ+
 QHIMj/YTKp0xTw9UmAcX9NQs4gJMi/jrjAWdQU+D8PCtOuLfXfOegPfRcDpxHL2avksU
 O0xNmXgEAMJ49D2+D1aTiUbJbZiBVs7vsQNFoVgptVf4KKUU+nhxH4b5CkGhvdNtZUWN
 9LKOo/qeKqK/whclNABYQYnvhm+cfpyCNjaQrgAxx6uMU9XI34F3cIxYPHqDSYcg+ddI
 f4KA==
X-Gm-Message-State: AFqh2ko6x198tB9Lljp9HLSc5MU8WZXFqAGKlnsbl+Bwu0NvEpCN9vGF
 mY/YShTw+Q/UIblvrkGeG8I=
X-Google-Smtp-Source: AMrXdXs+dneTYyMBsKQmo6iw+zLKoC1LthS3rF2+d1UURh0pS6nUQZlUDxUv+RyXwAi7EITRUA2xOg==
X-Received: by 2002:a05:600c:22c7:b0:3d1:cf66:3afa with SMTP id
 7-20020a05600c22c700b003d1cf663afamr2350684wmg.19.1671645298882; 
 Wed, 21 Dec 2022 09:54:58 -0800 (PST)
Received: from [192.168.6.210] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 k31-20020a05600c1c9f00b003d22528decesm3280666wms.43.2022.12.21.09.54.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 09:54:58 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <84626e56-c9a3-8913-0fec-d2cea8841ac9@xen.org>
Date: Wed, 21 Dec 2022 17:54:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v4 03/47] xen: Add XEN_DISABLED mode and make it
 default
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221221010623.1000191-1-dwmw2@infradead.org>
 <20221221010623.1000191-4-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221221010623.1000191-4-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 21/12/2022 01:05, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Also set XEN_ATTACH mode in xen_init() to reflect the truth; not that
> anyone ever cared before. It was *only* ever checked in xen_init_pv()
> before.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>


Reviewed-by: Paul Durrant <paul@xen.org>


