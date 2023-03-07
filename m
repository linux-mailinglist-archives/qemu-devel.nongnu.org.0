Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 628CE6ADD54
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:30:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVVh-0008Jh-Bp; Tue, 07 Mar 2023 06:29:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZVVe-0008IB-Le
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:29:34 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZVVc-0005mw-NI
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:29:34 -0500
Received: by mail-wr1-x432.google.com with SMTP id r18so11780012wrx.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678188571;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZH3Q1fiViFkedD/SohivkdCJBORP2dYkWAHXGgMGnQU=;
 b=bYEbe4alNTH1brr9NksFnpytF/v98dG4TityAnXFRd3UU9kGlZ8UU+bDJyB4rPUXeH
 FZk/u1LeYUF20rcQTfoylIOq3XwjiX7ONG2mu9d/i1BKKQqI7gbR5PdrmuJP8qRwBg1/
 J97r28ac6C8rV6Qunq4gSIlgLRrVGMIVrzPqGY8gmM+tghAAzeNmnE7xdr9oFvqw323n
 kBxN+ZDNU/18BspzG6coku5fsrSrNT5HohGKIV3/UxKAhVUlowyFtP5C6K9aV4l5h8mJ
 1HbW87lwLYrk6smoHY+sGHkyvUG4q5haVvY//U/kHukHN8s50WEWwX66ae8D8VINW8pr
 s31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678188571;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZH3Q1fiViFkedD/SohivkdCJBORP2dYkWAHXGgMGnQU=;
 b=4/3Jkvwrrhd/NgKSb86/YHRlB9q0P3MmySCsZwLzbGD4QAUsE9K4WTfNEQNRMk+G6i
 p/97pK5ZFwe4T6tS6RBKWV5Kzhx6LfCif4Sn+Tn/Z2nWzWfFjRwwZKrnLLGEJQ7Th4Mt
 3qIqu6HyIOv62JHjzqk24/N6lSZM9xddPzFBHxieXqNo9CKUtlG5P5dl6CeecSCL2rH+
 ofkXWga96pFcC5iCIBfhKX7d5JacEDrCtVpSMGxoBuOoj7iJ/sWYhGJL/9v7QdSxvTol
 1w0TbVRSAL01YD4fA61cw3uYVa+mdH+cDoO3CPV/4EBlurekDz7iBy69ozOH+jW7EvY9
 3IAg==
X-Gm-Message-State: AO0yUKVvJ4L3O/jEkVWDdqvodQcbLDQVuj/+rnKokFuAgrZVxZew88Gr
 1YWygYdw2a0IUj23OIFB1l8=
X-Google-Smtp-Source: AK7set8Lclo21+j8Gxl4MN8i0MzUImFNsiKxJ2ypaJRJ+vZG5Jq1AaAuRc/IUvQQUn8nANF098S2og==
X-Received: by 2002:adf:e8cd:0:b0:2cb:3660:44e with SMTP id
 k13-20020adfe8cd000000b002cb3660044emr9034590wrn.66.1678188571284; 
 Tue, 07 Mar 2023 03:29:31 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 c10-20020adffb0a000000b002ce72cff2ecsm2753413wrr.72.2023.03.07.03.29.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 03:29:30 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <b7ef693a-5586-fe65-9825-15655a7ec67b@xen.org>
Date: Tue, 7 Mar 2023 11:29:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 03/25] hw/xen: Implement XenStore watches
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-4-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-4-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x432.google.com
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
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Starts out fairly simple: a hash table of watches based on the path.
> 
> Except there can be multiple watches on the same path, so the watch ends
> up being a simple linked list, and the head of that list is in the hash
> table. Which makes removal a bit of a PITA but it's not so bad; we just
> special-case "I had to remove the head of the list and now I have to
> replace it in / remove it from the hash table". And if we don't remove
> the head, it's a simple linked-list operation.
> 
> We do need to fire watches on *deleted* nodes, so instead of just a simple
> xs_node_unref() on the topmost victim, we need to recurse down and fire
> watches on them all.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xenstore_impl.c | 253 +++++++++++++++++++++++++++++++++---
>   tests/unit/test-xs-node.c   |  85 ++++++++++++
>   2 files changed, 323 insertions(+), 15 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>

... with one suggestion...

[snip]
> +    /* Check for duplicates */
> +    w = g_hash_table_lookup(s->watches, abspath);
> +    while (w) {
> +        if (!g_strcmp0(token, w->token) &&  opaque == w->cb_opaque &&
> +            fn == w->cb && dom_id == w->dom_id) {
> +            return EEXIST;
> +        }
> +        w = w->next;

I think you could stash a tail pointer here...

> +    }
> +
> +    if (dom_id && s->nr_domu_watches >= XS_MAX_WATCHES) {
> +        return E2BIG;
> +    }
> +
> +    w = g_new0(XsWatch, 1);
> +    w->token = g_strdup(token);
> +    w->cb = fn;
> +    w->cb_opaque = opaque;
> +    w->dom_id = dom_id;
> +    w->rel_prefix = strlen(abspath) - strlen(path);
> +
> +    l = g_hash_table_lookup(s->watches, abspath);

... to avoid the duplicate hash lookup here.

> +    if (l) {
> +        w->next = l->next;
> +        l->next = w;
> +    } else {
> +        g_hash_table_insert(s->watches, g_strdup(abspath), w);
> +    }
> +    if (dom_id) {
> +        s->nr_domu_watches++;
> +    }
> +
> +    /* A new watch should fire immediately */
> +    fn(opaque, path, token);
> +
> +    return 0;
> +}


