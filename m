Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D7652314C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 13:17:00 +0200 (CEST)
Received: from localhost ([::1]:43938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nokKx-0004Ja-Br
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 07:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nokCD-0004qi-5h
 for qemu-devel@nongnu.org; Wed, 11 May 2022 07:07:57 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nokCA-0000z3-Ur
 for qemu-devel@nongnu.org; Wed, 11 May 2022 07:07:56 -0400
Received: by mail-wr1-x430.google.com with SMTP id w4so2421009wrg.12
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 04:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YQPwQdXc6blCVQ2JvtkMoCeDb2RsLlrvPPd+idVcYIw=;
 b=Om9pdpuOtxW2kfHblwqw5c6YLAJJVx5lPWEW7gAyapkpRRki0ozA4kDWNNQ+MreOGF
 HIxEKvo5N+aU7i00zNyT1FYFZaEieZR7jkn98qXOnuxoxT2q2wW1dCvKEzp+5EO/U0cA
 5gx0YjeeueRUGjEVmm9A77auPzcB8uiTmEOrSLmujsMs3ZFa1GWT8CXpO7L5uWPxuwJg
 v9MH5TBmvNgkYET6kbj5dh8mQO/O1zceMaqh7mMBd10B4ZZiVEiMJgGurOIJbYy+4MwC
 c4zmLFpn8nVdP6epQFqmjz8JK1RdT24qK5bMSlSBQ2/gC+eWPXtrP1AhDnnJvj19biBr
 m8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YQPwQdXc6blCVQ2JvtkMoCeDb2RsLlrvPPd+idVcYIw=;
 b=d1MBrB52AZ5ZRJHgsCpdhFKZ38s7WaVZbGO2S871cFaYSRzCr52llhnxwGBmSDiRvx
 28ZpT3zaw8h5uyFJscuZt4DXvVjYpoPLry9FAzLCZOL2vpECwgdqvLhXvJvpTMo4xPVl
 ttRPyYLIwy/7DLfe96LXeFZKcZgsHZRPkD1GcLD/xyYhCGOWs7vvjwVXsBaq5VYVrTVZ
 Hyj5ymqWN8VByYxWmVuc+93EY4fDI1nxZ9yzlgdbBWvxD+7Voi/UwV4ldQFB8s5Ohf1q
 LecpgCH87fhWKZ7JoxrTAA99s115b0jh3yVA8cd/IU47b3fnCJyVKEg17Nh/7lDQ+tBD
 Qp7A==
X-Gm-Message-State: AOAM5303DyMqQ7hw74e6C9HToQhO1v+bYArnmCS6zhbf1pCaN78jIifI
 /GB7B6eYL5r/YT4pLML/NvEuFhH8Td27hw==
X-Google-Smtp-Source: ABdhPJzjiYaAR6TXoN0h2xzmVyKMGvqdaD1K1AnHlYpMjdoXPkcuADbQGIJiBpSXmJ+PymcnVFz39A==
X-Received: by 2002:adf:e94d:0:b0:20c:d4d3:c696 with SMTP id
 m13-20020adfe94d000000b0020cd4d3c696mr7735214wrn.136.1652267272871; 
 Wed, 11 May 2022 04:07:52 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 l16-20020a5d4810000000b0020cd8f1d25csm1437687wrq.8.2022.05.11.04.07.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 04:07:51 -0700 (PDT)
Message-ID: <5374a249-8389-3d11-1b30-b0b6e6910a51@redhat.com>
Date: Wed, 11 May 2022 13:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] util: NUMA aware memory preallocation
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>
Cc: Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org
References: <ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com>
 <Ynt/v2SHmnO2afg4@redhat.com>
 <8a6b84ed-50bc-8f6e-4b71-7e15247c4ac0@redhat.com>
 <YnuDONrdbMcJT08p@redhat.com>
 <a11ca582-3d17-b064-6736-bd66ed5a5ec4@redhat.com>
 <YnuLe7cVlEYsw78o@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YnuLe7cVlEYsw78o@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/11/22 12:10, Daniel P. Berrangé wrote:
> If all we needs is NUMA affinity, not CPU affinity, then it would
> be sufficient to create 1 I/O thread per host NUMA node that the
> VM needs to use. The job running in the I/O can spawn further
> threads and inherit the NUMA affinity.  This might be more clever
> than it is needed though.
> 
> I expect creating/deleting I/O threads is cheap in comparison to
> the work done for preallocation. If libvirt is using -preconfig
> and object-add to create the memory backend, then we could have
> option of creating the I/O threads dynamically in -preconfig mode,
> create the memory backend, and then delete the I/O threads again.

I think this is very overengineered.  Michal's patch is doing the 
obvious thing and if it doesn't work that's because Libvirt is trying to 
micromanage QEMU.

As mentioned on IRC, if the reason is to prevent moving around threads 
in realtime (SCHED_FIFO, SCHED_RR) classes, that should be fixed at the 
kernel level.

Paolo

