Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7214327DBC
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:58:06 +0100 (CET)
Received: from localhost ([::1]:44236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGhBd-0003Xg-Vk
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:58:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGh7u-0006h6-RO
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:54:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGh7t-0007on-CK
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:54:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614599652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eymlgApz95gFpnLJxS1j2yZplEOiyb+7aMrhnJt3LlU=;
 b=XR4YIc1TDe/+3cC0Pll9a3qfISsUqn1/Auf4XJRLDUHZr05TGNNQcfZf2Be4Pk6EZmEMYe
 bYl89gqy86Gnv423YceaqCNuxFQ164ppc8OZ9uMdVcC20Yaq1RykMBZZlTJkZUa/zGxwxY
 R0/y7IQA5Y15CvcoYokA2eEwDdrFaAw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-jL36BK9gMTqvJEwNRaWbhw-1; Mon, 01 Mar 2021 06:54:11 -0500
X-MC-Unique: jL36BK9gMTqvJEwNRaWbhw-1
Received: by mail-wm1-f72.google.com with SMTP id w20so4658404wmc.0
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 03:54:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eymlgApz95gFpnLJxS1j2yZplEOiyb+7aMrhnJt3LlU=;
 b=JU2hZKXU7y7KKjvaArUpcFtiEU4frhjxzryb8nB6Qix+RwS9kPdgxuN5s10upqe0pS
 QlxjknSvXdvFXU7WmyVsDlXuTv0T6TBT715ToBmcP1YHBLZFOgQeh35ebO8WjG+FeEkR
 a6evXvsG7RVAuUdTsYbK1VfbcrYJSSNnptu5rpDU6K3pBLy/JH9fTt7Jw/HonvTuEtVV
 X2U/zJ70NxrU4ey+HWzSftVvH4fsUhk4CQgCdXeHXOb+rU7HLbvkQWcz6wYcip+BxazD
 1cLPvYg+yMA1AslrrqyVI9jWyUdcggaK3NFl5/AyN2g+rdHQ1u5jIpnqGSdD5FtB9DfJ
 DSyg==
X-Gm-Message-State: AOAM533xDv8LaoTExiNbPnDbN1DTqhreI358hQ34+cm3O0v903R2KMli
 X19fN+DMdZqtY0+dD5wMLV7lTwDXNbqOebT1WgxbYvmG1O6mew1LFbB1MqEYCkS7DYmfp/YyVym
 t+J1rKwxE9sUPRxc=
X-Received: by 2002:a05:600c:198c:: with SMTP id
 t12mr15334720wmq.183.1614599649848; 
 Mon, 01 Mar 2021 03:54:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQs/nen78SsY87XfTBZDQIuROfubT+65jB0WxQ6gdolyPtmyOX1bigpOc1YzSIGJc0rzf4eA==
X-Received: by 2002:a05:600c:198c:: with SMTP id
 t12mr15334705wmq.183.1614599649640; 
 Mon, 01 Mar 2021 03:54:09 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id s23sm21937419wmc.29.2021.03.01.03.54.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 03:54:09 -0800 (PST)
Subject: Re: [PATCH 08/25] hmp: replace "O" parser with keyval
To: Markus Armbruster <armbru@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-9-pbonzini@redhat.com>
 <87zh0xo0fw.fsf@dusky.pond.sub.org> <87k0qrjgrp.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <60a53508-0069-43ef-f89a-1a9b07e46e49@redhat.com>
Date: Mon, 1 Mar 2021 12:54:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87k0qrjgrp.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/03/21 11:43, Markus Armbruster wrote:
> 
> With proper initialization, I get
> 
>      {
>          "driver": "help"
>      }
> 
> instead.  If this change is okay, the commit message should explain it.

Matches "qemu-system-x86_64 -device help,e1000", so it should be okay.

Paolo


