Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7444931840D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 04:42:23 +0100 (CET)
Received: from localhost ([::1]:58918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA2s2-0006Fs-IZ
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 22:42:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lA2q9-0005az-R3; Wed, 10 Feb 2021 22:40:25 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:39410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lA2q8-0003Lp-7g; Wed, 10 Feb 2021 22:40:25 -0500
Received: by mail-pj1-x102b.google.com with SMTP id d2so2593144pjs.4;
 Wed, 10 Feb 2021 19:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oXD5HifBOhkdDJxxb7pep5N3bulxBVFgVULUFRlmQzA=;
 b=Hrv7retqE1TuliFp9NO70WYU79wfrJLRMihvG+kER7RsHjqtEfd85xp2bGqlDh5xqo
 Cku+DCH4j4U0WC1f8EFHRRpcAJ2y40JkQLpyoNpNn4FlRMyxZmrpmwB5eve4vvJPq0BO
 jGHC/xio6TO8rBhEIUZQKcjFxaqBH5HVFS2KjaHvmL+zW+M+hwIQJpK+2THtRUzTxOEZ
 3kZmLXNkpOcT+7gAI/jl3uz479iQRhsdukOUY8S2R280pPAltyE80xBBjiyqzwZACPLl
 ptuTe5ftr1BdEtydKNK0bnWDY79pfusVcg0Ipi65CKkPdmUBcoKDU51S3YWZmxGsJVhW
 uIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oXD5HifBOhkdDJxxb7pep5N3bulxBVFgVULUFRlmQzA=;
 b=dv0GnSvXFafdkOLbBXlIwSdTKs/DnqKlMhwqQj8bCh0EsbL45t4aMZvIBAUYnWEg/R
 FgBDkDSAnKk4vuFcB2HhgOH3tBBpILP/+wIICqOB6X/YpzJJuLCFQmgrMOw5fAMNeBFG
 QJbSPPE7GhWeOLydyFMtiQMvQmH37oygrzHXp5n1AIxLXXXeDK2JbSKlhq5oykLsOByT
 CJl1CpPnV7WCBtLIIbY1lD83RTEatZJG1yjTiTedCv29f32orK9ggnHfe8qLwlJumema
 K5/1JGbgB1OWuUC2glvPKJC1JFjE+pmWzTCrf+7gTlb2iY3AjJTQnAfp/UqtzDvrW06E
 7iuw==
X-Gm-Message-State: AOAM5329TwTZ2qwJGcVoCJbKJsglcmeEBj9dnDKfNDCZnvkyY91ydwms
 hKx75InQBIcXkRUvpKsldwr4JaAhbWSbYQ==
X-Google-Smtp-Source: ABdhPJyC+zPVK8n1hKimXOmAud9JQGW2cnqItvFSBccQMYriR/vsJJi0nTLXhyLs5IAnZbOOn6bkew==
X-Received: by 2002:a17:902:7b89:b029:e1:1b46:bcec with SMTP id
 w9-20020a1709027b89b02900e11b46bcecmr5827448pll.5.1613014822209; 
 Wed, 10 Feb 2021 19:40:22 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id b18sm3748908pfb.197.2021.02.10.19.40.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Feb 2021 19:40:21 -0800 (PST)
Date: Thu, 11 Feb 2021 12:40:19 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [RFC PATCH 1/3] hw/block/nvme: set NVME_DNR in a single place
Message-ID: <20210211034019.GF24885@localhost.localdomain>
References: <20210210195252.19339-1-minwoo.im.dev@gmail.com>
 <20210210195252.19339-2-minwoo.im.dev@gmail.com>
 <YCQ/38kzPxdWDPqG@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YCQ/38kzPxdWDPqG@apples.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-02-10 21:19:43, Klaus Jensen wrote:
> On Feb 11 04:52, Minwoo Im wrote:
> > @@ -945,6 +945,11 @@ static void nvme_post_cqes(void *opaque)
> >  static void nvme_enqueue_req_completion(NvmeCQueue *cq, NvmeRequest *req)
> >  {
> >      assert(cq->cqid == req->sq->cqid);
> > +
> > +    if (req->status != NVME_SUCCESS) {
> > +        req->status |= NVME_DNR;
> > +    }
> 
> There are status codes where we do not set the DNR bit (e.g. Data
> Transfer Error, and that might be the only one actually).

Ouch, I think I need to prepare some of switch-helper to figure out
which one needs to be retried or not.

> Maybe a switch such that we do not explicitly set DNR for Data Transfer
> Error (and any other errors we identify), but only if we set it earlier
> in the stack.

Agreed.

