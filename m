Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03BD67CD5B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 15:15:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL31u-0006AN-3a; Thu, 26 Jan 2023 09:15:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1pL31s-0006AC-NP
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:15:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1pL31r-0006Er-1C
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:15:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674742502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sb/v9HMjUz0vqBy+msoVyyjLEpuo1yrc8JMxk0yTsK8=;
 b=X4I7eSWk8pWVTx0mA2IRdvZ4RUtpPzivjVguUDS6LAPz+oAH6YGwtpaeenDU0147qykQZ3
 xW6JvdVAP1r0mB+tyjK+r9XUMyeDOrNZjerk8uoBSwEPpMnQDwwz/Ywj8Li4JNQw6ZLVLa
 vrKO0y++LJy5Q9hc28AAbfQBwytj1vc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-533-CWTMUhdePN6rTBQiUpg-ew-1; Thu, 26 Jan 2023 09:13:23 -0500
X-MC-Unique: CWTMUhdePN6rTBQiUpg-ew-1
Received: by mail-ed1-f70.google.com with SMTP id
 j10-20020a05640211ca00b0049e385d5830so1493116edw.22
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 06:13:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sb/v9HMjUz0vqBy+msoVyyjLEpuo1yrc8JMxk0yTsK8=;
 b=kENPQt2T5uyfBHnczdbei4VO3XgjJrWICeRuoKo7cy2hDlwmV4KoVkZWbYwJsmAmzy
 2NKY1Po4Xie6+R758AoedmGpB5QLlEzNurVf7eBC5RN6ZAedCPKTwpAOHi+tilm3bfxu
 U8V/zAhSuJN4kB0x/yt75rrxxD/1NtyVsWuf3I/gpJ5UkxB9BbYH4hmOWELgB2JtOp/B
 K707Y+ijRvyAioytPjDhywo4A4HFyq4ly81EfRAi4nhW+1mMLpfmaPa0vNKcCqxbLb0W
 0+KsdzoXHzw8PsC1zI8sKZkwmGGkirkq44A3jrU8zou3Uu3VHbKlZkVMgvdOrgBYsZQS
 UQ2g==
X-Gm-Message-State: AFqh2kqT1QwUH2qyKMdZjA3j7PguHe2wjt/tj3/+mFSo40w8J2PD3Nat
 tiPhM5+Vx39i+uq8p83FO0UVyQ+Cryj8NAsYs89CO0H2qjpAjY3GKecDDdgaNmEhbvpZNK3lrP7
 Tf0K+DINRVg2CgmE=
X-Received: by 2002:a05:6402:43cf:b0:472:f7c1:361 with SMTP id
 p15-20020a05640243cf00b00472f7c10361mr41155211edc.29.1674742401957; 
 Thu, 26 Jan 2023 06:13:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsHhc3YwxSYXhVNFmWpAkx/k+L/ttUnBj7/monmArNxYlqGIot8jWhRoz0PCQnlZizxiUV41Q==
X-Received: by 2002:a05:6402:43cf:b0:472:f7c1:361 with SMTP id
 p15-20020a05640243cf00b00472f7c10361mr41155198edc.29.1674742401781; 
 Thu, 26 Jan 2023 06:13:21 -0800 (PST)
Received: from [10.43.2.39] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 s9-20020aa7c549000000b004a0afea4c9csm793684edr.18.2023.01.26.06.13.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 06:13:21 -0800 (PST)
Message-ID: <0f8ad497-202d-ae55-e468-77bb726a2699@redhat.com>
Date: Thu, 26 Jan 2023 15:13:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 0/3] util/userfaultfd: Support /dev/userfaultfd
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20230125224016.212529-1-peterx@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <20230125224016.212529-1-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.15, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 1/25/23 23:40, Peter Xu wrote:
> The new /dev/userfaultfd handle is superior to the system call with a
> better permission control and also works for a restricted seccomp
> environment.
> 
> The new device was only introduced in v6.1 so we need a header update.
> 
> Please have a look, thanks.

I was wondering whether it would make sense/be possible for mgmt app
(libvirt) to pass FD for /dev/userfaultfd instead of QEMU opening it
itself. But looking into the code, libvirt would need to do that when
spawning QEMU because that's when QEMU itself initializes internal state
and queries userfaultfd caps.

Michal


